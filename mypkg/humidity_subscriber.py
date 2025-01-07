import rclpy
from rclpy.node import Node
from std_msgs.msg import Float32

class HumiditySubscriber(Node):
    def __init__(self):
        super().__init__('humidity_subscriber')
        self.subscription = self.create_subscription(
            Float32,
            'humidity_data',
            self.listener_callback,
            10
        )
        self.get_logger().info('HumiditySubscriber started.')

    def listener_callback(self, msg):
        self.get_logger().info(f'Received humidity: {msg.data:.2f}%')

def main(args=None):
    rclpy.init(args=args)
    node = HumiditySubscriber()
    rclpy.spin(node)
    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()
