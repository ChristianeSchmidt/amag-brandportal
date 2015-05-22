
[#if model.contentNavigation?exists]
    <div id="nav-content">
        [#if content.title?has_content]<h3><em>${i18n['contentNavigation.index.title']} </em>${content.title}</h3>[/#if]
        [#list model.contentNavigation as item]
        <ul>
            <li><a href="${item.href}">${item.title}</a></li>
        </ul>
        [/#list]
    </div><!-- end nav-content -->
[/#if]