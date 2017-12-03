close all

bb = BtBlackboard;
q = bb.add_item('q',19.2);

t1 = BtSequence(q<=4,q<=6)
a1 = BtAssign(q,0.3*q)
t5 = BtSelector(t1,a1)
plot(t5)
pause
clf
t5.tick
plot(t5)
pause
clf
t5.tick
plot(t5)
pause
clf
t5.tick
plot(t5)
pause
% here's how you set something on the blackboard
q.set_value(17)
t5.tick
plot(t5)
% and here's how you access a value after updating the BT
q2 = q.get_value
pause
t5.tick
plot(t5)
pause
t5.tick
plot(t5)
pause