grammar python;

// TOKENS

//variables
INT : '0'..'9'+;
BOOL : 'true' | 'false';
STRING : '"' (~["\r\n] | '""')* '"';

VARNAME: [a-zA-Z_] [a-zA-Z_0-9]*;

//arithmetic operators
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

//conditional operators
GREATERTHAN : '>';
GREATERTHANEQUAL : '>=';
LESSTHAN : '<';
LESSTHANEQUAL : '<=';
AREEQUAL : '==';
NOTEQUAL : '!=';
NOT : 'not';
AND : 'and';
OR : 'or';

WHITESPACE : [ \r\n\t]+ -> skip;

// RULES
start: block EOF;

block
    : assignment block*
    | expr block*
    | WHITESPACE
    ;

expr
     : var
     | conditionalExpr
     | mathExpr
     ;

assignment
    : VARNAME EQUAL expr
    ;

var
    : INT
    | STRING
    | BOOL
    | VARNAME
    ;

mathExpr
    : INT (PLUS | MINUS | MULTIPLY | DIVIDE | MODULUS) INT
    | VARNAME (PLUSEQUAL | MINUSEQUAL | MULTIPLYEQUAL | DIVIDEEQUAL | MODULUSEQUAL) INT
    ;


conditionalExpr
    : (GREATERTHAN
        | GREATERTHANEQUAL
        | LESSTHAN
        | LESSTHANEQUAL
        | AREEQUAL
        | NOTEQUAL
        | NOT
        | AND
        | OR) var
    ;

