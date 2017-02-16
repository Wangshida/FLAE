function [Q,K]=QUEST(sxy,cxy,weight)

B=0;
nn=length(cxy(1,:));
for j=1:nn
    B=B+weight(j)*sxy(:,j)*cxy(:,j)';
end

S=B'+B;
dita=B(1,1)+B(2,2)+B(3,3);
Z=[B(2,3)-B(3,2),B(3,1)-B(1,3),B(1,2)-B(2,1)]';
K=[S-dita*eye(3,3),Z;Z',dita];
[V,D]=eig(K);

q=[V(4,4);V(1,4);V(2,4);V(3,4)];

q=q./norm(q);
Q=q;

end