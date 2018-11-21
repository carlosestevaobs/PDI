%% C�lculo e apresenta��o do histograma
% Processamento Digital de Imagens - PDI
% Docente: Prof. Dr. Pedro Pedrosa Rebou�as Filho
% Discente: Carlos Estev�o Bastos Sousa

%% Carregamento da imagem
imgOriginal = imread('lena.png');
imgCinza = rgb2gray(imgOriginal);

%% Execu��o e plotagem
plotar(imgCinza);

%% Calculando o histograma
function histograma = CalcularHistograma(imgCinza)
[linha, coluna] = size(imgCinza);
histograma = zeros(1, 256);
for i = 1: linha
    for j = 1:coluna
        histograma(imgCinza(i,j)) = histograma(imgCinza(i,j)) + 1 ;
    end
end
end

%% Execu��o e Plotagem
function plotar(imgCinza)
subplot(1, 2, 1);
imshow(imgCinza);
title("imagem")

subplot(1, 2, 2);
histograma = CalcularHistograma(imgCinza);
bar(histograma);
title("Histograma (imagem cinza)")
end



