## Manufactured Solutions
The analytical computation of the source terms f(x) and f(x,y) for the 1D and 2D cases, respectively, occuring in
the r.h.s. of the flow equations which solve given analytical solutions is carried out with the codes included in
the folder "Maple".

The hydraulic conductivity fields are computed for fixed mean hydraulic conductivity K_MEAN=15 m/day and increasing
variances of the lnK field, varK=[0.1 1 2 4 6 8 10], by summing up increasing numbers of periodic cosine-modes,
Nmod=[100, 1000, 10000], with wavenumbers and phases read from text files (see computation in "Numerical_Coefficients").

K-fields for each particular cases used in this benchmark are obtained by specifying input parameters "varK" and "Nmod".

## K-field generation
Numerical computations of K-fields and source terms f with C++ and Matlab codes are illustrated in folders "C++" and
"Matlab", respectively.

                 
## Date 
09.03.2019 


