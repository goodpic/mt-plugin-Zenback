package Zenback;

use strict;
use utf8;
use warnings;
use MT::Util qw( remove_html );
use URI::Escape;

sub _hdlr_zenback_tag {

    my ($ctx, $args, $cond) = @_;
    my $plugin    = MT->component("Zenback");
    my $blog      = $ctx->stash('blog') or return '';
    my $config    = $plugin->get_config_hash("blog:" . $blog->id);
    my $entry     = $ctx->stash('entry');
    my $url       = uri_escape($blog->site_url);

    my $button ='<!-- BEGIN ZenBackWidget --><script type="text/javascript">document.write(unescape("%3Cscript src=\'http://widget.zenback.jp/?motouri="+encodeURIComponent(document.referrer)+"&base_uri=' . $url . '&nsid=' . $config->{'zenback_key'} . '&rand="+Math.ceil((new Date()*1)*Math.random())+"\' type=\'text/javascript\'%3E%3C/script%3E"));</script><!-- END ZenBackWidget -->';

#     open  FH, ">> debug.log";
#     print FH "Debugging \n $button \n";
#     close FH;

    return $button;
}

1;
