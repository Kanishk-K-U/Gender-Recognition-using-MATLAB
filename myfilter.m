function filtered = myfilter(b, a, raw)

filtered = zeros(size(raw));

    for n = 3:size(raw,1)

        filtered(n,1) = b(1)* raw(n,1)   + b(2)* raw(n-1,1) + b(3)* raw(n-2,1) ...                
                      - a(1)*filtered(n,1)   - a(2)*filtered(n-1,1) - a(3)*filtered(n-2,1) ;
                      
    end


