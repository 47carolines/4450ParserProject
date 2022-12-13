# CS 4450 Parser Project

## Project Description

This project is an implementation of a parser for a simplified version of the Python language (specifically Python 3.x). To create our parser we used a tool called ANTLR which can generate parsers from a grammar file. Our grammar <code>python.g4</code> covers the basics of the Python language (if/elif/else statements, while/for loops, commenting), as well as functions and function calls. The output of this project is a parse tree. 

## Group Information

**Group Name:** Changing Majors

**Programming Language:** Python

**Group Members (and GitHub usernames):**
*	Troy Dalton (ttdghk/ShadowDeath6)
*	Evan Dobson (nosbod18)
*	Caroline Lewis (47carolines)
*	Jacob Strubelt (Jakey5197)
*	Nathan Tucker (nttucker28)

## How to setup

1. Download this repository and unzip it. 
2. If you don't already have Python, download and install it: https://www.python.org/downloads/.
3. If you don't already have ANTLR4, download and install it using the instructions provided in the file located in this repo called ANTLR.pdf.
4. Open up a terminal/command prompt in the project folder <code>4450ParserProject</code>.
5. Run <code>pip install -r requirements.txt</code> to install the <code>antlr4-python3-runtime</code> and <code>antlr-denter</code>. This is needed for <code>main.py</code> to work.
<br><br>


## How to use/run
1. Open up a terminal/command prompt in the project folder <code>4450ParserProject</code>.
2. Run <code>antlr4 -Dlanguage=Python3 python.g4</code> to generate the parser.
   
3. Run in the terminal <code>python main.py test.py</code> to generate a textual parse tree based off of our Python test code file <code>test.py</code>. 
     * NOTE: You can replace the <code>test.py</code> part of the command with the pathname of any Python file you want to test. 

## Bonus
****DISCLAIMER: THIS WAS GENERATED BEFORE CODE REFACTORING****
1. Open up a terminal/command prompt in the project folder <code>4450ParserProject</code>.
2. Run <code>antlr4 -o . -lib . -no-listener -no-visitor  python.g4; javac *.java; grun python start -gui test.py</code>. 
     * This will create the parser and  generate an image visualization of the parse tree for <code>test.py</code> that can be downloaded in PNG or SVG format. This is using ANTLR's GUI feature. You must have ANTLR4 correctly installed in order for this command to work.
     * ![image](https://user-images.githubusercontent.com/75278206/207210153-dac4bf34-d8ba-40bf-9655-80261e633bcf.png)

<br><br>
