%option unicode

%top{
  #include <iostream>
  #include <sstream>
  #include <fstream>

std::stringstream ss;

%}

LETTERS        [\xd8a1-\xd98a\xd991]
DIAC           [\xd98b-\xd990\xd992\xd993]
LATIN          [a-zA-Z0-9]

%%
DIAC+       {/* ignore diacritics */}
٠           {ss << "0";}
١           {ss << "1";}
٢           {ss << "2";}
٣           {ss << "3";}
٤           {ss << "4";}
٥           {ss << "5";}
٦           {ss << "6";}
٧           {ss << "7";}
٨           {ss << "8";}
٩           {ss << "9";}
[\]\[\{\}]    {ss << std::string(text());}
محاذ        {;}
ذاتي        {ss << "auto";}
و           {ss << "and";}
و_عدل       {ss << "and_eq";}
أساس        {ss << "asm";}
بت_و        {ss << "bitand";}
بت_أو       {ss << "bitor";}
بول         {ss << "bool";}
أكسر        |
أكسري       {ss << "break";}
حالة        {ss << "case";}
ألقط        {ss << "catch";}
رمز         {ss << "char";}
رمز16_ن     |
رمز١٦_ن     {ss << "char16_t";}
رمز32_ن     |
رمز٣٢_ن     {ss << "char32_t";}
صنف         {;}
متمم        {;}
ثابت        {ss << "const";}
عبارة_ثابتت   {;}
تحويل_ثابت    {;}
أكمل          {;}
أعلن_نوع      {;}
افتراضي     {ss << "default";}
أشطب        {ss << "delete";}
افعل        {ss << "do";}
ضعف         {ss << "double";}
إلا             |
الا             {;}
تعداد         {;}
صريح          {ss << "explicit";}
أصدر          {;}
خارجي         {ss << "extern";}
خطأ           {ss << "false";}
متحرك         {;}
ل             {ss << "for";}
صديق          |
صديقة         {ss << "friend";}
اذا           |
إذا           {ss << "if";}
كبير          {ss << "long";}
متغير         {;}
نطاق          {ss << "namespace";}
جديد          {ss << "new";}
نفي           {ss << "not";}
نفي_عدل       {;}
مؤثر_ملغي     {;}
حاذى_ك      {ss << "alignas";}
صحيص        {ss << "int";}
أعد         {ss << "return";}
حاول        {ss << "try";}
رئيسي       {ss << "main";}
؛            {ss << ";";}
ـ           {; /*not an underscore, arabic letter extention to be dumped*/}
"."+|","+    {ss << std::string(text());}
LETTERS+    {ss << std::string(text());}
LATIN+      {ss << std::string(text());}
[\n\t ]     {ss << std::string(text());}
[|\\/'"!#~<>?@:;-_+=()*&^%.,]   {ss << std::string(text());}


%%

int main(int argc, char **argv)
{
  FILE *fd = stdin;
  if (argc > 1 && (fd = fopen(argv[1], "r")) == NULL)
    exit(EXIT_FAILURE);
  std::ofstream of("output.txt", std::ofstream::out);
  if (!of)
    exit(EXIT_FAILURE);
  Lexer(fd, of).lex();
  of.close();
  if (fd != stdin)
    fclose(fd);
  std::cout << ss.str() << std::endl;
  return 0;
}
