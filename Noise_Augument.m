% This MATLAB footprint is to adding noise to every wavefile in the folder
% and output the noised wavefile into another folder, waited to be
% processed and analyzed by Voicebox
clc
clear 

i=171;   
    files = dir('/Users/ethanwang/Google ‘∆∂À”≤≈Ã/study/UCLA/114/ML/Machine learning speech project F19 (1)/ece114_speech_data/*.wav');
for file=files'   
    
  
        
        [X,Fs] = audioread(file.name);

  

        Y = awgn(X,5,'measured');
%          m=min(Y)
        str4='/Users/ethanwang/Google ‘∆∂À”≤≈Ã/study/UCLA/114/ML/Machine learning speech project F19 (1)/ece114_speech_data/augument/';
        str2=num2str(i);
        str3=file.name;
        filename = [str4,str2,str3];
        audiowrite(filename,Y,Fs); 
        i=i+1;

end
