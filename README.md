# GreenWave

## Model

Our system has the following entries:
- **green wave**;
- **control post**;
- **traffic light**;
- **driver**;
- **neural network**;
- **speed suggester**.

Each **green wave** starts and ends by **control post**s and contains some amount of **traffic light**s. As soon as **driver** passes through **control post** he pays fee that goes to his virtual **green wallet** (driver may deposit money before coming to the route to speed up check). 

The **green wave** is split to areas between two **traffic light**s. The special road sign shows the speed proposed by **speed suggester**. If driver follows suggestion his ballance keeps the same. If he breaks rules the fee is withdrawn from his balance automatically (through AI analysis). The driver may avoid punishment if he doesn't cause the traffic jam but became the victim of it.

Each **traffic light** has a sensors to register number of successfully passed cars and that ones which stop. The data is processed by **neural network** and the results are send to **speed suggester**. 
