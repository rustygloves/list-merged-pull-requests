#!/usr/bin/env ruby
# frozen_string_literal: true

require 'octokit'

if ARGV.length < 4
  puts 'Error: Too few arguments'
  puts "Usage: #{__FILE__} repository number token message"
  puts "e.g., #{__FILE__} tiwanari/list-merged-pull-requests 44 *** \"hello\""
  exit 1
end

args = ARGV.map(&:strip)
repository = args[0]
number = args[1].to_i  # Convert the number to integer
token = args[2]
message = args[3]

if message.empty?
  puts 'Error: Message cannot be empty'
  exit 1
end

GITHUB = Octokit::Client.new(access_token: token)
GITHUB.update_pull_request(repository, number, body: message)
