require 'colorizer'.setup()

require 'colorizer'.setup {
  'css';
  'javascript';
  html = {
    mode = 'foreground';
  }
}

require 'colorizer'.setup({
  'css';
  'javascript';
  html = { mode = 'background' };
}, { mode = 'foreground' })

require 'colorizer'.setup {
  '*'; -- Highlight all files, but customize some others.
  css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
  html = { names = false; } -- Disable parsing "names" like Blue or Gray
}

require 'colorizer'.setup {
  '*'; -- Highlight all files, but customize some others.
  '!vim'; -- Exclude vim from highlighting.
}
