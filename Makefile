STEM = icqg2016
R_OPTS=--no-save --no-restore --no-init-file --no-site-file

$(STEM).pdf: $(STEM).tex header.tex Figs/piecharts.pdf Figs/table_fig.pdf
	xelatex $<

notes: $(STEM)_withnotes.pdf
all: $(STEM).pdf notes web

$(STEM)_withnotes.pdf: $(STEM)_withnotes.tex header.tex Figs/piecharts.pdf Figs/table_fig.pdf
	xelatex $(STEM)_withnotes
	pdfnup $(STEM)_withnotes.pdf --nup 1x2 --no-landscape --paper letterpaper --frame true --scale 0.9
	mv $(STEM)_withnotes-nup.pdf $(STEM)_withnotes.pdf

$(STEM)_withnotes.tex: $(STEM).tex Ruby/createVersionWithNotes.rb
	Ruby/createVersionWithNotes.rb $(STEM).tex $(STEM)_withnotes.tex

web: $(STEM).pdf $(STEM)_withnotes.pdf
	scp $(STEM).pdf broman-10.biostat.wisc.edu:Website/presentations/$(STEM).pdf
	scp $(STEM)_withnotes.pdf broman-10.biostat.wisc.edu:Website/presentations/$(STEM)_withnotes.pdf

Figs/piecharts.pdf: R/pie_charts.R
	cd R;R $(R_OPTS) -e "source('$(<F)')"

Figs/table_fig.pdf: R/table_fig.R
	cd R;R $(R_OPTS) -e "source('$(<F)')"
