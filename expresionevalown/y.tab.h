#ifndef _yy_defines_h_
#define _yy_defines_h_

#define NUMBER 257
#define PLUS 258
#define MINUS 259
#define TIMES 260
#define DIVIDE 261
#define LPAREN 262
#define RPAREN 263
#define UMINUS 264
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union YYSTYPE {
    double num;
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;

#endif /* _yy_defines_h_ */