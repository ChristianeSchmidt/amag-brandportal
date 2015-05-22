

                [#if def.platformArea.enabled]
                    [#include def.platformArea.template]
                [/#if]

                <div id="main">
                    [#include def.mainArea.template]
                </div><!-- end main -->

                [#if def.extrasArea.enabled]
                    <div id="extras">
                        [#include def.extrasArea.template]
                    </div><!-- end extras -->
                [/#if]


