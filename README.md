### "Игра Виселица"

Программа написана на языке 'ruby' 
Для того что бы запустить её вы должны установить интерпритатор 'ruby'
Суть игры состоит в том чтобы отгадать загадонное программой или другим пользователем слово

Инструкция запуска

- скачать программу из архива
- запустить в терминале из дериктории где находится скачанная программа командой
 
```
ruby viselitsa.rb
```
Далее Вы вводите буквы (без учета регистра) и отгадываете слово. У Вас будет всего 7 попыток.
После семи неправильно введенных букв программа выведет картинку повешенного человечка.

Программа берет загаданные слова из файла 'words.txt' 
При желании его можно дополнить новыми словами 

В программе есть возможность ввода слова в качестве атрибута. (регистр букв не учитывается)

```
ruby viselitsa.rb ванна
```
В таком случае будет загадано именно это слово 


Версию программы можно узнать командой

```
ruby viselitsa.rb -v
```