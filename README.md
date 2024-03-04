# Canny Edge Detector with Non-Maximum Supression
# MATLAB and Python implementation

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Dependencies](#dependencies)
- [Configuration](#configuration)
- [References](#references)
- [License](#license)

## Introduction

The Enhanced Canny Edge Detector for Image Segmentation is an advanced MATLAB function designed to provide high-precision image segmentation. Building on the foundational principles of the Edge Canny Detector by John F. Canny, this function introduces several novel modifications to achieve superior performance. These include the use of a Gaussian filter for noise reduction, the computation of intensity gradients to highlight potential edges, gradient magnitude thresholding to isolate strong edge features, and the innovative application of Non-Maximum Suppression and the "Roberts" operator for edge thinning and enhanced directionality.

This method is particularly suited for applications requiring precise edge detection and segmentation, such as medical imaging, object recognition in complex scenes, and any other domain where image analysis plays a critical role.

The purpose of this repository is merely for education purposes.

## Installation

To install the Enhanced Canny Edge Detector for Image Segmentation, follow these steps:

1. Ensure you have MATLAB installed on your computer.
2. Download the function files from the provided repository or source.
3. Place the function files in your MATLAB working directory or any directory in your MATLAB path.

## Usage

The application is designed as an interactive learning tool for image segmentation using the Canny Algorithm. Here's how to use it:

1. Run the function by entering a numerical input in MATLAB's command window.
2. Access the "Images" folder to select an image for segmentation.
3. Ensure you have four pre-segmented images in the same directory for comparison.

### Usage Tips

- Before using the tool, familiarize yourself with the Canny Algorithm and its parameters to better understand how your inputs affect segmentation results.
- Organize your pre-segmented images in a specific folder for easy access and comparison.
- Experiment with different parameters to see how they influence the segmentation outcome.

## Features

- Real-time image segmentation using the Canny Algorithm.
- Interactive image selection for segmentation.
- Side-by-side comparison with pre-segmented images for educational purposes.

## Dependencies

- MATLAB: The primary dependency for running the Enhanced Canny Edge Detector.
- Image Processing Toolbox: This MATLAB toolbox might be required for advanced image manipulation functions.

## Configuration

No specific configuration is required beyond the basic setup of MATLAB and the necessary function files.

## Documentation

The core concepts and knowledge areas essential for understanding and utilizing this algorithm include:

- **Linear Algebra and Calculus**: Fundamental for understanding the mathematical principles behind image processing algorithms.
- **Computer Vision Fundamentals**: Key concepts such as Gaussian Kernels, Spatial Filtering, Hysteresis Thresholding, and Image Gradient Orientation/Magnitude.
- **Matrix/Vector Manipulation in MATLAB/Python**: Proficiency in handling image data within these programming environments.
- **Image Segmentation Principles**: Basic understanding of partitioning images into significant regions or objects.

## References

- Mathworks Image Processing,  
Served as an extra support alongside the development of this project.
https://uk.mathworks.com/videos/edge-detection-with-matlab-119353.html      

- Canny Edge Detection 2D: By. Deshan Yang,
Non-maximum Supression and Hysteresis Thresholding methods were used as support to my function.
https://uk.mathworks.com/matlabcentral/fileexchange/38924-canny-edge-detection-2d?s_tid=srchtitle

- Digital Image Processing, Third Edition,
Rafael C. Gonzalez
Richard E. Woods

## License

The Enhanced Canny Edge Detector for Image Segmentation is open-source and available under [eaguaida]. Please refer to the LICENSE file for more details.
