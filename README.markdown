# JekyllAndHyde

JekyllAndHyde is a HTML presentation generator that combines the simplicity of website generation via [Jekyll][1] with jQuery's [Slippy][2] presentation library. Together they create a super-simple, GitHub Pages-compatible slideshow platform in Ruby.

# Jekyll

Jekyll is a blog aware static site generator that powers [GitHub Pages][3]. It takes a template directory (representing the raw form of a website), runs it through Textile or Markdown and Liquid converters, and spits out a complete, static website suitable for serving with Apache or your favorite web server. GitHub Pages is set up in a way that whenever you push markup files into its Git repository, Jekyll will automatically render them and generate a static website.

# Slippy

Slippy is HTML presentation library written with jQuery that takes a HTML file in and plays the presentation in any browser.

# Why?

Combining Jekyll and Slippy can provide a powerful yet simple solution to create presentations: use the jekyll_and_hyde gem to generate a Jekyll template with Slippy properly integrated; write slides with Makrdown or Textile; publish slides by pushing it to a Git repository; present slides on a browser.

# How?

## Installation:

	> gem install jekyll_and_hyde

## Generation:

	> jh new my_slides
	> cd my_slides
	> jh generate my-first-slide

There are two options coming with the "new" task: the "--github" flag is to set up a branch for GitHub Pages during generation, which is the same as calling "jh github"; the "--template" option is to define the Git repository of the generated Jekyll template to download, by default, the value is git://github.com/jingweno/jekyll_and_hyde_template.git. 

## Other tasks:

	> jh github
	> jh list [SEARCH]
	> jh help [TASK]

The "github" task is to set up branching information for GitHub Pages. The "list" task is to list all the available tasks by giving it an optional SEARCH term. The "help" task is to display usage for a specific task.

# Demo

<http://owenou.com/jekyll_and_hyde_demo>

# Screencast

<http://vimeo.com/jingwenowenou/cook-up-presentations-with-jekyllandhyde>

# News

<http://ruby5.envylabs.com/episodes/151-episode-148-february-8-2011>

# License

MIT License. Details see LICENSE.

[1]: https://github.com/mojombo/jekyll
[2]: https://github.com/Seldaek/slippy
[3]: http://pages.github.com/