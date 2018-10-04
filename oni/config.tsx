const activate = oni => {
  const isMode = mode => {
    const isMenuOpen = oni.menu.isMenuOpen();
    const editorMode = oni.editors.activeEditor.mode;
    return mode === 'menu' ? isMenuOpen : editorMode === mode;
  };

  const commandMode = () => isMode('cmdline_normal');

  // Panes
  oni.input.bind('<f8>', 'markdown.togglePreview');
  oni.input.bind('<f9>', 'sidebar.toggle');

  // Command-line
  oni.input.bind('<c-v>', 'editor.clipboard.paste', commandMode);
};

module.exports = {
  activate,
  'ui.colorscheme': 'nord',
  'oni.loadInitVim': true,
  'oni.useDefaultConfig': false,
  'editor.fontSize': '14px',

  // UI customizations
  'ui.animations.enabled': true,
  'ui.fontSmoothing': 'auto',

  'snippets.enabled': false,

  'sidebar.plugins.enabled': true,

  // Oni's clipboard-manager adds bugs and yields no benefits
  'editor.clipboard.enabled': false,

  'oni.plugins.prettier': {
    settings: {
      semi: true,
      tabWidth: 2,
      useTabs: false,
      singleQuote: true,
      trailingComma: 'none',
      bracketSpacing: true,
      jsxBracketSameLine: false,
      arrowParens: 'avoid',
      printWidth: 80
    },

    // TODO: Set this to true to enable formatting on save
    formatOnSave: false,

    // TODO: Set this to true to enable the plugin
    enabled: true
  },

  // Experimental features
  'editor.quickInfo.delay': 100,
  'sidebar.marks.enabled': true,
  'experimental.markdownPreview.enabled': true
};
