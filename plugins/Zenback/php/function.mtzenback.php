<?
function smarty_function_mtzenback($args, &$ctx) {

  $blog  = $ctx->stash('blog');
  if (!$blog) { return $ctx->error("Error : No blog");}
  $id    = $ctx->stash('blog_id');
  $config = $ctx->mt->db()->fetch_plugin_data('Zenback', "configuration:blog:$id");
  $entry = $ctx->stash('entry');
  $url = urlencode(smarty_function_mtentrypermalink($args, $ctx));
  

  $button ='<!-- BEGIN ZenBackWidget --><script type="text/javascript">document.write(unescape("%3Cscript src=\'http://widget.zenback.jp/?motouri="+encodeURIComponent(document.referrer)+"&base_uri=' . $url . '&nsid=' . $config['zenback_key'] . '&rand="+Math.ceil((new Date()*1)*Math.random())+"\' type=\'text/javascript\'%3E%3C/script%3E"));</script><!-- END ZenBackWidget -->';
      
  return $button;

}
?>