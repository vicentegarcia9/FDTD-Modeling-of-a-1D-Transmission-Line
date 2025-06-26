% Output script for line voltage at discrete times
 

    if(ksnap <= numsnaps && n == nsnap(ksnap))

      Vsnap(:,ksnap) = V;

       ksnap = ksnap+1;  % update to next snap shot index

    end



