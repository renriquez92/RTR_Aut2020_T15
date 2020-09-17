%%%%    Tsb=EEFrameConfig(g)    %%%%
%%%%    
%%%%    E=H[0,4]=H1[0,1]*H2[1,2]*H3[2,3]*H4[3,4]    Position of the end
%%%%    effector as a function of all other homogeneous transformations
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
%%%%
%%%%
%%%%


L1=10;      %Length from 0 to 1 @time 0
L2=5;       %Length from 1 to 2 @all time
L3=5;       %Length from 2 to 3 @all time
L4=3;       %Length from 4 to 4 @all time
h=2;        %Pitch
w1=pi/4;    %Angular Velocity @all time
w2=pi/8;    %Angular Velocity @all time
w3=-pi/4;   %Angular Velocity @all time


 T1=[ 1 , 0 , 0 , 0  ;
      0 , 1 , 0 , 0  ;
      0 , 0 , 1 , L1 ;
      0 , 0 , 0 , 1 ];

 T2=[ 1 , 0 , 0 , 0  ;
      0 , 1 , 0 , L2 ;
      0 , 0 , 1 , 0  ;
      0 , 0 , 0 , 1 ];

 T3=[ 1 , 0 , 0 , 0  ;
      0 , 1 , 0 , L3 ;
      0 , 0 , 1 , 0  ;
      0 , 0 , 0 , 1 ];

 T4=[ 1 , 0 , 0 , 0  ;
      0 , 1 , 0 ,-L4 ;
      0 , 0 , 1 , 0  ;
      0 , 0 , 0 , 1 ];
  
  %(0,90,-90)     
R2=[     CyCZ     ,  -CySz      ,    Sy   ,  0  ;
     SxSyCz+CxSz  ,-SxSySz+CxCy ,  -SxCy  ,  0  ;
     -CxSyCz+SxSz ,CxSySz+SxCz  ,   CxCy  ,  0  ;
           0      ,    0        ,    0    ,  1 ];

  %(0,90,-90)     
R3=[     CyCZ     ,  -CySz      ,    Sy   ,  0  ;
     SxSyCz+CxSz  ,-SxSySz+CxCy ,  -SxCy  ,  0  ;
     -CxSyCz+SxSz ,CxSySz+SxCz  ,   CxCy  ,  0  ;
           0      ,    0        ,    0    ,  1 ];

  %(-90,90,0)     
R4=[     CyCZ     ,  -CySz      ,    Sy   ,  0  ;
     SxSyCz+CxSz  ,-SxSySz+CxCy ,  -SxCy  ,  0  ;
     -CxSyCz+SxSz ,CxSySz+SxCz  ,   CxCy  ,  0  ;
           0      ,    0        ,    0    ,  1 ];
       
E=T1*T2*R1*T3*R3*T4*R4;
       
%%%% q=SpatialPosition(t) %%%%


       
       
       