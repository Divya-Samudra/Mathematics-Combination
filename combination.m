%not complete
clc;
clear;
%Inputs: Incidencematrix and reliability of individual elements
incidence_matrix = [1 0 1 0 0;
                    0 1 0 1 0;
                    1 0 0 1 1;
                    0 1 1 0 1];
 reliability = [0.99 0.99 0.99 0.99 0.99];
 sizeof_incidence_matrix=size(incidence_matrix);
 system_reliability=0;
 %Tie elements
 for i1 = 1:sizeof_incidence_matrix(1);
     %if element exists that has to be considered for tie diagram
     element = 1;
     for j1=1:sizeof_incidence_matrix(2)
         if (incidence_matrix(i1,j1)==1)
             tie(i1,element)=j1;
             element=element+1;
         end
     end
 end
 tie
 sizeof_tie = size(tie);
 X=zeros(1,sizeof_incidence_matrix(1));
 for p1=1:sizeof_incidence_matrix(1)
     X(p1)=p1;
 end
 p=perms(X);
 n=sizeof_incidence_matrix(1);
 for i=1:n
     r=i;
     C=(factorial(n))/((factorial(r))*(factorial(n-r)));
     order=zeros(C,i);
     sizeof_order=size(order);
     all_comb=p(:,1:i);
     sizeof_all_comb=size(all_comb);
     row=1;
     for i2=1:sizeof_all_comb(1)
         x1=sort(all_comb(i2,:));
         count=0;
         for j2=1:sizeof_order(1)
             x2=sort(order(j2,:));
             if(x2==x1)
                 count=1;
             end
         end
         if(count==0)
             order(row,:)=x1;
             row=row+1;
         end
     end
 end