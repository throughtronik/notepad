class Memo < Post
  def load_data(data_hash)
    super(data_hash)

    @text = data_hash['text'].split('\n\r')
  end

  def read_from_console
    puts 'Новая заметка (все, что запишите до строки "end"):'

    @text = []
    line = nil

    while line != 'end'
      line = STDIN.gets.chomp
      @text << line
    end

    @text.pop
  end

  def to_db_hash
    super.merge(
      {
        'text' => @text.join('\n\r')
      }
    )
  end

  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')} \n\r "

    @text.unshift(time_string)
  end
end
