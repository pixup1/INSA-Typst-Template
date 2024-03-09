#let titlefont = "Liberation Sans"
#let bodyfont = "Source Serif Pro"

#let insa(
  cover-header: [],
  cover-title: [],
  page-header: [],
  first-page-empty: false,
  date: datetime.today(),
  doc
) = {
  set text(lang: "fr", font:titlefont)
  
  set page(
    "a4",
    margin: 0%
  )

  place(image("cover.jpg"))
  
  place(
    dx: 2.5cm,
    dy: 6.5cm,
    box(
      width: 8.5cm,
      par(
        leading: 15pt,
        justify: false,
        text(size: 28pt, weight: "bold", cover-title)
      )
    )
  )
  place(
    dx: 2.5cm,
    dy: 15cm,
    par(
      leading: 15pt,
      text(size: 18pt, cover-header)
    )
  )
  
  if first-page-empty [
    #pagebreak()
    #counter(page).update(0)
    #pagebreak()
  ] else [#counter(page).update(0)]
  
  set page(
    "a4",
    margin: auto,
    header-ascent: 25%,
    footer: [
      #set text(font:titlefont)
      #place(
        right,
        dy: -0.6cm,
        dx: 1.9cm,
        image("footer.png")
      )
      #place(
        right,
        dx: 1.55cm,
        dy: 0.58cm,
        text(fill: white, weight: "bold", counter(page).display())
      )
    ],
    header: [
      #set text(font:titlefont)
      #page-header
      #h(1fr)
      #if type(date) == datetime [
        #date.display("[day]/[month]/[year]")
      ] else [
        #date
      ]
      #line(length: 100%)
    ]
  )
  
  set par(justify: true)
  set text(font:bodyfont, size: 11pt)
  show heading: set text(font:titlefont)
  show heading.where(level:1): set text(size:18pt)
  show heading.where(level:2): set text(size:15pt)
  show heading.where(level:3): set text(size:13pt)
  show outline: set text(font:titlefont,size:11pt)
  
  doc
}

#let insa-short(
  author : none,
  date : datetime.today(),
  doc
) = {
  set text(lang: "fr")
  set page(
    "a4",
    margin: (top: 3.2cm),
    header-ascent: 0.71cm,
    header: [
      #place(left, image("logo.png", height: 1.28cm), dy: 1.25cm)
      #place(right + bottom)[
        #author\
        #if type(date) == datetime [
          #date.display("[day]/[month]/[year]")
        ] else [
          #date
        ]
      ]
    ],
    footer: [
      #place(
        right,
        dy: -0.6cm,
        dx: 1.9cm,
        image("footer.png")
      )
      #place(
        right,
        dx: 1.55cm,
        dy: 0.58cm,
        text(fill: white, weight: "bold", counter(page).display())
      )
    ]
  )

  doc
}

#let insa-report(
  id: 0,
  pre-title: none,
  title: none,
  authors: (),
  sub-authors: none,
  date: none,
  doc,
) = {
  insa(
    cover-header: [
      #authors.map(auteur => [
        #text(
          weight: "bold",
          auteur
        )
      ]).join(linebreak())\
      #sub-authors\
      #set text(14pt)
      #if type(date) == datetime [
          #date.display("[day]/[month]/[year]")
        ] else [
          #date
        ]
    ],
    cover-title: [
      #if pre-title != none [
        #pre-title #sym.hyph
      ]
      TP #id\
      #set text(size: 22pt, weight: "medium")
      #smallcaps(title)
    ],
    page-header: [TP #id #sym.hyph #smallcaps(title)],
    date: date,
    {
      set math.equation(numbering: "(1)")
      set text(hyphenate: false)
      set heading(numbering: "I.1.a -")
      show heading.where(level: 1): it => [
        #set text(18pt)
        #smallcaps(it)
      ]
      show raw.where(block: true): it => block(stroke: 0.5pt + black, inset: 5pt, width: 100%, it)
      doc
    }
  )
}

#let insa-cv(
  introduction: [],
  photo:"",
  doc
) = {
  set text(size: 12pt,font:bodyfont)
  
  let marginx = 2.5cm
  let marginy = 3.2cm
  
  set page(
    paper: "a4",
    margin: (x:marginx,y:marginy),
    header: [
      #place(pad(rect(fill:rgb(228,38,24), width: 100%, height: 100%),left: -2.5cm, right:-2.5cm))
      #place(image("logo-white.png",height:50%),dy:25%,dx:{-marginx+ 18pt})
    ],
    footer: [
      #place(
        right,
        dy: -0.6cm,
        dx: 1.9cm,
        image("footer.png",height:63.5pt)
      )
      #place(
        right,
        dx: 1.467cm,
        dy: 0.935cm,
        text(fill: white, weight: "bold", counter(page).display())
      )
    ],
    header-ascent: 35%
  )
  
  set par(justify: true)
  set list(marker:(text(sym.square.filled.tiny,size: 0.8em)))
  
  show heading: (it) => {
    set text(size:14pt,font:titlefont)
    set align(center)
    set strong()
    
    v(12pt)
    box(
      place(
        text(
          sym.triangle.filled.tl,
          size:12pt,
          fill:rgb(228,38,24)
          ),
        dx: -11pt,
        dy: -16pt
      ),
    )
    it.body
    v(-10pt)
    line(length:100%,stroke:0.6pt)
    v(8pt)
  }

  place(image("cross-pattern.jpg", width: 140pt), dx: 370pt,dy:-19pt)
  
  if photo != "" {
    place(image("../"+photo,height:150pt),dx:75%,dy:-8%)
  }
  
  par[
    #set block(spacing: 0.8em) // Espacement entre les parbreak
    
    #introduction
  ]

  v(5pt)

  set block(spacing: 0.9em)
  
  doc
}

#let tableau(content, caption: none) = {
  figure(caption: caption, kind: "table", supplement: "Tableau", content)
}
