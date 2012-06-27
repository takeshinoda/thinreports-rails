# Thinreports::Handler
ThinReporsHandler is constructed by Rails Template Handler [ThinReports](http://www.thinreports.org/ "ThinReposts") the PDF.

## Supported versions

* Ruby 1.8.7, 1.9.3
* Rails 3.0.X, 3.1.X, 3.2.X
* ThinReports 0.7.X

## Installation

Add this line to your application's Gemfile:

    gem 'thinreports-handler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install thinreports-handler

## Usage

### PDF is display in the browser.

#### Controllers
``` ruby
class OrdersController < ApplicationController
  def def index
    @orders = Order.all
  end
end
```

#### Views

app/views/orders/index.pdf.thinreports 

``` ruby
report.set_layout # ! <= Required. default use: orders/index.tlf
report.start_new_page
report.page.values printed_at: Time.now
@orders.each do |order|
  report.page.list(:list).add_row do |row|
    row.item(:col1).value order.name
    row.item(:col2).value order.num
  end
end
```

### Download

``` ruby
class OrdersController < ApplicationController
  def def index
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

### layout file

To app/views/reports/index.tlf for example. 
Write code like this to index.pdf.thinreports.

``` ruby
report.set_layout 'reports/index'
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

For exsample to use, app/views/orders/_header.pdf.thinreports.
title is local variable in _header.pdf.thinreports.

``` ruby
report.partial 'header', title: title
```

## Authour

TwitterID: @takeshinoda
Blog: http://d.hatena.ne.jp/takeshinoda/

## Contributing

m(__)m, send me pull request.

## Copyright

Copyright (c) 2012 Takeshi Shinoda.

