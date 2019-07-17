## K-field generators:

"calc_K_2018-exp-lambda.c" is a function to generate realizations of  K-field with exponential correlation.

"calc_K_2018-Gss-lambda.c" is a function to generate realizations of  K-field with Gaussian correlation.

OUT[0] returns the value of lnK
OUT[1] returns the hydraulic conductivity value K
       at the point of coordinates IN[0] and IN[1].


## Tests:

The following codes illustrate the use of the random field generators:

"exp_K-field_grid.cpp" computes a realization of K-field with exponential correlation in the folder "expK".

"Gss_K-field_grid.cpp" computes a realization of K-field with Gaussian  correlation in the folder "gssK".

"test_corr-exp_K-field_grid.cpp" and "test_corr-exp_K-field_grid.cpp" estimate correlation functions and 
		       correlation lengths of lnK fields and write results in folders "corrE" and "corrG".



## NOTE:
These codes use 
#include<random> // C++ library for random generated numbers
and have to be compiled with a "-std" option, e.g.

code_name.cpp -std=gnu++11

##
## Date: 
09.03.2019
