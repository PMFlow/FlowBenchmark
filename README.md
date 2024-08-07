## Data repository accompanying the paper "Numerical benchmark study for flow in highly heterogeneous aquifers" by Cristian D. Alecsa, Imre Boros, Florian Frank, Peter Knabner, Mihai Nechita, Alexander Prechtel, Andreas Rupp, Nicolae Suciu

This is a data repository accompanying the paper "Numerical benchmark study for flow in highly heterogeneous aquifers"
by Cristian D. Alecsa, Imre Boros, Florian Frank, Peter Knabner, Mihai Nechita, Alexander Prechtel,
Andreas Rupp, Nicolae Suciu (https://doi.org/10.1016/j.advwatres.2020.103558).



The benchmark consists of evaluating the performance of numerical methods by comparing solutions of the equations
for divergence-free flow in porous media with analytical solutions. The latter are constructed by the method of
"manufactured solutions" for highly heterogeneous space-functions modeling the coefficients of the flow equations.

The benchmark contains one- and two-dimensional flow problems with coefficients consisting of realizations of
random space functions log-normally distributed, with exponential and Gaussian correlations. All necessary data
files and computing codes are contained in the following folders:

### K-field generators
C and Matlab codes to generate realizations of random hydraulic conductivity coefficients

### Manufactured Solutions

1. 1D and 2D analytical solutions and corresponding boundary conditions, coefficient functions, and source terms occurring in the right-hand side of the homogeneous pressure equation
2. text files containing numerical coefficients of the analytical coefficient and source functions
3. C++ and Matlab codes used to construct coefficients and source terms

### Numerical Coefficients
C codes used to compute the numerical coefficients of the analytical coefficients and source functions


## 
## 

If you would like to compare the results of your method with reference solutions contained in this benchmark,
please follow the instructions given in README files contained in folders and sub-folders.
