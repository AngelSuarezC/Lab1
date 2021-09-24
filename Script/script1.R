library(dplyr)
library(ggplot2)
library(statsr)

data("arbuthnot")
dim(arbuthnot)
names(arbuthnot)

arbuthnot$boys
ggplot(data = arbuthnot, aes(x = year, y = girls)) + geom_point()
ggplot(data = arbuthnot, aes(x = year, y = boys)) + geom_point()

arbuthnot <- arbuthnot %>% mutate(total = boys + girls)
ggplot(data = arbuthnot, aes(x = year, y = total)) + geom_line()
ggplot(data = arbuthnot, aes(x = year, y = total)) + geom_line() + geom_point()

arbuthnot <- arbuthnot %>% mutate(more_boys = boys > girls)

data(present)
range(present$year) #Para obtener el rango de una vector de datos

present <- present %>% mutate(total = boys + girls)
present <- present %>%mutate(prop_boys = boys/total)
ggplot(data = present, aes(x = year, y = prop_boys)) + geom_point() + geom_line()

present <- present %>% mutate(more_boys = boys > girls)
#Proporcion de nacimientos de niños niñas para cada año
present <- present %>% mutate(prop_boy_girl = boys/girls)
ggplot(data = present, aes(x = year, y = prop_boy_girl)) + geom_point() + geom_line()

#Para ordenar los datos en orden desendente
present %>% arrange(desc(total))
