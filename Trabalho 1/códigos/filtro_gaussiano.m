%% Filtro Gaussiano
% Processamento Digital de Imagens - PDI
% Docente: Prof. Dr. Pedro Pedrosa Rebouças Filho
% Discente: Carlos Estevão Bastos Sousa

%% Carregamento da imagem
imgOriginal = imread('lena.png');
imgCinza = rgb2gray(imgOriginal);
imgCinza = imnoise(imgCinza, 'salt & pepper', 0.1);

%% Execução e Plotagem
plotar(imgCinza);

%% Filtro de Gauss
function imgGaussiana = FiltroGaussiano(sigma, vizinhanca, imgCinza)
kernel = zeros(vizinhanca, vizinhanca);
SomaElementos = 0;         
centro = round(vizinhanca/2);
vizinhos = round((vizinhanca/2)-1);

for i = 1:vizinhanca
    for j = 1:vizinhanca
        sq_dist = (i - centro)^2 + (j - centro)^2;            
        kernel(i,j)  = exp(-1*(sq_dist)/(2*sigma*sigma));
        SomaElementos = SomaElementos + kernel(i,j);
    end
end
kernel = kernel/SomaElementos;

%% Aplicação do filtro gaussiano na imagem
[m, n] = size(imgCinza);
output = zeros(m, n);
Im = padarray(imgCinza, [vizinhos vizinhos]);

for i = 1: m
    for j = 1: n
        temp = Im(i: i + (vizinhanca - 1), j: j + (vizinhanca - 1));
        temp = double(temp);
        conv = temp.* kernel;
        output(i,j) = sum(conv(:));
    end
end
imgGaussiana = uint8(output);
end

%% Execução e Plotagem
function plotar(imgCinza)
subplot(4,4,2);
imshow(imgCinza);
title('Níveis cinza com zoom');

subplot(4,4,3);
imgCinzaM = imcrop(imgCinza,[250 245 40 40]);
imshow(imgCinzaM);
title('Níveis cinza com zoom');

subplot(4,4,5);
img3x3 = FiltroGaussiano(1, 3,imgCinza);
imshow(img3x3);
title('Filtro gaussiano (3 x 3) e \sigma = 1');

subplot(4,4,6);
img3x3N = imcrop(img3x3,[250 245 40 40]);
imshow(img3x3N);
title('Filtro gaussiano (3 x 3) e \sigma = 1 - zoom');

subplot(4,4,7);
img3x3 = FiltroGaussiano(2, 3,imgCinza);
imshow(img3x3);
title('Filtro gaussiano (3 x 3) e \sigma = 2');

subplot(4,4,8);
img3x3N = imcrop(img3x3,[250 245 40 40]);
imshow(img3x3N);
title('Filtro gaussiano (3 x 3) e \sigma = 2 - zoom');


subplot(4,4,9);
img5x5 = FiltroGaussiano(1, 5,imgCinza);
imshow(img5x5);
title('Filtro gaussiano (5 x 5) e \sigma = 1');

subplot(4,4,10);
img5x5N = imcrop(img5x5,[250 245 40 40]);
imshow(img5x5N);
title('Filtro gaussiano (5 x 5) e \sigma = 1 - zoom');

subplot(4,4,11);
img5x5 = FiltroGaussiano(2, 5,imgCinza);
imshow(img5x5);
title('Filtro gaussiano (5 x 5) e \sigma = 2');

subplot(4,4,12);
img5x5N = imcrop(img5x5,[250 245 40 40]);
imshow(img5x5N);
title('Filtro gaussiano (5 x 5) e \sigma = 2 - zoom');

subplot(4,4,13);
img7x7 = FiltroGaussiano(1, 7,imgCinza);
imshow(img7x7);
title('Filtro gaussiano (7 x 7) e \sigma = 1');

subplot(4,4,14);
img7x7N = imcrop(img7x7,[250 245 40 40]);
imshow(img7x7N);
title('Filtro gaussiano (7 x 7) e \sigma = 1 - zoom');

subplot(4,4,15);
img7x7 = FiltroGaussiano(2, 7,imgCinza);
imshow(img7x7);
title('Filtro gaussiano (7 x 7) e \sigma = 2');

subplot(4,4,16);
img7x7N = imcrop(img7x7,[250 245 40 40]);
imshow(img7x7N);
title('Filtro gaussiano (7 x 7) e \sigma = 2 - zoom');

end