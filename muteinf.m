%This function is to calculate the mutual information for two different
%variables A and Y
function info = muteinf(A, Y)
n = size(A,1);%实例数量
Z = [A Y];%所有实例的维度值及标签
if(n/10 > 20)
    nbins = 20;
else
    nbins = max(floor(n/10),10);%设置区间的个数
end;
pA = hist(A, nbins);%min(A)到max(A)划分出nbins个区间出来，求每个区间的概率
pA = pA ./ n;%除以实例数量

i = find(pA == 0);
pA(i) = 0.00001;%不能使某一区间的概率为0

od = size(Y,2);%一个维度
cl = od;
%下面是求实例不同标签的的概率值，也就是频率
if(od == 1)
    pY = [length(find(Y==+1)) length(find(Y==-1))] / n;
    cl = 2;
else
    pY = zeros(1,od);
    for i=1:od
        pY(i) = length(find(Y==+1));
    end;
    pY = pY / n;
end;
p = zeros(cl,nbins);
rx = abs(max(A) - min(A)) / nbins;%每个区间长度
for i = 1:cl
    xl = min(A);%变量的下界
    for j = 1:nbins
        if(i == 2) && (od == 1)
            interval = (xl <= Z(:,1)) & (Z(:,2) == -1);
        else
            interval = (xl <= Z(:,1)) & (Z(:,i+1) == +1);
        end;
        if(j < nbins)
            interval = interval & (Z(:,1) < xl + rx);
        end;
        %find(interval)
        p(i,j) = length(find(interval));

        if p(i,j) == 0 % hack!
            p(i,j) = 0.00001;
        end

        xl = xl + rx;
    end;
end;
HA = -sum(pA .* log(pA));%计算当前维度的信息熵
HY = -sum(pY .* log(pY));%计算标签的信息熵
pA = repmat(pA,cl,1);
pY = repmat(pY',1,nbins);
p = p ./ n;
info = sum(sum(p .* log(p ./ (pA .* pY))));
info = 2 * info ./ (HA + HY);%计算互信息
