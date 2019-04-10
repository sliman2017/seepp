%option unicode

%top{
  #include <iostream>
  #include <sstream>
  #include <fstream>

std::wstringstream ss;

%}

LETTERS        [\xd8a1-\xd98a\xd991]
DIAC           [\xd98b-\xd990\xd992\xd993]
LATIN          [a-zA-Z0-9]
ZERO           ٠
%%

تحويل_ديناميكي  {ss << L"dynamic_cast";}

بارة_ثابتة   {ss << L"constexpr";}
طغى_التحويل   {ss << L"reinterpret_cast";}

تحويل_دائم    {ss << L"const_cast";}
لا_استثناء     {ss << L"noexcept";}
تأكيد_ثابت     {ss << L"static_assert";}
تحويل_ثابت     {ss << L"static_cast";}

مؤشر_صفري     {ss << L"nullptr";}

أو_ح_حدث      |
أوـح_حدث      |
او_ح_حدث      |
اوـح_حدث      {ss << L"xor_eq";}
أعلن_نوع      {ss << L"decltype";}
اذهب_الى      {ss << L"goto";}
خيط_محلي        {ss << L"thread_local";}


رمز١٦_ن     |
رمز١٦ـن     |
رمز16_ن     |
رمز16ـن     {ss << L"char16_t";}
رمز٣٢_ن     |
رمز٣٢ـن     |
رمز32_ن     |
رمز32ـن     {ss << L"char32_t";}
نفي_حدث     {ss << L"not_eq";}
حدد_نوع         {ss << L"typedef";}
عرف_نوع         {ss << L"typeid";}
اسم_نوع         {ss << L"typename";}
استعمال         {ss << L"using";}
افتراضي          {ss << L"virtual";}
رمز_ع_ن           |
رمزـعـن           {ss << L"wchar_t";}

حاذى_ك      {ss << L"alignas";}
أو_حدث      |
او_حدث      {ss << L"or_eq";}

و_حدث       {ss << L"and_eq";}
بت_او       |
بت_أو       {ss << L"bitor";}
اكسري       |
أكسري       {ss << L"break";}
مبدئي       {ss << L"default";}
أشطبي       {ss << L"delete";}
تعداد       {ss << L"enum";}
خارجي       {ss << L"extern";}
أخيرة       {ss << L"final";}
متحرك       {ss << L"float";}
صديقة       {ss << L"friend";}
متغير       {ss << L"mutable";}
جديدة       {ss << L"new";}
محمية       {ss << L"protected";}
ثنائي          {ss << L"signed";}
ثابتة           {ss << L"static";}
تبديل           {ss << L"switch";}
حاولي           {ss << L"try";}
اتحاد           {ss << L"union";}
متلاش             {ss << L"volatile";}
حينما              |
عندما              {ss << L"while";}
رئيسي       {ss << L"main";}
ألتقط       {ss << L"catch";}


محاذ        {ss << L"alignof";}
أساس        {ss << L"asm";}
ذاتي        {ss << L"auto";}
بت_و        {ss << L"bitand";}
أكسر        |
اكسر        {ss << L"break";}
حالة        {ss << L"case";}
متمم        {ss << L"compl";}
دائم        {ss << L"const";}
أوـح        |
أو_ح        |
اوـح        |
او_ح        {ss << L"xor";}
أكمل        {ss << L"continue";}
اشطب        {ss << L"delete";}
افعل        {ss << L"do";}
محدد        {ss << L"explicit";}
أخير        {ss << L"final";}
صديق        {ss << L"friend";}
صحيح        {ss << L"int";}
كبير        {ss << L"long";}
نطاق        {ss << L"namespace";}
جديد        {ss << L"new";}
صفري        {ss << L"NULL";}
عامل        {ss << L"operator";}
اسبق        {ss << L"override";}
محمي        {ss << L"protected";}
علني        {ss << L"public";}
صغير        {ss << L"short";}
ثابت            {ss << L"static";}
بنية           {ss << L"struct";}
قالب           {ss << L"template";}
أرمي            |
ارمي            {ss << L"throw";}
صواب            {ss << L"true";}
حاول            {ss << L"try";}
مطلق             {ss << L"unsigned";}
غائب             {ss << L"void";}


بول         {ss << L"bool";}
رمز         {ss << L"char";}
صنف         {ss << L"class";}
إلا            |
الا            {ss << L"else";}
ضعف           {ss << L"double";}
خطأ           {ss << L"false";}
اذا           |
إذا           {ss << L"if";}
نفي           {ss << L"not";}
سري           {ss << L"private";}
اعد            |
أعد            {ss << L"return";}
حجم            {ss << L"sizeof";}
هذا             |
هذه             {ss << L"this";}
لما                {ss << L"while";}


أو            |
او            {ss << L"or";}
ضم            {ss << L"inline";}


و           {ss << L"and";}
ل             {ss << L"for";}

[\]\[\{\}]    {ss << wstr();}

٠           {ss << L"0";}
١           {ss << L"1";}
٢           {ss << L"2";}
٣           {ss << L"3";}
٤           {ss << L"4";}
٥           {ss << L"5";}
٦           {ss << L"6";}
٧           {ss << L"7";}
٨           {ss << L"8";}
٩           {ss << L"9";}
؛           {ss << L";";}
،           {ss << L",";}

"."+          |
","+          {ss << wstr();}
[\p{IsArabic}_]+     {ss << wstr();}
{LATIN}+      {ss << wstr();}
[[ \t\n\v\f\r]      {ss << wstr();}
[|\\/'"!#~<>?@:;-_+=()*&^%.,]   {ss << wstr();}
.                   {ss << wstr();}

%%

int main(int argc, char **argv)
{
  FILE *fd = stdin;
  if (argc > 1 && (fd = fopen(argv[1], "r")) == NULL)
    exit(EXIT_FAILURE);
  std::locale::global(std::locale(""));
  std::wofstream of;
  Lexer(fd).lex();
  std::wstring wstr = ss.str();
  std::wcout << wstr;
  of.open("output.txt",std::ios::out|std::ios::trunc|std::ios::binary);
  of << wstr;
  of.close();
  return 0;
}
