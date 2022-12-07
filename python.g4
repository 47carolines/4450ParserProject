grammar python;

// TOKENS

//variables
INT : '0'..'9'+;
BOOL : 'True' | 'False';
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
RESERVED_WORD : 'if' | 'else' | 'elif' | 'print' | 'while' | 'for';
OPEN: '(';
CLOSE: ')';

WHITESPACE : [ \r\n\t]+ -> skip;

COLON : ':' ;

COMMENT: '#' ~( '\r' | '\n' )*;

// RULES
start: block EOF; //start symbol

block
    : assignment block*
    | expr block*
    | WHITESPACE
    | COMMENT
    ;

expr
     : var
     | conditionalExpr
     | mathExpr
     | if_block
     | printRule
     | while_statement
     | for_block
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
        | var (GREATERTHAN
        | GREATERTHANEQUAL
        | LESSTHAN
        | LESSTHANEQUAL
        | AREEQUAL
        | NOTEQUAL
        | NOT
        | AND
        | OR) var
    ;

if_statement 
    : 'if' OPEN expr CLOSE COLON expr 
    | 'if' expr COLON expr 
    ;

elif_statement 
    : 'elif' OPEN expr CLOSE COLON expr 
    | 'elif' expr COLON expr 
    ;

else_statement : 'else' COLON expr ;

if_block : if_statement elif_statement* else_statement*;

printRule : 'print' OPEN expr CLOSE ;

while_statement : 'while' OPEN expr CLOSE COLON expr*
                | 'while' expr COLON expr*
                ;

for_statement
    : 'for' var 'in' expr COLON ;

for_block
    : for_statement block
    | for_statement block else_statement
    ;