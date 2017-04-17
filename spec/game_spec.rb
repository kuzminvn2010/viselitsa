require 'rspec'
require_relative "../lib/game.rb"
require "unicode_utils"

describe Game do
  context "user simulation" do
    it 'user input good letters' do
      game = Game.new(UnicodeUtils.downcase("Конь"))
      game.next_step(UnicodeUtils.downcase("к"))
      game.next_step(UnicodeUtils.downcase("н"))
      game.next_step(UnicodeUtils.downcase("О"))
      game.next_step(UnicodeUtils.downcase("ь"))
      puts game.letters.to_s
      puts game.good_letters.to_s
      game.good_letters.should include(game.letters[0], game.letters[1], game.letters[2], game.letters[3])
      expect(game.status).to eq 1
      expect(game.errors).to eq 0
    end

    it 'user input one bad leters' do
      game = Game.new(UnicodeUtils.downcase("КиСа"))
      game.next_step(UnicodeUtils.downcase("к"))
      game.next_step(UnicodeUtils.downcase("с"))
      game.next_step(UnicodeUtils.downcase("а"))
      game.next_step(UnicodeUtils.downcase("ф"))
      puts game.letters.to_s
      puts game.good_letters.to_s
      game.good_letters.should_not include(game.letters[1])
      expect(game.status).to eq 0
      expect(game.errors).to eq 1
    end

    it 'user input all bad leters' do
      game = Game.new(UnicodeUtils.downcase("Танк"))
      game.next_step(UnicodeUtils.downcase("м"))
      game.next_step(UnicodeUtils.downcase("с"))
      game.next_step(UnicodeUtils.downcase("ж"))
      game.next_step(UnicodeUtils.downcase("ф"))
      puts game.letters.to_s
      puts game.good_letters.to_s
      game.good_letters.should_not include(game.letters)
      expect(game.status).to eq 0
      expect(game.errors).to eq 4
    end
  end
end
