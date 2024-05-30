ods graphics on / discretemax= 1600;
data project;
infile '/home/u63652615/sasuser.v94/data - Sheet1.csv' dlm=',' firstobs=2;
input Year GDP GFCI Trade CO2 FDI Inflation;
run;

proc print;
run; 

/*Find the relationship between gross domestic product (dependent variable)
 and the selected independent economic variables in the table in a multiple regression methodology.*/

proc means data = project;
var GDP Inflation;
run;

proc reg data=project outest=betas;
    model GDP = GFCI Trade CO2 FDI Inflation;
    title "Linear Regression with the GDP being the Dependent Variable and the GFCI being Independent";
run;

proc reg data=project outest=betas;
    model GDP = Inflation;
    title "Linear Regression with the GDP being the Dependent Variable and the GFCI being Independent";
run;

proc reg data=project outest=betas;
    model GDP = GFCI;
    title "Linear Regression with the GDP being the Dependent Variable and the GFCI being Independent";
run;

proc sgplot data = project;
reg x = Inflation y = GDP/ lineattrs=(color=red);
scatter x = Inflation y = GDP;
run;

proc corr data=project plots=matrix 
(histogram);
var GDP Inflation;
run;
