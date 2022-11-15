grammar python;

// TOKENS
INT : '0'..'9'+;
BOOL : 'true' | 'false';
STRING : '"' (~["\r\n] | '""')* '"';

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
EQUAL : '=';
NEWLINE: [\n]+ ;

SPACE : ' ';
TAB : '    ';

VARNAME: [a-zA-Z_] [a-zA-Z_0-9]*;


// RULES
start: block EOF;

block
    : assignment block*
    | expr block*
    | NEWLINE
    ;

space
    : SPACE
    | TAB // rule also covers multiple spaces or tabs.
    | space space
    ;

expr
     : var
     ;

assignment
    : VARNAME EQUAL expr
    | VARNAME space EQUAL expr
    | VARNAME space EQUAL space expr
    | VARNAME EQUAL space expr
    ;


var : INT
    | STRING
    | BOOL
    | VARNAME
    ;
