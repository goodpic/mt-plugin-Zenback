package Zenback::CMS;
use strict;

# Set params before loding plugin config template
sub blog_config_tmpl {
    use MT::Blog;
    use URI::Escape;
    my $plugin = shift;
    my ($param, $scope) = @_;
    my $app = MT->app;

    my @arr_scope = split(/:/, $scope);
    my $blog_id = pop(@arr_scope);
    my $blog = MT::Blog->load($blog_id);

    my $q = $app->param;
    $param->{'zenback_key'} = $q->param('zb_nsid') ? $q->param('zb_nsid') : $param->{'zenback_key'} ;

    $param->{cgi_path}  = $app->{__host} . $app->app_uri . '?__mode=cfg_plugins&blog_id=' . $blog_id;
    $param->{blog_name} = $blog->name;
    $param->{site_url}  = $blog->site_url;
    $param->{zenback_url} = "http://zenback.jp/_t/mtinstall/?callback_uri="
                          . uri_escape($param->{cgi_path})
                          . "&base_uri=" . uri_escape($blog->site_url);

    return $plugin->load_tmpl("blog_config.tmpl");
}

sub set_param {
    my ($cb, $app, $param, $tmpl) = @_;

#     open  FH, ">> debug.log";
#     print FH "called set_param() \n";
#     close FH;
}

sub set_source {
    my ($cb, $app, $tmpl) = @_;
}


sub set_output {
    my ($cb, $app, ,$output, $param, $tmpl) = @_;
}


1;
