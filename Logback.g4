grammar Logback;
@header { package de.hs.settlers.server.parser; }

options {
    language = Java;
}

logfile: (line | excep) EOF;
line: timestamp level thread clazz message;
timestamp: FULLDATE WHITESPACE;
level: actuallevel=LVL WHITESPACE WHITESPACE;
thread: LEFTBRACKET qualifier RIGHTBRACKET;
clazz: WHITESPACE className=CLASSNAME COLON linenr=NUMBER WHITESPACE+ MINUS WHITESPACE;
message: ((CLASSNAME | MINUS | UNDERSCORE)+ | SPECIALCHARS | WHITESPACE)+;
excep: message;
qualifier: (CLASSNAME | MINUS | UNDERSCORE)+;
FULLDATE: NUMBER DOT NUMBER DOT NUMBER WHITESPACE NUMBER COLON NUMBER COLON NUMBER DOT NUMBER;
COLON: ':';
LVL: 'INFO' | 'WARN' | 'ERROR' | 'TRACE' | 'DEBUG' | 'ALL';
LEFTBRACKET: '[';
RIGHTBRACKET: ']';
UNDERSCORE: '_';
MINUS: '-';
DOLLAR: '$';
DOT: '.';
WHITESPACE: ' ';
DIGIT: ('0'..'9');
CHARACTER: ('a'..'z') | ('A'..'Z') | 'ö' | 'ü' | 'ä' | 'Ä' | 'Ü' | 'Ö' | 'ß';
SPECIALCHARS: LEFTBRACKET | RIGHTBRACKET | COLON | '#' | '\'' | '/' | '\\' | '"' | '!' | '?' | '{' | '}' | '(' | ')' | '+' | ';' | ',' | '&' | '|' | '%' | '*' | '=';
CLASSNAME: CHARACTER (CHARACTER | NUMBER | DOT | DOLLAR)*;
NUMBER: (DIGIT)+;
