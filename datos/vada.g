#!/usr/bin/gnuplot

set terminal epslatex size 18cm,12cm color colortext
set output 'vada.tex'

set title
set xlabel '$s$ (\si{\mm})'
set ylabel '$v$ (\si{\mm})'
set grid x,y
set yrange[-35:0]
set xrange[0:25]
set key bottom left

V3(x)=KV3*x**2
P3(x)=KP3*x**2
V6(x)=KV6*x**2
P6(x)=KP6*x**2

fit V3(x) 'fitvada' u 1:2 via KV3
fit P3(x) 'fitvada' u 1:3 via KP3
fit V6(x) 'fitvada' u 1:4 via KV6
fit P6(x) 'fitvada' u 1:5 via KP6

plot 'fitvada' u 1:2 ls 1 ps 4 title  '$a=\SI{30}{\cm}$, vypuklá', V3(x) ls 1 lw 4 notitle, '' u 1:3 ls 2 ps 4 title  '$a=\SI{30}{\cm}$, ploská', P3(x) ls 2 lw 4 notitle, '' u 1:4 ls 3 ps 4 title  '$a=\SI{60}{\cm}$, vypuklá', V6(x) ls 3 lw 4 notitle, '' u 1:5 ls 4 ps 4 title  '$a=\SI{60}{\cm}$, ploská', P6(x) ls 4 lw 4 notitle


set terminal wxt
set output
