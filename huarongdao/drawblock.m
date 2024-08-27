function drawblock(r1,r2,color)
% drawblock 用来绘制单个块
w = r2(1) - r1(1);
h = r2(2) - r1(2);
rectangle('Position',[r1(1),r1(2),w,h],'Curvature',0.15,'LineWidth',1,'facecolor',color)
end