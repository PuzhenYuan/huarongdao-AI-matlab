%用来开始华容道并进模式选择的函数
clear;clc
A1 = [2 1 1 3;
     2 1 1 3;
     4 6 6 5;
     4 8 9 5;   %训练3305s h=117，用AI2
     7 0 0 10]; %训练950s h=2650，用AI1
A2 = [2 8 9 3;
     2 6 6 3;
     4 1 1 5;
     4 1 1 5;
     7 0 0 10];
A3 = [2 8 9 3;
     2 6 6 3;
     4 1 1 5;
     4 1 1 5;
     0 7 10 0];

B = generatemap();
% B = A1;
drawinterface(B)
while 1
    useai = menu('是否使用AI解决？','是，广度搜索','是，深度搜索','否，玩家操作','否，再次生成','否，结束游戏');
    if useai == 1
        AIhua2(B);
        pause(10);
        fprintf('重新生成')
        B = generatemap();
        drawinterface(B)
    elseif useai == 2
        AIhua(B);
        pause(10);
        fprintf('重新生成')
        B = generatemap();
        drawinterface(B)
    elseif useai == 3
        drawinterface(B)
        choice = myhua(B);
        if choice == 2
            fprintf('游戏结束\n');
            break 
        else 
            fprintf('继续游戏\n');
            B = generatemap();
        end
        close all;
    elseif useai == 4
        B = generatemap();
        drawinterface(B)
    elseif useai == 5
        fprintf('游戏结束!\n')
        close all
        break
    end
end
