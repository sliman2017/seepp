%option unicode

%top{
  #include <iostream>
  #include <sstream>
  #include <fstream>

std::wstringstream ss;

%}

ARABIC         [\xd8a1-\xd98a\xd991]
DIAC           [\xd98b-\xd990\xd992\xd993]
LATIN          [a-zA-Z0-9]
%%

[_{ARABIC}]{14,}    {/* identifier */ ss << wstr();}

تحويل_ديناميكي    {ss << L"dynamic_cast";}

[_{ARABIC}]{13,14}    {/* identifier */ ss << wstr();}

تحويل_المؤشر         {ss << L"reinterpret_cast";}
تحويل_الثابت       {ss << L"const_cast";}

[_{ARABIC}]{12}    {/* identifier */ ss << wstr();}

جمع_م_تحديث            {ss << L"xor_eq";}
عبارة_ثابتة           {ss << L"constexpr";}

[_{ARABIC}]{11}    {/* identifier */ ss << wstr();}

تحويل_ثابت            {ss << L"static_cast";}
تأكيد_ثابت            {ss << L"static_assert";}
أو_ح_تحديث             |
أوـح_تحديث             {ss << L"xor_eq";}
لا_استثناء              |
لا_إستثناء             {ss << L"noexcept";}

[_{ARABIC}]{10}    {/* identifier */ ss << wstr();}

تعريف_نوع              {ss << L"typeid";}
تحديد_نوع              {ss << L"typedef";}
جمع_تحديث            {ss << L"or_eq";}
مؤشر_صفري          {ss << L"nullptr";}
نفي_تحديث          {ss << L"not_eq";}
ضرب_تحديث        {ss << L"and_eq";}

[_{ARABIC}]{9}    {/* identifier */ ss << wstr();}

في_أثناء               |
في_اثناء               {ss << L"while";}
خيط_محلي               {ss << L"thread_local";}
استاتيكي              {ss << L"static";}
ذو_اشارة              |
ذو_إشارة              {ss << L"signed";}
او_تحديث             |
أو_تحديث             {ss << L"or_eq";}
اذهب_الى            |
اذهب_إلى            |
إذهب_إلى            |
إذهب_الى             {ss << L"goto";}
أعلن_نوع         |
اعلن_نوع          {ss << L"decltype";}
محاذيا_ك       {ss << L"alignas";}

[_{ARABIC}]{8}    {/* identifier */ ss << wstr();}

استعمال                {ss << L"using";}
اسم_نوع                {ss << L"typename";}
رمز٣٢_ن                  |
رمز٣٢ـن                  |
رمز32_ن                  |
رمز32ـن                  {ss << L"char32_t";}
رمز١٦_ن                 |
رمز١٦ـن                 |
رمز16_ن                 |
رمز16ـن                  {ss << L"char16_t";}
رمز_ع_ن                |
رمزـعـن                {ss << L"wchar_t";}

[_{ARABIC}]{7}    {/* identifier */ ss << wstr();}

افتراض                 {ss << L"virtual";}
انكسار                  |
إنكسار                  {ss << L"break";}
بوليان                  {ss << L"bool";}
جمع_بت                 {ss << L"bitor";}
و_تحدث                 {ss << L"and_eq";}
ضرب_بت                 {ss << L"bitand";}

[_{ARABIC}]{6}    {/* identifier */ ss << wstr();}

عندما                  {ss << L"while";}
متلاش                   {ss << L"volatile";}
اتحاد                  {ss << L"union";}
حاول                   {ss << L"try";}
قالب                   {ss << L"template";}
تبديل                  {ss << L"switch";}
عمومي                  {ss << L"public";}
تجاوز                  {ss << L"override";}
متغير                  {ss << L"mutable";}
نهائي                   {ss << L"final";}
متحرك                   {ss << L"float";}
خارجي                  {ss << L"extern";}
مزدوج                  {ss << L"double";}
مبدئي                  {ss << L"default";}
استمر                  {ss << L"continue";}
بت_او                   |
بت_أو                   {ss << L"bitor";}
جمع_م                  {ss << L"xor";}
تلقائ                 {ss << L"auto";}
تجميع                  {ss << L"asm";}

[_{ARABIC}]{5}    {/* identifier */ ss << wstr();}

أرمي                   |
ارمي                   {ss << L"throw";}
مطلق                   {ss << L"unsigned";}
أوـح                   |
او_ح                   {ss << L"xor";}
غائب                    {ss << L"void";}
صواب                   {ss << L"true";}
بنية                   {ss << L"struct";}
عودة                  {ss << L"return";}
قصير                  {ss << L"short";}
محمي                 {ss << L"protected";}
صفري                {ss << L"NULL";}
عامل                {ss << L"opterator";}
نطاق                {ss << L"namespace";}
جديد                {ss << L"new";}
صحيح                 {ss << L"int";}
طويل                {ss << L"long";}
صديق                {ss << L"friend";}
محدد                {ss << L"explicit";}
افعل                {ss << L"do";}
متمم                 {ss << L"coml";}
ثابت                 {ss << L"const";}
ألقط                 |
القط                 {ss << L"catch";}
حالة                {ss << L"case";}
حاذه                {ss << L"alignof";}
ذاتي                {ss << L"auto";}
بت_و                {ss << L"bitand";}

[_{ARABIC}]{4}    {/* identifier */ ss << wstr();}

ضرب                   {ss << L"and";}
هذا                    |
هذه                    {ss << L"this";}
حجم                    {ss << L"sizeof";}
أعد                   |
اعد                   {ss << L"return";}
خاص                  {ss << L"private";}
جمع                  {ss << L"or";}
نفي                 {ss << L"not";}
اذا                 |
إذا                 {ss << L"if";}
بول                 {ss << L"bool";}
خطأ                  {ss << L"false";}
إلا                   |
الا                  {ss << L"else";}
عد                  {ss << L"enum";}
حذث                 {ss << L"delete";}
رمز                 {ss << L"char";}
صنف                 {ss << L"class";}

[_{ARABIC}]{3}    {/* identifier */ ss << wstr();}

أو                   |
او                   {ss << L"or";}
ضم                   {ss << L"inline";}

[_{ARABIC}]{2}    {/* identifier */ ss << wstr();}

و                    {ss << L"and";}
ل                     {ss << L"for";}

[_{ARABIC}]          {/* identifier */ ss << wstr();}

؛                    {ss << L";";}
،                    {ss << L",";}
[|\\/'"!#~<>?@:;-_+=()*&^%.,]   {ss << wstr();}
{LATIN}+      {ss << wstr();}
[[ \t\n\v\f\r]      {ss << wstr();}

.                   {ss << wstr();}

%%

int main(int argc, char **argv)
{
  FILE *fd = stdin;
  if (argc > 1 && (fd = fopen(argv[1], "r")) == NULL)
    exit(EXIT_FAILURE);


  std::string fileName = argv[1];

  if(fileName.substr(fileName.find_last_of(".") + 1) != "spp") {
    std::cerr << "Invalid File Extention";
    exit(EXIT_FAILURE);
  }

  std::locale::global(std::locale(""));
  std::wofstream of;
  Lexer(fd).lex();
  std::wstring wstr = ss.str();

  std::size_t lastindex = fileName.find_last_of(".");
  std::string rawname = fileName.substr(0, lastindex);
  rawname += ".cpp";

  of.open(rawname ,std::ios::out|std::ios::trunc|std::ios::binary);
  of << wstr;
  of.close();
  return 0;
}
