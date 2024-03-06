build: pull_nerd_fonts .WAIT build_nerd_fonts

update_input_fonts:
	curl 'https://input.djr.com/build/?fontSelection=whole&a=0&g=0&i=serifs_round&l=serifs_round&zero=0&asterisk=0&braces=0&preset=default&line-height=1.2&accept=I+do&email=' -o Input_Fonts.zip

pull_nerd_fonts:
	git clone https://github.com/ryanoasis/nerd-fonts .nerd-fonts || cd .nerd-fonts && git pull --rebase

build_nerd_fonts:
	@unzip -o Input_Fonts.zip
	@find Input_Fonts/InputMono/ -iname '*.ttf' | while read font; do \
		.nerd-fonts/font-patcher --mono --complete --careful "$$font" -out . & \
		.nerd-fonts/font-patcher --complete --careful "$$font" -out . & \
	done

PHONY: all update_input_fonts pull_nerd_fonts build_nerd_fonts
