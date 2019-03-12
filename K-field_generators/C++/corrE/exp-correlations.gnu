#load "exp-correlations.gnu"

#set logscale
set terminal postscript portrait enhanced color 'Helvetica' 10

set output "exp-correlations.eps"

set title "Exponential correlation of f=lnK with {/Symbol l}_{1}=1 m and  {/Symbol l}_{2}=2 m"
set xlabel "l [m]";
set ylabel "correlations";
 set size 1, 0.5
 set origin 0,0

set key at graph 0.85,0.85  samplen 3 spacing 2.5
#set key graph 0.85,0.85  samplen 3 spacing 2.5

#set logscale x

plot \
'elku' u 1:2 title '<f(x,y)f(x+l,y)>' w l lt 2 lw 3, \
'elkv' u 1:2 title '<f(x,y)f(x,y+l)>' w l lt 1 lw 3, \
'telku' u 1:2 title 'theoretical' w l lt -1 lw 1.5, \
'telkv' u 1:2 notitle w l lt -1 lw 1.5

set terminal x11
#set terminal windows
replot
set nologscale
set xlabel; set ylabel
set title
set size 1,1
set origin 0,0
set key