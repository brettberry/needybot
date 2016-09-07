# from flask import Flask, jsonify, request
#
# app = Flask(__name__)
#
# @app.route('/wheels', methods=["POST"])
# def move():
#     frontRight = request.args.get('frontRight')
#     frontLeft = request.args.get('frontLeft')
#     rearRight = request.args.get('rearRight')
#     rearLeft = request.args.get('rearLeft')
#     print(frontRight, frontLeft, rearRight, rearLeft)
#
#     return "ok"
#
# app.run()

from .neural import main
main()
