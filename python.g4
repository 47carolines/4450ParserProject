grammar python;

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

SPACE : ' ';
TAB : '    ';

VARNAME: [a-zA-Z_] [a-zA-Z_0-9]*;


// RULES
start: block EOF;

block
    : expr block*
    ;

space
    : SPACE
    | TAB
    | space space
    ;

expr
     :
     | //being worked on 
     ;

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
