function drawinterface(A)
% drawinterface 来绘制游戏界面的函数

myred = [0.5050,0.0780,0.1840];
myylw = [0.9290,0.6940,0.1250];

clf
hold on

% 曹操 1
[row,col] = find(A==1);
x1 = min(col)-1;
x2 = max(col);
y1 = 5-max(row);
y2 = 5-(min(row)-1);
drawblock([x1,y1],[x2,y2],myred)
text(0.5*(x1+x2)-0.7,0.5*(y1+y2),'曹操','fontsize',36,'fontname','隶书')

% 黄忠 2
[row,col] = find(A==2);
x1 = min(col)-1;
x2 = max(col);
y1 = 5-max(row);
y2 = 5-(min(row)-1);
drawblock([x1,y1],[x2,y2],myylw)
text(0.5*(x1+x2)-0.26,0.5*(0.5*(y1+y2)+y2),'黄','fontsize',32,'fontname','隶书')
text(0.5*(x1+x2)-0.26,0.5*(0.5*(y1+y2)+y1),'忠','fontsize',32,'fontname','隶书')

% 张飞 3
[row,col] = find(A==3);
x1 = min(col)-1;
x2 = max(col);
y1 = 5-max(row);
y2 = 5-(min(row)-1);
drawblock([x1,y1],[x2,y2],myylw)
text(0.5*(x1+x2)-0.26,0.5*(0.5*(y1+y2)+y2),'张','fontsize',32,'fontname','隶书')
text(0.5*(x1+x2)-0.26,0.5*(0.5*(y1+y2)+y1),'飞','fontsize',32,'fontname','隶书')

% 马超 4
[row,col] = find(A==4);
x1 = min(col)-1;
x2 = max(col);
y1 = 5-max(row);
y2 = 5-(min(row)-1);
drawblock([x1,y1],[x2,y2],myylw)
text(0.5*(x1+x2)-0.26,0.5*(0.5*(y1+y2)+y2),'马','fontsize',32,'fontname','隶书')
text(0.5*(x1+x2)-0.26,0.5*(0.5*(y1+y2)+y1),'超','fontsize',32,'fontname','隶书')

% 赵云 5
[row,col] = find(A==5);
x1 = min(col)-1;
x2 = max(col);
y1 = 5-max(row);
y2 = 5-(min(row)-1);
drawblock([x1,y1],[x2,y2],myylw)
text(0.5*(x1+x2)-0.26,0.5*(0.5*(y1+y2)+y2),'赵','fontsize',32,'fontname','隶书')
text(0.5*(x1+x2)-0.26,0.5*(0.5*(y1+y2)+y1),'云','fontsize',32,'fontname','隶书')

% 关羽 6
[row,col] = find(A==6);
x1 = min(col)-1;
x2 = max(col);
y1 = 5-max(row);
y2 = 5-(min(row)-1);
drawblock([x1,y1],[x2,y2],myylw)
text(0.5*(x1+0.5*(x1+x2))-0.26,0.5*(y1+y2),'关','fontsize',32,'fontname','隶书')
text(0.5*(0.5*(x1+x2)+x2)-0.26,0.5*(y1+y2),'羽','fontsize',32,'fontname','隶书')

% 小卒 7 8 9 10
[row,col] = find(A>=7);
for i = 1:length(row)
    x1 = col(i)-1;
    x2 = col(i);
    y1 = 5-row(i);
    y2 = 5-(row(i)-1);
    drawblock([x1,y1],[x2,y2],myylw)
    text(0.5*(x1+x2)-0.26,0.5*(y1+y2),'卒','fontsize',32,'fontname','隶书')
end

axis equal
axis([0 4 0 5])
axis off

end
