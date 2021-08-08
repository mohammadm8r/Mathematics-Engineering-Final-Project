myFile = fopen('C:\Uni Courses\Term5\Engineering Mathematics\HWs\Project\train.txt');
paths = textscan(myFile,'%s %d','HeaderLines',0,'CollectOutput',1);
paths = paths{:};
myFile = fclose(myFile);
paths(:,1);
for i=1 : 540
    X(i,1:2500) = reshape(imread(paths{i}),1,2500);
end
X = double(X);
for i=1: 2500
    tmp = 0;
    tmp = double(tmp);
    for j = 1 : 540
        tmp = tmp + X(j,i);
    end
    average(i) = double(tmp / 540);
end
for i = 1:540
    for j =1 :2500
        Subtraction(i,j) = X(i,j) - average(j);
    end
end

% imshow(reshape(uint8(Subtraction(1,:)),50,50));

myFile = fopen('C:\Uni Courses\Term5\Engineering Mathematics\HWs\Project\test.txt');
paths2 = textscan(myFile,'%s %d','HeaderLines',0,'CollectOutput',1);
paths2 = paths2{:};
myFile = fclose(myFile);
paths2(:,1);
for i=1 : 100
    X_test(i,1:2500) = reshape(imread(paths2{i}),1,2500);
end
X_test = double(X_test);
for i=1: 2500
    tmp = 0;
    tmp = double(tmp);
    for j = 1 : 100     
        tmp = tmp + X_test(j,i);
    end
    average2(i) = double(tmp / 100);
end
for i = 1:100
    for j =1 :2500
        Subtraction2(i,j) = X_test(i,j) - average2(j);
    end
end

% imshow(reshape(uint8(Subtraction2(1,:)),50,50));
% return;


[u,s,v] = svd(X);
vT = v';
for i=1 : 10
    imshow(reshape(uint8(vT(i,:)),50,50));
    subplot(1,10,i), imshow(reshape(uint8(vT(i,:)),50,50));
end
lowRank = diag(s);
plot(lowRank(1:200));
ef = Eigenface(vT,X,10);