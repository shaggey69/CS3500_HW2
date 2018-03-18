		               /* ---- PROLOGUE ---- */
%{
#include <iostream>
using namespace std;

int numLines = 0;
int numOfTokens = 0;
%}
		              /* ---- DEFINITIONS ---- */
%option noyywrap

%%  		              /* ---- REGULAR EXPRESSIONS ---- */

[ \t]			{ numOfTokens++; }
\n              { numLines++; }

[+|-]?[0-9]+    
{ cout << "#" << numOfTokens << " TOKEN: INTCONST   LEXEME: " << yytext << endl; }

[+|-]?[0-9]+['.'][0-9]+    
{ cout << "#" << numOfTokens << " TOKEN: DECCONST   LEXEME: " << yytext << endl; }

[+|-]?[0-9]+['.'][0-9]+['E'][+|-]?[1-9]+[0-9]*
{ cout << "#" << numOfTokens << " TOKEN: SCICONST   LEXEME: " << yytext << endl; }

[A-H|0-9]+['H']
{ cout << "#" << numOfTokens << " TOKEN: HEXCONST   LEXEME: " << yytext << endl; }

[0|1]+['B']
{ cout << "#" << numOfTokens << " TOKEN: BINCONST   LEXEME: " << yytext << endl; }

['('][0-9][0-9][0-9][')'][0-9][0-9][0-9]['-'][0-9][0-9][0-9][0-9]
{ cout << "#" << numOfTokens << " TOKEN: PHCONST   LEXEME: " << yytext << endl; }

[0-9][0-9][0-9]['.'][0-9][0-9][0-9]['.'][0-9][0-9][0-9][0-9]
{ cout << "#" << numOfTokens << " TOKEN: PHCONST   LEXEME: " << yytext << endl; }

[0-9][0-9][0-9]['-'][0-9][0-9][0-9]['-'][0-9][0-9][0-9][0-9]
{ cout << "#" << numOfTokens << " TOKEN: PHCONST   LEXEME: " << yytext << endl; }

["while"|"end"|"func"|"print"|"if"|"then"|"else"]
{ cout << "#" << numOfTokens << " TOKEN: KEYWORD   LEXEME: " << yytext << endl; }

[a-zA-Z][a-z|A-Z|0-9]*
{ cout << "#" << numOfTokens << " TOKEN: IDENT   LEXEME: " << yytext << endl; }

["\""][a-z|A-Z|0-9|" "]*["\""]
{ cout << "#" << numOfTokens << " TOKEN: STRCONST   LEXEME: " << yytext << endl; }

["+"|"-"|"*"|"/"|"<"|">"|"="]
{ cout << "#" << numOfTokens << " TOKEN: OPERATOR   LEXEME: " << yytext << endl; }


%%  		              /* --- EPILOGUE ---- */

int main()
{
    yylex();
        cout << numOfTokens <<" tokens processed." << endl;
    cout << numLines <<" lines processed." << endl;
    return 0;
}
