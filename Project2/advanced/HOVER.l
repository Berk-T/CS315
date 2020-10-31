/* HOVER.l */
%option main
sign [{plus}{minus}]
digit [0-9]
integer [+-]?[0-9]+
float   [+-]?[0-9]?(\.)[0-9]+
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
not !
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
get_size GET_SIZE
io_read READ
io_write WRITE
void VOID
null NULL
function FUNC
comma \,
return RETURN
LP \(
RP \)
LB \{
RB \}
LSB \[
RSB \]
semicolon ;
if IF
else ELSE
hashtag #
comment {hashtag}([^#])*{hashtag}
for FOR
while WHILE
do DO
times TIMES
array_initializer (\[\])+
%%
{type_bool}                 printf("TYPE_BOL");
{type_int}                  printf("TYPE_INT");
{type_char}                 printf("TYPE_CHR ");
{type_string}               printf("TYPE_STR ");
{type_float}                printf("TYPE_FLT ");
{constant_keyword}          printf("CONSTANT ");
{assign_op}                 printf("ASSIGNMENT_OP ");
{assign_op}{plus}           printf("PLUS_ASSIGNMENT_OP ");
{assign_op}{minus}          printf("MINUS_ASSIGNMENT_OP ");
{assign_op}{multiplication} printf("MULTIPLY_ASSIGNMENT_OP ");
{assign_op}{power}          printf("POWER_ASSIGNMENT_OP ");
{assign_op}{mod}            printf("MOD_ASSIGNMENT_OP ");
{assign_op}{division}       printf("DIVIDE_ASSIGNMENT_OP ");
{increment}                 printf("INCREMENT_OP ");
{decrement}                 printf("DECREMENT_OP ");
{multiplication}            printf("MULTIPLICATION_OP ");
{power}                     printf("POWER_OP ");
{division}                  printf("DIVISION_OP ");
{mod}                       printf("MOD_OP ");
{bigger}                    printf("BIGGER_THAN ");
{smaller}                   printf("SMALLER_THAN ");
{bigger_equal}              printf("BIGGER_EQUAL ");
{smaller_equal}             printf("SMALLER_EQUAL ");
{equal}                     printf("EQUAL ");
{not_equal}                 printf("NOT_EQUAL ");
{boolean}                   printf("BOOLEAN ");
{and}                       printf("AND ");
{or}                        printf("OR ");
{not}                       printf("NOT ");
{comma}                     printf("COMMA ");
{within}                    printf("WITHIN ");
{outside}                   printf("OUTSIDE ");
{inclination}               printf("GET_INC ");
{altitude}                  printf("GET_ALT ");
{temperature}               printf("GET_TEMP ");
{acceleration}              printf("GET_ACC ");
{cam_on}                    printf("CAM_ON ");
{cam_off}                   printf("CAM_OFF ");
{snap_pic}                  printf("SNAP_PIC ");
{time}                      printf("GET_TIME ");
{wifi}                      printf("CONNECT_BASE ");
{storage}                   printf("GET_CAPACITY ");
{battery}                   printf("GET_BATTERY ");
{wait}                      printf("WAIT ");
{get_size}                  printf("GET_SIZE ");
{io_read}                   printf("READ ");
{io_write}                  printf("WRITE ");
{void}                      printf("VOID ");
{null}                      printf("NULL ");
{function}                  printf("FUNC ");
{return}                    printf("RETURN ");
{if}                        printf("IF ");
{else}                      printf("ELSE ");
{for}                       printf("FOR ");
{while}                     printf("WHILE ");
{do}                        printf("DO ");
{times}                     printf("TIMES ");
{LP}                        printf("LP ");
{RP}                        printf("RP ");
{LB}                        printf("LCB ");
{RB}                        printf("RCB ");
{LSB}                       printf("LSB ");
{RSB}                       printf("RSB ");
{semicolon}                 printf("SC ");
{identifier}                printf("IDENTIFIER ");
{char}                      printf("CHAR ");
{comment}                   printf("COMMENT ");
{plus}                      printf("PLUS_OP ");
{minus}                     printf("MINUS_OP ");
{array_initializer}         printf("ARRAY_INITIALIZER ");
{float}                     printf("FLOAT ");
{integer}                   printf("INTEGER ");
{string}                    printf("STRING ");
