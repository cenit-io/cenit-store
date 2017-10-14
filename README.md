CenitIO store over Stripe Membership Saas
=========================================

## Installation:

```bash
git clone https://github.com/cenit-io/cenit-store
cd cenit-store
bundle install
bundle exec rake db:migrate
```
    
## Configuration:

###Needed environment vars:

```yaml
ADMIN_NAME:             "Cenit.IO Store"
ADMIN_EMAIL:            "cenit.io.store@gmail.com"
ADMIN_PASSWORD:         "********"
GMAIL_USERNAME:         "cenit.io.store@gmail.com"
GMAIL_PASSWORD:         "********"
DOMAIN_NAME:            "cenit-store.io"
MAILCHIMP_API_KEY:      "*************************************"
MAILCHIMP_LIST_ID:      "******"
STRIPE_API_KEY:         "********************************"
STRIPE_PUBLISHABLE_KEY: "********************************"
```

## Load default data and plans:

```bash
bundle exec rake db:seed
```

## Stripe Webhooks

When a credit card expires or a monthly transaction is declined, Stripe will automatically retry a recurring payment after it fails. After a number of attempts (set in your Stripe account settings), Stripe will cancel the subscription. Your application needs to know to deny access for a subscriber with an expired account. Stripe provides webhooks to communicate events to you (for details, see the Stripe webhooks documentation).

A Stripe webhook is an HTTP request from Stripe’s servers to your site, containing JSON data that provides data about the event, plus an event id that can be used to retrieve the data from the Stripe server. The example application responds to Stripe webhooks, using an implementation provided by Danny Whalen’s stripe_event gem, which is provided with the Payola gem. The application responds to webhook requests at https://www.example.com/payola/events.

The example application only responds to “customer.subscription.deleted” events. You can customize the application to respond to other events (such as sending a thank you email in response to an “invoice.payment_succeeded” event).

For webhooks to work, you must visit your Stripe dashboard at https://manage.stripe.com/#account/webhooks and add the URL for your application, such as https://www.example.com/payola/events.

## Roles

The application manages access for users in multiple roles: admin and user, as well as three roles corresponding to subscription plans: silver, gold, and platinum. You can customize the application for additional roles if needed.

Roles are defined in the app/models/user.rb file (the User model).

```Ruby
class User < ActiveRecord::Base
  .
  .
  .
  enum role: [:user, :admin, :silver, :gold, :platinum]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

end
```

You can change the available roles by changing the array [:user, :admin, :silver, :gold, :platinum].

The application uses the ActiveRecord enum method to manage roles. ActiveRecord provides convenient methods to query the role attribute:

```Ruby
user.admin! # sets the role to "admin"
user.admin? # => true
user.role  # => "admin"
```

See documentation for ActiveRecord::Enum for details.
