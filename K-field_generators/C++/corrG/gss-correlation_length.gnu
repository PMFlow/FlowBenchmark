#load "gss-correlation_length.gnu"

#set logscale
set terminal postscript portrait enhanced color 'Helvetica' 10

set output "gss-correlation_lengths.eps"

set title "Correlation lengths of Gaussian correlated f=lnK with {/Symbol l}_{x}=1 m and  {/Symbol l}_{y}=2 m"
set xlabel "l [m]";
set ylabel "correlation lengths";
 set size 1, 0.5
 set origin 0,0

set key at graph 0.85,0.8  samplen 3 spacing 2.5

#set logscale x

plot \
'glku' u 1:3 title '{/Symbol S}@_{i=0}^{i=l/{/Symbol d}x}  <f(x,y)f(x+i{/Symbol d}x,y)>' w l lt 2 lw 3, \
'glkv' u 1:3 title '{/Symbol S}@_{i=0}^{i=l/{/Symbol d}y}  <f(x,y)f(x,y+i{/Symbol d}y)>' w l lt 1 lw 3, \
'tglku' u 1:3 title 'theoretical' w l lt -1 lw 1.5, \
'tglkv' u 1:3 notitle w l lt -1 lw 1.5

set terminal x11
replot
set nologscale
set xlabel; set ylabel
set title
set size 1,1
set origin 0,0
set key