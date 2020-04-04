;(function (global, factory) {
   typeof exports === 'object' && typeof module !== 'undefined'
       && typeof require === 'function' ? factory(require('<c:url value="/moment')) :
   typeof define === 'function' && define.amd ? define(['<c:url value="/moment'], factory) :
   factory(global.moment)
}(this, (function (moment) { 'use strict';
