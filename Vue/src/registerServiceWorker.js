/* eslint-disable no-console */

import { register } from 'register-service-worker'

if (process.env.NODE_ENV === 'production') {
  register(`${process.env.BASE_URL}service-worker.js`, {
    ready() {
      console.log(
        'App is being served from cache by a service worker.\n' +
        'For more details, visit https://goo.gl/AFskqB'
      );
    },
    registered() {
      // 在生产环境中，可以选择去掉这个日志
      // console.log('Service worker has been registered.');
    },
    cached() {
      console.log('Content has been cached for offline use.');
    },
    updatefound() {
      console.log('New content is downloading.');
    },
    updated() {
      console.log('New content is available; please refresh.');
    },
    offline() {
      console.log('No internet connection found. App is running in offline mode.');
    },
    error(error) {
      // 可以通过远程监控服务发送错误日志
      console.error('Error during service worker registration:', error);

      // 示例：远程发送错误日志
      // fetch('/log-service-worker-error', {
      //   method: 'POST',
      //   body: JSON.stringify({ error: error.message }),
      //   headers: { 'Content-Type': 'application/json' }
      // });
    }
  });
}