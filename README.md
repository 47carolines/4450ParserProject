# CS 4450 Parser Project

## Project Description

This project is an implementation of a parser for a simplified version of the Python language (specifically Python 3.x). To create our parser we used a tool called ANTLR which can generate parsers from a grammar file. Our grammar <code>python.g4</code> covers the basics of the Python language but does not cover more complex things like classes and functions. The output of this project is a parse tree. 

## Group Information

**Group Name:** Changing Majors

**Programming Language:** Python

**Group Members (and GitHub usernames):**
*	Troy Dalton (ttdghk)
*	Evan Dobson (nosbod18)
*	Caroline Lewis (47carolines)
*	Jacob Strubelt (Jakey5197)
*	Nathan Tucker (nttucker28)

## How to setup

1. Download this repository and unzip it. 
2. If you don't already have Python, download and install it: https://www.python.org/downloads/.
3. Open up a terminal/command prompt in the project folder <code>4450ParserProject</code>.
4. Run <code>pip install -r requirements.txt</code> to install the <code>antlr4-python3-runtime</code>. This is needed for <code>main.py</code> to work.
<br><br>


## How to use/run
1. Open up a terminal/command prompt in the project folder <code>4450ParserProject</code>.

2. Run in the terminal <code>python main.py test.py </code> to generate a textual parse tree based off of our Python test code file <code>test.py</code>. 
     * NOTE: You can replace the <code>test.py</code> part of the command with the pathname of any Python file you want to test. 
<br><br>

## Demo video

TBD
