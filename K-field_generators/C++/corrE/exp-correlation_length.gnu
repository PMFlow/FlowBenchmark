#load "exp-correlation_length.gnu"

#set logscale
set terminal postscript portrait enhanced color 'Helvetica' 10

set output "exp-correlation_lengths.eps"

set title "Correlation lengths of exponentially correlated f=lnK with {/Symbol l}_{x}=1 m and  {/Symbol l}_{y}=2 m"
set xlabel "l [m]";
set ylabel "correlation lengths";
 set size 1, 0.5
 set origin 0,0

set key at graph 0.85,0.7  samplen 3 spacing 2.5
#set key graph 0.85,0.7  samplen 3 spacing 2.5

#set logscale x

plot \
'elku' u 1:3 title '{/Symbol S}@_{i=0}^{i=l/{/Symbol d}x}  <f(x,y)f(x+i{/Symbol d}x,y)>' w l lt 2 lw 3, \
'elkv' u 1:3 title '{/Symbol S}@_{i=0}^{i=l/{/Symbol d}y}  <f(x,y)f(x,y+i{/Symbol d}y)>' w l lt 1 lw 3, \
'telku' u 1:3 title 'theoretical' w l lt -1 lw 1.5, \
'telkv' u 1:3 notitle w l lt -1 lw 1.5


set terminal x11
#set terminal windows
replot
set nologscale
set xlabel; set ylabel
set title
set size 1,1
set origin 0,0
set key