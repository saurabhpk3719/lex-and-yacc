                                              
%{
int flag=0;
char acc[16];

%}

ifsc [P][U][N][B][0][a-z A-Z0-9][a-z A-Z0-9][a-z A-Z0-9][a-z A-Z0-9][a-z A-Z0-9][a-z A-Z0-9]

cacc [0-9][0-9][0-9][0-9][0][0][0][2][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]
sacc [0-9][0-9][0-9][0-9][0][0][0][1][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]
acn [0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]

%%

{ifsc} {printf("\n IFSC code is valid"); }
{sacc} {flag=1;printf("Account number is valid. It is a saving account ");printf("Generated IFSC code is " );
	 printf("ifsc code is:PUNB0%c%c%c%c%c%c",yytext[0],yytext[1],yytext[2],yytext[3],yytext[4],yytext[5]);}//saving account number.
{cacc} {flag=1;printf("Account number is valid. It is a current account ");printf("Generated IFSC code is " );
	 printf("ifsc code is:PUNB0%c%c%c%c%c%c",yytext[0],yytext[1],yytext[2],yytext[3],yytext[4],yytext[5]);}//current account number.

{acn} {flag=1;printf("Enter bank account number to verify ur account.%s \n",yytext);
	printf("Generated IFSC code is " );
	 printf("ifsc code is:PUNB0%c%c%c%c%c%c",yytext[0],yytext[1],yytext[2],yytext[3],yytext[4],yytext[5]);}
.* {printf("Invalid...! Please Enter valid account number  ");}
%%

void main()

{	printf("Welcome to punjab national bank");
	printf("\n Enter IFSC code"); 
	
	yylex();
yywrap();

}

