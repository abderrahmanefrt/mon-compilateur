%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ts.h"
extern int yylex();
extern int nb_ligne;

// Déclaration de la fonction yyerror
void yyerror(const char* msg) {
    printf("Erreur syntaxique : %s\n", msg);
}
%}

%union {
    char *str;
}

%token <str> mc_code mc_start mc_endp mc_ident mc_cst mc_integ mc_fr
%token mc_aff mc_pvg

%%

S: mc_code mc_ident DEC mc_start mc_endp {
    printf("Syntaxe correcte\n");
}
;

DEC: mc_integ mc_ident mc_pvg DEC { 
    inserer(&tete, $2, "INTEGER", "VARIABLE", 4);
}
| mc_fr mc_ident mc_pvg DEC { 
    inserer(&tete, $2, "REAL", "VARIABLE", 8);
}
| /* epsilon */ 
;

%%

int main() {
    yyparse();
    afficher(tete);
    return 0;
}
