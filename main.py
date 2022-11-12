import sys
from antlr4 import *
from antlr4.tree.Trees import Trees
from pythonLexer import pythonLexer
from pythonParser import pythonParser

def main(argv):
    io_stream = FileStream(argv[1])
    lexer = pythonLexer(io_stream)
    stream = CommonTokenStream(lexer)
    parser = pythonParser(stream)
    tree = parser.start()
    print(Trees.toStringTree(tree, None, parser))

if __name__ == '__main__':
    main(sys.argv)
