function A = generatemap()
%generatemap 生成一5*4的矩阵，符合华容道的要求
%避免了曹操出现在出口的可能，但不保证有解
%生成例如下图的数字矩阵
A = zeros(5,4);
%生成1曹操
while 1
    row = randi([1,4]);
    col = randi([1,3]);
    A(row,col) = 1;
    A(row+1,col) = 1;
    A(row,col+1) = 1;
    A(row+1,col+1) = 1;
    if row ~= 4 || col ~= 2
        break
    end
end
%生成2黄忠
while 1
    row = randi([1,4]);
    col = randi([1,4]);
    if A(row,col) == 0 && A(row+1,col) == 0
        A(row,col) = 2;
        A(row+1,col) = 2;
        break
    end
end
%生成3张飞
while 1
    row = randi([1,4]);
    col = randi([1,4]);
    if A(row,col) == 0 && A(row+1,col) == 0
        A(row,col) = 3;
        A(row+1,col) = 3;
        break
    end
end
%生成4马超
while 1
    row = randi([1,4]);
    col = randi([1,4]);
    if A(row,col) == 0 && A(row+1,col) == 0
        A(row,col) = 4;
        A(row+1,col) = 4;
        break
    end
end
%生成5赵云
while 1
    row = randi([1,4]);
    col = randi([1,4]);
    if A(row,col) == 0 && A(row+1,col) == 0
        A(row,col) = 5;
        A(row+1,col) = 5;
        break
    end
end
%生成6关羽
while 1
    row = randi([1,5]);
    col = randi([1,3]);
    if A(row,col) == 0 && A(row,col+1) == 0
        A(row,col) = 6;
        A(row,col+1) = 6;
        break
    end
end
%生成7小卒
for num = 1:4
    while 1
        row = randi([1,5]);
        col = randi([1,4]);
        if A(row,col) == 0
            A(row,col) = num + 6;
            break
        end
    end
end
end


