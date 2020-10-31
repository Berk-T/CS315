/*HOVER-less.y*/
%{
    #include <stdio.h>
    #include <string.h>

    extern FILE *yyin;

%}
%token TYPE_BOL TYPE_INT TYPE_CHR TYPE_STR TYPE_FLT CONSTANT ASSIGNMENT_OP PLUS_ASSIGNMENT_OP MINUS_ASSIGNMENT_OP MULTIPLY_ASSIGNMENT_OP POWER_ASSIGNMENT_OP 
%token MOD_ASSIGNMENT_OP DIVIDE_ASSIGNMENT_OP INCREMENT_OP DECREMENT_OP MULTIPLICATION_OP POWER_OP DIVISION_OP MOD_OP BIGGER_THAN SMALLER_THAN BIGGER_EQUAL 
%token SMALLER_EQUAL EQUAL NOT_EQUAL BOOLEAN AND OR COMMA WITHIN OUTSIDE GET_INC GET_ALT GET_TEMP GET_ACC CAM_ON CAM_OFF SNAP_PIC GET_TIME
%token CONNECT_BASE GET_CAPACITY GET_BATTERY WAIT READ WRITE VOID FUNC RETURN IF ELSE FOR WHILE DO TIMES LP RP LCB RCB SC IDENTIFIER 
%token CHAR COMMENT PLUS_OP MINUS_OP FLOAT INTEGER STRING START END INTO
%%
start: START stmt_list END {printf("\rProgram is valid.\n");};
stmt_list: stmt | stmt stmt_list;
stmt: if_stmt SC | non_if_stmt SC | COMMENT;
non_if_stmt: declare_assign_stmts | constant_expr | loop | function_declare | IO_stmt ;
declare_assign_stmts: declare_stmts | assign_stmt;
declare_stmts: declare | declare_assign;
assign_stmt: assign;
declare: single_declare;
single_declare: type IDENTIFIER;
type: TYPE_BOL | TYPE_INT | TYPE_CHR | TYPE_STR | TYPE_FLT;
assign: IDENTIFIER assignment_op constant_expr;
assignment_op: ASSIGNMENT_OP | PLUS_ASSIGNMENT_OP | MINUS_ASSIGNMENT_OP | MULTIPLY_ASSIGNMENT_OP | POWER_ASSIGNMENT_OP | MOD_ASSIGNMENT_OP | DIVIDE_ASSIGNMENT_OP;
declare_assign: constant_declare_assign | single_declare ASSIGNMENT_OP constant_expr;
loop: for_loop | while_loop | dowhile_loop | times_loop;
func_call: IDENTIFIER LP arguments RP | IDENTIFIER LP RP;
arguments: arg | arg COMMA arguments;
arg: literal | IDENTIFIER;
function_declare: non_void_function_declare | void_function_declare;
IO_stmt: input_stmt | output_stmt;
primitive_func: GET_INC | GET_ALT | GET_TEMP | GET_ACC | GET_TIME | CONNECT_BASE | GET_CAPACITY | GET_BATTERY | CAM_ON | CAM_OFF | SNAP_PIC | WAIT IDENTIFIER | WAIT positive_int;
literal: integer | FLOAT | CHAR | STRING | BOOLEAN | VOID;
integer: positive_int | negative_int;
positive_int: PLUS_OP INTEGER | INTEGER;
negative_int: MINUS_OP INTEGER;
constant_declare_assign: CONSTANT type IDENTIFIER ASSIGNMENT_OP literal;
constant_expr: logical_or_expr | range_expr;
logical_or_expr: logical_and_expr | logical_or_expr OR logical_and_expr;
logical_and_expr: equality_expr | logical_and_expr AND equality_expr;
equality_expr: relational_expr | equality_expr equality_op relational_expr;
relational_expr: arithmetic_add_expr | relational_expr relational_op arguments;
arithmetic_add_expr: arithmetic_mult_expr | arithmetic_add_expr PLUS_OP arithmetic_mult_expr | arithmetic_add_expr MINUS_OP arithmetic_mult_expr;
arithmetic_mult_expr: arithmetic_pow_expr | arithmetic_mult_expr MULTIPLICATION_OP arithmetic_pow_expr | arithmetic_mult_expr DIVISION_OP arithmetic_pow_expr;
arithmetic_pow_expr: update_expr | arithmetic_pow_expr POWER_OP update_expr | arithmetic_pow_expr MOD_OP update_expr;
update_expr: primary_expr | update_expr INCREMENT_OP | update_expr DECREMENT_OP;
primary_expr: IDENTIFIER | literal | func_call | primitive_func | LP expr RP;
expr: logical_or_expr;
range_expr: IDENTIFIER range_keyword range_bound COMMA range_bound | literal range_keyword range_bound COMMA range_bound;
range_bound: FLOAT | integer | IDENTIFIER;
range_keyword: WITHIN | OUTSIDE;
if_stmt: matched | unmatched;
matched: IF LP constant_expr RP matched ELSE matched | LCB if_stmt_list RCB;
unmatched: IF LP constant_expr RP if_stmt | IF LP constant_expr RP matched ELSE unmatched;
if_stmt_list: stmt_list | stmt_list return_stmt SC; 
for_loop: FOR LP for_init SC for_condition SC for_update RP LCB stmt_list RCB;
for_init: declare_assign_stmts | for_init COMMA declare_assign_stmts;
for_condition: constant_expr;
for_update: assign_stmt | expr;
while_loop: WHILE LP constant_expr RP LCB stmt_list RCB;
times_loop: TIMES LP positive_int RP LCB stmt_list RCB | TIMES LP IDENTIFIER RP LCB stmt_list RCB;
dowhile_loop: DO LCB stmt_list RCB WHILE LP constant_expr RP;
non_void_function_declare: type FUNC IDENTIFIER LP parameters RP LCB stmt_list return_stmt SC RCB | type FUNC IDENTIFIER LP RP RCB stmt_list return_stmt SC RCB;
void_function_declare: VOID FUNC IDENTIFIER LP parameters RP LCB stmt_list RCB | VOID FUNC IDENTIFIER LP RP LCB stmt_list RCB;
parameters: parameter | parameter COMMA parameters;
parameter: single_declare;
return_stmt: RETURN single_return;
single_return: constant_expr;
input_stmt: single_input;
single_input: READ LP STRING RP INTO IDENTIFIER | READ INTO IDENTIFIER;
output_stmt: WRITE LP constant_expr RP INTO LP STRING RP | WRITE LP constant_expr RP;
equality_op: EQUAL | NOT_EQUAL;
relational_op: SMALLER_THAN | BIGGER_THAN | SMALLER_EQUAL | BIGGER_EQUAL;
%%
#include "lex.yy.c"
int main() {
 return yyparse();
}
int yyerror(char *s) {
    extern int yylineno; 
    fprintf(stderr,"%s at line: %d with next token: %d!\n", s, yylineno,yychar);
    printf("\r"); 
}
