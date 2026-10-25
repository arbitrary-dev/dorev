#!/usr/bin/env python3

import pymupdf as fitz
import sys

doc = fitz.open(sys.argv[1])
out = fitz.open()
w, h = doc[0].rect.width, doc[0].rect.height

page = out.new_page(width=w, height=h)

r_top = fitz.Rect(0, 0, w, 135)
page.show_pdf_page(r_top, doc, 0, clip=r_top)

r_mid = fitz.Rect(0, 195, w, 220)
r_midd = fitz.Rect(0, 155, w, 180)
page.show_pdf_page(r_midd, doc, 0, clip=r_mid)

r_bot = fitz.Rect(0, 180, w, h)
page.show_pdf_page(r_bot, doc, 4, clip=r_bot)

#out.insert_pdf(doc, from_page=2)

out.save(sys.argv[2])
doc.close()
out.close()
