### Build and install the latest Ruby from the source as follows.
$ sudo yum groupinstall "Development Tools"
$ sudo yum install openssl-devel
$ wget http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz
$ tar xvfvz ruby-2.1.2.tar.gz
$ cd ruby-2.1.2
$ ./configure
$ make
$ sudo make install
### Finally, update Rubygems and Bundler.
$ sudo gem update --system
$ sudo gem install bundler
### If you have any pre-installed gems with an older version of Ruby, update the gems.
$ sudo gem update
### To use the installed Ruby/Rubygems, open a new terminal. Then check the version of installed Ruby and Rubygems as follows.
$ ruby --version
$ rubygems --version
