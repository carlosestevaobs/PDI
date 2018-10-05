%% Cálculo e apresentação do histograma - RGB
% Processamento Digital de Imagens - PDI
% Docente: Prof. Dr. Pedro Pedrosa Rebouças Filho
% Discente: Carlos Estevão Bastos Sousa

%% Carregamento da imagem
imgOriginal = imread('lena.png');
imgCinza = rgb2gray(imgOriginal);

%% Execução e plotagem
plotar(imgOriginal);

%% Calculando o histograma
function vetorHist = CalcHistograma(imgOriginal, canal)
[m, n, ~] = size(imgOriginal);
histograma = zeros(256, 1);
for i = 1: m
        for j = 1:n
            histograma(imgOriginal(i,j,canal)) = histograma(imgOriginal(i,j, canal)) + 1;
        end
end
vetorHist = histograma;
end

%% Execução e Plotagem
function plotar(imgOriginal)
subplot(1, 4, 1);
imshow(imgOriginal);
title("Imagem Original");

subplot(1, 4, 2);
bar(CalcHistograma(imgOriginal, 1), 'r');
title("Histograma - R");

subplot(1, 4, 3);
bar(CalcHistograma(imgOriginal, 2), 'g');
title("Histograma - G");

subplot(1, 4, 4);
bar(CalcHistograma(imgOriginal, 3), 'b');
title("Histograma - B");
end