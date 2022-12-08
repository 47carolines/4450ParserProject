grammar python;

//////////////////////////////////////////////////////////////////////////////
// Override nextToken so the parser can emit INDENT and DEDENT tokens
// Enforces pythons whitespace significance
//
// https://github.com/yshavit/antlr-denter#python3

tokens { INDENT, DEDENT }

@lexer::header {
from antlr_denter.DenterHelper import DenterHelper
from pythonParser import pythonParser
}

@lexer::members {
class pythonDenter(DenterHelper):
    def __init__(self, lexer, nl_token, indent_token, dedent_token, ignore_eof):
        super().__init__(nl_token, indent_token, dedent_token, ignore_eof)
        self.lexer: pythonLexer = lexer
    def pull_token(self):
        return super(pythonLexer, self.lexer).nextToken()

denter = None
def nextToken(self):
    if not self.denter:
        self.denter = self.pythonDenter(self, self.NL, pythonParser.INDENT, pythonParser.DEDENT, False)
    return self.denter.next_token()
}

//////////////////////////////////////////////////////////////////////////////
// Rules

//////////////////////////////////////
// Entry

start
    : (NL | stmt)* EOF
    ;

block
    : simple_stmt
    | INDENT stmt+ DEDENT
    ;

//////////////////////////////////////
// Statements

stmt
    : simple_stmt (SEMI simple_stmt)* SEMI? NL
    | compound_stmt
    ;

simple_stmt
    : expr
    | assign_stmt
    | func_call
    ;

compound_stmt
    : if_stmt
    | for_stmt
    | while_stmt
    | func_def
    ;

assign_stmt
    : ID assign_op expr
    ;

if_stmt
    : IF if_cond COLON block (ELIF if_cond COLON block)* (ELSE COLON block)?
    ;

if_cond
    : (OPEN_PAREN if_cond CLOSE_PAREN) | expr
    ;

for_stmt
    : FOR ID IN expr COLON block (ELSE COLON block)?
    ;

while_stmt
    : WHILE expr COLON block
    ;

//////////////////////////////////////
// Functions

func_def
    : DEF ID OPEN_PAREN func_parameters? CLOSE_PAREN (ARROW expr)? COLON block
    ;

func_parameters
    : expr (ASSIGN expr)? (COMMA func_parameters)?
    ;

func_call
    : ID OPEN_PAREN func_parameters? CLOSE_PAREN
    ;

//////////////////////////////////////
// Expressions

expr
    : cond_expr (compare_op cond_expr)*
    ;

cond_expr
    : arith_expr ((AND | OR) arith_expr)*
    ;

arith_expr
    : atom ((ADD | SUB) atom)*
    ;

//////////////////////////////////////
// Atoms and operators

atom
    : NOT? (ID | NUMBER | STRING | bool)
    ;

bool
    : TRUE
    | FALSE
    ;

compare_op
    : LESS_THAN
    | GREATER_THAN
    | LT_EQUAL
    | GT_EQUAL
    | EQUAL
    | NOT_EQUAL
    | AND
    | OR
    ;

assign_op
    : ASSIGN
    | ADD_ASSIGN 
    | SUB_ASSIGN 
    | MUL_ASSIGN 
    | DIV_ASSIGN 
    ;

//////////////////////////////////////////////////////////////////////////////
// Tokens - Order is important

//////////////////////////////////////
// Identifiers

DEF             : 'def';
IF              : 'if';
ELIF            : 'elif';
ELSE            : 'else';
FOR             : 'for';
IN              : 'in';
WHILE           : 'while';
AND             : 'and';
OR              : 'or';
NOT             : 'not';
TRUE            : 'True';
FALSE           : 'False';

NUMBER          : [+-]? DIGIT+ ('.' DIGIT+)?;
ID              : [_a-zA-Z][_a-zA-Z0-9]*;
STRING          : '"' ~["]* '"';
DIGIT           : [0-9];

//////////////////////////////////////
// Symbols

OPEN_PAREN      : '(';
CLOSE_PAREN     : ')';
ARROW           : '->';
COMMA           : ',';
COLON           : ':';
SEMI            : ';';

ADD             : '+';
SUB             : '-';
MUL             : '*';
DIV             : '/';
MOD             : '%';

ASSIGN          : '=';
ADD_ASSIGN      : '+=';
SUB_ASSIGN      : '-=';
MUL_ASSIGN      : '*=';
DIV_ASSIGN      : '/=';
MOD_ASSIGN      : '%=';

LESS_THAN       : '<';
GREATER_THAN    : '>';
LT_EQUAL        : '<=';
GT_EQUAL        : '>=';
EQUAL           : '==';
NOT_EQUAL       : '!=';

//////////////////////////////////////
// Whitespace

WS              : ' ' -> skip;
NL              : ('\r'? '\n' ' '*);
COMMENT         : '#' ~[\r\n]* -> skip;
