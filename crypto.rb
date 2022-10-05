module Morse_hash_with_blank_space
    def morse_hash 
        @morse_hash = {
            "a" => ".- ",
            "b" => "-... ",
            "c" => "-.-. ",
            "d" => "-.. ",
            "e" => ". ",
            "f" => "..-. ",
            "g" => "--. ",
            "h" => ".... ",
            "i" => ".. ",
            "j" => ".--- ",
            "k" => "-.- ",
            "l" => ".-.. ",
            "m" => "-- ",
            "n" => "-. ",
            "o" => "--- ",
            "p" => ".--. ",
            "q" => "--.- ",
            "r" => ".-. ",
            "s" => "... ",
            "t" => "- ",
            "u" => "..- ",
            "v" => "...- ",
            "w" => ".-- ",
            "x" => "-..- ",
            "y" => "-.-- ",
            "z" => "--.. ",
            " " => " ",
            "1" => ".---- ",
            "2" => "..--- ",
            "3" => "...-- ",
            "4" => "....- ",
            "5" => "..... ",
            "6" => "-.... ",
            "7" => "--... ",
            "8" => "---.. ",
            "9" => "----. ",
            "0" => "----- "
          }
    end
end

module Morse_hash 
    def morse_hash 
        @morse_hash = {
            "a" => ".-",
            "b" => "-...",
            "c" => "-.-.",
            "d" => "-..",
            "e" => ".",
            "f" => "..-.",
            "g" => "--.",
            "h" => "....",
            "i" => "..",
            "j" => ".---",
            "k" => "-.-",
            "l" => ".-..",
            "m" => "--",
            "n" => "-.",
            "o" => "---",
            "p" => ".--.",
            "q" => "--.-",
            "r" => ".-.",
            "s" => "...",
            "t" => "-",
            "u" => "..-",
            "v" => "...-",
            "w" => ".--",
            "x" => "-..-",
            "y" => "-.--",
            "z" => "--..",
            " " => " ",
            "1" => ".----",
            "2" => "..---",
            "3" => "...--",
            "4" => "....-",
            "5" => ".....",
            "6" => "-....",
            "7" => "--...",
            "8" => "---..",
            "9" => "----.",
            "0" => "-----"
          }
    end
end

class Cryptography
    include Morse_hash_with_blank_space
    def morse_encrypting(msg)
        sliced_msg = msg.chars
        encrypted_morse_msg = []
        for letter in sliced_msg do
            morse_letter = morse_hash[letter]
            encrypted_morse_msg << morse_letter 
        end
        puts %Q(A sua mensagem criptografada é: #{encrypted_morse_msg.join})

    end
end

class Decryption
    include Morse_hash
    def morse_decrypting(msg)
        sliced_msg = msg.split(" ")
        decrypted_morse_msg = []
        for letter in sliced_msg do 
            inverted_morse_hash = morse_hash.invert
            morse_letter = inverted_morse_hash[letter]
            decrypted_morse_msg << morse_letter
        end 
        puts %Q(A sua mensagem descriptografada é: #{decrypted_morse_msg.join})
    end
end


puts %Q( \nOlá!. Você deseja criptografar ou descriptografar uma mensagem?.\n
1. Criptografar.
2. Descriptografar.)


print %Q(\nEu quero: )
choice = gets.chomp.to_i


case choice
    when 1 
        puts %Q(\nQual mensagem você gostaria de criptografar em código Morse?
        Por favor, não use acentos ou carácteres especiais.)
        print %Q(\nEu quero criptografar a mensagem: )
        msg = gets.downcase
        secret_msg = Cryptography.new
        secret_msg.morse_encrypting(msg)
else
    puts %Q(\n Qual mensagem você gostaria de descriptografar em código Morse?
    Por favor, delete as aspas caso sua mensagem esteja em formato de String.)
    print %Q(\n Eu quero descriptografar a mensagem: )
    msg = gets
    secret_msg = Decryption.new
    secret_msg.morse_decrypting(msg)
end
