		               /* ---- PROLOGUE ---- */
%{
#include <iostream>
using namespace std;

int numLines = 0;
int numOfTokens = 0;
%}
		              /* ---- DEFINITIONS ---- */
%option noyywrap
INTE [+|-]?[0-9]+    
DECE [+|-]?[0-9]+[.][0-9]+    
SCIENCE [+|-]?[0-9]+[.][0-9]+[E][+|-]?[1-9]+[0-9]*
HEX [A-H|0-9]+[H]
BIT [0|1]+[B]
PHONEONE [(][0-9][0-9][0-9][)][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]
PHONETWO [0-9][0-9][0-9][.][0-9][0-9][0-9][.][0-9][0-9][0-9][0-9]
PHONETHREE [0-9][0-9][0-9][-][0-9][0-9][0-9][-][0-9][0-9][0-9][0-9]
KEYWORDS	[(while)|(end)|(func)|(print)|(if)|(then)|(else)]
IDENT [a-zA-Z][a-z|A-Z|0-9]*
STRCONTS ["][a-z|A-Z|0-9| ]*["]
OPERATOR [+|-|*|/|<|>|=]


%%  		              /* ---- REGULAR EXPRESSIONS ---- */

[ \t]			{ numOfTokens++; }
\n              { numLines++; }

{INTE}    
{ cout << "#" << numOfTokens << " TOKEN: INTCONST   LEXEME: " << yytext << endl; }

{DECE}
{ cout << "#" << numOfTokens << " TOKEN: DECCONST   LEXEME: " << yytext << endl; }

{SCIENCE}
{ cout << "#" << numOfTokens << " TOKEN: SCICONST   LEXEME: " << yytext << endl; }

{HEX}
{ cout << "#" << numOfTokens << " TOKEN: HEXCONST   LEXEME: " << yytext << endl; }

{BIT}
{ cout << "#" << numOfTokens << " TOKEN: BINCONST   LEXEME: " << yytext << endl; }

{PHONEONE}
{ cout << "#" << numOfTokens << " TOKEN: PHCONST   LEXEME: " << yytext << endl; }

{PHONETWO}
{ cout << "#" << numOfTokens << " TOKEN: PHCONST   LEXEME: " << yytext << endl; }

{PHONETHREE}
{ cout << "#" << numOfTokens << " TOKEN: PHCONST   LEXEME: " << yytext << endl; }

{KEYWORDS}
{ cout << "#" << numOfTokens << " TOKEN: KEYWORD   LEXEME: " << yytext << endl; }

{IDENT}
{ cout << "#" << numOfTokens << " TOKEN: IDENT   LEXEME: " << yytext << endl; }

{STRCONTS}
{ cout << "#" << numOfTokens << " TOKEN: STRCONST   LEXEME: " << yytext << endl; }

{OPERATOR}
{ cout << "#" << numOfTokens << " TOKEN: OPERATOR   LEXEME: " << yytext << endl; }


%%  		              /* --- EPILOGUE ---- */

int main()
{
    yylex();
        cout << numOfTokens <<" tokens processed." << endl;
    cout << numLines <<" lines processed." << endl;
    return 0;
}
