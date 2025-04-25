# Porosity-of-Materials-
Using Matlab Finding Porosity of Materials 
This MATLAB script estimates the porosity of materials from a digital image. The process includes image preprocessing, segmentation, and pore detection to compute the percentage of porous regions in a sample.

# Overview
Porosity is a measure of the void (pore) spaces in a material. This script performs image-based analysis using image processing techniques in MATLAB to estimate the porosity.

# How it Works??

## 1. Image Upload:
A file selection dialog allows the user to upload an image ```\(.jpg, .png, .bmp, .tif, etc.)```\ of the material's surface.

## 2. Preprocessing:
Convert the uploaded image to *grayscale using rgb2gray*.
Enhance contrast with imadjust to highlight features.
Apply "Gaussian filtering" *(imgaussfilt)* to reduce noise.

## 3. Segmentation:
Convert the preprocessed image to binary using *Otsu’s thresholding (imbinarize)*.
Invert the binary image so that pores appear white (imcomplement).

## 4. Noise Removal and Hole Filling:
Use morphological operations like imopen to remove small artifacts.
Fill holes inside the pores using imfill.

## 5. Porosity Calculation:
```\Total image area = number of pixels\```.

*Pore area = number of white pixels in the binary image*.

***Porosity (%) = (Pore Area / Total Area) × 100***

## 6. Visualization:
Show grayscale, enhanced, filtered, binary, and final segmented images.
Overlay detected pores on the original image with red dots.

# Output

Displays intermediate images to help visualize each step.
Prints estimated porosity in the MATLAB console.
Overlays pore locations on the original image.

# Dependencies
*MATLAB with Image Processing Toolbox*

# Usage Process/Steps

1. Run the script in MATLAB.
2. Select an image when prompted.
3. View the visualizations and porosity result.
