grammar Logback;
@header { package de.hs.settlers.server.parser; }

options {
    language = Java;
}

logfile: line | excep;
line: timestamp level thread clazz message;
timestamp: FULLDATE WHITESPACE;
level: WHITESPACE actuallevel=LVL WHITESPACE;
thread: LEFTBRACKET (CLASSNAME | MINUS | UNDERSCORE)+ RIGHTBRACKET;
clazz: WHITESPACE className=CLASSNAME COLON linenr=NUMBER;
message: ((CLASSNAME | MINUS | UNDERSCORE)+ | SPECIALCHARS | WHITESPACE)+;
excep: message;
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
