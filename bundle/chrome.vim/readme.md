
chrome.vim
==========

**Vim meets Chrome**

Experiments at driving a remotely running Chrome instance from Vim.

All of this is based and derived from
http://www.igvita.com/2012/04/09/driving-google-chrome-via-websocket-api/ post.

*Related links & documentation*

- https://developers.google.com/chrome-developer-tools/docs/protocol/1.0/index
- http://www.webkit.org/blog/1620/webkit-remote-debugging/
- protocol JSON schema:
  http://trac.webkit.org/browser/trunk/Source/WebCore/inspector/Inspector.json
- raw, from unofficial mirrored repo:
  https://raw.github.com/WebKit/webkit/master/Source/WebCore/inspector/Inspector.json

For any of the below command, a remotely running Chrome instance with
remote debugging turned on (by specifying the given port, let's keep it
to `9222` for now) is required.

Vim scripts delegates to nodejs scripts, `node` should be installed and
available in your path.

Commands
--------

    :CReload [tab]

Reload the active webpage by default, unless a tab number is specified.


    :CRuntimeEvaluate expression

Evaluates expression on global object.

*Note*: This is very crude right now. You can run `:CRuntimeEvaluate 1 + 1`, it prints back `2`!!

*Note to self*: This command should accepts range and visual selection.

    :5,19CRuntimeEvaluate


