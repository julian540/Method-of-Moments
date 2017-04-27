clear;clc
n = input('Input the number of delta C\n');
mu = 4*pi*10^-7       %真空中的磁导率
eta = 120*pi;         %真空中的波阻抗
epsilon = 8.854187817e-12;   %真空中的介电常数
lambda = 1;           %波长
c = 3*10^8            %真空中光速
w = 2*pi*c/lambda     %角速度
k = 2*pi / lambda;    %波数
l = 1;                %天线总长度
delta_l = l/(n+1);      %因为是线天线，所以分段均匀，并且两端看做带有零电流的一小段

%确定位置坐标
position_i = -(l/2 - 0.5*delta_l):delta_l:(l/2 - 0.5*delta_l);
position_i_plus = position_i + delta_l/2;
position_i_minuts = position_i - delta_l/2;

zmn = zeros(n);
v = zeros(n:1);
for index_i = 1:n
    for index_j = 1:n
        zmn(index_i,index_j) = j*w*mu*delta_l*delta_l*my_psi(index_j,index_i,delta_l,k)+1/(j*w*epsilon)...
            (   my_psi(n,m,         ...%++
               -my_psi(n,m,         ...%-+
               -my_psi(n,m,         ...%+-
               +my_psi(n,m,         )  %--
    end
end

alpha = zmn\v;
