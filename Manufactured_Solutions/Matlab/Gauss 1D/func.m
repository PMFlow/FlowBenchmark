function f = func(x,Nmod,KMean,varK,wave1,wave2,phi)
S1 = sum( (-2*pi)*wave1.*sin(phi + 2*pi*(wave1*x + wave2))) ;
S2 = sum( cos(phi + 2*pi*(wave1*x + wave2))) ;
f = KMean*exp(-varK/2)*exp(sqrt(varK*2/Nmod)*S2)*(sqrt(varK*2/Nmod)*S1*cos(x) - sin(x)) ;
end