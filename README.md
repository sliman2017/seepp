# س++/see++ An Arabic pseudo-language
# س++ لغة برمجة عربية مستعارة
Is a pseudo-language syntactically identical to C++/11  based on Arabic script and language. The implenmentation relies on using the GNU compiler and directly lexically translates س++ source code to valid C++/11 code .

هي لغة مطابقة الى سسس كبنية على الأحرف و اللغة العربية.
## Motivation

### Why Develop an Arabic Programming Language?
The main motivation of this project is to provide support for Arabic speakers and encourage their involvement in the software development world. People should not be disadvantaged in computer science because of a different linguistic background. This project is an exploration of the practicality of using Arabic in a programming language.

### Why C++? Why not create your own language?
There are several motivations as to why I decided to use C++. C++ offers the ability to both use high level abstraction by using OOP, but also gives the programmer the ability to get their hands dirty and work on a low level.

Regardless of whether a language is elegant or not, a language's success depends on its adoption, usage and support. The GNU compiler has been in the works for years, and reinventing the wheel and creating dedicated support for the language would lessen its appeal and increase its logistical complexity (which I as a university student cannot work with at the time).

### Why is your README.md in English? (oh the irony)

My Arabic isn't that great, I'm will look for someone to help me in the translation of the README once I have a working implementation done.

## Implementation
All Arabic letters are encoded to English, while C++ allows for Arabic characters to be used in identifiers, forcing all characters to English will allow for less ambiguity, and allow for robustness.

## Valid Keywords
| C++11 Keyword  | س++ Equivalent(s) |
| ------------- | ------------- |
| alignas  | حاذى_ك  |
| alignof  | محاذ  |
| and  | و  |
| and_eq  | و_عدل  |
| asm  | أساس  |
| auto  | ذاتي  |
| bitand  | بت_و  |
| bitor  | بت_أو  |
| bool  | بول  |
| break  | أكسر , أكسري  |
| case  | حالة  |
| catch  | ألقط  |
| char  | رمز  |
| char16_t  | رمز١٦_ن  |
## Built With
* [Flex](https://github.com/westes/flex) - For Lexer generation

## Contributing
Not Yet Written

## Authors
Not Yet Written

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
