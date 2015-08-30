% takes an initial position (1 is bought, 0 is sold)
% and two matrices of buy and sell prices
% and outputs a matrix of the ratios between successive buy/sell prices as both long and short ratios

function [shortratios, longratios] = ...
    ratios(initialposition, used_buy, used_sell)

fees=0.998^2;

if initialposition==1
    if length(used_sell)>length(used_buy)
        used_buy=[used_buy;1];
        shortratios=used_sell./used_buy*fees;
        shortratios=shortratios(1:end-1);
        used_buy=used_buy(1:end-1);
        used_sell=used_sell(2:end);
        longratios=used_sell./used_buy*fees;
    else
        shortratios=used_sell./used_buy*fees;
        used_buy=used_buy(1:end-1);
        used_sell=used_sell(2:end);
        longratios=used_sell./used_buy*fees;
    end
end
if initialposition==0
    if  length(used_buy)>length(used_sell)
        used_sell=[used_sell;1];
        longratios=used_sell./used_buy*fees;
        longratios=longratios(1:end-1);
        used_buy=used_buy(2:end);
        used_sell=used_sell(1:end-1);
        shortratios=used_sell./used_buy*fees;
    else
        longratios=used_sell./used_buy*fees;
        used_buy=used_buy(2:end);
        used_sell=used_sell(1:end-1);
        shortratios=used_sell./used_buy*fees;
    end
end
clear used_buy;
clear used_sell;
