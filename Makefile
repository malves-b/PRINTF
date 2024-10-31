# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: malves-b <malves-b@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/02 13:52:22 by malves-b          #+#    #+#              #
#    Updated: 2024/10/31 15:16:30 by malves-b         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FILES = $(wildcard src/*.c)

OBJS = $(patsubst src/%.c, objs/%.o, $(FILES))

CC = cc
CFLAGS = -Wall -Wextra -Werror
RM = rm -f

GREEN = \033[1;32m
BROWN = \033[1;33m
P = \033[1;31m
R = \033[0m

NAME = printf.a

$(NAME): $(OBJS)
	@if [ "$(OBJS)" ]; then \
		ar rcs $(NAME) $(OBJS); \
		echo "$(GREEN)COMPILED$(R)"; \
	else \
		echo "$(P)No object files found!$(R)"; \
	fi

all: $(NAME)

objs/%.o: src/%.c
	@mkdir -p objs
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@$(RM) $(OBJS)
	@echo "$(BROWN)OBJS REMOVED$(R)"

fclean: clean
	@$(RM) $(NAME)
	@echo "$(BROWN)EXE REMOVED$(R)"

re: fclean all

.PHONY: all clean fclean re

