## Numerical Coefficients 

The hydraulic conductivity fields used in "Manufactured_Solutions", for both 1D and 2D cases, are computed with the
Kraichnan randomization method for fixed mean hydraulic conductivity K_MEAN=15 m/day, increasing variances "varK" 
of the lnK field, and numerical coefficients consisting of a fixed realization of the set of wavenumbers and phases.
The latter, are generated for Nmod=10000 random periodic modes and stored as text files in the folders "coeffExp" and
"coeffGauss".


## Note:
The codes "coeffExp.c" and "coeffGauss.c" use #include \<random\> /* C++ library for random generated numbers */ 
and have to be compiled with a "-std" option, e.g.,
  
code_name.c -std=gnu++11

##
#### Date: 09.03.2019
