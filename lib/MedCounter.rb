# frozen_string_literal: true

require_relative "MedCounter/version"

module MedCounter
  class Error < StandardError; end

  class CountMedication
    def self.context
      puts "This is a medication prompter for letting you know what day to take your meds."
    end
    
    def self.medicate
      monday_meds    = File.read("data/medication/monday_meds.txt").strip
      tuesday_meds   = File.read("data/medication/tuesday_meds.txt").strip
      wednesday_meds = File.read("data/medication/wednesday_meds.txt").strip
      thursday_meds  = File.read("data/medication/thursday_meds.txt").strip
      friday_meds    = File.read("data/medication/friday_meds.txt").strip
      saturday_meds  = File.read("data/medication/saturday_meds.txt").strip
      sunday_meds    = File.read("data/medication/sunday_meds.txt").strip

      system("date > data/time/date.txt")

      data = File.read("data/time/date.txt").split(" ")

      current_day = "#{data[0]}"

      print "BIANCA >> You need to take #{current_day}'s medication. "

      if    current_day == "Mon"; puts "Take: #{monday_meds}."
      elsif current_day == "Tue"; puts "Take: #{tuesday_meds}."
      elsif current_day == "Wed"; puts "Take: #{wednesday_meds}."
      elsif current_day == "Thu"; puts "Take: #{thursday_meds}."
      elsif current_day == "Fri"; puts "Take: #{friday_meds}."
      elsif current_day == "Sat"; puts "Take: #{saturday_meds}."
      elsif current_day == "Sun"; puts "Take: #{sunday_meds}."
      end

      sleep(1.5)
    end
  end
end
