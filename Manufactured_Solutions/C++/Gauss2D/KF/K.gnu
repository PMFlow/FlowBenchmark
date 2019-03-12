#load "K.gnu" 
set terminal postscript portrait enhanced color 'Helvetica' 14
set out "Kgss2D.eps"
set xlabel "x";
set ylabel "y"
set zlabel "K(x,y)";
set zlabel offset 4,3,4
set size 1,0.5
set origin 0,0

set dgrid3d 250,125
set ticslevel 2.0
set xtics; set ytics; set ztics;
set xtics 5
set ytics 5
set ztics 10
set grid
set view 60,20
set clabel
set contour both
set cntrparam levels 50
splot [][][] 'k' w l lt 1 

set terminal x11
#set terminal windows
 replot
