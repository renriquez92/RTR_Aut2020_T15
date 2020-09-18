clear ALL

%%%% q=SpatialPosition(t) %%%%
%%%% Basicaly the same but with T(1,0,-1) translation extra at the end and
%%%% a plot

%t=sym('t');
%t=0:1:8;

w1=pi/4;    %Angular Velocity @all time
w2=pi/8;    %Angular Velocity @all time
w3=-pi/4;   %Angular Velocity @all time
h=2;        %Pitch
L2=5;       %Length from 1 to 2 @all time
L3=5;       %Length from 2 to 3 @all time
L4=3;       %Length from 4 to 4 @all time

for t=0:1:10

tetha1=w1*t;       %angles as a function of time
tetha2=w2*t;       %angles as a function of time
tetha3=w3*t;       %angles as a function of time

L1=10+(h*tetha1);  %Length from 0 to 1 @all time

%%%% DH = a(i-1),A(i-1),di,tethai 
    D=[  0 ,  0  , L1 , tetha1  ;
         0 , -pi , L2 , tetha2  ;
        L3 , -pi , 0  , tetha3  ;
        L4 , -pi , 0  ,   0    ];

H1=[    cos(D(1,4))          ,    -sin(D(1,4))          ,       0         ,        D(1,1)        ;
    sin(D(1,4))*cos(D(1,2))  , cos(D(1,4))*cos(D(1,2))  ,  -sin(D(1,2))   , -sin(D(1,2))*D(1,3)  ;
    sin(D(1,4))*sin(D(1,2))  , cos(D(1,4))*cos(D(1,2))  ,   cos(D(1,2))   ,  cos(D(1,2))*D(1,3)  ;
             0               ,         0                ,       0         ,          1          ];

H2=[    cos(D(2,4))          ,    -sin(D(2,4))          ,       0         ,        D(2,1)        ;
    sin(D(2,4))*cos(D(2,2))  , cos(D(2,4))*cos(D(2,2))  ,  -sin(D(2,2))   , -sin(D(2,2))*D(2,3)  ;
    sin(D(2,4))*sin(D(2,2))  , cos(D(2,4))*cos(D(2,2))  ,   cos(D(2,2))   ,  cos(D(2,2))*D(2,3)  ;
             0               ,         0                ,       0         ,          1          ];

H3=[    cos(D(3,4))          ,    -sin(D(3,4))          ,       0         ,        D(3,1)        ;
    sin(D(3,4))*cos(D(3,2))  , cos(D(3,4))*cos(D(3,2))  ,  -sin(D(3,2))   , -sin(D(3,2))*D(3,3)  ;
    sin(D(3,4))*sin(D(3,2))  , cos(D(3,4))*cos(D(3,2))  ,   cos(D(3,2))   ,  cos(D(3,2))*D(3,3)  ;
             0               ,         0                ,       0         ,          1          ];

H4=[    cos(D(4,4))          ,    -sin(D(4,4))          ,       0         ,        D(4,1)        ;
    sin(D(4,4))*cos(D(4,2))  , cos(D(4,4))*cos(D(4,2))  ,  -sin(D(4,2))   , -sin(D(4,2))*D(4,3)  ;
    sin(D(4,4))*sin(D(4,2))  , cos(D(4,4))*cos(D(4,2))  ,   cos(D(4,2))   ,  cos(D(4,2))*D(4,3)  ;
             0               ,         0                ,       0         ,          1          ];

E=H1*H2*H3*H4; %homogeneous transformation from S to b

P(1,1)=E(1,4);
P(2,1)=E(2,4);
P(3,1)=E(3,4);  %P is just a simple extraction of the position matrix at the end of the homogeneous transformation

X(1,t+1)=P(1,1);
Y(1,t+1)=P(2,1);
Z(1,t+1)=P(3,1);

end

%plot3(X,Y,Z)