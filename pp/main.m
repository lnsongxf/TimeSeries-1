
%load('fontes.txt');
%x=fontes(3,1:250)';
load('x.txt');
series=x;

%Pre-processamento%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%heterocedasticidade%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c=1;
[residuo] = hetero(x,c);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%heterocedasticidade inversa%%%%%%%
[serie_rec] = heteroinv(residuo,c);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%tendencia%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nru=ordint(series);%Testa
nru=1;%pode apagar
if nru>0
[residuo,series0] = integracao(series,nru);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Tendencia (inversa)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[serie_rec] = integracaoinv(residuo,series0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Ciclos%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%x=fontes_sinteticas(4,1:500)';
grau=0;%grau do polin�nimo a ser retirado
nc=1;%numero de componentes a ser retirada
[residuo,retirada]=tendciclos(x,grau,nc);
%figure;plot(residuo);hold on;plot(x,'r');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ciclos (inversa)%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for m=1:length(residuo),
serie_rec_tc(m)=reconstroi_tc2(residuo(m),retirada,m);%TESTE COLOCANDO mm+m
end
figure;plot(serie_rec_tc);hold on;plot(x,'r');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Sazonalidades%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ps=5;
[residuo,series0]=difsaz(series,ps);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Sazonalidades (inversa)%%%%%%%%%%%%%%%%%%%%%%%%%%%%
series_rec=intsaz(residuo,ps,series0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure;plot(series);hold on;plot(serie_rec,'r');
