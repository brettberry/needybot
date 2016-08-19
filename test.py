from needybot_speech.server import *
# from needybot_msgs.msg import *

server = SpeechActionServer()
server.warm_cache()
action = SpeechGoal(
    key = 'hello_world',
    params = [
        SpeechParam(
            key = 'name',
            value = 'a needy robot'
        )
    ]
)
