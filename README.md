Peer Cnnctr
===========

The peer_cnnctr is a naive discovery system for peer groups.

In order to connect multiple services on various networks, a `peer_cnnctr` can be used.  It is a
hosted platform in which peers can be entered either through a web interface, or through a JSON
interface.

Peers can discover each other by inquiring the `peer_cnnctr`.  Once a peer is recorded in the
`peer_cnnctr`, all updates to its group will be forwarded to the peer.  For this, the peer should
implement the right interfaces.  An example of this is shown in `tenforce/didicat`.


Components of the peer_cnnctr
-----------------------------

### Ruby on Rails

This application requires:

-   Ruby
-   Rails

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

### Database

This application uses SQLite with ActiveRecord.

License
-------

The peer_cnnctr is provided in the Apache License Version 2.0.  See LICENSE for the complete license.
