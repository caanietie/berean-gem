# frozen_string_literal: true

require_relative "test_helper"

class BereanTest < Test::Unit::TestCase
  setup do
    @valid_passage = [
      berean(:one), berean(:two),
      berean(:three), berean(:four),
      berean(:five), berean(:six)
    ]
  end

  test "first passage" do
    first_psg = ::Berean.first_passage
    assert_instance_of Berean, first_psg
    assert_equal first_psg.book, "Genesis"
    assert_equal first_psg.chapter, 1
    assert_equal first_psg.verse, 1
  end

  test "last passage" do
    last_psg = ::Berean.last_passage
    assert_instance_of Berean, last_psg
    assert_equal last_psg.book, "Revelation"
    assert_equal last_psg.chapter, 22
    assert_equal last_psg.verse, 21
  end

  test "should not be nil" do
    @valid_passage.each do |psg|
      assert_not_nil psg
    end
  end

  test "should respond to #book" do
    @valid_passage.each do |psg|
      assert_respond_to psg, :book
    end
  end

  test "should respond to #chapter" do
    @valid_passage.each do |psg|
      assert_respond_to psg, :chapter
    end
  end

  test "should respond to #verse" do
    @valid_passage.each do |psg|
      assert_respond_to psg, :verse
    end
  end

  test "should respond to #to_s" do
    @valid_passage.each do |psg|
      assert_respond_to psg, :to_s
    end
  end

  test "should respond to #to_h" do
    @valid_passage.each do |psg|
      assert_respond_to psg, :to_h
    end
  end

  test "should respond to #eql?" do
    @valid_passage.each do |psg|
      assert_respond_to psg, :eql?
    end
  end

  test "should respond to #next_verse" do
    @valid_passage.each do |psg|
      assert_respond_to psg, :next_verse
    end
  end

  test "should respond to #succ" do
    @valid_passage.each do |psg|
      assert_respond_to psg, :succ
    end
  end

  test "should respond to #next_chapter" do
    @valid_passage.each do |psg|
      assert_respond_to psg, :next_chapter
    end
  end

  test "should reespond to #previous_verse" do
    @valid_passage.each do |psg|
      assert_respond_to psg, :previous_verse
    end
  end

  test "should respond to #pred" do
    @valid_passage.each do |psg|
      assert_respond_to psg, :pred
    end
  end

  test "should respond to #previous_chapter" do
    @valid_passage.each do |psg|
      assert_respond_to psg, :previous_chapter
    end
  end

  teardown do
    @valid_passage = nil
  end
end