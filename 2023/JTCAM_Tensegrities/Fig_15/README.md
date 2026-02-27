# Data description

This folder contains data and codes used for plotting the results (Figs. 15 - 19) presented in the paper (Harish, A.B., et.al. (2023) "Mathematics of stable tensegrities", Journal of Theoretical, Computational and Applied Mechanics (Accepted)). This includes:

- Excel sheets with the data
- Matlab codes for plotting the data in the format presented in the paper

## Data in MS Excel

There are two excel workbooks provided in this repository.

- The excel book (*Eigenvalues.xlsx*) contains the eigenvalues for the different eigenmodes of the 9-segrity and 10-segrity plotted in Fig. 15.

- The excel book (*Displacement.xlsx*) contains the nodal coordinates for each rod and string in the two tensegrities. It also shows the nodal displacements for the two tensegrities:
    - For the modes 7, 8 and 9 (without boundary conditions)
    - For the mode 7 (with one-end of the rods fixed)

## Matlab codes

The eigenmode analysis is done using Abaqus CAE and the obtained results are post-processed and provided in the excel workbooks outlined above. The Matlab codes use these excel workbooks for plotting adn visualisation of the results. They do not provide any mechanical calculations. 

**Note:** The provided plotting codes use an external libraries:

- *matlab2tikz* in order to save the generated MATLAB figure in vector graphics format. The exact version of the toolbox used has been provided in the folder *matlab2tikz*. This includes their entire repository (including license agreements and source codes). The latest/current version of this toolbox can be found through their GitHub repository (https://github.com/matlab2tikz/matlab2tikz).

- *TubePlot* in order to generate cylinders/tubes of appropriate radii to visualise rods and strings. The file *tubeplot.m* has been provided with the code. The latest/current version of this toolbox can be found through the MathWorks File Exchange (https://www.mathworks.com/matlabcentral/fileexchange/5562-tubeplot).

- These links are being provided as a convenience and for informational purposes only; they do not constitute an endorsement or an approval of any of these products, services or opinions of the corporation or organization or individual. We bear no responsibility for the accuracy, legality or content of this external site or for that of subsequent links. Contact the respective owners of the external toolboxes for answers to questions regarding its content.