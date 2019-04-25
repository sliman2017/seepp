# س++/see++ An Arabic pseudo-language
# س++ لغة برمجة عربية مستعارة
Is a pseudo-language syntactically identical to C++/11  based on the Arabic script. The implenmentation relies on using the Clang compiler and directly lexically translates س++ source code to valid C++/11 code .

## Motivation

### Why Develop an Arabic Programming Language?
The main motivation of this project is to provide support for Arabic speakers and encourage their involvement in the software development world. People should not be disadvantaged in computer science because of a different linguistic background. This project is an exploration of the practicality of using Arabic in a programming language.

### Why C++? Why not create your own language?
There are several motivations as to why I decided to use C++. C++ offers the ability to both use high level abstraction e.g. OOP, but also gives the programmer the ability to get their hands dirty and work on a low level.

Regardless of whether a language is elegant or not, a language's success depends on its adoption, usage and support. The Clang compiler has been in the works for years, and reinventing the wheel and creating dedicated support for the language would lessen its appeal and increase its logistical complexity (which I as a university student cannot work with at the time).

### Why is your README.md in English? (oh the irony)

I will be posting the Arabic translations in a few days.

## Implementation
All Arabic letters are encoded to English, while C++ allows for Arabic characters to be used in identifiers, forcing all characters to English will allow for less ambiguity, and allow for robustness. Currently clang supports unicode identifiers, I will in the future add an option to encode Arabic identifiers to latin letters.

## Valid Keywords
| C++11 Keyword  | س++ Equivalent(s) |
| ------------- | ------------- |
| alignas  | محاذيا_ك  |
| alignof  | حاذه |
| and  |  و ، ضرب  |
| and_eq  | و_تحدث ، ضرب_تحديث |
| asm  | تجميع |
| auto  | ذاتي ، تلقائي |
| bitand  | بت_و ، ضرب_بت|
| bitor  | بت_او ، بت_أو ، جمع_بت|
| bool  | بول ، بوليان |
| break  | انكسار ، إنكسار |
| case  | حالة  |  
| catch  | ألقط ، القط  |
| char  | رمز |
| char16_t  |  رمز١٦_ن , رمز١٦ـن , رمز16_ن , رمز16ـن |
| char32_t  |  رمز٣٢_ن , رمز٣٢ـن , رمز32_ن , رمز32ـن |
| class  | صنف |
| coml  | متمم  |
| const  | ثابت |
| constexpr  | عبارة_ثابتة  |
| const_cast  | تحويل_ثابت  |
| continue  | استمر  |
| decltype  | أعلن_نوع ، اعلن_نوع |
| default  | مبدئي  |
| delete  | حذث |
| do  | افعل  |
| double  | مزدوج |  
| dynamic_cast  | تحويل_ديناميكي |
| else  |  إلا , الا  |
| enum  | عد |
| explicit  | محدد  |
| extern  | خارجي  |
| false  | خطأ  |
| final  | نهائي  |
| float  | متحرك  |
| for  | ل  |
| friend  | صديق |
| goto  | اذهب_الى ، اذهب_إلى ، إذهب_إلى ، إذهب_الى  |
| if  | اذا , إذا  |
| inline  | ضم  |
| int  | صحيح |  
| long  | طويل |
| mutable  | متغير  |
| namespace  | نطاق  |
| new  | جديد |
| noexcept  | لا_استثناء ، لا_إستثناء|
| not  | نفي  |
| not_eq  | نفي_تحديث |
| nullptr  | مؤشر_صفري  |
| NULL | صفري |
| operator  | عامل  |
| or  | أو , او ، جمع |
| or_eq  | او_تحديث ، أو_تحديث ، جمع_تحديث|
| override  | تجاوز |
| private  | خاص |
| protected  | محمي |  
| public  | عمومي |
| reinterpret_cast  | تحويل_المؤشر |
| return  | أعد , اعد ، عودة |
| short  | قصير |  
| signed  | ذو_اشارة ، ذو_إشارة  |
| sizeof  | حجم  |
| static  | استاتيكي|
| static_assert  | تأكيد_ثابت  |
| static_cast  | تحويل_ثابت  |
| struct  | بنية  |
| switch  | تبديل  |
| template  | قالب  |
| this  | هذا , هذه  |
| thread_local  | خيط_محلي  |
| throw  | أرمي , ارمي  |
| true  | صواب  |
| try  | حاول |  
| typedef  | تحديد_نوع  |
| typeid  | تعريف_نوع |
| typename  | اسم_نوع  |
| union  | اتحاد |
| unsigned  | مطلق  |
| using  | استعمال  |
| virtual  | افتراضي  |
| void  | غائب  |
| volatile  | متلاش  |
| wchar_t  | رمز_ع_ن , رمزـعـن  |
| while  | في_أثناء ، في_اثناء ، عندما |
| xor  | أوـح , او_ح ، جمع_م |  
| xor_eq  | أو_ح_تحديث ,  أوـح_تحديث ، جمع_م_تحديث|

Eastern Arabic numerals will be supported soon.

## How do I try seep?

All the filed needed are in the repository. To compile the lexer use the command:

```
clang ./src/reflex/output.o ./src/reflex/input.o ./src/reflex/pattern.o ./src/reflex/error.o lex.yy.cpp -o seep

```
And run the program with a file with extension .spp :

e.g:

```
./seep example.spp
```

and a file with the same file name with extension .cpp will be output.

## Built With
* [RE-flex](https://github.com/Genivia/RE-flex) - For Lexer generation


## Contributing
If you are interesting in contributing, email me at ``` mashini.suleiman@gmail.com ```

## Note
This is a very early version of the lexer, improvements will come and I will make installation and running more robust in the near future.

## License
This project is licensed under the BSD-3 License - see the [LICENSE.md](LICENSE.md) file for details.
