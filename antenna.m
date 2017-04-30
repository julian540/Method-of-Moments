clear;clc
%n = input('Input the number of delta C\n');
n = 99
mu = 4*pi*10^-7;      %����еĴŵ���
epsilon = 8.854187817e-12;   %����еĽ�糣��
lambda = 1;           %����
c = 3*10^8;           %����й���
w = 2*pi*c/lambda;    %���ٶ�
k = 2*pi / lambda;    %����
for index_y = 1:250
    l = index_y*lambda*0.01;           %�����ܳ���

    a = l/148.4;            %�ߵİ뾶 l/2a = 74.2
    delta_l = l/(n+1);      %��Ϊ�������ߣ����Էֶξ��ȣ��������˿��������������һС��

    %ȷ��λ������
    position_i = -(l/2 - 0.5*delta_l):delta_l:(l/2 - 0.5*delta_l);  %�е�
    position_i_plus = position_i + delta_l/2;                       %+
    position_i_minuts = position_i - delta_l/2;                     %-

    zmn = zeros(n);     %�迹����
    v = zeros(n,1);     %��ѹ����
    v(50) = 1;          %���е�Ӽ�����ѹ

    for index_i = 1:n
        for index_j = 1:n
            zmn(index_i,index_j) = j*w*mu*delta_l*delta_l*my_psi(position_i(index_j),position_i(index_i),delta_l,k,a)+1/(j*w*epsilon)*...
                (   my_psi(position_i_plus(index_j),position_i_plus(index_i),delta_l,k,a)       ...%++
                   -my_psi(position_i_plus(index_j),position_i_minuts(index_i),delta_l,k,a)     ...%-+
                   -my_psi(position_i_minuts(index_j),position_i_plus(index_i),delta_l,k,a)     ...%+-
                   +my_psi(position_i_minuts(index_j),position_i_minuts(index_i),delta_l,k,a)   ); %--
        end
    end
    ymn = inv(zmn);         
    alpha = ymn*v;
    zz(index_y) = ymn(50,50);
end
plot(real(zz));
title('Real\_Y')
figure();
plot(imag(zz));
title('Imag\_Y')