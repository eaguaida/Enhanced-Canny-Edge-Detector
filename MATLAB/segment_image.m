%% This function takes an input image and returns the segmented parts of the image.
%%%How does this function works?
%  Uses the core principle of Edge Canny Detector developed by John F. Canny in 1986.
%  1. Utilize a Gaussian filter to smooth the image, which helps in diminishing noise.
%  2. Compute the image's intensity gradients to highlight regions with potential edges.
%  3. Implement gradient magnitude thresholding to eliminate weak responses to edge detection, ensuring only strong edge features are considered.
%  4. Apply a double threshold technique to identify possible edges by differentiating strong and weak ones.
%  5. Execute edge tracking through hysteresis, confirming edge presence by retaining only strong edges or weak edges connected to strong edges.
%  
%  However this method differs from the classic Canny Detector by using Non-Maximum Suppression" and the "Roberts" operator.
%  Introduced in: https://arxiv.org/pdf/1705.02950.pdf
%

%%%References :-Mathworks Image Processing  
%               Served as an extra support alongside the development of this project.
%               https://uk.mathworks.com/videos/edge-detection-with-matlab-119353.html      
%
%             - Canny Edge Detection 2D: By. Deshan Yang
%               Non-maximum Supression and Hysteresis Thresholding methods were used as support to my function.
%               https://uk.mathworks.com/matlabcentral/fileexchange/38924-canny-edge-detection-2d?s_tid=srchtitle
%
%             -DIGITAL IMAGE PROCESSING Third Edition,
%                Rafael C. Gonzalez
%                Richard E. Woods
%%%
%% This function is derived from the Canny Edge Detection MATLAB function provided by GAGAN. 
%% http://www.mathworks.com/matlabcentral/fileexchange/30621-canny-edge-detection
%% Enrique Molero, MSc Artificial Intelligence, King's College London
% Feel free to change sizes of the Standard Deviation and Gaussian Mask,
% there are no perfect parameters, this need to be adjusted depending on
% the image and the score will be measure with other methods.
function [gnh]= segment_image(I)
    ia_gray = im2gray(I);
    iag = im2double(ia_gray);
    iag=imadjust(iag);
    sigma= 1.5;
    hsize = ceil(6 * sigma);
    thresh = 0.195;
    dim=size(I);
    ex1 = imgaussfilt(iag,sigma);
    
    %To get optimal results, the Upper Threshold is set 0.195 and the lower one
    %will be 0.28 * U Threshold, in this case Lower Threshold will be 0.054
    if length(thresh)==1
        lthresh=0.28*thresh;
        uthresh=thresh;
    else
        uthresh=thresh(1);
        lthresh=thresh(2);
    end
    
    if(uthresh>1.0)
        uthresh=1;
    end
    
    [x, y] = meshgrid(-3*sigma:1:3*sigma, -3*sigma:1:3*sigma);
    Gx = (-x/(2*pi*sigma^4)) .* exp(-(x.^2 + y.^2)/(2*sigma^2));
    Gy = (-y/(2*pi*sigma^4)) .* exp(-(x.^2 + y.^2)/(2*sigma^2));

    %Generating Gradient Magnitude and Direction using MATLAB imgradient
    % function and with "Roberts" operator

    [Mag,Gdir] = imgradient(ex1,"roberts");
    Ix = conv2(ex1, Gx, 'same');
    Iy = conv2(ex1, Gy, 'same');
    
    gnl=zeros(dim(1),dim(2));
    gnh=zeros(dim(1),dim(2));

    % Non-Maximum Supression Method by Deshan Yang
    idxes = find(Mag>lthresh);
    theta = cart2pol(Ix(idxes),Iy(idxes));
    theta = theta/pi*180;
    direction = floor(mod(theta+22.5,180)/45)+1;
    deltax = [1 1 0 -1];
    deltay = [0 1 1 1];
    deltaxs = deltax(direction)';
    deltays = deltay(direction)';
    
    [yis,xis] = ind2sub(dim,idxes);
    yis1=yis+deltays; yis1=max(yis1,1); yis1=min(yis1,dim(1));
    yis2=yis-deltays; yis2=max(yis2,1); yis2=min(yis2,dim(1));
    xis1=xis+deltaxs; xis1=max(xis1,1); xis1=min(xis1,dim(2));
    xis2=xis-deltaxs; xis2=max(xis2,1); xis2=min(xis2,dim(2));
    idxes1 = sub2ind(dim,yis1,xis1);
    idxes2 = sub2ind(dim,yis2,xis2);
    %%Hysteresis Thresholding Method by Deshan Yang
    Mag1 = Mag(idxes1);
    Mag2 = Mag(idxes2);
    Mag0 = Mag(idxes);
    idxes_gnh = idxes(Mag0>Mag1 & Mag0>Mag2 & Mag0>=uthresh);
    idxes_gnl = idxes(Mag0>Mag1 & Mag0>Mag2 & Mag0<uthresh);
    
    gnh(idxes_gnh)=1;
    gnl(idxes_gnl)=1;
    imshow(gnh);
    imshow(gnl);
  
    [row,col]=find(gnh>0);
    idxes = (col-1)*dim(1)+row;
    gnl(gnh==1)=1;
    gnh = imfill(gnl==0,idxes,8)-(gnl==0);
%% 'gnh' will hold the primary segmented image that is outputted by the function.
end