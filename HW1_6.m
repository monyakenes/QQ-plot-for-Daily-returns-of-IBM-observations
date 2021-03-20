% QQ plot
clear
clc
clf
 
Datatable = readtable('IBM.xlsx','ReadRowNames',true);
 
M = [500, 1000, 3000]; % N-s
 
for i=1:3
    N = M(i);
    Data = Datatable{2:N,{'PriceOrBid_AskAverage'}};
 
    for l=1:N-2
        Data_return(l) = (Data(l+1)/Data(l)) - 1;
    end
 
    dx = 0.01; %% width of bin
    interval = [-0.13: dx: 0.13];
 
    U_sort = sort(Data_return);
 
    for k=1:N-2
        p(k) = k/(N-2+1);
       Theoretical(k) = norminv(p(k), 0, 1);
    end
 
    figure(i)
    scatter(U_sort, Theoretical);
    hold on
    plot (interval, interval);
    hold on
    formatTitle = "QQ plot for Daily returns of IBM %d observations from Jan 1 2005";
    title(sprintf(formatTitle,N))
end

