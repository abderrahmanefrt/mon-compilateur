%{
#include "ts.h"  // Inclut les définitions nécessaires
#include "syn.tab.h"  // Généré par Bison
#include <string.h>
int nb_ligne = 1;

extern Symbol *tete;  // Variable globale
%}



lettre [a-zA-Z]
chiffre [0-9]
IDF {lettre}({lettre}|{chiffre})*
cst {chiffre}+

%%

"CODE" {printf("mot CODE\n"); return mc_code;}
"INTEGER" {yylval.str=strdup(yytext); return mc_integ; }
"REAL" {yylval.str=strdup(yytext); return mc_fr; }
"START" {printf("mot cle START\n"); return mc_start; }
"END." {printf("mot cle END\n"); return mc_endp; }

{IDF} {
    printf("IDF : %s\n", yytext);
    inserer(&tete, yytext, "IDF", "VARIABLE", 0);
    yylval.str = strdup(yytext);
    return mc_ident;
}

{cst} {
    printf("Constante : %s\n", yytext);
    yylval.str = strdup(yytext);
    inserer(&tete, yytext, "CONST", "CONSTANTE", 0);
    return mc_cst;
}

"=" {printf("aff\t"); return mc_aff;}
";" {printf("pvg\t"); return mc_pvg;}
[ \t] ;
\n {nb_ligne++;}
. printf("Erreur lexicale à la ligne %d\n", nb_ligne);

%%

