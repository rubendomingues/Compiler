%{
// HEADERS
#include <stdlib.h>
#include "parser.h"

// variables maintained by the lexical analyser
int yyline = 1;
%}

%option noyywrap

%%
[ \t]+ {  }
#.*\n { yyline++; }
\n { yyline++; }

\-?[0-9]+ {
   yylval.intValue = atoi(yytext);
   return INT;
}
[a-z][a-zA-Z]* {
	yylval.charValue = yytext;
	return VAR;
}
"TRUE" { return TRUE; }
"FALSE" {return FALSE; }
"+" { return PLUS; }
"-" { return MINUS; }
"*" { return TIMES; }
"/" { return DIV; }
"%" { return MOD; }
">" { return GT; }
"<" { return LT; }
">=" { return GTE; }
"<=" { return LTE; }
"==" { return EQ; }
"!=" { return NOT_EQ; }
"if" { return IF; }
"else" { return ELSE; }
"while" { return WHILE; }
"print" { return PRINT; }
"read" { return READ; }
"let" {return ATRIB; }
"{" { return KEY1; }
"}" { return KEY2; }
";" { return SM; }
"=" { return TOKEN_EQ; }
.  { yyerror("unexpected character"); }
%%
