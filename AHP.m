%% 输入判断矩阵
clear;clc
% A = input('输入判断矩阵A')
A =[1 1 4 1/3 3;
 1 1 4 1/3 3;
 1/4 1/4 1 1/3 1/2;
 3 3 3 1 3;
 1/3 1/3 2 1/3 1];
%% 矩阵检验
e=0;
[r,c]=size(A);
if r ~= c  || r <= 1 || c<=1
    disp('输入的判断矩阵A不是方阵或是1*1矩阵');
    e = 1;
end
n=size(A,1);
if sum(sum(A <= 0)) > 0
    disp('输入的判断矩阵A的元素中出现负数');    
    e = 2;
end
if n > 15
    disp('输入的判断矩阵A的行数大于15'); 
    e = 3;
end
if sum(sum(A' .* A ~=  ones(n))) > 0
    disp('输入的判断矩阵A不是正互反矩阵');
    e = 4;
end
if n==2
    disp('2*2矩阵是一致性矩阵，无需一致性检验');
    e = 5;
    [maxeig,v] = MAX_eig(A);
    qz1 = EIG_AHP(v);
    qz2 = MEAN_AHP(A,n);
    qz3 = GEOMEAN_AHP(A,n);
end
if e==0
    %最大特征值maxeig与对应的特征向量v
    [maxeig,v] = MAX_eig(A);
    CR = IF_consistent(maxeig,n);
    %特征值法求权重
    qz1 = EIG_AHP(v);
    %算术平均法求权重
    qz2 = MEAN_AHP(A,n);
    %几何平均法求权重
    qz3 = GEOMEAN_AHP(A,n);
end
%% 相关函数
function [maxeig,v] = MAX_eig(A)
    [V,D] = eig(A); 
    maxeig = max(D(:));
    [r,~] = find(D == maxeig , 1);
    v = V(:,r);
end
function CR = IF_consistent(maxeig,n)
    CI = (maxeig - n) / (n-1);
    RI=[0 0 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59];
    CR=CI/RI(n);
    disp('一致性指标CI=');disp(CI);
    disp('一致性比例CR=');disp(CR);
    if CR<0.10
        disp('因为CR < 0.10，所以该判断矩阵A的一致性可以接受!');
    else
        disp('注意：CR >= 0.10，因此该判断矩阵A需要进行修改!');
    end
end
function qz1 = EIG_AHP(v)
    qz1 = v./sum(v);
    disp('特征值法求权重的结果为：');
    disp(qz1);
end
function qz2 = MEAN_AHP(A,n)
    Sum_A = sum(A);
    SUM_A = repmat(Sum_A,n,1);
    Stand_A = A ./ SUM_A;
    sum(Stand_A,2);
    qz2 = sum(Stand_A,2) / n;
    disp('算术平均法求权重的结果为：');
    disp(qz2);
end
function qz3 = GEOMEAN_AHP(A,n)
    Prod_A = prod(A,2);
    StandProd_A = Prod_A .^ (1/n);
    qz3 = StandProd_A./sum(StandProd_A);
    disp('几何平均法求权重的结果为：');
    disp(qz3);
end