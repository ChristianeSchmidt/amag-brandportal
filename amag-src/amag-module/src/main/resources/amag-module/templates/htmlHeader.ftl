<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<meta name="keywords" content="${content.keywords!content.title!content.@name}" />
<meta name="description" content="${content.description!content.abstract!}" />
<meta name="author" content="" />
<meta name="robots" content="all" />
<meta name="generator" content="[@cmsu.poweredBy pattern="Magnolia {0} {1}"/]" />

[#assign siteTitle = model.siteTitle!model.homeTitle!model.homeName]
[#assign contentPageTitle = content.windowTitle!content.title!content.@name]
[#assign contextRoot = ctx.request.contextPath!]
[#assign docRoot = contextRoot + "/docroot/amag-module"]
	
<title>${siteTitle} - ${contentPageTitle}</title>

[#comment] until we have an icon
    <link rel="shortcut icon" type="image/ico" href="#" />
[/#comment]

[#list model.site.theme.cssFiles as cssFile]
    <link rel="stylesheet" type="text/css" href="${cssFile.link}" media="${cssFile.media}" />
[/#list]

[#list def.cssFiles as cssFile]
    <link rel="stylesheet" type="text/css" href="${cssFile.link}" media="${cssFile.media}" />
[/#list]
    <link rel="stylesheet" type="text/css" href="${docRoot}/amag-fonts/fonts.css" />

[#if model.logoImageLink?has_content]
    <style type="text/css">
        #logo span {
            background-image: url('${model.logoImageLink}');
        }
    </style>
[/#if]
[#list model.site.theme.jsFiles as jsFile]
    <script src="${jsFile.link}" type="text/javascript"></script>
[/#list]

[#list model.site.jsFiles as jsFile]
    <script src="${jsFile.link}" type="text/javascript"></script>
[/#list]

[#list def.jsFiles as jsFile]
    <script src="${jsFile.link}" type="text/javascript"></script>
[/#list]

	<script type="text/javascript" src="${docRoot}/js/lib/audioJS/audio.min.js"></script>
	<script>
		audiojs.events.ready(function() {
			var as = audiojs.createAll();
		});
	</script>
	<style>
		.audiojs audio { position: absolute; left: -1px; } 
		.audiojs { width: 460px; height: 36px; background: #404040; overflow: hidden; font-family: monospace; font-size: 12px; background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #444), color-stop(0.5, #555), color-stop(0.51, #444), color-stop(1, #444)); background-image: -moz-linear-gradient(center top, #444 0%, #555 50%, #444 51%, #444 100%); -webkit-box-shadow: 1px 1px 8px rgba(0, 0, 0, 0.3); -moz-box-shadow: 1px 1px 8px rgba(0, 0, 0, 0.3); -o-box-shadow: 1px 1px 8px rgba(0, 0, 0, 0.3); box-shadow: 1px 1px 8px rgba(0, 0, 0, 0.3); } 
		.audiojs .play-pause { width: 40px; height: 40px; padding: 4px 6px; margin: 0px; float: left; overflow: hidden; border-right: 1px solid #000; } 
		.audiojs p { display: none; width: 25px; height: 40px; margin: 0px; cursor: pointer; } 
		.audiojs .play { display: block; } 
		.audiojs .scrubber { position: relative; float: left; width: 280px; background: #5a5a5a; height: 14px; margin: 10px; border-top: 1px solid #3f3f3f; border-left: 0px; border-bottom: 0px; overflow: hidden; } 
		.audiojs .progress { position: absolute; top: 0px; left: 0px; height: 14px; width: 0px; background: #ccc; z-index: 1; background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #ccc), color-stop(0.5, #ddd), color-stop(0.51, #ccc), color-stop(1, #ccc)); background-image: -moz-linear-gradient(center top, #ccc 0%, #ddd 50%, #ccc 51%, #ccc 100%); } 
		.audiojs .loaded { position: absolute; top: 0px; left: 0px; height: 14px; width: 0px; background: #000; background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #222), color-stop(0.5, #333), color-stop(0.51, #222), color-stop(1, #222)); background-image: -moz-linear-gradient(center top, #222 0%, #333 50%, #222 51%, #222 100%); } 
		.audiojs .time { float: left; height: 36px; line-height: 36px; margin: 0px 0px 0px 6px; padding: 0px 6px 0px 12px; border-left: 1px solid #000; color: #ddd; text-shadow: 1px 1px 0px rgba(0, 0, 0, 0.5); } 
		.audiojs .time em { padding: 0px 2px 0px 0px; color: #f9f9f9; font-style: normal; } 
		.audiojs .time strong { padding: 0px 0px 0px 2px; font-weight: normal; } 
		.audiojs .error-message { float: left; display: none; margin: 0px 10px; height: 36px; width: 400px; overflow: hidden; line-height: 36px; white-space: nowrap; color: #fff; text-overflow: ellipsis; -o-text-overflow: ellipsis; -icab-text-overflow: ellipsis; -khtml-text-overflow: ellipsis; -moz-text-overflow: ellipsis; -webkit-text-overflow: ellipsis; } 
		.audiojs .error-message a { color: #eee; text-decoration: none; padding-bottom: 1px; border-bottom: 1px solid #999; white-space: wrap; } 
		.audiojs .play { background: url("${docRoot}/js/lib/audioJS/player-graphics.gif") -2px -1px no-repeat; } 
		.audiojs .loading { background: url("${docRoot}/js/lib/audioJS/player-graphics.gif") -2px -31px no-repeat; } 
		.audiojs .error { background: url("${docRoot}/js/lib/audioJS/player-graphics.gif") -2px -61px no-repeat; } 
		.audiojs .pause { background: url("${docRoot}/js/lib/audioJS/player-graphics.gif") -2px -91px no-repeat; } 
		.playing .play, .playing .loading, .playing .error { display: none; } 
		.playing .pause { display: block; } 
		.loading .play, .loading .pause, .loading .error { display: none; } 
		.loading .loading { display: block; } 
		.error .time, .error .play, .error .pause, .error .scrubber, .error .loading { display: none; } 
		.error .error { display: block; } 
		.error .play-pause p { cursor: auto; } 
		.error .error-message { display: block; }
	</style>
[#-- add Magnolia css and js: --]
[@cms.links /]