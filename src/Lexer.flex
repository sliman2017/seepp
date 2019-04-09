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

تحويل_ديناميكي  {ss << "dynamic_cast";}

عبارة_ثابتت   {ss << "constexpr";}
طغى_التحويل   {ss << "reinterpret_cast";}

تحويل_دائم    {ss << "const_cast";}
لا_استثناء     {ss << "noexcept";}
تأكيد_ثابت     {ss << "static_assert";}
تحويل_ثابت     {ss << "static_cast";}

مؤشر_صفري     {ss << "nullptr";}

أو_ح_حدث      |
أوـح_حدث      |
او_ح_حدث      |
اوـح_حدث      {ss << "xor_eq";}
أعلن_نوع      {ss << "decltype";}
اذهب_الى      {ss << "goto";}
خيط_محلي        {ss << "thread_local";}


رمز١٦_ن     |
رمز١٦ـن     |
رمز16_ن     |
رمز16ـن     {ss << "char16_t";}
رمز٣٢_ن     |
رمز٣٢ـن     |
رمز32_ن     |
رمز32ـن     {ss << "char32_t";}
نفي_حدث     {ss << "not_eq";}
حدد_نوع         {ss << "typedef";}
عرف_نوع         {ss << "typeid";}
اسم_نوع         {ss << "typename";}
استعمال         {ss << "using";}
افتراضي          {ss << "virtual";}
رمز_ع_ن           |
رمزـعـن           {ss << "wchar_t";}

حاذى_ك      {ss << "alignas";}
أو_حدث      |
او_حدث      {ss << "or_eq";}

و_حدث       {ss << "and_eq";}
بت_او       |
بت_أو       {ss << "bitor";}
اكسري       |
أكسري       {ss << "break";}
مبدئي       {ss << "default";}
أشطبي       {ss << "delete";}
تعداد       {ss << "enum";}
خارجي       {ss << "extern";}
أخيرة       {ss << "final";}
متحرك       {ss << "float";}
صديقة       {ss << "friend";}
متغير       {ss << "mutable";}
جديدة       {ss << "new";}
محمية       {ss << "protected";}
ثنائي          {ss << "signed";}
ثابتة           {ss << "static";}
تبديل           {ss << "switch";}
حاولي           {ss << "try";}
اتحاد           {ss << "union";}
متلاش             {ss << "volatile";}
حينما              |
عندما              {ss << "while";}
رئيسي       {ss << "main";}

محاذ        {ss << "alignof";}
أساس        {ss << "asm";}
ذاتي        {ss << "auto";}
بت_و        {ss << "bitand";}
أكسر        |
اكسر        {ss << "break";}
حالة        {ss << "case";}
ألقط        {ss << "catch";}
متمم        {ss << "compl";}
دائم        {ss << "const";}
أوـح        |
أو_ح        |
اوـح        |
او_ح        {ss << "xor";}
أكمل        {ss << "continue";}
اشطب        {ss << "delete";}
افعل        {ss << "do";}
محدد        {ss << "explicit";}
أخير        {ss << "final";}
صديق        {ss << "friend";}
صحيص        {ss << "int";}
كبير        {ss << "long";}
نطاق        {ss << "namespace";}
جديد        {ss << "new";}
صفري        {ss << "NULL";}
عامل        {ss << "operator";}
اسبق        {ss << "override";}
محمي        {ss << "protected";}
علني        {ss << "public";}
صغير        {ss << "short";}
ثابت            {ss << "static";}
بنية           {ss << "struct";}
قالب           {ss << "template";}
أرمي            |
ارمي            {ss << "throw";}
صواب            {ss << "true";}
حاول            {ss << "try";}
مطلق             {ss << "unsigned";}
غائب             {ss << "void";}


بول         {ss << "bool";}
رمز         {ss << "char";}
صنف         {ss << "class";}
إلا            |
الا            {ss << "else";}
ضعف           {ss << "double";}
خطأ           {ss << "false";}
اذا           |
إذا           {ss << "if";}
نفي           {ss << "not";}
سري           {ss << "private";}
اعد            |
أعد            {ss << "return";}
حجم            {ss << "sizeof";}
هذا             |
هذه             {ss << "this";}
لما                {ss << "while";}


أو            |
او            {ss << "or";}
ضم            {ss << "inline";}


و           {ss << "and";}
ل             {ss << "for";}

[\]\[\{\}]    {ss << std::string(text());}

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
؛            {ss << ";";}
،            {ss << ",";}

"."+|","+    {ss << std::string(text());}
\p{IsArabicExtended-A}     {ss << *text();}
{LATIN}+      {ss << *text();}
[[ \t\n\v\f\r]      {ss << *text();}
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
