if not exist latexmkTemp mkdir latexmkTemp

latexmk -outdir="./latexmkTemp" -pdf FullProposal.tex
latexmk -outdir="./latexmkTemp" -pdf Authentication.tex
latexmk -outdir="./latexmkTemp" -pdf Bibliography.tex
latexmk -outdir="./latexmkTemp" -pdf BudgetJustification.tex
latexmk -outdir="./latexmkTemp" -pdf Equipment.tex
latexmk -outdir="./latexmkTemp" -pdf FacilitiesAndOtherResources.tex
latexmk -outdir="./latexmkTemp" -pdf ProjectNarrative.tex
latexmk -outdir="./latexmkTemp" -pdf ProjectSummary.tex
latexmk -outdir="./latexmkTemp" -pdf ResearchStrategy.tex
latexmk -outdir="./latexmkTemp" -pdf ResourceSharingPlan.tex
latexmk -outdir="./latexmkTemp" -pdf SpecificAims.tex
latexmk -outdir="./latexmkTemp" -pdf Resubmission.tex

if not exist pdfs mkdir pdfs
move /y latexmkTemp\*.pdf pdfs
if exist latexmkTemp rmdir /s /q latexmkTemp
