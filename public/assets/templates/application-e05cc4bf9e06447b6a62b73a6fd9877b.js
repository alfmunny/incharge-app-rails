Ember.TEMPLATES.application=Ember.Handlebars.template(function(n,a,s,l,e){function t(n,a){a.buffer.push("Users")}function o(n,a){a.buffer.push("Vehicles")}function r(n,a){a.buffer.push("Charge Points")}function i(n,a){a.buffer.push("Transactions")}function h(n,a){a.buffer.push("About")}this.compilerInfo=[4,">= 1.0.0"],s=this.merge(s,Ember.Handlebars.helpers),e=e||{};var p,u,c,f="",b=this,d=s.helperMissing;return e.buffer.push('<nav class="navbar navbar-default navbar-fixed-top">\n  <div class="container-fluid">\n    <div class="navbar-header">\n      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1">\n        <span class="sr-only">Toggle navigation</span>\n        <span class="icon-bar"></span>\n        <span class="icon-bar"></span>\n        <span class="icon-bar"></span>\n      </button>\n      <a class="navbar-brand" href="#">InCharge</a>\n    </div>\n\n    <div class="collapse navbar-collapse" id="navbar-collapse-1">\n    <ul class="nav navbar-nav">\n      <li> '),u=s["link-to"]||a&&a["link-to"],c={hash:{},hashTypes:{},hashContexts:{},inverse:b.noop,fn:b.program(1,t,e),contexts:[a],types:["STRING"],data:e},p=u?u.call(a,"users",c):d.call(a,"link-to","users",c),(p||0===p)&&e.buffer.push(p),e.buffer.push(" </li>\n      <li> "),u=s["link-to"]||a&&a["link-to"],c={hash:{},hashTypes:{},hashContexts:{},inverse:b.noop,fn:b.program(3,o,e),contexts:[a],types:["STRING"],data:e},p=u?u.call(a,"vehicles",c):d.call(a,"link-to","vehicles",c),(p||0===p)&&e.buffer.push(p),e.buffer.push(" </li>\n      <li> "),u=s["link-to"]||a&&a["link-to"],c={hash:{},hashTypes:{},hashContexts:{},inverse:b.noop,fn:b.program(5,r,e),contexts:[a],types:["STRING"],data:e},p=u?u.call(a,"charge-points",c):d.call(a,"link-to","charge-points",c),(p||0===p)&&e.buffer.push(p),e.buffer.push(" </li>\n      <li> "),u=s["link-to"]||a&&a["link-to"],c={hash:{},hashTypes:{},hashContexts:{},inverse:b.noop,fn:b.program(7,i,e),contexts:[a],types:["STRING"],data:e},p=u?u.call(a,"trades",c):d.call(a,"link-to","trades",c),(p||0===p)&&e.buffer.push(p),e.buffer.push(" </li>\n      <li> "),u=s["link-to"]||a&&a["link-to"],c={hash:{},hashTypes:{},hashContexts:{},inverse:b.noop,fn:b.program(9,h,e),contexts:[a],types:["STRING"],data:e},p=u?u.call(a,"about",c):d.call(a,"link-to","about",c),(p||0===p)&&e.buffer.push(p),e.buffer.push(' </li>\n      <!-- <li class="dropdown">\n        <a class="dropdown" data-toggle="dropdown" href="#">Things</a>\n        <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">\n          <li><a>Clothing(empty)</a>\n          </li>\n          <li><a href="">Photos(empty)</a>\n          </li>\n          <li><a href="">Books(empty)</a>\n          </li>\n        </ul>\n      </li> -->\n    </ul>\n    </div>\n    <!-- <ul class="nav navbar-nav navbar-right">\n      <li>\n        <a href="#">\n          <button name="button" class="btn btn-default btn-xs">\n            <span class="glyphicon glyphicon-star"></span>\n          </button>\n        </a>\n      </li>\n    </ul> -->\n  </div>\n</nav>\n\n<div class="main">\n  '),p=s._triageMustache.call(a,"outlet",{hash:{},hashTypes:{},hashContexts:{},contexts:[a],types:["ID"],data:e}),(p||0===p)&&e.buffer.push(p),e.buffer.push("\n</div>\n"),f});