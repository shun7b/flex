%{

%}
%%

"+" {}
[0-9]+\.[0-9]*|[0-9]+  { printf("number%s\n",yytext);}
[\t] ;
^\n     ;
\n      ;
.       {printf("...%s\n",yytext);}
%%

main(){
        yylex();
        
        
}
int yywrap(){
    return 1;
}