%%%%    Tsb=EEFrameConfig(g)    %%%%
%%%%    
%%%%    E=H[0,4]=H1[0,1]*H2[1,2]*H3[2,3]*H4[3,4]    Position of the end
%%%%    effector as a function of all other homogeneous transformations
%%%%    
%%%%    Using Euler's notation
%%%%    
%%%%    H1=T01[L1,x]
%%%%    H2=T12[L2,y]*R[-90,z]
%%%%    H3=T23[L3,y]*R[-90,z]*R[90,y]
%%%%    H4=T34[L4,-y]*R[90,z]*R[-90,y]
%%%%    
%%%%    R=Rxyz=[      CyCZ     ,  -CySz      ,    Sy   ,  0
%%%%              SxSyCz+CxSz  ,-SxSySz+CxCy ,  -SxCy  ,  0
%%%%              -CxSyCz+SxSz ,CxSySz+SxCz  ,   CxCy  ,  0
%%%%                    0      ,    0        ,    0    ,  1   ]
%%%%
%%%%
%%%%    Using D-H notation
%%%%
%%%%    H= DH trasnformation matrix eed to write
%%%%    
%%%%    
%%%%
%%%%
%%%%
%%%%

%%%%    Forward kinematics as a function of t in the D-H parameter notation

t=6;        %calculate at time t

w1=pi/4;    %Angular Velocity @all time
w2=pi/8;    %Angular Velocity @all time
w3=-pi/4;   %Angular Velocity @all time
h=2;        %Pitch

tetha1=w1*t;       %angles as a function of time
tetha2=w2*t;       %angles as a function of time
tetha3=w3*t;       %angles as a function of time

L1=10+tetha1;      %Length from 0 to 1 @all time
L2=5;              %Length from 1 to 2 @all time
L3=5;              %Length from 2 to 3 @all time
L4=3;              %Length from 4 to 4 @all time

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

P(1,1)=E(1,4);P(2,1)=E(2,4);P(3,1)=E(3,4);  %P is just a simple extraction of the position matrix at the end of the homogeneous transformation




%%%% q=SpatialPosition(t) %%%%
%%%% Basicaly the same but with T(1,0,-1) translation extra at the end and
%%%% a plot

t=6;

w1=pi/4;    %Angular Velocity @all time
w2=pi/8;    %Angular Velocity @all time
w3=-pi/4;   %Angular Velocity @all time
h=2;        %Pitch

tetha1=w1*t;       %angles as a function of time
tetha2=w2*t;       %angles as a function of time
tetha3=w3*t;       %angles as a function of time

L1=10+tetha1;      %Length from 0 to 1 @all time
L2=5;              %Length from 1 to 2 @all time
L3=5;              %Length from 2 to 3 @all time
L4=3;              %Length from 4 to 4 @all time

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

P(1,1)=E(1,4);P(2,1)=E(2,4);P(3,1)=E(3,4);  %P is just a simple extraction of the position matrix at the end of the homogeneous transformation

%P=simplify(P);
%P=subs(P,t,T);
%P=simplify(P);
%plot3(P(1,:),P(2,:),P(3,:))

     

       
       