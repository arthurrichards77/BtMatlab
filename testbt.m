bb = BtBlackboard;
q = bb.add_item('q',19.2);

t1 = BtSequence(q<=4,q<=6)
t1.tick

t2 = BtSequence(q<=20,q<=21)
t2.tick

t3 = BtSelector(q<=18,q<=20)
t3.tick

t4 = BtLatchSuccess(t1)
t4.tick