[#macro image image imageClass]

  [#if image?has_content]
      [#assign imageAlt=image.caption!"Image "+content.subtitle!]

      [#if image.title?? || image.caption?? || image.copyright?? || image.description??]
          <dl class="${imageClass}">
              <dt><img src="${image.link}" alt="${imageAlt}" /></dt>
              <dd class="zoom"><a href="${stk.getAssetLink(content, "image")}" title="${i18n['link.zoom.title']}" rel="showbox"></a></dd>
              [#if image.caption??]<dd class="caption">${image.caption!}</dd>[/#if]
              [#if image.copyright??]<dd class="copyright">${image.copyright}</dd>[/#if]
              [#if image.description??]<dd class="longdesc">${image.description}</dd>[/#if]
          </dl>
      [#else]
          <img class="${imageClass}" src="${image.link}" alt="${imageAlt}" />
      [/#if]
  [/#if]

[/#macro]