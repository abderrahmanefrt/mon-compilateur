#ifndef TS_H
#define TS_H

typedef struct Symbol {
    char *nom;
    char *type;
    char *code;
    int taille;
    struct Symbol *suivant;
} Symbol;

extern Symbol *tete;


Symbol* createNode(char *nom, char *type, char *code, int taille);
void inserer(Symbol **tete, char *nomentite, char *typeentite, char *codeentite, int taille);
void afficher(Symbol *tete);
Symbol* recherche(Symbol *tete, char *nomentite);

#endif
