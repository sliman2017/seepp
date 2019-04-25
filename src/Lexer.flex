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
ARABIC         [\u{0621}-\u{063A}\u{0640}-\u{064A}_]+
%%
أو_ح_تحديث/{ARABIC}             |
أوـح_تحديث/{ARABIC}             |
جمع_م_تحديث/{ARABIC}            {ss << L"xor_eq";}
أوـح/{ARABIC}                   |
او_ح/{ARABIC}                   |
جمع_م/{ARABIC}                  {ss << L"xor";}
لا_استثناء/{ARABIC}           |
لا_إستثناء/{ARABIC}           {ss << L"noexcept";}
محاذيا_ك/{ARABIC}       {ss << L"alignas";}
حاذه/{ARABIC}           {ss << L"alignof";}
و_تحدث/{ARABIC}          |
ضرب_تحديث/{ARABIC}        {ss << L"and_eq";}
تجميع/{ARABIC}           {ss << L"asm";}
ذاتي/{ARABIC}             |
تلقائ/{ARABIC}            {ss << L"auto";}
بت_و/{ARABIC}             |
ضرب_بت/{ARABIC}           {ss << L"bitand";}

بت_او/{ARABIC}            |
بت_أو/{ARABIC}            |
جمع_بت/{ARABIC}           {ss << L"bitor";}
بوليا/{ARABIC}            {ss << L"bool";}
بول/{ARABIC}              |
انكسار/{ARABIC}           |
إنكسار/{ARABIC}           {ss << L"break";}
حالة/{ARABIC}             {ss << L"case";}
ألقط/{ARABIC}             |
القط/{ARABIC}             {ss << L"catch";}
رمز_ع_ن/{ARABIC}                |
رمزـعـن/{ARABIC}                {ss << L"wchar_t";}
رمز/{ARABIC}              {ss << L"char";}
رمز١٦_ن/{ARABIC}          |
رمز١٦ـن/{ARABIC}          |
رمز16_ن/{ARABIC}          |
رمز16ـن/{ARABIC}          {ss << L"char16_t";}
رمز٣٢_ن/{ARABIC}          |
رمز٣٢ـن/{ARABIC}          |
رمز32_ن/{ARABIC}          |
رمز32ـن/{ARABIC}          {ss << L"char32_t";}
صنف/{ARABIC}              {ss << L"class";}
متمم/{ARABIC}             {ss << L"coml";}
ثابت/{ARABIC}             {ss << L"const";}
عبارة_ثابتة/{ARABIC}      {ss << L"constexpr";}
تحويل_الثابت/{ARABIC}       {ss << L"const_cast";}
استمر/{ARABIC}            {ss << L"continue";}
أعلن_نوع/{ARABIC}         |
اعلن_نوع/{ARABIC}          {ss << L"decltype";}
مبدئي/{ARABIC}             {ss << L"default";}
حذث/{ARABIC}               {ss << L"delete";}
افعل/{ARABIC}              {ss << L"do";}
مزدوج/{ARABIC}             {ss << L"double";}
تحويل_ديناميكي/{ARABIC}    {ss << L"dynamic_cast";}
إلا/{ARABIC}                 |
الا/{ARABIC}                 {ss << L"else";}
عد/{ARABIC}                 {ss << L"enum";}
محدد/{ARABIC}               {ss << L"explicit";}
خارجي/{ARABIC}              {ss << L"extern";}
خطأ/{ARABIC}                {ss << L"false";}
نهائي/{ARABIC}              {ss << L"final";}
متحرك/{ARABIC}              {ss << L"float";}
ل/{ARABIC}                   {ss << L"for";}
صديق/{ARABIC}               {ss << L"friend";}
اذهب_الى/{ARABIC}           |
اذهب_إلى/{ARABIC}           |
إذهب_إلى/{ARABIC}           |
إذهب_الى/{ARABIC}           {ss << L"goto";}
اذا/{ARABIC}                |
إذا/{ARABIC}                {ss << L"if";}
ضم/{ARABIC}                 {ss << L"inline";}
صحيح/{ARABIC}               {ss << L"int";}
طويل/{ARABIC}               {ss << L"long";}
متغير/{ARABIC}              {ss << L"mutable";}
نطاق/{ARABIC}               {ss << L"namespace";}
جديد/{ARABIC}               {ss << L"new";}
نفي_تحديث/{ARABIC}          {ss << L"not_eq";}

نفي/{ARABIC}                {ss << L"not";}
مؤشر_صفري/{ARABIC}          {ss << L"nullptr";}
صفري/{ARABIC}               {ss << L"NULL";}
عامل/{ARABIC}                {ss << L"opterator";}

او_تحديث/{ARABIC}             |
أو_تحديث/{ARABIC}             |
جمع_تحديث/{ARABIC}            {ss << L"or_eq";}
أو/{ARABIC}                   |
او/{ARABIC}                   |
جمع/{ARABIC}                  {ss << L"or";}
تجاوز/{ARABIC}                {ss << L"override";}
خاص/{ARABIC}                  {ss << L"private";}
محمي/{ARABIC}                 {ss << L"protected";}
عمومي/{ARABIC}                {ss << L"public";}
تحويل_المؤشر/{ARABIC}         {ss << L"reinterpret_cast";}
أعد/{ARABIC}                   |
اعد/{ARABIC}                   |
عودة/{ARABIC}                  {ss << L"return";}
قصير/{ARABIC}                  {ss << L"short";}
ذو_اشارة/{ARABIC}              |
ذو_إشارة/{ARABIC}              {ss << L"signed";}
حجم/{ARABIC}                    {ss << L"sizeof";}
استاتيكي/{ARABIC}              {ss << L"static";}
تأكيد_ثابت/{ARABIC}            {ss << L"static_assert";}
تحويل_ثابت/{ARABIC}            {ss << L"static_cast";}
بنية/{ARABIC}                   {ss << L"struct";}
تبديل/{ARABIC}                  {ss << L"switch";}
قالب/{ARABIC}                   {ss << L"template";}
هذا/{ARABIC}                    |
هذه/{ARABIC}                    {ss << L"this";}
خيط_محلي/{ARABIC}               {ss << L"thread_local";}
أرمي/{ARABIC}                   |
ارمي/{ARABIC}                   {ss << L"throw";}
صواب/{ARABIC}                   {ss << L"true";}
حاول/{ARABIC}                   {ss << L"try";}
تحديد_نوع/{ARABIC}              {ss << L"typedef";}
تعريف_نوع/{ARABIC}              {ss << L"typeid";}
اسم_نوع/{ARABIC}                {ss << L"typename";}
اتحاد/{ARABIC}                  {ss << L"union";}
مطلق/{ARABIC}                   {ss << L"unsigned";}
استعمال/{ARABIC}                {ss << L"using";}
افتراض/{ARABIC}                 {ss << L"virtual";}
غائب/{ARABIC}                    {ss << L"void";}
متلاش/{ARABIC}                   {ss << L"volatile";}

في_أثناء/{ARABIC}               |
في_اثناء/{ARABIC}               |
عندما/{ARABIC}                  {ss << L"while";}


و/{ARABIC}               {ss << L"and";}
ضرب/{ARABIC}             {ss << L"and";}

[_{ARABIC}][_{ARABIC}]*     {/* identifier */ ss << wstr();}


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
