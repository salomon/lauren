tinymce.PluginManager.add("pagebreak",function(e){var t,n="mce-pagebreak",r=e.getParam("pagebreak_separator","<!-- pagebreak -->"),i='<img src="'+tinymce.Env.transparentSrc+'" class="'+n+'" data-mce-resize="false" />';t=new RegExp(r.replace(/[\?\.\*\[\]\(\)\{\}\+\^\$\:]/g,function(e){return"\\"+e}),"gi"),e.addCommand("mcePageBreak",function(){e.execCommand("mceInsertContent",0,i)}),e.addButton("pagebreak",{title:"Page break",cmd:"mcePageBreak"}),e.addMenuItem("pagebreak",{text:"Page break",icon:"pagebreak",cmd:"mcePageBreak",context:"insert"}),e.on("ResolveName",function(t){"IMG"==t.target.nodeName&&e.dom.hasClass(t.target,n)&&(t.name="pagebreak")}),e.on("click",function(t){t=t.target,"IMG"===t.nodeName&&e.dom.hasClass(t,n)&&e.selection.select(t)}),e.on("BeforeSetContent",function(e){e.content=e.content.replace(t,i)}),e.on("PreInit",function(){e.serializer.addNodeFilter("img",function(e){for(var t,n,i=e.length;i--;)t=e[i],n=t.attr("class"),n&&-1!==n.indexOf("mce-pagebreak")&&(t.type=3,t.value=r,t.raw=!0)})})});