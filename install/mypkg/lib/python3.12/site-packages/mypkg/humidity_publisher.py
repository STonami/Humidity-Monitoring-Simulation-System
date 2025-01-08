import rclpy
from rclpy.node import Node
from std_msgs.msg import Float32
import random

class HumidityPublisherNode(Node):
    def __init__(self):
        super().__init__('humidity_publisher')
        self.publisher = self.create_publisher(Float32, 'humidity_data', 10)
        self.timer = self.create_timer(1.0, self.publish_humidity)  # 1秒間隔

    def publish_humidity(self):
        humidity = random.uniform(0.0, 100.0)  # 0〜100%のランダム値
        msg = Float32()
        msg.data = humidity
        self.publisher.publish(msg)

def main(args=None):
    rclpy.init(args=args)
    node = HumidityPublisherNode()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()

