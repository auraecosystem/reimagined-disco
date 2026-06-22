module KUBU.Core

import AI
import Blockchain
import Network

@interface FastVector : QObject
{
    vector<int> _buffer;
}

- push:(int)value;
- pop;
- sum;
- average;

@end

@implementation FastVector

- push:(int)value {
    _buffer.push(value);
}

- pop {
    return _buffer.pop();
}

- sum {
    return _buffer.reduce(
        (acc,v) => acc + v,
        0
    );
}

- average {
    return [self sum] / _buffer.length();
}

@end


@agent Lola
{
    memory:auto;
    learning:auto;
    voice:on;
    reasoning:on;

    - chat:(String)prompt {
        return AI.generate(prompt);
    }

    - summarize:(String)text {
        return AI.summarize(text);
    }

    - analyze:(File)file {
        AI.explain(file);
        AI.refactor(file);
        AI.test(file);
    }
}


@blockchain KUBU
{
    consensus: ProofOfPresence;
    ledger:auto;

    - transfer:(Address)to
      amount:(Token)amount
    {
        Ledger.transfer(
            self.address,
            to,
            amount
        );
    }
}


int main()
{
    FastVector *vec = [[FastVector alloc] init];

    [vec push:10];
    [vec push:20];
    [vec push:30];

    print([vec sum]);

    Lola *assistant = [[Lola alloc] init];

    print(
        [assistant chat:
            @"Explain blockchain consensus"]
    );

    analyze("./src");

    return 0;
}
