module Spammable
  MAX_SPAM_COUNTS = 3

  def flag_as_spam
    update(spam_counter: spam_counter + 1)
    if spam_counter >= MAX_SPAM_COUNTS
      update(spam: true)
    end
  end
end
