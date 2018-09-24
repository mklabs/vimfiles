import * as Oni from 'oni-api';

export const configuration = {
  //add custom config here, such as
  'ui.colorscheme': 'nord',
  //"oni.bookmarks": ["~/Documents"],
  'oni.loadInitVim': true,
  'oni.useDefaultConfig': false,
  'editor.fontSize': '14px',
  //"editor.fontFamily": "Monaco",

  // UI customizations
  'ui.animations.enabled': true,
  'ui.fontSmoothing': 'auto',

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
  }
};
