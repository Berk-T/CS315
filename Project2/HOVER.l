/* HOVER.l */
%{
    #include <stdlib.h>
    #include <stdio.h>
%}
%option yylineno
digit [0-9]
integer [0-9]+
float   [-+]?[0-9]*(\.)[0-9]+
alphabetic [A-Za-z_]
alphanumeric ({alphabetic}|{digit})
special_chars [\?!@#\$%\^\&\*\(\)\+=/-\;\'\"\|\{\}\[\]\:\.\,<>~\-]
char \'({alphanumeric}|{special_chars}|" ")?\'
string \"({alphanumeric}|{special_chars}|" "|\\n)*\"
identifier [A-Za-z]+({alphanumeric}|_)*
type_bool BOL
type_int INT
type_char CHR
type_string STR
type_float FLT
constant_keyword CONSTANT
assign_op =
plus \+
minus \-
newline \n
multiplication \*
power \*\*
mod %
division \/
bigger >
smaller <
bigger_equal >=
smaller_equal <=
equal ==
not_equal !=
increment \+\+
decrement \-\-
boolean TRUE|FALSE
and AND
or OR
within WITHIN
outside OUTSIDE
inclination GET_INC
altitude GET_ALT
temperature GET_TEMP
acceleration GET_ACC
cam_on CAM_ON
cam_off CAM_OFF
snap_pic SNAP_PIC
time GET_TIME
wifi CONNECT_BASE
storage GET_CAPACITY
battery GET_BATTERY
wait WAIT
io_read READ
io_write WRITE
void VOID
function FUNC
comma \,
RETURN RETURN
LP \(
RP \)
LB \{
RB \}
semicolon \;
if IF
else ELSE
hashtag #
comment {hashtag}([^#])*{hashtag}
for FOR
while WHILE
do DO
into INTO
times TIMES
start START
end END
%%
{start}                     return START;
{end}                       return END;
{type_bool}                 return TYPE_BOL;
{type_int}                  return TYPE_INT;
{type_char}                 return TYPE_CHR;
{type_string}               return TYPE_STR;
{type_float}                return TYPE_FLT;
{constant_keyword}          return CONSTANT;
{assign_op}                 return ASSIGNMENT_OP;
{assign_op}{plus}           return PLUS_ASSIGNMENT_OP;
{assign_op}{minus}          return MINUS_ASSIGNMENT_OP;
{assign_op}{multiplication} return MULTIPLY_ASSIGNMENT_OP;
{assign_op}{power}          return POWER_ASSIGNMENT_OP;
{assign_op}{mod}            return MOD_ASSIGNMENT_OP;
{assign_op}{division}       return DIVIDE_ASSIGNMENT_OP;
{increment}                 return INCREMENT_OP;
{decrement}                 return DECREMENT_OP;
{multiplication}            return MULTIPLICATION_OP;
{power}                     return POWER_OP;
{division}                  return DIVISION_OP;
{mod}                       return MOD_OP;
{bigger}                    return BIGGER_THAN;
{smaller}                   return SMALLER_THAN;
{bigger_equal}              return BIGGER_EQUAL;
{smaller_equal}             return SMALLER_EQUAL;
{equal}                     return EQUAL;
{not_equal}                 return NOT_EQUAL;
{boolean}                   return BOOLEAN;
{and}                       return AND;
{or}                        return OR;
{comma}                     return COMMA;
{within}                    return WITHIN;
{outside}                   return OUTSIDE;
{inclination}               return GET_INC;
{altitude}                  return GET_ALT;
{temperature}               return GET_TEMP;
{acceleration}              return GET_ACC;
{cam_on}                    return CAM_ON;
{cam_off}                   return CAM_OFF;
{snap_pic}                  return SNAP_PIC;
{time}                      return GET_TIME;
{wifi}                      return CONNECT_BASE;
{storage}                   return GET_CAPACITY;
{battery}                   return GET_BATTERY;
{wait}                      return WAIT;
{io_read}                   return READ;
{into}                      return INTO;
{io_write}                  return WRITE;
{void}                      return VOID;
{function}                  return FUNC;
{RETURN}                    return RETURN;
{if}                        return IF;
{else}                      return ELSE;
{for}                       return FOR;
{while}                     return WHILE;
{do}                        return DO;
{times}                     return TIMES;
{LP}                        return LP;
{RP}                        return RP;
{LB}                        return LCB;
{RB}                        return RCB;
{semicolon}                 return SC;
{identifier}                return IDENTIFIER;
{char}                      return CHAR;
{comment}                   return COMMENT;
{plus}                      return PLUS_OP;
{minus}                     return MINUS_OP;
{float}                     return FLOAT;
{integer}                   return INTEGER;
{string}                    return STRING;
{newline}                   ;
[\t]                        ;
%%
int yywrap() { return 1; }