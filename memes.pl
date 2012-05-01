# Usage: /HELLO [<nick>]
  sub cmd_hello {
    # data - contains the parameters for /HELLO
    # server - the active server in window
    # witem - the active window item (eg. channel, query)
    #         or undef if the window is empty
    my ($data, $server, $witem) = @_;

    if (!$server || !$server->{connected}) {
      Irssi::print("Not connected to server");
      return;
    }

    if ($data) {
      $server->command("MSG $data Hello!");
    } elsif ($witem && ($witem->{type} eq "CHANNEL" ||
                        $witem->{type} eq "QUERY")) {
      # there's query/channel active in window
      $witem->command("MSG ".$witem->{name}." Hello!");
    } else {
      Irssi::print("Nick not given, and no active channel/query in window");
    }
  }

  Irssi::command_bind('hello', 'cmd_hello');

  Irssi::command_bind yuno => sub {
      my ($data, $server, $witem) = @_;
      $witem->command('SAY ლ(ಠ益ಠლ)');
  };

  Irssi::command_bind flip => sub {
      my ($data, $server, $witem) = @_;
      $witem->command('SAY (╯°□°）╯ ︵ ┻━┻');
  };

  Irssi::command_bind cry_m => sub {
      my ($data, $server, $witem) = @_;
      $witem->command('SAY ಥ_ಥ');
  };
