grammar python;

start: (expr NEWLINE)* ;

expr : expr ('*' | '/') expr
     | expr ('+' | '-') expr
     | INT
     | '(' expr ')'
     | printRule
     ;

printRule: 'print(' expr ')';

NEWLINE: [\n]+ ;
INT    : [0-9]+ ;
