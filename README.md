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
| alignas  | حاذى_ك  |
| alignof  | محاذ  |
| and  | و  |
| and_eq  | و_حدث  |
| asm  | أساس  |
| auto  | ذاتي  |
| bitand  | بت_و  |
| bitor  | بت_أو  |
| bool  | بول  |
| break  | أكسر , أكسري  |
| case  | حالة  |  
| catch  | ألقط  |
| char  | رمز  |
| char16_t  |  رمز١٦_ن , رمز١٦ـن , رمز16_ن , رمز16ـن |
| char32_t  |  رمز٣٢_ن , رمز٣٢ـن , رمز32_ن , رمز32ـن |
| class  | صنف  |
| coml  | متمم  |
| const  | دائم  |
| constexpr  | عبارة_ثابتة  |
| const_cast  | تحويل_ثابت  |
| continue  | أكمل  |
| decltype  | أعلن_نوع  |
| default  | مبدئي  |
| delete  | أشطب  |
| do  | افعل  |
| double  | ضعف  |  
| dynamic_cast  | تحويل_ديناميكي |
| else  |  إلا , الا  |
| enum  | تعداد  |
| explicit  | محدد  |
| extern  | خارجي  |
| false  | خطأ  |
| final  | أخير , أخيرة  |
| float  | متحرك  |
| for  | ل  |
| friend  | صديق , صديقة  |
| goto  | اذهب_الى  |
| if  | اذا , إذا  |
| inline  | ضم  |
| int  | صحيح  |  
| long  | كبير  |
| mutable  | متغير  |
| namespace  | نطاق  |
| new  | جديد , جديدة  |
| noexcept  | لا_استثناء  |
| not  | نفي  |
| not_eq  | نفي_حدث |
| nullptr  | مؤشر_صفري  |
| NULL | صفري |
| operator  | عامل  |
| or  | أو , او  |
| or_eq  | أو_حدث , او_حدث  |
| override  | اسبق  |
| private  | سري , سرّي |
| protected  | محمي , محمية  |  
| public  | علني  |
| reinterpret_cast  | طغى_التحويل  |
| return  | أعد , اعد  |
| short  | صغير  |  
| signed  | ثنائي  |
| sizeof  | حجم  |
| static  | ثابت , ثابتة  |
| static_assert  | تأكيد_ثابت  |
| static_cast  | تحويل_ثابت  |
| struct  | بنية  |
| switch  | تبديل  |
| template  | قالب  |
| this  | هذا , هذه  |
| thread_local  | خيط_محلي  |
| throw  | أرمي , ارمي  |
| true  | صواب  |
| try  | حاول , حاولي  |  
| typedef  | حدد_نوع  |
| typeid  | عرف_نوع , عرّف_نوع  |
| typename  | اسم_نوع  |
| union  | اتحاد |
| unsigned  | مطلق  |
| using  | استعمال  |
| virtual  | افتراضي  |
| void  | غائب  |
| volatile  | متلاش  |
| wchar_t  | رمز_ع_ن , رمزـعـن  |
| while  | أكسر , أكسري  |
| xor  | أوـح , أو_ح  |  
| xor_eq  | أو_ح_حدث ,  أوـح_حدث |

Eastern Arabic numerals will be supported soon. 

## Built With
* [RE-flex](https://github.com/Genivia/RE-flex) - For Lexer generation

## Contributing
If you are interesting in contributing, email me at ``` mashini.suleiman@gmail.com ```


## License
This project is licensed under the BSD-3 License - see the [LICENSE.md](LICENSE.md) file for details.
