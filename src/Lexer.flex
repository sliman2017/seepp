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
حاذى_ك      {ss << "alignas";}
محاذ        {ss << "alignof";}
و           {ss << "and";}
و_حدث       {ss << "and_eq";}
أساس        {ss << "asm";}
ذاتي        {ss << "auto";}
بت_و        {ss << "bitand";}
بت_او       |
بت_أو       {ss << "bitor";}
بول         {ss << "bool";}
أكسر        |
اكسر        |
اكسري       |
أكسري       {ss << "break";}
حالة        {ss << "case";}
ألقط        {ss << "catch";}
رمز         {ss << "char";}
رمز١٦_ن     |
رمز١٦ـن     |
رمز16_ن     |
رمز16ـن     {ss << "char16_t";}
رمز٣٢_ن     |
رمز٣٢ـن     |
رمز32_ن     |
رمز32ـن     {ss << "char32_t";}
صنف         {ss << "class";}
متمم        {ss << "compl";}
دائم          {ss << "const";}
عبارة_ثابتت   {ss << "constexpr";}
تحويل_دائم    {ss << "const_cast";}
أكمل          {ss << "continue";}
أعلن_نوع      {ss << "decltype";}
مبدئي         {ss << "default";}
اشطب          |
أشطب          {ss << "delete";}
افعل          {ss << "do";}
ضعف           {ss << "double";}
إلا            |
الا            {ss << "else";}
تعداد         {ss << "enum";}
محدد          {ss << "explicit";}
أصدر          {;}
خارجي         {ss << "extern";}
خطأ           {ss << "false";}
أخير          |
أخيرة         {ss << "final";}
متحرك         {ss << "float";}
ل             {ss << "for";}
صديق          |
صديقة         {ss << "friend";}
اذهب_الى      {ss << "goto";}
اذا           |
إذا           {ss << "if";}
ضم            {ss << "inline";}
صحيص          {ss << "int";}
كبير          {ss << "long";}
متغير         {ss << "mutable";}
نطاق          {ss << "namespace";}
جديدة         |
جديد          {ss << "new";}
لا_استثناء     {ss << "noexcept";}
نفي           {ss << "not";}
نفي_حدث       {ss << "not_eq";}
مؤشر_صفري     {ss << "nullptr";}
صفري          {ss << "NULL";}
عامل          {ss << "operator";}
أو            |
او            {ss << "or";}
أو_حدث        |
او_حدث        {ss << "or_eq";}
اسبق          {ss << "override";}
سري           |
سرّي           {ss << "private";}
محمي          |
محمية         {ss << "protected";}
علني          {ss << "public";}
طغى_التحويل   {ss << "reinterpret_cast";}
اعد            |
أعد            {ss << "return";}
صغير            {ss << "short";}
ثنائي          {ss << "signed";}
حجم            {ss << "sizeof";}
ثابت            |
ثابتة           {ss << "static";}
تأكيد_ثابت     {ss << "static_assert";}
تحويل_ثابت     {ss << "static_cast";}
بنية           {ss << "struct";}
تبديل           {ss << "switch";}
قالب           {ss << "template";}
هذا             |
هذه             {ss << "this";}
خيط_محلي        {ss << "thread_local";}
أرمي            |
ارمي            {ss << "throw";}
صواب            {ss << "true";}
حاول            |
حاولي           {ss << "try";}
حدد_نوع         {ss << "typedef";}
عرف_نوع         |
عرّف_نوع         {ss << "typeid";}
اسم_نوع         {ss << "typename";}
اتحاد           {ss << "union";}
مطلق             {ss << "unsigned";}
استعمال         {ss << "using";}
افتراضي          {ss << "virtual";}
غائب             {ss << "void";}
متلاش             {ss << "volatile";}
رمز_ع_ن           |
رمزـعـن           {ss << "wchar_t";}
حينما              |
عندما              |
لما                {ss << "while";}
أوـح              |
أو_ح              |
اوـح              |
او_ح              {ss << "xor";}
أو_ح_حدث          |
أوـح_حدث          |
او_ح_حدث          |
اوـح_حدث          {ss << "xor_eq";}
رئيسي       {ss << "main";}
؛            {ss << ";";}
،            {ss << ",";}
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
