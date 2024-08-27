function AIhua(A)
%AIhua 函数自动进行深度优先查找算法网络的探索
%A为初始的输入矩阵
tic;
map = A;
drawinterface(map);

win = 0;
tree{5000} = node(zeros(5,4));%预先分配内存

tree{1} = node(map);
record = {};
h = 2;
while 1%用来控制tree的深度h，新一层tree从这里进入
    if h == 1%避免无解的情况造成数组越界
        fprintf('no solution!')
        win = 0;
        break
    end
    
    record{length(record)+1} = tree{h-1};
    hold = record;
    %hold = tree(1:h-1);
    back = 0;
    i = length(tree{h-1}.movelist_tried) + 1;
%     h-1
%     tree{h-1}
%     tree{h-1}.map
%     drawinterface(tree{h-1}.map);
%     pause(0.1)
    while 1%用来决定下一层探索哪个点
        if i > length(tree{h-1}.movelist_can)%如果换遍tree{h-1}可能的act都不行
            back = 1;
            break
        end
        
        act = tree{h-1}.movelist_can{i};
        tree{h} = tree{h-1}.next(act);
        %i
        %tree{h}.map
        if tree{h}.iswin()%如果探索到胜利则结束
            win = 1;
            break
        end

        if tree{h}.isin(hold,0)%新node已经出现过中则换act
            i = i + 1;
            tree{h-1}.addtry(act);
            %fprintf('in hold');
            continue
        end

        list = tree{h}.similar();%新node相似的情况已出现在之前树中则换act
        flag = 0;
        for j = 1:length(list)
            if list{j}.isin(hold,0)
                i = i + 1;
                tree{h-1}.addtry(act);
                flag = 1;
                %fprintf('is similar');
                break
            end
        end
        if flag == 1%如果前面list中有与之前相似情况，则再选个act
            continue
        end
%         if h >= 100%不让树的深度太大
%             back = 1;
%             break;
%         end
        %如果以上都没有发生，属于正常情况，进入下一层，得到了tree{h}（trylist非空）
        tree{h-1}.addtry(act);
        h = h + 1;
        break
    end

    if win == 1%如果胜利则结束循环
        break
    end
    if back == 1%如果探索一圈决定返回则深度减一
        h = h - 1;
    end
end
toc;
if win == 1
    fprintf('the machine wins!\n');
    fprintf('press buttom to see the process\n');
    fprintf('using %d steps',h);
    pause
    for i = 1:h
        tree{i}.show();
        pause(0.05);
    end
end

end