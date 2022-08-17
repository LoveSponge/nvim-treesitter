(jsx_element
  open_tag: (jsx_opening_element ["<" ">"] @tag.delimiter))
(jsx_element
  close_tag: (jsx_closing_element ["<" "/" ">"] @tag.delimiter))
(jsx_self_closing_element ["/" ">" "<"] @tag.delimiter)
(jsx_fragment [">" "<" "/"] @tag.delimiter)
(jsx_attribute (property_identifier) @tag.attribute)

(jsx_opening_element
  name: (identifier) @tag
  (#lua-match? @tag "^[A-Z]"))

(jsx_closing_element
  name: (identifier) @tag
  (#lua-match? @tag "^[A-Z]"))

(jsx_self_closing_element
  name: (identifier) @tag
  (#lua-match? @tag "^[A-Z]"))


; Handle the dot operator effectively - <My.Component>
(jsx_opening_element 
  ((nested_identifier 
     (identifier) @tag 
  )))

; Handle the dot operator effectively - </My.Component>
(jsx_closing_element 
  ((nested_identifier 
     (identifier) @tag 
  )))

; Handle the dot operator effectively - <My.Component />
(jsx_self_closing_element 
  ((nested_identifier 
     (identifier) @tag 
  )))

(jsx_text) @none
