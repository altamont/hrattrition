# Risk Board Game Example --------------------------------------------------

#Construct a function that determines the probable outcome of a risk battle.

#Details: The below is an example of solving a problem by creating simulating
#the situation.  Simulations that involve drawing from probability
#distribtutions are referred to as Monte Carlo simulations.

#Simulation Rules: The RISK battle has an attacker and a defender.  The attacker
#can attack with # of armies - 1.  It requires 1 army to remain in the territory
#from where the attack is being laucned.  The number of dice the attacker gets =
#the number of armies with which it is attacking with a maximum of 3 dice.  The 
#number of defender dice = the number of defenders with a maximum of 2 dice. 
#After the attacker and defender have rolled their dice, the top attacker role 
#is compared with the top defender role, then the second highest roles are 
#compared if necessary.  With each comparrison, the attacker wins if they have 
#the higher role.  The defender wins if they have the higher role, or tie.  For 
#example, attacker has 5 armies, defender has 3.  Attacker's 3 roles are 5, 2, 
#3.  Defender's roels are 3,3.  Defender loses 1 army (5 vs 3) and the Attacker 
#loses 1 army (3 vs 3).  The battles are repeated until either the defender is
#out of armies, or the attacker is down to 1 army.



risk.game.solver <- function(num.attackers.init, num.defenders.init, num.simulations){
  
  attackers.remaining.vector <- NULL
  defenders.remaining.vector <- NULL
  attacker.victory.vector <- NULL
  
  for(i in 1:num.simulations) {
    
    num.attackers <- num.attackers.init
    num.defenders <- num.defenders.init
    
    battle.over <- FALSE
    while(battle.over == FALSE){
      
      if(num.attackers <= 1){
        battle.over <- TRUE
        attacker.victory <- FALSE
      }else if(num.defenders == 0){
        battle.over <- TRUE
        attacker.victory <- TRUE
      }else{
        num.attacker.dice <- getNumDice(num.armies = num.attackers, player = "attacker")
        num.defender.dice <- getNumDice(num.armies = num.defenders, player = "defender")
        attacker.roll <- rollDice(num.attacker.dice)
        defender.roll <- rollDice(num.defender.dice)
        battle.result <- getBattleResult(attacker.roll = attacker.roll, defender.roll = defender.roll)
        num.attackers <- max(num.attackers - battle.result[1], 0)
        num.defenders <- max(num.defenders - battle.result[2], 0)
      }
      
    }
    
    attackers.remaining.vector <- c(attackers.remaining.vector, num.attackers)
    defenders.remaining.vector <- c(defenders.remaining.vector, num.defenders)
    attacker.victory.vector <- c(attacker.victory.vector, attacker.victory)
    
  }
  
  result <- list(attackers.remaining = attackers.remaining.vector,
                 defenders.remaining = defenders.remaining.vector,
                 attacker.victory = attacker.victory.vector,
                 success.rate = sum(attacker.victory.vector)/length(attacker.victory.vector))
  
  return(result)
  
}







#return number of dice to roll given the number of armies and whether a player
#is an attacker or defender
getNumDice <- function(num.armies, player){
  
  if (player == "attacker"){
    num.dice <- num.armies -1
    num.dice <- min(num.dice, 3)
  }else{
    num.dice <- min(num.armies, 2)
  }
  
  return(num.dice)
}


#returns a dice roll for a given number of dice
rollDice <- function(num.dice){
  possible.values <- 1:6
  rolls <- sample(x = possible.values, size = num.dice, replace = TRUE)
  return(rolls)
}


getBattleResult <- function(attacker.roll, defender.roll){
  attacker.roll <- sort(attacker.roll, decreasing = TRUE)
  defender.roll <- sort(defender.roll, decreasing = TRUE)
  num.dice.to.compare <- min(length(attacker.roll), length(defender.roll))
  attacker.roll <- attacker.roll[1:num.dice.to.compare]
  defender.roll <- defender.roll[1:num.dice.to.compare]
  dice.win <- attacker.roll > defender.roll
  defender.losses <- sum(dice.win)
  attacker.losses <- length(dice.win) - defender.losses
  result <- c(attacker.losses, defender.losses)
  return(result)
  
}


