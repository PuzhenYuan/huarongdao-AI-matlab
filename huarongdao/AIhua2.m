function AIhua2(A)
%AIhua2 使用广度优先搜索算法来实现最优解的查找
%A是初始的输入矩阵

tic;

map = A;
drawinterface(map);

%初始化循环，预先赋值是为了加速

tree{100} = {};%用于存储node
% for i = 1:100
%     tree{i} = {};
% end
tree{1}{1} = node(map);

h = 2;
treehi = 1;

record{25000} = node(zeros(5,4));%用来储存已生成的结点
% for i = 1:25000
%     record{i} = node(zeros(5,4));
% end
record{1} = tree{1}{1};
recordi = 1;%记录record长度，用来加速

win = 0;

while 1%该循环用于增加搜索层的深度h
    %tic;
    hold = treehi;%记录上一层的结点数
    tree{h} = {};
    tree{h}{300} = node(zeros(5,4));
    treehi = 0;
    for j = 1:hold%该循环用于遍历没层树中每个元素
        if win == 1
            break
        end
        for i = 1:length(tree{h-1}{j}.movelist_can)%遍历每个结点的下一个动作
            act = tree{h-1}{j}.movelist_can{i};
            %tree{h-1}{j}.addtry(act);
            newnode = tree{h-1}{j}.next(act);
            if newnode.isin(record,recordi) || newnode.mirror().isin(record,recordi)%判断是否已经是record中的结点
                continue
            elseif iswin(newnode)
                win = 1;
                break
                
            else%若不在record中则加入record并添加到下一层tree中
                recordi = recordi + 1;
                record{recordi} = newnode;
                treehi = treehi + 1;
                tree{h}{treehi} = newnode;
            end
        end
    end%至此所有h层的结点所有的act都尝试过
    if win == 1
        break
    end
    if treehi == 0
        fprintf('no solution!');
        break
    end
    h = h + 1
    %toc;
end

%进行回溯
trace{100} = node(zeros(5,4));%用于回溯，由于缺乏指针，使用数据结构很粗糙
tracei = 1;
if win == 1
    trace{1} = newnode;
    while ~(newnode.issame(node(map)))
        newnode = newnode.backnode;
        tracei = tracei + 1;
        trace{tracei} = newnode;
    end
end

toc;

%进行输出
if win == 1
    fprintf('the machine wins!\n');
    fprintf('press buttom to see the process\n');
    fprintf('using %d steps',h);
    pause
    for i = tracei:-1:1
        trace{i}.show();
        pause(0.1);
    end
end

end