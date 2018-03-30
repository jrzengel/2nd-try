gapminder <- read.csv("gapminder-FiveYearData.csv")

head(gapminder)

#
gapminder %>% group_by(country) %>% 
  summarize(avg = mean(pop), std=sd(pop), total=n())


#how to use arrange to sort from low to high
gapminder %>%  group_by(country) %>% 
  summarise(ave=mean(pop), std = sd(pop), total=n()) %>% 
  arrange(desc(ave))

            
 #this is how to use mutate
gapminder_mod <- gapminder0
gapminder_mod <- gapminder_mod %>%  mutate(GDP = pop * gdpPercap) %>% head()

gap2 <- gapminder %>% group_by(country) %>% summarize(avelife = mean(lifeExp)) %>% arrange(avelife) %>% 
  filter (avelife == max(avelife), avelife == min(avelife)) 

gapminder3 <- gapminder %>% group_by(country) %>% summarize(avelife = mean(lifeExp)) %>% arrange(avelife)

gapminder_mod

#Plotting stuff
plot(x = gapminder_mod$gdpPercap, y= gapminder_mod$lifeExp)

#ggplot2

library(ggplot2)

ggplot(gapminder, aes(x = log10(gdpPercap), y = lifeExp)) + geom_point(alpha = 1/3, size = 3)

#color by continent


p <- ggplot(gapminder, aes(x = log10(gdpPercap), y = lifeExp, color=continent)) + geom_point(alpha = 1/3, size = 3)

head(gapminder)

p<-p + facet_wrap(~ continent)
p<-p+geom_smooth(color = "orange")
p

p<p+geom_histogram(color="orange")

p <- ggplot(gapminder, aes(gdpPercap)) + geom_histogram(binwidth=1000)

p<-p+aes(color=continent)

life <- ggplot(gapminder, aes(lifeExp, fill=continent) + geom_histogram(binwidth=1)

ggsave(life, file = "histogramlifeExp.png")

ggsave(life, file = "~/scw-2018/advanced_R/histogram.jpg", dpi=400)   

#line plot

gapminder head(3)

gapminder

gapminder %>% filter(starts_with(A)) %>% summary() 
  ggplot(aes(x=year, y=lifeExp)) +
  geom_line()

#excersize 2
  
ex2 <- gapminder %>% group_by(continent) %>% ggplot(aes(x=year, y=lifeExp)) + geom_line()

ex2

ex2.1 <- ggplot(gapminder, aes(y=lifeExp, x=year)) + geom_point() + facet_wrap(~ continent)

ex3.1 <- ex2.1 +geom_smooth(color="orange", lwd = 2, se = FALSE)

ex3.1 +geom_smooth(color = "blue", lwd=2, se =FALSE, method=lm)

ggsave(ex3.1, file="ex3 file.jpg")

#density plot

ggplot(gapminder, aes(log10(gdpPercap), lifeExp)) +geom_point(size=0.25) +geom_density_2d()

#OR

ggplot(gapminder, aes(gdpPercap, lifeExp)) +geom_point(size=0.25) +geom_density_2d()+ scale_x_log10()
install.packages("gridExtra")
library(gridExtra)
gridExtra::grid.arrange(
  P5<-ggplot(gapminder, aes(lifeExp, year)) + geom_point() + facetwrap(~ continent)+ 
)


#New loop

gapminder_mod <- gapminder

gapminder_mod %>%  filter(continent == "Asia") %>% 
  summarize (ave = mean(lifeExp))

cont <- unique(gapminder$continent)
cont
# for (variable in list) { 
#   do something 
# }

for (c in cont){
  #print(c)
  res <- gapminder %>%  filter(continent == c) %>% 
    summarise(ave = mean(lifeExp)) %>% 
  print(paste0("The avg life expenctancy of", c, "is:" res))
  }

res


gapminder %>% group_by(continent, year) %>% 
  summarize(ave=mean(lifeExp))

#function
mean(2,3)

adder <- function(x,y){
  return(x+y)}
}}}

adder(2,3)  

adder <- function(x,y){
  print(paste0("The sum of ", x, " and ", y, " ",  "is :",""  ", x+y))
}

adder(1,4)

d
#This is the end of the workshop





