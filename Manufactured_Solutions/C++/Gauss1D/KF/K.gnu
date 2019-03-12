#load "K.gnu"

#set logscale
set terminal postscript portrait enhanced color 'Helvetica' 10

set output "Kgss1D.eps"

#set title "Exponential correlation of f=lnK for 64 modes, averaged over 1000 realizations and 100 initial points (x,y)"
set xlabel "x";
set ylabel "K(x)";
 set size 1, 0.5
 set origin 0,0

set key at graph 0.85,0.85  samplen 3 spacing 2.5

#set logscale x

plot 'k' u 1:2 notitle w l

set terminal x11
replot
set nologscale
set xlabel; set ylabel
set title
set size 1,1
set origin 0,0
set key