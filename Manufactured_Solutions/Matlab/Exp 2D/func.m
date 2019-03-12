function F = func(x,y,Nmod,KMean,varK,C1,C2,phi)

S1 = sum( (-2*pi)*C1.*sin(phi + (2*pi)*(C1*x + C2*y))) ;

S2 = sum( cos(phi + (2*pi)*(C1*x + C2*y) ) ) ;

S3 = sum( (-2*pi)*C2.*sin(phi + (2*pi)*(C1*x + C2*y))) ;

F = 2*KMean*exp(-varK/2)*sqrt(varK*2/Nmod)*S1*exp(sqrt(varK*2/Nmod)*S2)*cos(2*x+y) ...
    - 5*KMean*exp(-varK/2)*exp(sqrt(varK*2/Nmod)*S2)*sin(2*x+y) ...
    + KMean*exp(-varK/2)*sqrt(varK*2/Nmod)*S3*exp(sqrt(varK*2/Nmod)*S2)*cos(2*x+y);

end