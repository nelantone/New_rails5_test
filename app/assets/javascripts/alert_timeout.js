var alert_n = $('.alert');

function alert_timeout() {
  if (alert_n !== null) {
    alert_n.delay( 1500 ).fadeOut( 400 );
  }
}

alert_timeout();

