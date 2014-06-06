# PLEASE NOTE, THIS PROJECT IS NO LONGER BEING MAINTAINED

It's deprecated.
This project will be merged into
[Angular-Atom](https://github.com/angular-ui/AngularJS-Atom).
And I will develop on it.

### This package is going to be unpublished on Atom packages.

* * *

# Atom-AngulsrJS

a package to make easy to use
[angular.js](http://angularjs.org/) in [Atom](http://atom.io)
inspired JetBrain's Angular plugin

## Autocomplete

You can use autocomplete for directives in HTML and
angular.js's variables and function in JavaScript.
See [scoped-properties](https://github.com/outsideris/atom-angularjs/blob/master/scoped-properties/)
for more details.

![](https://raw.github.com/outsideris/atom-angularjs/master/screenshots/autocomplete.png)

If you type some prefix and press `ctrl` + `space`,
you can select auto-complete in below.

### HTML
```
ng-click
ng-model
ngForm
ng-valid
ng-invalid
ng-pristine
ng-dirty
ngSubmit
ng-controller
ng-show
ng-required
ng-minlength
ng-maxlength
ng-pattern
ng-change
ng-true-value
ng-false-value
ng-change
ng-value
ng-trim
ng-app
ng-bind
ng-bind-html
ng-bind-template
ng-blur
ng-checked
ng-class
ng-class-even
ng-class-odd
ng-cloak
ng-copy
ng-csp
ng-cut
ng-dblclick
ng-disabled
ng-focus
ng-form
ng-hide
ng-href
ng-if
ng-include
ng-init
ng-keydown
ng-keypress
ng-keyup
ng-list
ng-mousedown
ng-mouseenter
ng-mouseleave
ng-mousemove
ng-mouseover
ng-mouseup
ng-non-bindable
ng-open
ng-paste
ng-pluralize
ng-readonly
ng-repeat
ng-repeat-start
ng-repeat-end
ng-selected
ng-src
ng-srcset
ng-style
ng-submit
ng-switch
ng-options
ng-switch-when
ng-switch-default
ng-transclude
ng-view
ng-swipe-left
ng-swipe-right
```

### JavaScript

```
angular
bind
bootstrap
copy
element
equals
extend
forEach
fromJson
identity
injector
isArray
isDate
isDefined
isElement
isFunction
isNumber
isObject
isString
isUndefined
lowercase
module
noop
toJson
uppercase
$anchorScroll
$animate
$cacheFactory
$compile
$controller
$document
$exceptionHandler
$filter
$http
$httpBackend
$interpolate
$interval
$locale
$location
$log
$parse
$q
$rootElement
$rootScope
$sce
$sceDelegate
$templateCache
$timeout
$window
$animateProvider
$compileProvider
$controllerProvider
$filterProvider
$interpolateProvider
$locationProvider
$logProvider
$parseProvider
$rootScopeProvider
$sceDelegateProvider
$sceProvider
$injector
$provide
$animateProvider
$animate
$cookieStore
$cookies
mock
$exceptionHandlerProvider
$exceptionHandler
$httpBackend
$interval
$log
$timeout
inject
$sanitize
$swipe
controller
$scope
service
factory
provider
$resource
ngResource
$q
defer
config
$routeProvider
$route
$routeParams
when
otherwise
directive
run
filter
```

## Snippets

You can use snippets in HTML and JavaScript.
See [snippets](https://github.com/outsideris/atom-angularjs/tree/master/snippets)
for more details.

If you type prefix and press `tab`,
It will be replaced by snippet for it.

### HTML

#### ngindex
```
<html>
<head>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/$1/angular.js"></script>
</head>
<body ng-app>
 $2
</body>
</html>
```

#### ngsa
```
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/angularjs/$1/angular.js"></script>
```

#### ngst
```
<script type="text/ng-template" id="$1">
  $2
</script>
```

### JavaScript

#### ngm
```
angular.module('$1', [$2]);
```

#### ngma
```
var $1 = angular.module('$2', [$3]);
```

#### ngmc
```
var $1 = angular.module('$2', [$3], function($4) {
    $5
});
```

#### ngmfa
```
factory('$1', function($2) {
  $3
});
```

#### ngmfi
```
filter('$1', function($2) {
  return function (input, $3) {
    $4
  };
})
```

#### ngms
```
service('$1', function($2) {
  $3
});
```

#### ngro
```
$routeProvider.otherwise({redirectTo: '$1' });
```

#### ngrw
```
$routeProvider.when('$1', {templateUrl: '$2', controller: '$3'});
```

#### ngrwr
```
$routeProvider.when('$1', {templateUrl: '$2', controller: '$3', resolve: {$4} });
```

#### ngfor
```
angular.forEach($1, function(value, key) {
  $2
});
```

#### ngdl
```
.directive('$1', function($2) {
  $3
  return function(scope, element, attrs) {
    $4
  }
});
```

#### ngdlf
```
function (scope, element, attrs) {
  $1
}
```

#### ngdc
```
.directive('$1', function factory($2) {
  var directiveDefinitionObject = {
    $3
    compile: function compile(tElement, tAttrs, transclude) {
      $4
      return function (scope, element, attrs) {
        $5
      }
    }
  };
  return directiveDefinitionObject;
})
```

#### ngdcf
```
function compile(tElement, tAttrs, transclude) {
  $1
  return function (scope, element, attrs) {
    $2
  }
}
```

#### ngb
```
$scope.$broadcast('$1', $2);
```

#### nge
```
$scope.$emit('', );
```

#### ngf
```
$scope.$1 = function($2) {
  $3
};
```

#### ngon
```
$scope.$on('$1', function(event, $2) {
  $3
});
```

#### ngv
```
$scope.$1 = $2;
```

#### ngw
```
$scope.$watch('$1', function(newValue, oldValue) {
  $2
});
```

#### ngc
```
var $1 = function($scope, $2) {
  $3
}
```

## Change logs

#### v0.1.2
* deprecated. see [Angular-Atom](https://github.com/angular-ui/AngularJS-Atom).

#### v0.1.1
* fix cursor position error in snippets

#### v0.1.0

* support snippets in HTML and JavaScript
* support autocompletes for directives and variables
