# encoding: utf-8
#
# Популярная детская игра
# https://ru.wikipedia.org/wiki/Виселица_(игра)

# Подключаем библиотеку Unicode_Utils
# для последующего приведения строк к
# нижнему регистру с помощью метода downcase
require "unicode_utils"

# Подключаем классы Game, ResultPrinter и WordReader
require_relative "lib/game"
require_relative "lib/result_printer"
require_relative "lib/word_reader"

puts "Игра виселица. Версия 3. (c) goodprogrammer.ru\n\n"
sleep 1

current_path = File.dirname(__FILE__)
printer = ResultPrinter.new(current_path)

# Создаем экземпляр класса Word который мы будет использовать для
# вывода информации на экран.
word_reader = WordReader.new

# Соберем путь к файлу со словами из пути к файлу, где лежит программа и
# относительно пути к файлу words.txt.
words_file_name = File.dirname(__FILE__) + "/data/words.txt"

# Условие в котором проверяем
# Если в качестве параметра при запуске программы ничего не было задано
if word_reader.read_from_args == nil
  # Создаем объект класса Game, вызывая конструктор и передавая ему слово, которое
  # вернет метод read_from_file экземпляра класса WordReader.
  game = Game.new(UnicodeUtils.downcase(word_reader.read_from_file(words_file_name)))
else
  # Если же параметр при запуске порграммы был задан
  # Создаем объект класса Game, вызывая конструктор и передавая ему слово, которое
  # вернет метод read_from_args экземпляра класса WordReader.
  game = Game.new(UnicodeUtils.downcase(word_reader.read_from_args))
end

while game.status == 0
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)
