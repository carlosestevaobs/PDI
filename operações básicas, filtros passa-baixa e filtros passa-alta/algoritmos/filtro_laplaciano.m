%% Filtro Laplaciano 
% Processamento Digital de Imagens - PDI
% Docente: Prof. Dr. Pedro Pedrosa Rebouças Filho
% Discente: Carlos Estevão Bastos Sousa

%% Carregamento da imagem
imgOriginal = imread('basilicaCaninde.jpg');
imgCinza = rgb2gray(imgOriginal);

%% Execução e Plotagem
plotar(imgCinza);

%% Filtro Laplaciano
function imgLaplaciano = FiltroLaplaciano(vizinhanca, imgCinza)
[linha coluna] = size(imgCinza);
imgCinza=im2double(imgCinza);
imgLaplaciano = imgCinza;

switch vizinhanca
    case 1
        kernel = [0 -1 0; -1 4 -1; 0 -1 0];            % 4 vizinhos P        
    case 2
        kernel = [0 1 0; 1 -4 1; 0 1 0];               % 4 vizinhos N
    case 3
        kernel = [-1 -1 -1; -1 8 -1; -1 -1 -1];        % 8 vizinhos P        
    case 4
        kernel = [1 1 1; 1 -8 1; 1 1 1];               % 8 vizinhos N
        
end

for i = 2:linha - 1
    for j = 2 : coluna - 1
        soma = 0;
        linha1 = 0;
        coluna1 = 1;        
        for k = i - 1 : i + 1
            linha1 = linha1 + 1;
            coluna1 = 1;
            for l = j - 1 : j + 1
                soma = soma + imgCinza(k,l) * kernel(linha1,coluna1);               
                coluna1 = coluna1 + 1;
            end
        end
      imgLaplaciano(i,j) = soma;      
    end
end
end

%% Execução e Plotagem
function plotar(imgCinza)
figure (1)
subplot(1, 2, 1);
imshow(imgCinza);
title('Níveis cinza');

subplot(1, 2, 2);
imgCinzaM = imcrop(imgCinza,[720 355 300 227]);
imshow(imgCinzaM);
title('Níveis cinza com zoom');

figure (2)
subplot(2, 2, 1);
vizinhos4P = FiltroLaplaciano(1, imgCinza);
imshow(vizinhos4P);
title('Vizinhança de 4 e centro positivo');

subplot(2, 2, 2);
vizinhos4N = FiltroLaplaciano(2, imgCinza);
imshow(vizinhos4N);
title('Vizinhança de 4 e centro negativo');

subplot(2, 2, 3);
vizinhos8P = FiltroLaplaciano(3, imgCinza);
imshow(vizinhos8P);
title('Vizinhança de 8 e centro positivo');

subplot(2, 2, 4);
vizinhos8N = FiltroLaplaciano(4, imgCinza);
imshow(vizinhos8N);
title('Vizinhança de 8 e centro negativo');

figure (3)

subplot(2, 2, 1);
vizinhos4PM = imcrop(vizinhos4P,[720 355 300 227]);
imshow(vizinhos4PM);
title('Vizinhança de 4 e centro positivo (zoom)');

subplot(2, 2, 2);
vizinhos4N = imcrop(vizinhos4N,[720 355 300 227]);
imshow(vizinhos4N);
title('Vizinhança de 4 e centro negativo (zoom)');

subplot(2, 2, 3);
vizinhos8PM = imcrop(vizinhos8P,[720 355 300 227]);
imshow(vizinhos8PM);
title('Vizinhança de 8 e centro positivo (zoom)');

subplot(2, 2, 4);
vizinhos8NM = imcrop(vizinhos8N,[720 355 300 227]);
imshow(vizinhos8NM);
title('Vizinhança de 8 e centro negativo (zoom)');

end

