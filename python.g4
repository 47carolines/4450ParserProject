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
NEWLINE: [\n]+ ;

SPACE : ' ';
TAB : '    ';


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

expression : mathExpr
           | conditionalExpr
           | var
           ;

conditionalExpr : operator=(GREATERTHAN | GREATERTHANEQUAL) var
                | whitespace operator=(GREATERTHAN | GREATERTHANEQUAL) var
                | whitespace operator=(GREATERTHAN | GREATERTHANEQUAL) whitespace var
                | operator=(LESSTHAN | LESSTHANEQUAL) var
                | whitespace operator=(LESSTHAN | LESSTHANEQUAL) var
                | whitespace operator=(LESSTHAN | LESSTHANEQUAL) whitespace var
                | operator=(AREEQUAL | NOTEQUAL) var
                | whitespace operator=(AREEQUAL | NOTEQUAL) var
                | whitespace operator=(AREEQUAL | NOTEQUAL) whitespace var
                | operator=(NOT | AND | OR) var
                | whitespace operator=(NOT | AND | OR) var
                | whitespace operator=(NOT | AND | OR) whitespace var