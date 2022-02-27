function [ITRandNum, STRandNum, TempRandNum] = RandomVariateExponential(customerNum)
        
    %Interval Arrival Time ---------------------------------------------------
    ITRandSeedValues = (rand(1,customerNum));
    lambda = 0.005;

    for i=1:customerNum-1
        ln = log(1-ITRandSeedValues(i));
        ITRandNum(i)= (-1/lambda)*ln;
        
        while ITRandNum(i)>100
            ITRandNum(i)=floor(ITRandNum(i)/10);
        end
        
        if ITRandNum(i) < 1
            ITRandNum(i)=floor(ITRandNum(i)*10);
        else
            ITRandNum(i)=floor(ITRandNum(i));   
        end
                   
        if ITRandNum(i) == 0
            ITRandNum(i) = ITRandNum(i)+1;
        end
    
    end
    
    disp('Random number for inter-arrival time: ')
    printf('%d\t', ITRandNum)
    printf('\n\n')
    
    %Service Time ------------------------------------------------------------
    STRandSeedValues = (rand(1,customerNum));
    lambda = 0.005;
    
    for i=1:customerNum
        ln = log(1-STRandSeedValues(i));
        STRandNum(i)= (-1/lambda)*ln;
        
        while STRandNum(i)>100
            STRandNum(i)=floor(STRandNum(i)/10);
        end
        
        if STRandNum(i)<1
            STRandNum(i)=floor(STRandNum(i)*10) ;
        else
            STRandNum(i)=floor(STRandNum(i));   
        end
        
        if STRandNum(i)==0
           STRandNum(i)=STRandNum(i)+1;
        end
     
    end
    
    disp('Random number for service time: ')
    printf('%d\t', STRandNum)
    printf('\n\n')
    
   
    
    %Temperature---------------------------------------------------------------
    TempRandSeedValues = (rand(1,customerNum));
    lambda = 0.005;
    
    for i=1:customerNum
        ln = log(1-TempRandSeedValues(i));
        TempRandNum(i)= (-1/lambda)*ln;
        
        if TempRandNum(i)>100
            TempRandNum(i)=(TempRandNum(i)/1000)*2.2;
        elseif STRandNum(i)>1000
            TempRandNum(i)=(TempRandNum(i)/10000)*2.2;
        elseif STRandNum(i)<1
            TempRandNum(i)=(TempRandNum(i))*2.2;
        else
            TempRandNum(i)=(TempRandNum(i)/100)*2.2;   
        end
        
        TempRandNum(i)=TempRandNum(i)+36.1;
        
    end
    
    disp('Random number for temperature: ')
    printf('%.1f\t', TempRandNum)
    printf('\n\n')
    
    
    
    

    