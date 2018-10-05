%% Multi-Limiarização
% Processamento Digital de Imagens - PDI
% Docente: Prof. Dr. Pedro Pedrosa Rebouças Filho
% Discente: Carlos Estevão Bastos Sousa

%% Carregamento da imagem
imgOriginal = imread('lena.png');
imgCinza = rgb2gray(imgOriginal);

%% Execução e Plotagem
plotar(imgCinza);

%% Função de Multi-limiarização
function imgLimiar = Multilimiarizacao(limiarInf, limiarSup, imgCinza)
[m, n] = size(imgCinza);
imgLimiar = zeros(m, n);

for i = 1: m
    for j = 1:n
        if (imgCinza(i, j) >= limiarSup)
            imgLimiar(i, j) = 255;
        elseif (imgCinza(i, j) <= limiarSup && imgCinza(i, j) > limiarInf)
            imgLimiar(i, j) = 200;        
        else
            imgLimiar(i, j) = 0;            
        end
    end
end
imgLimiar = uint8(imgLimiar);
end

%% Plotagem e execução
function plotar(imgCinza)
subplot(2,4,1);
imgLimiar = Multilimiarizacao(50, 100, imgCinza);
imshow(imgLimiar);
title("50 e 100");

subplot(2,4,2);
imgLimiar = Multilimiarizacao(75,150, imgCinza);
imshow(imgLimiar);
title("75 e 150");

subplot(2,4,3);
imgLimiar = Multilimiarizacao(100, 150, imgCinza);
imshow(imgLimiar);
title("100 e 150");

subplot(2,4,4);
imgLimiar = Multilimiarizacao(200, 250, imgCinza);
imshow(imgLimiar);
title("200 e 250");

subplot(2,4,5);
imgLimiar = Multilimiarizacao(50, 100, imgCinza);
histogram(imgLimiar);
title("50 e 100");

subplot(2,4,6);
imgLimiar = Multilimiarizacao(75,150, imgCinza);
histogram(imgLimiar);
title("75 e 150");

subplot(2,4,7);
imgLimiar = Multilimiarizacao(100, 150, imgCinza);
histogram(imgLimiar);
title("100 e 150");

subplot(2,4,8);
imgLimiar = Multilimiarizacao(200, 250, imgCinza);
histogram(imgLimiar);
title("200 e 250");

end