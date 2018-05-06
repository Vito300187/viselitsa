# Метод проверки введенной буквы пользователем и проверка на пустой ввод
def get_letters
  slovo = ARGV[0]
  if slovo == nil || slovo == ""
    abort "Вы забыли ввести букву"
  end
  slovo.downcase.encode('UTF-8').split("")
end

# Метод ввода и возврата буквы, введенной пользователем
def get_user_input
  letter = ""
  while letter == "" do
    letter = STDIN.gets.encode("UTF-8").chomp
  end
  letter
end

# Метод проверки логики программы
def check_result(user_input, letters, good_letters, bad_letters)
  if good_letters.include?(user_input) || bad_letters.include?(user_input)
    return 0
  end
  if letters.include? user_input
    good_letters << user_input
    #Условие когда слово отгадано полностью
    if letters.uniq.size == good_letters.size
      1
    else
      0
    end
  else
    bad_letters << user_input
      -1
  end
end

# Метод проверки логики программы
def get_word_for_print(letters, good_letters)
  result = ""
  for item in letters do
    if good_letters.include?(item)
      result += item + " "
    else
      result += "__ "
    end
  end
  result
end

# Выводит загаданное слово, показ ошибок, названных букв и сообщение о поражении/выигрыше
def print_status(letters, good_letters,bad_letters, errors)
  puts "Слово:  #{get_word_for_print(letters, good_letters)}"
  puts "Ошибки (#{errors}): #{bad_letters.join(", ")}"

  if errors >= 7
    puts 'Вы проиграли'
  else
    if good_letters.uniq.sort == letters.uniq.sort
      puts "Поздравляем!"
    else
      puts "У Вас осталось" + (7-errors).to_s
    end
  end
end