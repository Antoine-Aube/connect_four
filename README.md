# **CONNECT FOUR - PAIR PROJECT - TURING - MOD1**
![funny image](https://i.kym-cdn.com/photos/images/original/001/335/681/bac.jpg)
## **Overview:**

This project explores creating a version of the classic game Connect Four as a CLI game within your computer terminal. A specific requirement of this project was to develop all code given only written instruction without code prompts from an interaction pattern. As a pair, our team was able to design architecture for this application and implement that design in our codebase to create a functioning and interactive game. The project explores the concept of abstraction in OOP through creation of complex, logic based methods that are applied to a gameflow found in the game controller class. 


## **User interaction outcome:**
The game in it's current state provides two game modes for the player: one player, and two player. In our one player mode, the player plays against a computer which places a random piece after a player's turn until winning conditions are met by either the computer or player. In two player mode, two human players can play on the same terminal placing one piece per turn until winning conditions are met by one player. 

## **Tech Stack:**
- Ruby
- Gems: RSpec

## **Additional Documentation:**
[Google Doc Brainstom](https://docs.google.com/document/d/1P3wmFz5bldRx5s5Ox9hBn4K1FPc2cF2PQGabBorPTnc/edit#heading=h.h8krlvcjmayj)
[Defining Relationship](https://docs.google.com/document/d/1QYJ4KUGjahCnPv96DBg9BflEC1-6jwJpzyDmNIjcJL8/edit)

## **Skills Gained/Expanded:**
- Codebase architecture and design
- Pair programming - driver/navigator, general collaboration, and collective creativity in design
- TDD - utilizing testing in RSpec to ensure incremenental functionality of all methods; unit and integrations
- CLI testing - utilizing user interactive testing alongside TDD to verify application functionality

## **Reflection Points:**
1. This project did not provide an interaction pattern. How did you approach the design and problem solving process for this project?

*We began by putting our general thoughts on a Google Doc. We them split up our Google Doc by iteration of the project and revisited the documentation to brainstom at the beginning of each iteration. During the brainstorming sessions, we applied pseudo coding techniques as well as writing potential method and class names. During the last iteration we utilized Replit to play around with code for the check_diagonal_win method. We approached the design aspect from the get-go based on the data structure of the board. We began with a hash of hashes, and quickly reverted to an array of arrays once we began the second iteration. During each step of brainstorming, we also tried to foresee any potential roadblocks, or design flaws in order to better understand the limitations of our ideas.*

2. If you had one more day to work on this project, what would you work on?

*We would most likely try to implement the HTTP requirements in order for two players to be able to play each other across the web. We would also like to make the user interface a bit friendlier by creating better spacing in the board, making it visually easier to play the game.*

3. Describe the pairing techniques you used while working on this project.

*We utilized some driver/navigator techniques as well as divide and conquer. For some of the more complex methods (checking win conditions), we attempted to separate and come up with our solutions in order to juxtapose. For some simpler methods such as the ones found in iteration 1 and 2, we simply divided the work, and created pull requests with detailed summaries that we reviewed and commented on before merging into the main branch.**

4. Describe how feedback was shared over the course of this project.

*We gave feedback in the form of assuring mutual understanding when implementing new methods and design. When one partner did not understand the exact logic or reasoning behind method design, we took the time to explain it to one another. During driver/navigator sessions, we gave direct but polite feedback when making a correction change to the code. We showed appreciation for each others contributions along the way, and acknowledged when one partner provided a solution that was better than another.*

# GEM INSTALLATION

# ConnectFour2307

TODO: Delete this and the text below, and describe your gem

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/connect_four_2307`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_PRIOR_TO_RELEASE_TO_RUBYGEMS_ORG

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/connect_four_2307.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
