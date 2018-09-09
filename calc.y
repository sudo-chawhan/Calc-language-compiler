%{
void yyerror (char *s);
int yylex();
#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
%}

%union {int num; char id;}         /* Yacc definitions */
%start line
%token print
%token mulitply
%token divide
%token add
%token subtract
%token modulus
%token exit_command
%token <num> number
%type <num> line exp 
%%

/* descriptions of expected inputs     corresponding actions (in C) */

line    :
		exit_command ';'		{exit(EXIT_SUCCESS);}
		| exp ';'			{printf("= %d\n", $1);}
		| line exit_command ';'	{exit(EXIT_SUCCESS);}
        ;

exp    	: number                 					 {$$ = $1;}
       	| mulitply '(' exp ',' exp ')'           {$$ = $3 * $5;}
       	//| mulitply '(' number ',' exp ')'           {$$ = $3 * $5;}
       	| divide '(' exp ',' exp ')'           {$$ = $3 / $5;}
       	//| divide '(' number ',' exp ')'           {$$ = $3 / $5;}
       	| add '(' exp ',' exp ')'           {$$ = $3 + $5;}
       	//| add '(' number ',' exp ')'           {$$ = $3 + $5;}
       	| subtract '(' exp ',' exp ')'           {$$ = $3 - $5;}
       	//| subtract '(' number ',' exp ')'           {$$ = $3 - $5;}
       	| modulus '(' exp ',' exp ')'           {$$ = $3 % $5;}
       	//| modulus '(' number ',' exp ')'           {$$ = $3 % $5;}
       	;

%%                     /* C code */

int main (void) {
	return yyparse ( );
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 
