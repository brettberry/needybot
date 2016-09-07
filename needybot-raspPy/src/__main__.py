from nanpy import ArduinoApi, SerialManager

connection = SerialManager(device='/dev/cu.usbmodem1421')
arduino = ArduinoApi(connection=connection)

frontLeft = { "en": 13, "in1": 12, "in2": 11 }
frontRight = { "en": 8, "in1": 10, "in2": 9 }
backLeft = { "en": 7, "in1": 6, "in2": 5 }
backRight = { "en": 2, "in1": 4, "in2": 3}


def activateMotor(motor):
    arduino.pinMode(motor["in1"], arduino.OUTPUT)
    arduino.pinMode(motor["in2"], arduino.OUTPUT)
    arduino.analogWrite(motor["en"], 200)
    arduino.digitalWrite(motor["in1"], arduino.HIGH)
#
# activateMotor(frontLeft)
# activateMotor(frontRight)
# activateMotor(backRight)
# activateMotor(backLeft)
