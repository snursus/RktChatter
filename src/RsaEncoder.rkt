(module RsaEncoder racket
  (require (file "Common.rkt"))
  (require (file "Rsa.rkt"))
  
  (define RsaEncoder%
    (class object%
      (super-new)
      
      (init [public-key TRUE-NULL])
      
      (define m-public-key public-key)
      
      (define/public (set-public-key! key)
        (set! m-public-key key))
      
      (define/public (get-public-key)
        m-public-key)
      
      ; TODO The following three methods would form an appropriate interface
      (define/public (encode data)
        (if (TRUE-NULL? m-public-key)
            data
            (Rsa:encrypt-string->list string m-public-key)))
      
      (define/public (pack)
        m-public-key)
      
      (define/public (unpack package)
        (set! m-public-key package))))
  
  (provide RsaEncoder%))