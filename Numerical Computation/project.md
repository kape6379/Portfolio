# Group Project: Interpolation on Topographic Data using SciPy
Eben Fluto, Kai Schuyler Gonzalez, Kate Pendavinji, Richard Terrile
## Background

Eben: My individual explorition was on gimp and how gimp utilizes interpolation to rescale images.

Kai: I was interested in this project because of the activity we did on Interpolation back in March. Since SciPy is so widely used, I was curious to see it implemented with real world data.

Kate: My initial individual exploration was surrounding the package LaplaceInterpolation.jl. It focused on fast interpolation on a grid which led me to want to look into interpolating topographic data due to its real world applicability. 

Richard: My individual project looked into the ODES scikit extension. My idea was to look into the rootfinding and preconditioning capabilities and compare its accuracy and speed to basic scikit implementations.

## Key Problems
SciPy is a package which allows you to apply various algorithms and functions onto data sets using Python. Our focal point of exploration is to be able to use SciPy's interpolation subpackage on data sets featuring information on topography of various formations such as volcanoes. We will be performing linear, nearest neighbor, and cubic interpolation on these data sets to view a three dimensional representation of the topography of the formations which we selected. While running these tests we hope to see where these subpackage fail and succeeds. We will also be compressing our data to produce smaller-scale examples of our interpolation experimentation. 

## Stakeholders
* SciPy is open source and has over 1000 contributors on GitHub.
* SciPy is managed by an organization and has a steering council that oversees the long-term well being of the project.
* Direct funding comes from two sources:
  * The Chan Zuckerburg Initiative
    * They provide grants to organizations working in support of their missions of Science and Education, such as SciPy.
  * Tidelift
    * They provide open source management to help maintain large open source projects including SciPy.

## Utilized Features
Scipy has a sub-package dedicated to interpolation. Scipy.interpolate offers functions that can interpolate in many dimensions utilizing various methods. For our project we utilized three functions. 
- # scipy.interpolate.NearestNDInterpolator
	<p> This function performs a simple nearest neighbors interpolation in any dimension.</p>
- # scipy.interpolate.LinearNDInterpolator
	<p> This function performs a piecewise barycentric linear interpolation in any dimension. For our example we can think of this in the following. If we have all our points in 3d this function is going to connect all these points together by constructing a triangular grid. Then when we wish to get the value for a new point within a certain triangle in the grid we take the weighted average of the objective values at the three vertices based on distance.  Here is an image that helps visualize this process. 
![barycentric](https://github.com/kape6379/CSCI3656_Group_Project/blob/main/barycentric_interpolation.png) </p>
- # scipy.interpolate.CloughTocher2DInterpolator
	<p> This works similar to the linear interpolator. It triangularizes the data but interpolates points within using bezier polynomials.

## Experiment

#### These tests feature data about Kilauea Volcano in Hawaii
	
_(data can be found at https://portal.opentopography.org/datasetMetadata?otCollectionID=OT.072018.6635.1)_
	
***Original view of Kilauea***
![og](https://github.com/kape6379/CSCI3656_Group_Project/blob/main/og_1.PNG)
![og](https://github.com/kape6379/CSCI3656_Group_Project/blob/main/og_2.PNG)
***Subsampled version of Kilauea***
![subsample](https://github.com/kape6379/CSCI3656_Group_Project/blob/main/experiment/subsampled_1.jpeg)
![subsample](https://github.com/kape6379/CSCI3656_Group_Project/blob/main/experiment/subsampled_2.jpeg)
***Kilauea Linear Interpolation***
![linear](https://github.com/kape6379/CSCI3656_Group_Project/blob/main/linear_1.PNG)
	![linear](https://github.com/kape6379/CSCI3656_Group_Project/blob/main/linear_2.PNG)
***Kilauea Nearest Neighbor Interpolation***
![nn](https://github.com/kape6379/CSCI3656_Group_Project/blob/main/nn_1.PNG)
![nn](https://github.com/kape6379/CSCI3656_Group_Project/blob/main/nn_2.PNG)
***Kilauea Cubic Interpolation***
![cubic](https://github.com/kape6379/CSCI3656_Group_Project/blob/main/cubic_1.PNG)
![cubic](https://github.com/kape6379/CSCI3656_Group_Project/blob/main/cubic_2.PNG)
