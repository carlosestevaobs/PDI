%% Filtro Mediana 
% Processamento Digital de Imagens - PDI
% Docente: Prof. Dr. Pedro Pedrosa Rebouças Filho
% Discente: Carlos Estevão Bastos Sousa

%% Carregamento da imagem
imgOriginal = imread('lena.png');
imgCinza = rgb2gray(imgOriginal);

%% Adicionando ruído na imagem
imgRuido = imnoise(imgCinza, 'salt & pepper', 0.1);

%% Execução e Plotagem
plotar(imgOriginal, imgCinza, imgRuido);

%% Filtro da mediana
function imgMediana = CalcularMediana(vizinhanca, imgRuido)    
    vizinhos = round((vizinhanca/2)-1);
    [m, n] = size(imgRuido);
    imgMediana = zeros(m, n);
    for i = 1: m
        for j = 1: n
        xmin = max(1, i - vizinhos);
        xmax = min(m, i + vizinhos);
        ymin = max(1, j - vizinhos);
        ymax = min(n, j + vizinhos);
        
        temp = imgRuido(xmin:xmax, ymin:ymax);        
        imgMediana(i, j) = median(temp(:));        
        end
    end
    imgMediana  = uint8(imgMediana);
end

%% Plotagem e chamada de método
function plotar(imgCinza, imgRuido)
    figure (1)
    subplot(3,3,1);
    imshow(imgCinza);
    title('Imagem com níveis de cinza');

    subplot(3,3,2);
    imshow(imgRuido);
    title('Ruídos (sal e pimenta)');
    
    subplot(3,3,4);
    img3x3 = CalcularMediana(3, imgRuido);
    imshow(img3x3);
    title('Mediana (3 x 3)');
    
    subplot(3,3,5);
    img5x5 = CalcularMediana(5,imgRuido);   
    imshow(img5x5);
    title('Mediana (5 x 5)');
    
    subplot(3,3,6);
    img7x7 = CalcularMediana(7,imgRuido);
    imshow(img7x7);
    title('Mediana (7 x 7)');    
       
    subplot(3,3,7);
    img3x3M = imcrop(img3x3,[250 245 40 40]);
    imshow(img3x3M);
    title('Mediana (3 x 3) com zoom');
    
    subplot(3,3,8);
    img5x5M = imcrop(img5x5,[250 245 40 40]);  
    imshow(img5x5M);
    title('Mediana (5 x 5) com zoom');
    
    subplot(3,3,9);
    img7x7M = imcrop(img7x7,[250 245 40 40]); 
    imshow(img7x7M);
    title('Mediana (7 x 7) com zoom');
   
    %% plotagem com o Histograma    
    figure (2)
    subplot(2,3,1);
    histogram(imgCinza);
    title("Imagem escala cinza");
    
    subplot(2,3,2);
    histogram(imgRuido);
    title("Imagem com ruídos");
    
    subplot(2,3,4);
    histogram(img3x3);
    title("Filtro Mediana (3x3)");
    
    subplot(2,3,5);
    histogram(img5x5);
    title("Filtro Mediana (5x5)");
    
    subplot(2,3,6);
    histogram(img7x7);
    title("Filtro Mediana (7x7)");
       
end