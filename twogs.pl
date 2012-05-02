use Irssi;
use strict;

my ($MODE_OP, $MODE_HALFOP, $MODE_VOICE, $MODE_NORMAL) = (0,1,2,3);

my @quotes = (
    "Hold tight, Sir Pinkelton!",
    "Everybody knows I do it like this!",
    "Obsolete Operating System, hold tight.",
    "Ready thyselves...",
    "Who's got this new bread-bin tune?",
    "Easy, bruv.",
    "Shouts to Gunfinger.",
    "Shouts to the 256, hold tight.",
    "Easy now to the people on the bus.",
    "Hold tight, the 674. I see ya, bruv.",
    "Big up VHS.",
    "Nothing wrong with these sounds.",
    "Eliminator.",
    "Hold tight, HTML.",
    "Hold tight, flip flop.",
    "Out to the Shout-Out Massive. Oi!",
    "Hold tight, Slim-B.",
    "I'm keepin' this stuff movin'.",
    "O.M.G.",
    "Big up Spodoo.",
    "My sound's so crisp.",
    "Hold tight, Diabetty.",
    "Selecta locked in.",
    "Selecta locked out.",
    "Hold tight, Tarte Tatin.",
    "Shouts to Inhaler.",
    "Shouts to Fresh Nuts.",
    "EXECUTIONER.",
    "Shouts to all the usual crew at the Mumba Bar.",
    "Just getting bugged out here.",
    "This one from Mr. Portcullis.",
    "Hold tight, the 757. Don't worry bruv I see ya.",
    "Oo, you know it's a Percy!",
    "It's the T-WOG\$, rollin' with ya.",
    "Shouts to the Contact Lens Solution Boys.",
    "Step to the bass and the lyrical swagger.",
    "UHH THAT'S FILTHY!",
    "Locked in, locked on.",
    "Me phone line's melting bruv.",
    "Big up Green Lungs and the Arachnid Egg Sac Crew in Isleworth, easy.",
    "Big up Barren Binman, easy.",
    "Keep it locked on, Ursa Minor, easy.",
    "Big up The Terminatorator, easy.",
    "Big up to Susan and Timothy in Barnes, easy.",
    "Shout out to Scum.",
    "Shouts to Infinite Zeros, easy.",
    "Sometimes all I think I need is a pizza box, a playstation controller, and some beats.",
    "I'm not gonna lie to you, I'm annihilated.",
    "Hold tight, Assistant Attorney General.",
    "Hold tight, Crazy Cane.",
    "UHH THIS IS GREASY.",
    "BRRRRAP!",
    "Big shouts to the 965, locked in, locked on.",
    "Easy Ian and the E11 Crew.",
    "Keep it locked in, the 949.",
    "'out to Captain Coke Can.",
    "NURSE!",
    "Shouts to Gugenheim.",
    #24/03/12
    "Hold tight, Smith and Blanks.",
    "Speak tomorrow, Tug O' War. Bell me.",
    "Shouts to Sarcastic Bacteria.",
    "Ooh, that's mucky. PURE MUCKTION.",
    "Shouts to the Hancocks and the Rossy B in Luca.",
    "Oh this thing is nasty. I can feel it in me nostril.",
    "I'll mess up your duvet.",
    "I'll drink all your Cuveé.",
    "This tune's just making me stupid in the face!",
    "Big up da Hollow Sausage.",
    #24/03/12
    "Shouts to Walnut Eye, sitting on the toilet, easy.",
    "I'm bouncing in me chair!.",
    "Bless out to the Fossilized Trilobite Crew, easy.",
    #17/03/12
    "Ready fae dem.",
    "Big up DJ Mr. Corgi.",
    "Big up Ebony Scrooge, hold tight.",
    "Big up Micky Dribben, easy.",
    "Hold tight, Sid The Fox.",
    "Big up Gold Tooth Gloria.",
    "Big up The Hoff Dog on the computer, easy.",
    "Hold tight, Mr. Scabs.",
    "Hold tight, Kahlua in the Camelot Flats. I see ya, bruv."
);

Irssi::command_bind wog_it => sub {
    my ($data, $server, $witem) = @_;
    my $nicks = $witem->nicks();
    my $rand = int(rand($#quotes + 2));

    if ($rand == $#quotes + 1)
    {
        # Really dumb way of getting random user, sorry
        my @nick_list = (sort {(($a->{'op'}?'1':$a->{'halfop'}?'2':$a->{'voice'}?'3':'4').lc($a->{'nick'}))
            cmp (($b->{'op'}?'1':$b->{'halfop'}?'2':$b->{'voice'}?'3':'4').lc($b->{'nick'}))} $witem->nicks());

        my $rand_nick = int(rand($#nick_list)) + 1;
        my $nick_count = 0;
        foreach my $nick (@nick_list)
        {
            print $nick->{'nick'};
            if ($nick_count == $rand_nick)
            {
                $witem->command("SAY T-WOG\$ says: Big up ".$nick->{'nick'}.".");
                return;
            }
            $nick_count += 1;
        }
    }
    else
    {
        $witem->command("SAY T-WOG\$ says: ".@quotes[$rand]);
    }

};
