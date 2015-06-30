# BushViper

![](https://github.com/koriroys/images/blob/master/iStock_000053428128_Medium_bush_viper.jpg)

Image credits: [Mark Kostich](http://www.istockphoto.com/photo/african-bush-viper-venomous-snake-53428128)

## Installation

Add this line to the Gemfile of your application:

```ruby
gem "bush_viper"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bush_viper

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/koriroys/bush_viper/fork )
2. Create your feature branch (`git checkout -b your-initials/your-new-feature`)
3. Commit your changes (`git commit -am "Reasoning for feature"`)
4. Push to the branch (`git push origin your-initials/your-new-feature`)
5. Create a new Pull Request

## Testing

For running the tests you will need an access token. Since Mendeley offers no way to authenticate without a browser callback flow, the easiest way to get a token is to go to dev.mendeley.com and login. Copy the access_token from the url.

Create a .env file in the main directory, then make it look like this:

    ACCESS_TOKEN=<access_token>

(\<access_token\> being the token you just copied)

Then, to run the tests:

    $ rake

The first time you run the tests, it will make calls to the Mendeley API.
After that, VCR will kick in and the recorded cassetes will make the tests
much faster.

I recommend using a throwaway Mendeley account since the tests will create
quite a few dummy objects using the account.
