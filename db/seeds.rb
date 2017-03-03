require('buzzfeed_title_generator')
require('httparty')

Comment.delete_all
Grumble.delete_all

names = %w(Jesse Adam Andy Robin Adrian Matt)

def advice
  JSON.parse(HTTParty.get("http://api.adviceslip.com/advice").body)["slip"]["advice"]
end

def photo
  JSON.parse(HTTParty.get("http://www.splashbase.co/api/v1/images/random?images_only=true").body)["url"]
end

def comment
  comments = [
    "That photo reminds me of the time I saw",
    "Your post would be better if it included",
    "There is no God. There is only",
    "I disagree. I'd encourage you to think more broadly of",
    "This just goes to show your ignorance about",
    "Who wrote this? It sounds like it was written by",
    "This is all well and good, but one mustn't forget about",
    "Hey, OP, people said the same thing when there was",
    "I'm not sure how to feel about this. My opinions are usually informed by",
    "I feel like a more appropriate picture for this post would be",
    "It seems like all you see on the news these days is",
    "Ugh. Modern society is so obsessed with",
    "I've responded to this in my post about",
    "Didn't you know? The government is secretly controlled by"
  ]
  message = HTTParty.get("http://www.ineedaprompt.com/api", verify: false).parsed_response["english"]
  puts message
  comments.sample + " " + message[0,1].downcase + message[1..-1]
end

names.each do |name|
  current_grumble = Grumble.create!(
    authorName: name,
    title: BuzzfeedTitleGenerator.make_title,
    content: advice,
    photoUrl: photo
  )
  (rand(4) + 2).times do
    current_grumble.comments.create!(authorName: names.sample, content: comment)
  end
end
