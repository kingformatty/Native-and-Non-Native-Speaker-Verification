%sF0 is fundamental frequency measured by straight measurement
%H1,2,3,4,5 A1,2,3,4,5
speaker_type='afrikaans';
figure;
for i=1:6
    path=['/Users/ethanwang/Google ‘∆∂À”≤≈Ã/study/UCLA/114/ML/Machine learning speech project F19 (1)/ece114_speech_data/',speaker_type,num2str(i),'.mat'];
    try
    load (path);
    end
    subplot(2,1,1);plot(soe);hold on;%axis ([-inf inf -inf 80]);    
end
speaker_type='english';
for i=1:6
    if i==4;continue;
    end
    path=['/Users/ethanwang/Google ‘∆∂À”≤≈Ã/study/UCLA/114/ML/Machine learning speech project F19 (1)/ece114_speech_data/',speaker_type,num2str(i),'.mat'];
    try
    load (path);
    end
    subplot(2,1,2);plot(soe);hold on;%axis ([-inf inf -inf 80]); 
end

