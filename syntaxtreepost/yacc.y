%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct node {
    char* token;
    struct node* left;
    struct node* right;
} node;

node* create_node(char* token, node* left, node* right);
void post_order(node* root);
void yyerror(const char* s);
int yylex();

node* root = NULL;
%}

%union {
    char* str;
    struct node* node_ptr;
}

%token <str> ID
%token ASSIGN PLUS MINUS MULTIPLY LPAREN RPAREN

%type <node_ptr> S E T

%%

S: ID ASSIGN E { $$ = create_node("=", create_node($1, NULL, NULL), $3); root = $$; }
 ;

E: E PLUS T    { $$ = create_node("+", $1, $3); }
 | E MINUS T   { $$ = create_node("-", $1, $3); }
 | E MULTIPLY T { $$ = create_node("*", $1, $3); }
 | T           { $$ = $1; }
 ;

T: LPAREN E RPAREN { $$ = $2; }
 | ID              { $$ = create_node($1, NULL, NULL); }
 ;

%%

node* create_node(char* token, node* left, node* right) {
    node* new_node = (node*)malloc(sizeof(node));
    new_node->token = strdup(token);
    new_node->left = left;
    new_node->right = right;
    return new_node;
}

void post_order(node* root) {
    if (root == NULL) return;
    post_order(root->left);
    post_order(root->right);
    printf("%s ", root->token);
}

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    printf("Syntax tree in postorder: ");
    post_order(root);
    printf("\n");
    return 0;
}