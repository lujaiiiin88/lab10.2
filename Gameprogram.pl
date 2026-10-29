{\rtf1\ansi\ansicpg1252\cocoartf2865
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 % ==========================================\
% Lab 9: The Name Game Program\
% Uses dynamic database manipulation and IO streams\
% ==========================================\
\
:- dynamic letter/1.\
\
% Start with an initial set of letters (a, b, c)\
letter(a).\
letter(b).\
letter(c).\
\
% Main entry point to run the game\
start :-\
    nl,\
    write('Hi This is the "Name Game"'), nl,\
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,\
    disp_menu.\
\
% Display the interactive menu\
disp_menu :-\
    nl,\
    write('Choose from the following:'), nl,\
    write('1- Display the current set of letters'), nl,\
    write('2- Add a letter'), nl,\
    write('3- Add a letter at the top'), nl,\
    write('4- Add a letter at the bottom'), nl,\
    write('5- Delete a letter'), nl,\
    write('6- Delete all letters'), nl,\
    write('7- Exit'), nl,\
    write('Enter your choice...'), nl,\
    write('|: '),\
    read(Choice),\
    handle_choice(Choice).\
\
% Option 1: Display current letters\
handle_choice(1) :-\
    nl, write('--- Current Set of Letters ---'), nl,\
    (   letter(X),\
        write(X), nl,\
        fail\
    ;   true\
    ),\
    disp_menu.\
\
% Option 2: Add a letter (using standard assert/assertz)\
handle_choice(2) :-\
    nl, write('Enter the letter you want to add: '),\
    read(NewLetter),\
    assertz(letter(NewLetter)),\
    write('Letter added successfully.'), nl,\
    disp_menu.\
\
% Option 3: Add a letter at the top (using asserta)\
handle_choice(3) :-\
    nl, write('Enter the letter to add at the top: '),\
    read(NewLetter),\
    asserta(letter(NewLetter)),\
    write('Letter added at the top successfully.'), nl,\
    disp_menu.\
\
% Option 4: Add a letter at the bottom (using assertz)\
handle_choice(4) :-\
    nl, write('Enter the letter to add at the bottom: '),\
    read(NewLetter),\
    assertz(letter(NewLetter)),\
    write('Letter added at the bottom successfully.'), nl,\
    disp_menu.\
\
% Option 5: Delete a specific letter (using retract)\
handle_choice(5) :-\
    nl, write('Enter the letter you want to delete: '),\
    read(TargetLetter),\
    (   retract(letter(TargetLetter))\
    ->  write('Letter deleted successfully.')\
    ;   write('Letter not found in the set.')\
    ),\
    nl,\
    disp_menu.\
\
% Option 6: Delete all letters (using retractall)\
handle_choice(6) :-\
    retractall(letter(_)),\
    nl, write('All letters have been deleted.'), nl,\
    disp_menu.\
\
% Option 7: Exit the program\
handle_choice(7) :-\
    nl, write('Exiting Name Game. Goodbye!'), nl, !.\
\
% Catch invalid choices\
handle_choice(_) :-\
    nl, write('Invalid choice, please try again.'), nl,\
    disp_menu.}