#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ts.h"

Symbol *tete = NULL;

Symbol* createNode(char *nom, char *type, char *code, int taille) {
    Symbol *new_node = (Symbol*)malloc(sizeof(Symbol));
    new_node->nom = strdup(nom);
    new_node->type = strdup(type);
    new_node->code = strdup(code);
    new_node->taille = taille;
    new_node->suivant = NULL;
    return new_node;
}
Symbol* recherche(Symbol *tete, char *nomentite) {
    while (tete != NULL) {
        if (strcmp(tete->nom, nomentite) == 0) {  // Utilisez 'nom' au lieu de 'nomentite'
            return tete;
        }
        tete = tete->suivant;  // Utilisez 'suivant' au lieu de 'next'
    }
    return NULL;  // Si l'entité n'est pas trouvée
}


void inserer(Symbol **tete, char *nomentite, char *typeentite, char *codeentite, int taille) {
    Symbol *new_node = createNode(nomentite, typeentite, codeentite, taille);
    new_node->suivant = *tete;
    *tete = new_node;
}

void afficher(Symbol *tete) {
    Symbol *current = tete;
    while (current != NULL) {
        printf("Nom: %s, Type: %s, Code: %s, Taille: %d\n", current->nom, current->type, current->code, current->taille);
        current = current->suivant;
    }
}
