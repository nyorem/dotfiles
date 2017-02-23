/**
* Toggle Rikaichan
* source:
* - for firefox < 51: http://why-would-you-ever-want-a-short-url.blogspot.com/2016/02/vimperator-rikaichan.html
* - for firefox >= 51: https://developer.mozilla.org/en-US/docs/Tools/Browser_Toolbox
*/

commands.addUserCommand(["rikai[chan]","rk"], "Toggle Rikaichan",
                        function() {
                            // For Firefox < 51
                            // rcxMain.toggle();

                            // For Firefox >= 51
                            // extracted from the onToggleButton(ev) function
                            let browser = rcxMain.getBrowser();
                            let on = ((typeof(browser._rikaichan_) != 'undefined') && (browser._rikaichan_.enabled));
                            if (on) {
                                rcxMain.disableOnBrowser(browser);
                            } else {
                                rcxMain.enableOnBrowser(browser);
                            }
                        });

