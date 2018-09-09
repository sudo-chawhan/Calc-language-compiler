%{
#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}
%%
"print"				   	{return print;}
"exit"				   	{return exit_command;}
"mul"				 	{return mulitply;}
"div"					{return divide;}
"add"					{return add;}
"sub"					{return subtract;}
"mod"					{return modulus;}
[-]?[0-9]+                 	{yylval.num = atoi(yytext); return number;}
[ \t\n]                	;
[(),;]           	   	{return yytext[0];}
.                      	{ECHO; yyerror ("unexpected character");}

%%
int yywrap (void) {return 1;}