Ember.TEMPLATES.application=Ember.Handlebars.template(function(n,a,s,e,l){function t(n,a){a.buffer.push("Users")}function o(n,a){a.buffer.push("Vehicles")}function i(n,a){a.buffer.push("Charge Points")}function h(n,a){a.buffer.push("Transactions")}function r(n,a){a.buffer.push("About")}function p(n,a){a.buffer.push("Blog")}this.compilerInfo=[4,">= 1.0.0"],s=this.merge(s,Ember.Handlebars.helpers),l=l||{};var u,f,c,b="",d=this,v=s.helperMissing;return l.buffer.push('<!-- <div class="panel panel-primary">\n  <div class="panel-heading">\n    <div class="panel-title">\n      <h2 id=\'title\'>Incharge Server</h2>\n    </div>\n  </div>\n  <div class="panel-body" style="background-color: #0fe312">\n    <p>\n      <h5 style="color: #ffffff">Welcome in Incharge!</h5>\n    </p>\n  </div>\n</div> -->\n<nav class="navbar navbar-default">\n  <div class="container-fluid">\n    <div class="navbar-header">\n      <a class="navbar-brand" href="#">Incharge</a>\n    </div>\n    <ul class="nav navbar-nav">\n      <li> '),f=s["link-to"]||a&&a["link-to"],c={hash:{},hashTypes:{},hashContexts:{},inverse:d.noop,fn:d.program(1,t,l),contexts:[a],types:["STRING"],data:l},u=f?f.call(a,"users",c):v.call(a,"link-to","users",c),(u||0===u)&&l.buffer.push(u),l.buffer.push(" </li>\n      <li> "),f=s["link-to"]||a&&a["link-to"],c={hash:{},hashTypes:{},hashContexts:{},inverse:d.noop,fn:d.program(3,o,l),contexts:[a],types:["STRING"],data:l},u=f?f.call(a,"vehicles",c):v.call(a,"link-to","vehicles",c),(u||0===u)&&l.buffer.push(u),l.buffer.push(" </li>\n      <li> "),f=s["link-to"]||a&&a["link-to"],c={hash:{},hashTypes:{},hashContexts:{},inverse:d.noop,fn:d.program(5,i,l),contexts:[a],types:["STRING"],data:l},u=f?f.call(a,"charge-points",c):v.call(a,"link-to","charge-points",c),(u||0===u)&&l.buffer.push(u),l.buffer.push(" </li>\n      <li> "),f=s["link-to"]||a&&a["link-to"],c={hash:{},hashTypes:{},hashContexts:{},inverse:d.noop,fn:d.program(7,h,l),contexts:[a],types:["STRING"],data:l},u=f?f.call(a,"transactions",c):v.call(a,"link-to","transactions",c),(u||0===u)&&l.buffer.push(u),l.buffer.push(" </li>\n      <li> "),f=s["link-to"]||a&&a["link-to"],c={hash:{},hashTypes:{},hashContexts:{},inverse:d.noop,fn:d.program(9,r,l),contexts:[a],types:["STRING"],data:l},u=f?f.call(a,"about",c):v.call(a,"link-to","about",c),(u||0===u)&&l.buffer.push(u),l.buffer.push(" </li>\n      <li> "),f=s["link-to"]||a&&a["link-to"],c={hash:{},hashTypes:{},hashContexts:{},inverse:d.noop,fn:d.program(11,p,l),contexts:[a],types:["STRING"],data:l},u=f?f.call(a,"posts",c):v.call(a,"link-to","posts",c),(u||0===u)&&l.buffer.push(u),l.buffer.push(' </li>\n      <!-- <li class="dropdown">\n        <a class="dropdown" data-toggle="dropdown" href="#">Things</a>\n        <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">\n          <li><a>Clothing(empty)</a>\n          </li>\n          <li><a href="">Photos(empty)</a>\n          </li>\n          <li><a href="">Books(empty)</a>\n          </li>\n        </ul>\n      </li> -->\n    </ul>\n    <ul class="nav navbar-nav navbar-right">\n      <li>\n        <a href="#">\n          <button name="button" class="btn btn-default btn-xs">\n            <span class="glyphicon glyphicon-star"></span>\n          </button>\n        </a>\n      </li>\n    </ul>\n  </div>\n</nav>\n'),u=s._triageMustache.call(a,"outlet",{hash:{},hashTypes:{},hashContexts:{},contexts:[a],types:["ID"],data:l}),(u||0===u)&&l.buffer.push(u),l.buffer.push("\n"),b});