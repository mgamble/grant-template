
from PyPDF4 import PdfFileReader, PdfFileWriter
from collections import namedtuple
from pathlib import Path
reader = PdfFileReader("FullProposal.pdf")
b2p = {}
for o in reader.getOutlines():
	if type(o) is not list:
		b2p[o['/Title']] = reader.getDestinationPageNumber(o)
#print(b2p)
Interval = namedtuple("Interval", "start stop")
bookmark2range = {"Project_Summary" : Interval(b2p["Project Summary"], b2p["Project Narrative"]),
	"Project_Narrative" : Interval(b2p["Project Narrative"], b2p["Facilities And Other Resources"]),
	"Facilities_And_Other_Resources" : Interval(b2p["Facilities And Other Resources"], b2p["Equipment"]),
	"Equipment" : Interval(b2p["Equipment"], b2p["Budget Justification"]),
	"Specific_Aims" : Interval(b2p["Specific Aims"], b2p["Significance"]),
	"Research_Strategy" : Interval(b2p["Significance"], b2p["Resource Sharing Plan"]),
	"Resource_Sharing_Plan" : Interval(b2p["Resource Sharing Plan"], b2p["Authentication of Key Biological and/or Chemical Resources"]),
	"Authentication_of_Resources" : Interval(b2p["Authentication of Key Biological and/or Chemical Resources"], reader.numPages)}

if "Introduction" in b2p.keys():
	bookmark2range["Budget Justification"] = Interval(b2p["Budget Justification"], b2p["Introduction"])
	bookmark2range["Introduction"] = Interval(b2p["Introduction"], b2p["Specific Aims"])
else:
	bookmark2range["Budget Justification"] = Interval(b2p["Budget Justification"], b2p["Specific Aims"])
#print(bookmark2range)

writers = []
if not Path("pdfs").exists(): Path("pdfs").mkdir()
for n,i in [k for k in bookmark2range.items() if k[0] != "Project_Summary"]:
	with Path("pdfs/" + n + ".pdf").open("wb") as pdfFile:
		print("pdfs/" + n + ".pdf",)
		writers.append(PdfFileWriter())
		for j in range(i.start, i.stop):
			writers[-1].addPage(reader.getPage(j))
		writers[-1].write(pdfFile)
