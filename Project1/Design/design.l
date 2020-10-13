%option main
sign [+-]
digit [0-9]
normal_chars ([a-z]|[A-Z]||"_")
special_chars [! | @ | # | $ | % | ^ | & | * | ( | ) | + | = | / | * | - | ; | ' | " | ; | '|' | { | } | \[ | \] ]
type [BOL |INT | LNG | CHR | STR | FLT | DBL]
%%
{sign}*{digit}+ printf("INT")
{sign}*{digit}+(\.){digit}+ printf("FLT")
'{normal_chars}+' printf("CHR")
"({specialchars}|{normal_chars}|" ")*"  printf("STR")       //double ve long nasıl olcak anlamadım
TRUE | FALSE printf("BOOL_VAL")
#({specialchars}|{normal_chars}|" ")*# printf("COMMENT")
while printf("WHILE_LOOP")
for printf("FOR_LOOP")
times printf("TIMES_LOOP")
do printf("DO") //anlamadım nasıl olcak
({type}|VOID)+FUNC printf("FUNCTION")
return printf("RETURN")
