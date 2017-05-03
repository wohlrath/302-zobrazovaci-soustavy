#!/usr/bin/octave -qf
clear
load dvoji
a=dvoji(:,1);
ap=dvoji(:,2);
beta=dvoji(:,3);
n=size(a)(1);

k=1
for i=1:n
for j=1:n
	fpm(i,j)=abs(ap(i)-ap(j))/abs(beta(i)-beta(j));
	fm(i,j)=beta(i)*beta(j)*abs(a(i)-a(j))/abs(beta(i)-beta(j));
	if i>j
		fp(k)=fpm(i,j);
		f(k)=fm(i,j);
		k++;
	endif
endfor
endfor


f=f';
fp=fp';

for i=1:5
	fme=median(f);
	fpme=median(fp);
	fs=std(f);
	fps=std(fp);
	for j=1:size(f)(1)
		if j<=size(f)(1)
		if abs(f(j)-fme)>3*fs
			f(j)=[];
		endif
		endif
	endfor
	for j=1:size(fp)(1)
		if j<=size(fp)(1)
		if abs(fp(j)-fpme)>3*fs
			fp(j)=[];
		endif
		endif
	endfor
	size(fp)
	fpme
	fps
endfor

for i=1:15
	fme=mean(f);
	fpme=median(fp);
	fs=std(f);
	fps=std(fp);
	for j=1:size(f)(1)
		if j<=size(f)(1)
		if abs(f(j)-fme)>0.6
			f(j)=[];
		endif
		endif
	endfor
	for j=1:size(fp)(1)
		if j<=size(fp)(1)
		if abs(fp(j)-fpme)>0.6
			fp(j)=[];
		endif
		endif
	endfor
	size(fp)
	fpme
	fps
endfor