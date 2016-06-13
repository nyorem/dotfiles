/**
* Toggle Rikaichan
* source: http://why-would-you-ever-want-a-short-url.blogspot.com/2016/02/vimperator-rikaichan.html
*/

commands.addUserCommand(["rikai[chan]","rk"], "Toggle Rikaichan",
                        function() {
                            rcxMain.toggle();
                        });

