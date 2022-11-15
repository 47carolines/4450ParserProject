grammar python;

// TOKENS

//variables
INT : 'int';
FLOAT : 'float';
BOOL : 'bool';
STRING : 'str';
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

// RULES
var : INT
    | MINUS INT
    | FLOAT
    | MINUS FLOAT
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