%{
#define YYSTYPE double
#include<stdio.h>
#include<math.h>

%}
%token NL
%token NUMBER
%token LPAR
%token RPAR
%token OWARI
%left ADDOP SUBOP
%left MULOP DIVOP
%left NEG
%%
s       :   list
        ;
list    :   
        |list expr NL{printf("The result is:%lf",$2);printf("list_1_%lf,%lf,%lf,%lf\n",$$,$1,$2,$3);}
        |   list OWARI{return;}
        ;
expr    :   expr ADDOP expr {$$=$1+$3;printf("expr_1_%lf,%lf,%lf,%lf\n",$$,$1,$2,$3);}
        |   expr SUBOP expr {$$=$1-$3;printf("expr_2_%lf,%lf,%lf,%lf\n",$$,$1,$2,$3);}
        |   expr MULOP expr {$$=$1*$3;printf("expr_3_%lf,%lf,%lf,%lf\n",$$,$1,$2,$3);}
        |   expr DIVOP expr {$$=$1/$3;printf("expr_4_%lf,%lf,%lf,%lf\n",$$,$1,$2,$3);}
        |   SUBOP expr %prec NEG { $$=-$2;printf("expr_5_%lf,%lf,%lf\n",$$,$1,$2);}
        |   LPAR expr RPAR{$$=$2;printf("_expr_5_%lf,%lf,%lf,%lf\n",$$,$1,$2,$3);}
        |   NUMBER {$$=$1;printf("expr_6_%lf,%lf\n",$$,$1);}
        ;
%%
yyerror(s) char *s;{printf("error%s\n",s);}
#include"lex.yy.c"


