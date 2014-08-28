Myapp.ChargePoint = DS.Model.extend({
  status: DS.attr('string'),
  chargePointVendor: DS.attr('string'),
  chargePointModel: DS.attr('string'),
  chargePointSerialNumber: DS.attr('string'),
  firmwareVersion: DS.attr('string'),
  iccid: DS.attr('string'),
  imsi: DS.attr('string'),
  meterType: DS.attr('string'),
  meterSerialNumber: DS.attr('string'),
  heartbeatInterval: DS.attr('number'),
  chargeBoxSerialNumber: DS.attr('string')
});