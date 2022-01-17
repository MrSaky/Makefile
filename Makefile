# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: shocquen <shocquen@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/11/23 09:28:22 by shocquen          #+#    #+#              #
#    Updated: 2022/01/17 03:24:30 by shocquen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

define sign
	@clear
	@tput setaf 1
	@tput bold

	@echo "$(shell tput cup 0 9).%%..%%."
	@sleep .02
	@echo "$(shell tput cup 1 9).%%..%%."
	@sleep .02
	@echo "$(shell tput cup 2 9).%%%%%%."
	@sleep .02
	@echo "$(shell tput cup 3 9).%%..%%."
	@sleep .02
	@echo "$(shell tput cup 4 9).%%..%%."
	@sleep .02	

	@echo "$(shell tput cup 0 0)..%%%%.."
	@sleep .02
	@echo "$(shell tput cup 1 0).%%....."
	@sleep .02
	@echo "$(shell tput cup 2 0)..%%%%.."
	@sleep .02
	@echo "$(shell tput cup 3 0).....%%."
	@sleep .02
	@echo "$(shell tput cup 4 0)..%%%%.."
	@sleep .02	

	@echo "$(shell tput cup 0 18)..%%%%.."
	@sleep .02
	@echo "$(shell tput cup 1 18).%%..%%."
	@sleep .02
	@echo "$(shell tput cup 2 18).%%..%%."
	@sleep .02
	@echo "$(shell tput cup 3 18).%%..%%."
	@sleep .02
	@echo "$(shell tput cup 4 18)..%%%%.."
	@sleep .02	

	@echo "$(shell tput cup 0 36)..%%%%.."
	@sleep .02
	@echo "$(shell tput cup 1 36).%%..%%."
	@sleep .02
	@echo "$(shell tput cup 2 36).%%.%%%."
	@sleep .02
	@echo "$(shell tput cup 3 36).%%..%%."
	@sleep .02
	@echo "$(shell tput cup 4 36)..%%%%%."
	@sleep .02	

	@echo "$(shell tput cup 0 27)..%%%%.."
	@sleep .02
	@echo "$(shell tput cup 1 27).%%..%%."
	@sleep .02
	@echo "$(shell tput cup 2 27).%%....."
	@sleep .02
	@echo "$(shell tput cup 3 27).%%..%%."
	@sleep .02
	@echo "$(shell tput cup 4 27)..%%%%.."
	@sleep .02	


	@echo "$(shell tput cup 0 45).%%..%%."
	@sleep .02
	@echo "$(shell tput cup 1 45).%%..%%."
	@sleep .02
	@echo "$(shell tput cup 2 45).%%..%%."
	@sleep .02
	@echo "$(shell tput cup 3 45).%%..%%."
	@sleep .02
	@echo "$(shell tput cup 4 45)..%%%%.."
	@sleep .02	

	@echo "$(shell tput cup 0 63).%%..%%."
	@sleep .02
	@echo "$(shell tput cup 1 63).%%%.%%."
	@sleep .02
	@echo "$(shell tput cup 2 63).%%.%%%."
	@sleep .02
	@echo "$(shell tput cup 3 63).%%..%%."
	@sleep .02
	@echo "$(shell tput cup 4 63).%%..%%."
	@sleep .02	

	@echo "$(shell tput cup 0 54).%%%%%%."
	@sleep .02
	@echo "$(shell tput cup 1 54).%%....."
	@sleep .02
	@echo "$(shell tput cup 2 54).%%%%..."
	@sleep .02
	@echo "$(shell tput cup 3 54).%%....."
	@sleep .02
	@echo "$(shell tput cup 4 54).%%%%%%."
	@sleep .02	

	@tput sgr0
endef

# Create a library
define creating
	@echo "$(shell tput bold)$(shell tput setaf 2)Create $1 $(shell tput sgr0)\c"
	@$(AR) $(NAME) $(addprefix obj/, $(OBJS))
	@echo "$(shell tput bold)$(shell tput setaf 2)√$(shell tput sgr0)"
endef

# Call another Makefile
define making
	@echo "$(shell tput setaf 6)Make $1 $(shell tput sgr0)\c"
	@make -C $1 > /dev/null 2> /dev/null
	@echo "$(shell tput bold)$(shell tput setaf 2)√$(shell tput sgr0)"
endef

# Compile src/file.c to obj/file.o
define compiling
	@echo "$(shell tput bold)$(shell tput setaf 3)Compiling $1 $(shell tput sgr0)\c"
	@$(CC) $(CFLAGS) -I$(INC) -c $1 -o $2
	@echo "$(shell tput bold)$(shell tput setaf 2)√$(shell tput sgr0)"
endef

# Compile the executable
define finishing
	@echo "$(shell tput bold)$(shell tput setaf 2)Compiling $1 $(shell tput sgr0)\c"
	@$(CC) $(CFLAGS) $(addprefix obj/, $(OBJS)) $(LIBS) -I$(INC) -o $(NAME)
	@echo "$(shell tput bold)$(shell tput setaf 2)√$(shell tput sgr0)"
endef

define cleaning
	@echo "$(shell tput bold)$(shell tput setaf 8)Cleaning $1 $(shell tput sgr0)\c"
	@make $2 -sC $1 > /dev/null
	@echo "$(shell tput bold)$(shell tput setaf 2)√$(shell tput sgr0)"
endef

define removing
	@echo "$(shell tput bold)$(shell tput setaf 8)Removing $1 $(shell tput sgr0)\c"
	@$(RM) $1  > /dev/null 
	@echo "$(shell tput bold)$(shell tput setaf 2)√$(shell tput sgr0)"
endef

SRCS		= file.c

OBJS		= $(SRCS:.c=.o)

INC		= ./includes

LIBS	=	./libft/libft.a

NAME		= executable_name
RM			= rm -f
CC			= gcc
AR			= ar -rcs
CFLAGS		= -Wall -Wextra -Werror

${NAME}:	signe $(addprefix obj/, $(OBJS))
			$(call building,libft) 
			$(call finishing,$(NAME))

obj/%.o:	src/%.c
			@mkdir -p $(@D)
			$(call compiling,$<,$@,0)

all:	 $(NAME)

clean:	
			$(call cleaning,libft,clean)
			$(call removing,$(addprefix obj/, $(OBJS)))

fclean:		clean
			$(call cleaning,libft,fclean)
			$(call removing,$(NAME))

re:			fclean all

signe:
			$(call sign)
			@echo

.PHONY : 	all clean fclean re
