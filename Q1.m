myData = [mvnrnd([10 10]',[4 4;4 9],1000); mvnrnd([22 10]',[4 4;4 9],1000)];
[x y z]  = pca(myData);
for i=1:2000
    out(i) = dot(myData(i,:),x(1,:));
   
end
out_V = out' * x(1,:);

pl1 = out_V(1:1000,:);
pl2 = out_V(1000:2000,:);
scatter(pl1(:,1),pl1(:,2));
hold on;
scatter(pl2(:,1),pl2(:,2));
xT = x';
tmp = y * xT;
for i=1 : 2000
    bazsazi(i,:) = tmp(i,:) + mean(myData);
end

pl3 = bazsazi(1:1000,:);
pl4 = bazsazi(1000:2000,:);
scatter(pl3(:,1),pl3(:,2));
scatter(pl4(:,1),pl4(:,2));

a =   mean(myData);
result = sum((bazsazi - myData).^2)