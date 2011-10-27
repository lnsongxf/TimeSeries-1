clear all; clc;

serie_alvo=41;
limiar_corr=0.95;

[serie_trval, serie_teste, series_selecionadas] = carga_eletrica(serie_alvo,limiar_corr);

%Substitui��o dos outliers simulados pelas posi��es detectadas por SCICA
s=load('carga_eletrica_98_estimada.txt');
x=load('carga_eletrica_98.txt');

%Falsos alarmes detectados por SCICA
p1=[183 189 217 256 358];
p2=[88 135];
p3=[88 103];
p4=[101 103 113];
p5=[93 103 121 241 247 252];
p6=[121 359];
p7=[103 359];
p8=[];

x(1,p1)=s(1, p1);
x(2,p2)=s(2,p2);
x(3,p3)=s(3,p3);
x(4,p4)=s(4,p4);
x(5,p5)=s(5,p5);
x(6,p6)=s(6,p6);
x(7,p7)=s(6,p7);
x(8,p8)=s(6,p8);
serie_teste=x;

%Outlies %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s=load('carga_eletrica_98_estimada.txt');
x=load('carga_eletrica_98.txt');

%Falsos alarmes SEM ICA
p1=[217 256 358];
p2=[88 90 91 100 101 103 122 135];
p3=[88 91 93 94 135];
p4=[61 63 101 103 113 135 359];
p5=[91 93 104 119 121 250];
p6=[121 345];
p7=[70 78 94 103 135 139 275 277];
p8=[69 70];

x(1,p1)=s(1, p1);
x(2,p2)=s(2,p2);
x(3,p3)=s(3,p3);
x(4,p4)=s(4,p4);
x(5,p5)=s(5,p5);
x(6,p6)=s(6,p6);
x(7,p7)=s(6,p7);
x(8,p8)=s(6,p8);
serie_teste=x;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Substitui��o dos outliers simulados pelas posi��es detectadas por SCICA
s=load('carga_eletrica_98_estimada.txt');
x=load('carga_eletrica_98.txt');

%Falsos alarmes detectados por MCICA
p1=[93 132 159 358 365];
p2=[101 121 365];
p3=[93 101 365];
p4=[101];
p5=[121 346];
p6=[101 121 359];
p7=[121 251 346 359];
p8=[121 346];

x(1,p1)=s(1, p1);
x(2,p2)=s(2,p2);
x(3,p3)=s(3,p3);
x(4,p4)=s(4,p4);
x(5,p5)=s(5,p5);
x(6,p6)=s(6,p6);
x(7,p7)=s(6,p7);
x(8,p8)=s(6,p8);
serie_teste=x;

