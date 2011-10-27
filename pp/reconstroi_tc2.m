function amostra_rec=reconstroi_tc2(amostra,retirada,x)
% Esta funcao foi modificada da funcao original colocando x-1 no lugar de x na parte do codigo referente aos ciclos 
% O objetivo deste codigo � desfazer o pre-processamento da amostra predita pelo modelo neural
% Reconstrucao da amostra: 
% amostra = (residuo*normalizacao + comps. + tendencia)

% Reconstruindo a amostra
amostra_rec=amostra;


% "Denormalizando"
amostra_rec=amostra_rec*retirada.norma;


% Somando as componentes senoidais
for k=1:length(retirada.comps),
   amostra_rec=amostra_rec+retirada.ccos(retirada.comps(k))*cos(retirada.w(retirada.comps(k))*(x-1))+retirada.csen(retirada.comps(k))*sin(retirada.w(retirada.comps(k))*(x-1));
end

% Somando a tendencia 

% Verifica o grau da tendencia
grau=length(retirada.coefs)-1;
for k=1:grau+1,
    amostra_rec=amostra_rec+retirada.coefs(k)*(x)^(grau-k+1);
end