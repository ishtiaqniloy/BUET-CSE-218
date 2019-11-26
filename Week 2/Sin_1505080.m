function r = Sin_1505080( x , iter )
    negation = -1;
    nextTerm = x;
    r = 0;
    for i = 1 : iter
        r = r + nextTerm;
        c = 2 * (i+1) -1;
        nextTerm = nextTerm .* x .* x .* negation ./(c * (c-1 ) );
    
    end

end

