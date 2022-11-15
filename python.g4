grammar python;

start: (expr NEWLINE)* ;

// TOKENS
INT : 'int';
FLOAT : 'float';
BOOL : 'bool';
STRING : 'str';

PLUS : '+';
PLUSEQUAL : '+=';
MINUS : '-';
MINUSEQUAL : '-=';
MULTIPLY : '*';
MULTIPLYEQUAL : '*=';
DIVIDE : '/';
DIVIDEEQUAL : '/=';
MODULUS : '%';
MODULUSEQUAL : '%=';
EXPONENT : '**';
EXPONENTEQUAL : '**=';
FLOORDIV : '//';
FLOORDIVEQUAL : '//=';

VARNAME: [a-zA-Z_] [a-zA-Z_0-9]*;


// RULES
var : INT
    | MINUS INT
    | intCast
    | FLOAT
    | MINUS FLOAT
    | floatCast
    | STRING
    | strCast
    | BOOL
    | VARNAME
    ;

expr : expr ('*' | '/') expr
     | expr ('+' | '-') expr
     | INT
     | '(' expr ')'
     | printRule
     ;

printRule: 'print(' expr ')';

NEWLINE: [\n]+ ;
INT    : [0-9]+ ;
