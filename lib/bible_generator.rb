module BibleGenerator
  def self.verses
    raw_data = {
      "resultset": {
        "row": [
          {"field": [1001001, 1, 1, 1, "In the beginning God created the heavens and the earth."]},
          {"field": [1001002, 1, 1, 2, "And the earth was waste and void; and darkness was upon the face of the deep: and the Spirit of God moved upon the face of the waters."]},
          {"field": [1001003, 1, 1, 3, "And God said, Let there be light: and there was light."]}
        ],
      }
    }

    raw_data[:resultset][:row]
  end

  def self.run!(name:, abbreviation:)
    ActiveRecord::Base.transaction do
      bible = Bible.create!(
        name: name,
        abbreviation: abbreviation
      )

      BibleGenerator.verses.each do |verse_object|
        verse          = verse_object[:field]
        book_position  = verse[1]
        chapter_number = verse[2]
        verse_number   = verse[3]
        content        = verse[4]

        book_name = BibleBook.name_from_position book_position

        book = BibleBook.find_or_create_by(name: book_name) do |bible_book|
          bible_book.position = book_position
          bible_book.bible    = bible
        end

        chapter = BibleChapter.find_or_create_by(chapter_number: chapter_number) do |bible_chapter|
          bible_chapter.bible_book = book
        end

        verse = BibleVerse.create!(
          bible_chapter: chapter,
          content: content,
          verse_number: verse_number
        )

        puts "Created: #{book.name} #{chapter.chapter_number}:#{verse.verse_number} - #{verse.content}"
      end
    rescue ActiveRecord::RecordInvalid => e
      puts "ERROR GENERATING BIBLE", e.inspect
    end
  end
end
