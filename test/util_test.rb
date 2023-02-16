# frozen_string_literal: true

require_relative "test_helper"

class UtilTest < Test::Unit::TestCase
  test "num_books" do
    assert_equal ::Berean.num_books, 66
  end

  test "num_chapters for book" do
    [["Genesis", 50], ["Revelation", 22]].each do |book, chap|
      assert_equal ::Berean.num_chapters(book), chap
    end
  end

  test "num_verses for chapter in a given book" do
    [["Genesis", 1, 31], ["Revelation", 22, 21]].each do |book, chap, ver|
      assert_equal ::Berean.num_verses(book, chap), ver
    end
  end

  test "next_book given current book" do
    [["Genesis", "Exodus"], ["Matthew", "Mark"]].each do |curr, nxt|
      assert_equal ::Berean.next_book(curr), nxt
    end
  end

  test "previous_book given current book" do
    [["Genesis", "Exodus"], ["Matthew", "Mark"]].each do |prev, curr|
      assert_equal ::Berean.previous_book(curr), prev
    end
  end

  test "norm_book given a short book name" do
    [["Genesis", "gen"], ["Matthew", "Mat"]].each do |norm, short|
      assert_equal ::Berean.norm_book(short), norm
    end
  end

  test "passage_exist? for book, chapter, and verse" do
    [["Gene", 1, 1], ["rev", 22, 21]].each do |book, chap, ver|
      assert ::Berean.passage_exist? book, chap, ver
    end
  end

  test "random_verse for book and chapter not nil" do
    [["Est", 5], ["titus", 2]].each do |book, chap|
      res = ::Berean.random_verse(book, chap)
      assert_instance_of Array, res
      assert_equal res.length, 3
      assert res.none?{ |e| e.nil? }
      assert_instance_of String, res[0]
      assert res[1..].all?{ |k| k.instance_of? Integer }
    end
  end

  test "random_verse for book" do
    ["exod", "psal", "luke", "Heb"].each do |book|
      res = ::Berean.random_verse(book, nil)
      assert_instance_of Array, res
      assert_equal res.length, 3
      assert res.none?{ |e| e.nil? }
      assert_instance_of String, res[0]
      assert res[1..].all?{ |k| k.instance_of? Integer }
    end
  end

  test "random_verse without book and chapter" do
    5.times do
      res = ::Berean.random_verse(nil, nil)
      assert_instance_of Array, res
      assert_equal res.length, 3
      assert res.none?{ |e| e.nil? }
      assert_instance_of String, res[0]
      assert res[1..].all?{ |k| k.instance_of? Integer }
    end
  end
end