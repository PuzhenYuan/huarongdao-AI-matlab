function choice = myhua(A)
%myhua函数用来进行玩家游戏并进行鼠标控制
%返回的choice用于控制是否进行下一盘
map = A;
drawinterface(map)
while 1
    %通关判断
    if map(5,2)==1 && map(5,3)==1
        choice = menu('成功通关，是否继续游戏？','是','否');
        break
    end
    %获取鼠标
    while 1
        [xpos,ypos] = ginput(1);
        col = ceil(xpos);
        row = 5-ceil(ypos)+1;
        if col <= 4 && col >= 1 && row <= 5 && row >= 1
            rollnum = map(row,col);
            break
        else 
            fprintf('请重新点击\n');
        end
    end
    switch rollnum

        case 1%点击了曹操
            [r,c] = find(map==1);
            rowmax = max(r);
            rowmin = min(r);
            colmax = max(c);
            colmin = min(c);
            
            %判断是否能向左移
            if colmin>1 && isequal(map([rowmin,rowmax],colmin-1),[0;0])
                map([rowmin,rowmax],colmin-1)=[1;1];
                map([rowmin,rowmax],colmax)=[0;0];
                drawinterface(map)
            end
            
            %判断是否能向右移
            if colmax<4 && isequal(map([rowmin,rowmax],colmax+1),[0;0])
                map([rowmin,rowmax],colmax+1)=[1;1];
                map([rowmin,rowmax],colmin)=[0;0];
                drawinterface(map)
            end
            
            %判断是否能向下移
            if rowmin>1 && isequal(map(rowmin-1,[colmin,colmax]),[0,0])
                map(rowmin-1,[colmin,colmax])=[1,1];
                map(rowmin+1,[colmin,colmax])=[0,0];
                drawinterface(map)
            end
            
            %判断是否能向上移
            if rowmax<5 && isequal(map(rowmax+1,[colmin,colmax]),[0,0])
                map(rowmax+1,[colmin,colmax])=[1,1];
                map(rowmax-1,[colmin,colmax])=[0,0];
                drawinterface(map)
            end
            
        case 2% 点击了黄忠
            [r,c] = find(map==2);
            rowmax = max(r);
            rowmin = min(r);
            colmax = max(c);
            colmin = min(c);
            
            %判断是否能向左移
            if colmin>1 && isequal(map([rowmin,rowmax],colmin-1),[0;0])
                map([rowmin,rowmax],colmin-1)=[2;2];
                map([rowmin,rowmax],colmax)=[0;0];
                drawinterface(map)
            end
            
            %判断是否能向右移
            if colmax<4 && isequal(map([rowmin,rowmax],colmax+1),[0;0])
                map([rowmin,rowmax],colmax+1)=[2;2];
                map([rowmin,rowmax],colmin)=[0;0];
                drawinterface(map)
            end
            
            if rowmin>1 && map(rowmin-1,colmin)==0
                if rowmax<5 && map(rowmax+1,colmin)==0%如果又能上移又能下移，则要点击的部位
                    %点击部分在上半，则上移，下半则下移
                    if ypos - (5-rowmin) > 0
                        flag = 1;
                    else
                        flag = 2;
                    end
                    switch flag
                        case 1%上移
                            map(rowmin-1,colmin) = 2;
                            map(rowmin+1,colmin) = 0;
                            drawinterface(map)
                        case 2%下移
                            map(rowmax+1,colmin) = 2;
                            map(rowmax-1,colmin) = 0;
                            drawinterface(map)
                    end
                else%只能上移
                    map(rowmin-1,colmin) = 2;
                    map(rowmin+1,colmin) = 0;
                    drawinterface(map)
                end
            elseif rowmax<5 && map(rowmax+1,colmin)==0
                map(rowmax+1,colmin) = 2;
                map(rowmax-1,colmin) = 0;
                drawinterface(map)
            end            
            
        case 3%张飞
            [r,c] = find(map==3);
            rowmax = max(r);
            rowmin = min(r);
            colmax = max(c);
            colmin = min(c);
            
            %判断是否能向左移
            if colmin>1 && isequal(map([rowmin,rowmax],colmin-1),[0;0])
                map([rowmin,rowmax],colmin-1)=[3;3];
                map([rowmin,rowmax],colmax)=[0;0];
                drawinterface(map)
            end
            	
            %判断是否能向右移
            if colmax<4 && isequal(map([rowmin,rowmax],colmax+1),[0;0])
                map([rowmin,rowmax],colmax+1)=[3;3];
                map([rowmin,rowmax],colmin)=[0;0];
                drawinterface(map)
            end
            
            if rowmin>1 && map(rowmin-1,colmin)==0
                if rowmax<5 && map(rowmax+1,colmin)==0%如果又能上移又能下移，则要点击的部位
                    %点击部分在上半，则上移，下半则下移
                    if ypos - (5-rowmin) > 0
                        flag = 1;
                    else
                        flag = 2;
                    end
                    switch flag
                        case 1%上移
                            map(rowmin-1,colmin) = 3;
                            map(rowmin+1,colmin) = 0;
                            drawinterface(map)
                        case 2%下移
                            map(rowmax+1,colmin) = 3;
                            map(rowmax-1,colmin) = 0;
                            drawinterface(map)
                    end
                else%只能上移
                    map(rowmin-1,colmin) = 3;
                    map(rowmin+1,colmin) = 0;
                    drawinterface(map)
                end
            elseif rowmax<5 && map(rowmax+1,colmin)==0
                map(rowmax+1,colmin) = 3;
                map(rowmax-1,colmin) = 0;
                drawinterface(map)
            end
            
        case 4%马超
            [r,c] = find(map==4);
            rowmax = max(r);
            rowmin = min(r);
            colmax = max(c);
            colmin = min(c);
            
            %判断是否能向左移
            if colmin>1 && isequal(map([rowmin,rowmax],colmin-1),[0;0])
                map([rowmin,rowmax],colmin-1)=[4;4];
                map([rowmin,rowmax],colmax)=[0;0];
                drawinterface(map)
            end
            
            %判断是否能向右移
            if colmax<4 && isequal(map([rowmin,rowmax],colmax+1),[0;0])
                map([rowmin,rowmax],colmax+1)=[4;4];
                map([rowmin,rowmax],colmin)=[0;0];
                drawinterface(map)
            end
            
            if rowmin>1 && map(rowmin-1,colmin)==0
                if rowmax<5 && map(rowmax+1,colmin)==0%如果又能上移又能下移，则要点击的部位
                    %点击部分在上半，则上移，下半则下移
                    if ypos - (5-rowmin) > 0
                        flag = 1;
                    else
                        flag = 2;
                    end
                    switch flag
                        case 1%上移
                            map(rowmin-1,colmin) = 4;
                            map(rowmin+1,colmin) = 0;
                            drawinterface(map)
                        case 2%下移
                            map(rowmax+1,colmin) = 4;
                            map(rowmax-1,colmin) = 0;
                            drawinterface(map)
                    end
                else%只能上移
                    map(rowmin-1,colmin) = 4;
                    map(rowmin+1,colmin) = 0;
                    drawinterface(map)
                end
            elseif rowmax<5 && map(rowmax+1,colmin)==0
                map(rowmax+1,colmin) = 4;
                map(rowmax-1,colmin) = 0;
                drawinterface(map)
            end
            
        case 5%赵云
            [r,c] = find(map==5);
            rowmax = max(r);
            rowmin = min(r);
            colmax = max(c);
            colmin = min(c);
            
            %判断是否能向左移
            if colmin>1 && isequal(map([rowmin,rowmax],colmin-1),[0;0])
                map([rowmin,rowmax],colmin-1)=[5;5];
                map([rowmin,rowmax],colmax)=[0;0];
                drawinterface(map)
            end
            
            %判断是否能向右移
            if colmax<4 && isequal(map([rowmin,rowmax],colmax+1),[0;0])
                map([rowmin,rowmax],colmax+1)=[5;5];
                map([rowmin,rowmax],colmin)=[0;0];
                drawinterface(map)
            end
            
            if rowmin>1 && map(rowmin-1,colmin)==0
                if rowmax<5 && map(rowmax+1,colmin)==0%如果又能上移又能下移，则要点击的部位
                    %点击部分在上半，则上移，下半则下移
                    if ypos - (5-rowmin) > 0
                        flag = 1;
                    else
                        flag = 2;
                    end
                    switch flag
                        case 1%上移
                            map(rowmin-1,colmin) = 5;
                            map(rowmin+1,colmin) = 0;
                            drawinterface(map)
                        case 2%下移
                            map(rowmax+1,colmin) = 5;
                            map(rowmax-1,colmin) = 0;
                            drawinterface(map)
                    end
                else%只能上移
                    map(rowmin-1,colmin) = 5;
                    map(rowmin+1,colmin) = 0;
                    drawinterface(map)
                end
            elseif rowmax<5 && map(rowmax+1,colmin)==0
                map(rowmax+1,colmin) = 5;
                map(rowmax-1,colmin) = 0;
                drawinterface(map)
            end
            
        case 6%关羽
            [r,c] = find(map==6);
            rowmax = max(r);
            rowmin = min(r);
            colmax = max(c);
            colmin = min(c);
            
            %判断是否能向上移
            if rowmin>1 && isequal(map(rowmin-1,[colmin,colmax]),[0,0])
                map(rowmin-1,[colmin,colmax])=[6,6];
                map(rowmin,[colmin,colmax])=[0,0];
                drawinterface(map)
            end
            
            %判断是否能向下移
            if rowmax<5 && isequal(map(rowmax+1,[colmin,colmax]),[0,0])
                map(rowmax+1,[colmin,colmax])=[6,6];
                map(rowmax,[colmin,colmax])=[0,0];
                drawinterface(map)
            end
            
            if colmin>1 && map(rowmin,colmin-1)==0
                if colmax<4 && map(rowmax,colmax+1)==0%如果又能左移又能右移，则要点击的部位
                    %点击部分在左半，则左移，右半则右移
                    if xpos - colmin < 0
                        flag = 1;
                    else
                        flag = 2;
                    end
                    switch flag
                        case 1%左移
                            map(rowmax,colmin-1) = 6;
                            map(rowmax,colmin+1) = 0;
                            drawinterface(map)
                        case 2%右移
                            map(rowmax,colmax+1) = 6;
                            map(rowmax,colmax-1) = 0;
                            drawinterface(map)
                    end
                else%只能左移
                    map(rowmax,colmin-1) = 6;
                    map(rowmax,colmin+1) = 0;
                    drawinterface(map)
                end
            elseif colmax<4 && map(rowmax,colmax+1)==0
                map(rowmax,colmax+1) = 6;
                map(rowmax,colmax-1) = 0;
                drawinterface(map)
            end
            
        case {7,8,9,10} %小卒
            if row>1 && map(row-1,col)==0 % 上
                if col>1 && map(row,col-1)==0  % 左
                    %点击部分在右上，则上移，点击部分在左下，则下移
                    if ypos + xpos - floor(ypos) - floor(xpos) > 1
                        flag = 1;
                    else
                        flag = 2;
                    end
                    switch flag
                        case 1
                            map(row-1,col) = rollnum;
                            map(row,col) = 0;
                            drawinterface(map)
                        case 2
                            map(row,col-1) = rollnum;
                            map(row,col) = 0;
                            drawinterface(map)
                    end
                elseif row<5 && map(row+1,col)==0% 下
                    %点击部分在上半，则上移，下半则下移
                    if ypos - floor(ypos) > 0.5
                        flag = 1;
                    else
                        flag = 2;
                    end
                    switch flag
                        case 1
                            map(row-1,col) = rollnum;
                            map(row,col) = 0;
                            drawinterface(map)
                        case 2
                            map(row+1,col) = rollnum;
                            map(row,col) = 0;
                            drawinterface(map)
                    end
                elseif col<4 && map(row,col+1)==0  %右
                    %点击部分在右下，则右移，在左上，则上移
                    if ypos - floor(ypos) > xpos - floor(xpos)
                        flag = 1;
                    else
                        flag = 2;
                    end
                    switch flag
                        case 1
                            map(row-1,col) = rollnum;
                            map(row,col) = 0;
                            drawinterface(map)
                        case 2
                            map(row,col+1) = rollnum;
                            map(row,col) = 0;
                            drawinterface(map)
                    end
                else  %只能向上
                    map(row-1,col) = rollnum;
                    map(row,col) = 0;
                    drawinterface(map)
                end
            elseif col>1 && map(row,col-1)==0%左
                if row<5 && map(row+1,col)==0%下
                    %点击部分在左上，则左移，点击部分在右下，则下移
                    if ypos - floor(ypos) > xpos - floor(xpos)
                        flag = 1;
                    else
                        flag = 2;
                    end
                    switch flag
                        case 1
                            map(row,col-1) = rollnum;
                            map(row,col) = 0;
                            drawinterface(map)
                        case 2
                            map(row+1,col) = rollnum;
                            map(row,col) = 0;
                            drawinterface(map)
                    end
                elseif col<4 && map(row,col+1)==0%右
                    %点击部分在右半，则右移，左半则左移
                    if xpos - floor(xpos) < 0.5
                        flag = 1;
                    else
                        flag = 2;
                    end
                    switch flag
                        case 1
                            map(row,col-1) = rollnum;
                            map(row,col) = 0;
                            drawinterface(map)
                        case 2
                            map(row,col+1) = rollnum;
                            map(row,col) = 0;
                            drawinterface(map)
                    end
                else%只能向左
                    map(row,col-1) = rollnum;
                    map(row,col) = 0;
                    drawinterface(map)
                end
            elseif row<5 && map(row+1,col)==0%下
                if col<4 && map(row,col+1)==0%右
                    %点击部分在右上，则右移，点击部分在左下，则下移
                    if ypos - floor(ypos) + xpos - floor(xpos) < 1
                        flag = 1;
                    else
                        flag = 2;
                    end
                    switch flag
                        case 1
                            map(row+1,col) = rollnum;
                            map(row,col) = 0;
                            drawinterface(map)
                        case 2
                            map(row,col+1) = rollnum;
                            map(row,col) = 0;
                            drawinterface(map)
                    end
                else%只能向下
                    map(row+1,col) = rollnum;
                    map(row,col) = 0;
                    drawinterface(map)
                end
            elseif col<4 && map(row,col+1)==0%只能向右
                map(row,col+1) = rollnum;
                map(row,col) = 0;
                drawinterface(map)
            end
            
    end
end
end