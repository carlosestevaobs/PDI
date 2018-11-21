%% Limiarização
% Processamento Digital de Imagens - PDI
% Docente: Prof. Dr. Pedro Pedrosa Rebouças Filho
% Discente: Carlos Estevão Bastos Sousa

%% Carregamento da imagem
imgOriginal = imread('lena.png');
imgCinza = rgb2gray(imgOriginal);

%% Execução e Plotagem
plotar(imgCinza);

%% Função de limiarização
function imgLimiar = limiarizacao(limiar, imgCinza)
    [m, n] = size(imgCinza);
    imgLimiar = zeros(m, n);
    
    for i = 1: m
        for j = 1:n
            if (imgCinza(i, j) > limiar) 
                imgLimiar(i, j) = 255;                
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
imgLimiar = limiarizacao(50, imgCinza);
imshow(imgLimiar);
title("50");

subplot(2,4,2);
imgLimiar = limiarizacao(100, imgCinza);
imshow(imgLimiar);
title("100");

subplot(2,4,3);
imgLimiar = limiarizacao(150, imgCinza);
imshow(imgLimiar);
title("150");

subplot(2,4,4);
imgLimiar = limiarizacao(200, imgCinza);
imshow(imgLimiar);
title("200");

subplot(2,4,5);
imgLimiar = limiarizacao(50, imgCinza);
histogram(imgLimiar);
title("50");

subplot(2,4,6);
imgLimiar = limiarizacao(100, imgCinza);
histogram(imgLimiar);
title("100");

subplot(2,4,7);
imgLimiar = limiarizacao(150, imgCinza);
histogram(imgLimiar);
title("150");

subplot(2,4,8);
imgLimiar = limiarizacao(200, imgCinza);
histogram(imgLimiar);
title("200");
end