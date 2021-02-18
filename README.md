# ThinreportsRails
ThinreportsRails is constructed by Rails Template Handler [ThinReports](http://www.thinreports.org/ "ThinReposts") the PDF.

[![Build Status](https://travis-ci.org/takeshinoda/thinreports-rails.svg?branch=master)](https://travis-ci.org/takeshinoda/thinreports-rails)

Oldname: thinreports-handler


## Supported versions

* Ruby 2.1.X, 2.2.X, 2.3.X
* Rails 3.X, 4.X, 5.X, 6.0
* ThinReports 0.10.0 or later

## Installation

Add this line to your application's Gemfile:

    gem 'thinreports-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install thinreports-rails

## Usage

### Example to, Display in the browser.

#### Controllers
``` ruby
class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end
end
```

#### Views

app/views/orders/index.pdf.thinreports

``` ruby
report.start_new_page
report.page.values printed_at: Time.now
@orders.each do |order|
  report.page.list(:list).add_row do |row|
    row.item(:col1).value order.name
    row.item(:col2).value order.num
  end
end
```

### Example to, Download PDF.

``` ruby
class OrdersController < ApplicationController
  def index
    @orders = Order.all
    respond_to do |format|
      format.pdf {
        send_data render_to_string, filename: 'foo.pdf', type: 'application/pdf', disposition: 'attachment'
      }
    end
  end
end
```

### Configuration

### Layout file(.tlf) and options.

Example of using the `app/views/reports/index.tlf`.
Write code like this to `index.pdf.thinreports`.

`:layout_options` is an option `ThinReports::Report::Base#use_layout` method.

``` ruby
report.set_layout tlf: 'reports/index', layout_options: { default: true }
```

### generate options.
``` ruby
report.generate_options(security: {
  user_password: 'foo',
  owner_password: 'bar',
  permissions: {
    print_document: false,
    modify_contents: false,
    copy_contents: false
  }
})
```

### Partial

For example to use, `app/views/orders/_header.pdf.thinreports`.
`title` is local variable in `_header.pdf.thinreports`.

``` ruby
report.partial! 'header', title: title
```

## Author

* TwitterID: @takeshinoda
* Blog: http://d.hatena.ne.jp/takeshinoda/

## Contributing

m(__)m, send me pull request.

## Copyright

Copyright (c) 2012 Takeshi Shinoda.
