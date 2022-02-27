disp('Greetings! Welcome to the Maxis Queue Simulator!') 

printf('\n')

disp('Types of Random Number Generator') 
disp('1. Linear Congruential Generator') 
disp('2. Random Variate Generator for Exponential Distribution')  
disp('3. Random Variate Generator for Uniform Distribution') 
disp('4. Random Number Generator using Rand Function') 

printf('\n')

generatorType = input('Choose the type of random number generator: '); %user presses either 1,2 or 3
                                                       %to get input of the type of random generator chosen by user
printf('\n')

customerNum = input('Enter the number of customers in the simulator: '); %to get input of the number of customers entered by user

printf('\n')

maxCustomerNum = 0;

while true 
    maxCustomerNum = input('Enter the maximum number of customers in the centre: '); %to get input of the maximum number of customers entered by user
    if maxCustomerNum >= 2
        break;
    else
        disp('Please input a value more than or equal to 2.');
        printf('\n')
    end
end

printf('\n\n')

GeneratorChoice(generatorType,customerNum,maxCustomerNum) %to call the function RandGenChoice in file generatorType.m 
                                       %the two arguments passed in the parameter is the random generator type and the number of customers
