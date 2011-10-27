function [serie_out] = outlier_simulado(serie,vetor_pos,vetor_out)
%Simula os outliers
%serie: serie original
%vetor_pos: posicao dos outliers
%vetor_out: numero de desvios padrao de cada outlier

num_out=length(vetor_out);
dserie=diff(serie);
serie_out=serie;

for i=1:num_out
out(:,i)=mean(dserie)+vetor_out(i)*std(dserie);
serie_out(:,vetor_pos(i))=serie(:,vetor_pos(i))+out(:,i);
end

end
