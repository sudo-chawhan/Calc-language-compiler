%{
#include "y.tab.h"
#include <stdlib.h>
#include <string.h>
char* concat(const char *s1, const char *s2);
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
[-]?[0-9]+[.[0-9]*]?              {yylval.num = atof(yytext); return number;}
[ \t\n]                	;
[(),;]           	   	{return yytext[0];}
.                      	{yyerror (concat("unexpected character ", yytext)); exit(1);}//{yyerror (concat("unexpected character ", yytext));}

%%

char* concat(const char *s1, const char *s2)
{
    char *result = malloc(strlen(s1) + strlen(s2) + 1); // +1 for the null-terminator
    // in real code you would check for errors in malloc here
    strcpy(result, s1);
    strcat(result, s2);
    return result;
}

int yywrap (void) {return 1;}