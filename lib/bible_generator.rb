module BibleGenerator
  def self.content
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

  def self.run! version_name
  end
end
