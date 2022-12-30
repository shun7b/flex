%{
    double num;
    char mark;
    char flag='o';
%}
%%
"+"     {sscanf(yytext,"%c",&mark);return;}
"-"     {sscanf(yytext,"%c",&mark);return;}
"*"     {sscanf(yytext,"%c",&mark);return;}
"/"     {sscanf(yytext,"%c",&mark);return;}
"("     {sscanf(yytext,"%c",&mark);return;}
")"     {sscanf(yytext,"%c",&mark);return;}
"."     ;
[0-9]+\.[0-9]*|[0-9]+  {sscanf(yytext,"%lf",&num);return;} 
[\t] ;
^\n     ;
\n      {flag='e';return;}
.       ;
%%
main(){
    while(flag!='e'){
        yylex();
        printf("%lf\n",num);
        printf("%c\n",mark);
    }
}
int yywrap(){
    return 1;
}
