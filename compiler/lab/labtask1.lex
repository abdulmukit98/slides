%{
	
        int countIntNum;
	int countFloatNum;
	int countID;
%}
digit [0-9]
letter_ [a-zA-Z_]
keyword "if"|"else"|"main"|"return"
%%
{digit}+ {printf("This is an integer number: %s %d\n", yytext,atoi(yytext)); countIntNum++;}
{digit}+"."{digit}+ {printf("This is an floating-point number: %s\n", yytext); countFloatNum++;}
{keyword} {printf("This is a keyword\n");}
{letter_}({letter_}|{digit})* {printf("This is a valid identifier : %s and the length of the lexeme:%d\n", yytext, yyleng); countID++;}
. {printf("This is not a valid token\n");}
%%
int yywrap()
{
return 1;
}
int main()
{
        yylex();
        printf("total valid integer numbers:%d\n",countIntNum);
	printf("total valid floating-point numbers:%d\n",countFloatNum);
        printf("total valid identifiers:%d\n",countID);

        getchar();
	return 0;
}