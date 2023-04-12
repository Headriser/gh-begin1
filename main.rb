require 'telegram/bot'

TOKEN = ''
//тут в кавычках вводится токен/

Z = 1000
GHOUL = Array.new

OTVETIXD = ['доволен?',
'вот такой анекдот получился',
'ахахахаххах',
'не очень смешной, но покатит']

VID = ['videos/vid1.mp4', 'videos/vid2.mp4', 'videos/vid3.mp4','videos/vid4.mp4','videos/vid5.mp4','videos/vid6.mp4']

PHOT = ['photos/pho1.jpg', 'photos/pho2.jpg', 'photos/pho3.jpg','photos/pho4.jpg','photos/pho5.jpg','photos/pho6.jpg','photos/pho7.jpg',
        'photos/pho8.jpg','photos/pho9.jpg','photos/pho10.jpg']

ELX = ['ладно', 'не понял', 'что?', 'ок']


Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    case message.text

    when '!штирлиц'
      RND = rand(1..5)
      File.open("STIRLIZ.txt", "r") do |file|
        LINES = file.readlines()[RND]
      end
      bot.api.send_message(
        chat_id: message.chat.id,
        text: LINES
      )
      question = OTVETIXD.sample
      answers =
          Telegram::Bot::Types::ReplyKeyboardMarkup
              .new(keyboard: [%w(!штирлиц !пупа), %w(!рандомный 1000-7), %w(photo video)], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)

    when '!пупа'
      RND = rand(1..6)
      File.open("PUPA.txt", "r") do |file1|
        LINES1 = file1.readlines()[RND]
      end
      bot.api.send_message(
        chat_id: message.chat.id,
        text: LINES1
      )
      question = OTVETIXD.sample
      answers =
          Telegram::Bot::Types::ReplyKeyboardMarkup
              .new(keyboard: [%w(!штирлиц !пупа), %w(!рандомный 1000-7), %w(photo video)], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)

    when '!рандомный'
      RND = rand(1..7)
      File.open("Anekdoti.txt", "r") do |file2|
        LINES2 = file2.readlines()[RND]
      end
      bot.api.send_message(
        chat_id: message.chat.id,
        text: LINES2
      )
      question = OTVETIXD.sample
      answers =
          Telegram::Bot::Types::ReplyKeyboardMarkup
              .new(keyboard: [%w(!штирлиц !пупа), %w(!рандомный 1000-7), %w(photo video)], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)

    when '1000-7'
      while Z > -2
        GHOUL.push(Z)
        Z = Z - 7
      end
      bot.api.send_message(
          chat_id: message.chat.id,
        text: GHOUL)
      question = "доволен?"
      answers =
          Telegram::Bot::Types::ReplyKeyboardMarkup
              .new(keyboard: [%w(!штирлиц !пупа), %w(!рандомный 1000-7), %w(photo video)], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)

      when '!xdd'
      loop do
      bot.api.send_message(
          chat_id: message.chat.id,
          text: "hui!")
      end

    when 'photo'
      bot.api.send_photo(chat_id: message.chat.id,
         photo: Faraday::UploadIO.new(PHOT.sample, 'image/jpeg')
      )
      question = "скинул фоточку"
      answers =
          Telegram::Bot::Types::ReplyKeyboardMarkup
              .new(keyboard: [%w(!штирлиц !пупа), %w(!рандомный 1000-7), %w(photo video)], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)

    when '/start'
      question = "ну здарова #{message.from.first_name}"
      answers =
          Telegram::Bot::Types::ReplyKeyboardMarkup
              .new(keyboard: [%w(!штирлиц !пупа), %w(!рандомный 1000-7), %w(photo video)], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)

    when '/stop'
      kb = Telegram::Bot::Types::ReplyKeyboardRemove.new(remove_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: 'бб чел', reply_markup: kb)

    when 'video'
      bot.api.send_video(chat_id: message.chat.id,
         video: Faraday::UploadIO.new( VID.sample, 'video/mp4')
      )
      question = "ахахахахаххаххах"
      answers =
          Telegram::Bot::Types::ReplyKeyboardMarkup
              .new(keyboard: [%w(!штирлиц !пупа), %w(!рандомный 1000-7), %w(photo video)], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)


    else
      question = ELX.sample
      answers =
          Telegram::Bot::Types::ReplyKeyboardMarkup
              .new(keyboard: [%w(!штирлиц !пупа), %w(!рандомный 1000-7), %w(photo video)], one_time_keyboard: true)
      bot.api.send_message(chat_id: message.chat.id, text: question, reply_markup: answers)
    end
  end
end