require "rails_helper"

RSpec.describe MatchMailerMailer, type: :mailer do
  describe '#match_email' do
    before do
      @match = create(:match)
    end

  end
end
