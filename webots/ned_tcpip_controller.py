import socket
from controller import Robot

robot = Robot()

# get the time step of the current world
timestep = 250
max_speed = 6.28
                
# Init the motors - the Ned robot is a 6-axis robot arm
# You can find the name of the rotationalMotors is the device parameters of each HingeJoints
m1 = robot.getDevice('joint_1')
m2 = robot.getDevice('joint_2')
m3 = robot.getDevice('joint_3')
m4 = robot.getDevice('joint_4')
m5 = robot.getDevice('joint_5')
m6 = robot.getDevice('joint_6')
m7 = robot.getDevice('gripper::left')
            

# Set the motor velocity
# First we make sure that every joints are at their initial positions
m1.setPosition(0)
m2.setPosition(0)
m3.setPosition(0)
m4.setPosition(0)
m5.setPosition(0)
m6.setPosition(0)
m7.setPosition(0)

# Set the motors speed. Here we set it to 1 radian/second
m1.setVelocity(1)
m2.setVelocity(1)
m3.setVelocity(1)
m4.setVelocity(1)
m5.setVelocity(1)
m6.setVelocity(1)
m7.setVelocity(1)

def wait_for_connection(tcp):
    """
    Wait for a new connection for a specified timeout.
    Returns True if successful, False if a timeout or any other exception occurs.
    """
    try:
        con, cliente = tcp.accept()
        print('Connected by', cliente)
        return con, cliente
    except (socket.timeout, socket.error):
        return None, None

HOST = '127.0.0.1'             
PORT = 10020           
tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
orig = (HOST, PORT)
tcp.bind(orig)
tcp.listen(1)
tcp.settimeout(0.1)

# Wait in a loop for an initial connection
con, cliente = None, None
while con is None:
    con, cliente = wait_for_connection(tcp)
    robot.step(timestep)
print ('Connected by ', cliente)

# Main loop:
# - perform simulation steps until Webots is stopping the controller
while robot.step(timestep) != -1:
    msg = con.recv(1024)
    if not msg:
        conTmp, clienteTmp = wait_for_connection(tcp)
        if conTmp is not None:
            con = conTmp
            cliente = clienteTmp
        continue
    print('Processing message')
    txt = msg.decode('UTF-8')

    # Split the received message by comma
    parts = txt.split(',')

    # Check if there's at least one part (the command)
    if parts:
        command = parts[0]
    if command == "A" and len(parts) > 1:
        try:
            position = float(parts[1])
            m1.setPosition(position)
        except ValueError:
            print("Invalid position value received.")
            
        
print ('Ending client connection ', cliente)
con.close()