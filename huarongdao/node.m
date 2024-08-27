classdef node < handle
    %node 是搜索树的一个节点
    %用数对act=[p,d],action=[player,direction]来表示动作，是movelist中元素
    %d=1向上 d=2向左 d=3向下 d=4向右

    properties
        map %当前的矩阵
        movelist_can %可以移动的动作列表
        movelist_tried %已经尝试过的动作列表
        backnode
    end

    methods

        %构造函数
        function obj = node(A)
            %node 函数的构造函数
            obj.map = A;
            obj.movelist_can = {};
            obj.movelist_tried = {};
            %obj.backnode = node(zeros(5,4));
            %以下函数对于一个给定矩阵获取可以执行的动作，获取canlist
            [r,c] = find(obj.map==0);
            m = obj.map;
            %先搜索r(1),c(1)
            %向下搜索不越界，搜到的可以向上
            if r(1)+1 <= 5
                p = m(r(1)+1,c(1));
                if p >= 7
                    obj.movelist_can{length(obj.movelist_can)+1} = [p,1];
                elseif p >= 2 && p <= 5
                    obj.movelist_can{length(obj.movelist_can)+1} = [p,1];
                elseif p == 6 || p == 1
                    if r(2) == r(1) && c(2) == c(1)+1 && m(r(2)+1,c(2)) == p
                        obj.movelist_can{length(obj.movelist_can)+1} = [p,1];
                    end
                end
            end
            %向右搜索不越界，搜到的可以向左
            if c(1)+1 <= 4 
                p = m(r(1),c(1)+1);
                if p >= 7
                    obj.movelist_can{length(obj.movelist_can)+1} = [p,2];
                elseif p == 6
                    obj.movelist_can{length(obj.movelist_can)+1} = [p,2];
                elseif p >= 1 && p <= 5
                    if r(2) == r(1)+1 && c(2) == c(1) && m(r(2),c(2)+1) == p
                        obj.movelist_can{length(obj.movelist_can)+1} = [p,2];
                    end
                end
            end
            %向上搜索不越界，搜到的可以向下
            if r(1) >= 2
                p = m(r(1)-1,c(1));
                if p >= 7
                    obj.movelist_can{length(obj.movelist_can)+1} = [p,3];
                elseif p >= 2 && p <= 5
                    obj.movelist_can{length(obj.movelist_can)+1} = [p,3];
                elseif p == 6 || p == 1
                    if r(2) == r(1) && c(2) == c(1)+1 && m(r(2)-1,c(2)) == p
                        obj.movelist_can{length(obj.movelist_can)+1} = [p,3];
                    end
                end
            end
            %向左搜索不越界，搜到的可以向右
            if c(1) >= 2
                p = m(r(1),c(1)-1);
                if p >= 7
                    obj.movelist_can{length(obj.movelist_can)+1} = [p,4];
                elseif p == 6
                    obj.movelist_can{length(obj.movelist_can)+1} = [p,4];
                elseif p >= 1 && p <= 5
                    if r(2) == r(1)+1 && c(2) == c(1) && m(r(2),c(2)-1) == p
                        obj.movelist_can{length(obj.movelist_can)+1} = [p,4];
                    end
                end
            end
            %再搜索r(2),c(2)
            %向下搜索不越界，搜到的可以向上
            if r(2)+1 <= 5 
                p = m(r(2)+1,c(2));
                if p >= 7
                    obj.movelist_can{length(obj.movelist_can)+1} = [p,1];
                elseif p >= 2 && p <= 5
                    obj.movelist_can{length(obj.movelist_can)+1} = [p,1];
                end
            end
            %向右搜索不越界，搜到的可以向左
            if c(2)+1 <= 4 
                p = m(r(2),c(2)+1);
                if p >= 7
                    obj.movelist_can{length(obj.movelist_can)+1} = [p,2];
                elseif p == 6
                    obj.movelist_can{length(obj.movelist_can)+1} = [p,2];
                end
            end
            %向上搜索不越界，搜到的可以向下
            if r(2) >= 2
                p = m(r(2)-1,c(2));
                if p >= 7
                    obj.movelist_can{length(obj.movelist_can)+1} = [p,3];
                elseif p >= 2 && p <= 5
                    obj.movelist_can{length(obj.movelist_can)+1} = [p,3];
                end
            end
            %向左搜索不越界，搜到的可以向右
            if c(2) >= 2
                p = m(r(2),c(2)-1);
                if p >= 7
                    obj.movelist_can{length(obj.movelist_can)+1} = [p,4];
                elseif p == 6
                    obj.movelist_can{length(obj.movelist_can)+1} = [p,4];
                end
            end
            %至此我们获得了movelist_can
            %构造函数结束
        end
        
        %增加movelist_tried中元素
        function obj = addtry(obj,act)
            obj.movelist_tried{length(obj.movelist_tried)+1} = act;
        end

        %得到下一个node的函数，需要传入act
        function nextnode = next(obj,act)
            p = act(1);
            d = act(2);
            B = obj.map;
            [row,col] = find(obj.map == p);
            if d == 1 %向上
                B(row-1,col) = p;
                B(row,col) = 0;
                B(row-1,col) = p;
            elseif d == 2 %向左
                B(row,col-1) = p;
                B(row,col) = 0;
                B(row,col-1) = p;
            elseif d == 3 %向下
                B(row+1,col) = p;
                B(row,col) = 0;
                B(row+1,col) = p;
            elseif d == 4 %向右
                B(row,col+1) = p;
                B(row,col) = 0;
                B(row,col+1) = p;
            end
            nextnode = node(B);
            nextnode.backnode = obj;
        end

        %判定成功的函数
        function num = iswin(obj)
            B = obj.map;
            if B(5,2)==1 && B(5,3)==1
                num = 1;
            else 
                num = 0;
            end
        end
        
        %判定对称类似node的函数
        function similist = similar(obj)
            B = obj.map;
            C = B*[0,0,0,1;0,0,1,0;0,1,0,0;1,0,0,0];
            similist = {};
            similist{length(similist)+1} = node(B);
            similist{length(similist)+1} = node(C);
        end
        
        %给出镜像结点
        function node2 = mirror(obj)
            B = obj.map;
            C = B*[0,0,0,1;0,0,1,0;0,1,0,0;1,0,0,0];
            node2 = node(C);
        end

        %判断两个结点是否相同，认为2,3,4,5和7,8,9,10分别相同
        function num = issame(obj,node)
            
            B = obj.map;
            C = node.map;
            
%             [r,c] = find((B==2) + (B==3) + (B==4) + (B==5));
%             for i = 1:length(r)
%                 B(r(i),c(i)) = 2;
%             end
%             [r,c] = find((B==7) + (B==8) + (B==9) + (B==10));
%             for i = 1:length(r)
%                 B(r(i),c(i)) = 7;
%             end
%             [r,c] = find((C==2) + (C==3) + (C==4) + (C==5));
%             for i = 1:length(r)
%                 C(r(i),c(i)) = 2;
%             end
%             [r,c] = find((C==7) + (C==8) + (C==9) + (C==10));
%             for i = 1:length(r)
%                 C(r(i),c(i)) = 7;
%             end

            %此处为了提速避免使用循环
            [r,c] = find(B==3);
            B(r,c) = 2;
            [r,c] = find(B==4);
            B(r,c) = 2;
            [r,c] = find(B==5);
            B(r,c) = 2;
            [r,c] = find(B==8);
            B(r,c) = 7;
            [r,c] = find(B==9);
            B(r,c) = 7;
            [r,c] = find(B==10);
            B(r,c) = 7;
            [r,c] = find(C==3);
            C(r,c) = 2;
            [r,c] = find(C==4);
            C(r,c) = 2;
            [r,c] = find(C==5);
            C(r,c) = 2;
            [r,c] = find(C==8);
            C(r,c) = 7;
            [r,c] = find(C==9);
            C(r,c) = 7;
            [r,c] = find(C==10);
            C(r,c) = 7;
            %B,C
            num = isequal(B,C);
        end

        %判断一个结点是否在一个nodelist中,listi表示前listi项
        function num = isin(obj,nodelist,listi)
            flag = 0;
            if listi == 0
                for i = 1:length(nodelist)
                    if obj.issame(nodelist{i})
                        flag = 1;
                        break
                        %fprintf('is same to')
                        %nodelist{i}.map
                    end
                end
            elseif listi ~= 0
                 for i = 1:listi
                    if obj.issame(nodelist{i})
                        flag = 1;
                        break
                        %fprintf('is same to')
                        %nodelist{i}.map
                    end
                end
            end
            num = flag;
        end
        
        %用来可视化一个结点
        function show(obj)
            B = obj.map;
            drawinterface(B);
        end

    end
end