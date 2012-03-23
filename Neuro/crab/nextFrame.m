function [nextch, d_nextch] = nextFrame(ch, d_ch, change)

% pass in the channels/derivative of channels, and return the values for next frame
% the third parameter "change" indicates if the standing leg has changed. If it is, then a jump should be introduced ( proposed method is to change the derivative of the channel)

nextch = zeros(size(ch));
d_nextch = zeros(size(d_ch));

chlist = [19 28 22 31];
numch = length(chlist);

if change == false
	for i = 1:numch
		[nextch(chlist(i)), d_nextch(chlist(i))] = osci(ch(chlist(i)), d_ch(chlist(i)), chlist(i));
		
	end
else
	for i = 1:numch

%		more complex mechanism should be introduced
		switch chlist(i)
			case 19
				[nextch(chlist(i)), d_nextch(chlist(i))] = osci(ch(chlist(i)), - d_ch(chlist(i)), chlist(i));
			case 28
				[nextch(chlist(i)), d_nextch(chlist(i))] = osci(ch(chlist(i)), - d_ch(chlist(i)), chlist(i));
			otherwise
				[nextch(chlist(i)), d_nextch(chlist(i))] = osci(ch(chlist(i)), d_ch(chlist(i)), chlist(i));
		end
	end

end
