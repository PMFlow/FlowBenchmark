## K-field generators

#### The Matlab function
"Kraichnan_func.m" generates lnK and K-fields at given points (x,y) in a two-dimensional domain by summing up
		   random periodic modes (Kraichnan method). For "lambda">0, the function returns spatially
		   filtered lnK-fields computed with a Gaussian filter of width "lambda".

#### The functions
"Kraichnan_Exp_param.m" and "Kraichan_Gauss.m"
		   compute wavenumbers, phases, and amplitudes of the random modes, [wavenum, phi, amplitude], for
		   log-normal lnK with exponential and Gaussian correlation, respectively.


## Tests

"test_Kraichnan_K_field.m" illustrates the use of the random field generators by computing realizations of log-normal
	           K-fields with exponetial and Gaussian correlations.

"corr_Kraichnan_Kfield.m" estimates correlations and correlation lengths of lnK fields by ensemble and spatial averages.
	           To generate lnK fields, comment the last line and uncomment the last but one line in "Kraichnan_func.m". 

##
#### Date: 09.03.2019            
