function [cox1,coy1,cox,coy ] = obse( cox,coy,cbx2,cby2,n )
least=100000;
for i=1:n
    if(dis(cbx2,cby2,cox(i,1),coy(i,1))<least)
        least = dis(cbx2,cby2,cox(i,1),coy(i,1)); 
        cox1=cox(i,1);
        coy1=coy(i,1);
        k=i;   
    end
end
cox(k,1)=0;
coy(k,1)=0;
end

