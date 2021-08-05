class KABroadcastHandler extends ROBroadcastHandler
    dependson(KoreanAdmin)
    config(Mutator_KoreanAdmin);

var config array<KAEntry> Entries; // hex <-> character table; set in config

function PostBeginPlay()
{
    LogInternal("KABH Entries:" @ Entries.Length);
    super.PostBeginPlay();
}

function Broadcast(Actor Sender, coerce string Msg, optional name Type)
{
    super.Broadcast(Sender, ProcessString(Msg), Type);
}

function BroadcastTeam(Controller Sender, coerce string Msg, optional name Type)
{
	super.BroadcastTeam(Sender, ProcessString(Msg), Type);
}

function string ProcessString(string s)
{
    local string temp, code, result;
    local int i, j;

    if (left(s, 3) ~= "/ka") // must start with "/ka"
    {
        for (i = 3; i < len(s); i++)
        {
            temp = mid(s,i,1); // grab a letter and check if it's "/"
            if (temp ~= "/" && (i+4) < len(s))
            {
                code = mid(s, i + 1, 4); // grab hex and find it from the table
                j = Entries.Find('f', code);
                if (j != -1)
                {
                    result $= Entries[j].o; // replace it
                    i += 4;
                }
                else
                {
                    result $= temp;
                }
            }
            else
            {
                result $= temp;
            }
        }
        return result;
    }
    else
    {
        return s;
    }
}