% Programmed by   : Huynh Thai Hoang, University of Technology at Ho Chi Minh City.
% Last updated    : Nov 11, 2014

function x=trichdactrung(Ibw)
x=zeros(96,1);
for hang=1:12
    for cot=1:8,
        x((hang-1)*8+cot,1)=sum(sum(Ibw(5*(hang-1)+1:5*hang,...
                                5*(cot-1)+1:5*cot)));
    end;
end;
end