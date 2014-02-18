git_camera
===

Have you ever finished a website and thought about how the design/build has evolved to get where it is now? Well git_camera is for you!

git_camera goes through your (web) project's git commits, and records a video of how the interface has changed over time. It's a little window into your build process - Use it for your own curiosity, show it to your client, your boss, investors, your cat, or your therapist.


Installation
---

If needs PhantomJS, FFmpeg, and Ruby. You probably already have Ruby, and if you're on a Mac you can get the others with:

    $ brew install phantomjs ffmpeg

If that gave you an error, you probably need to install homebrew first: 

    $ ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)


The simplest way is to install via rubygems. You don't need to know anything about Ruby, it comes with OSX and is just a delivery system.

    $ [sudo] gem install git_camera

Alternatively, run from the source.

Usage
---

    cd project_directory
    git_camera

When you first run it, it will create a `git_camera` directory with a config file. Make sure to set the project's URL, and any setup that may be required.

If you need any help with this, I'm @skattyadz on Twitter

