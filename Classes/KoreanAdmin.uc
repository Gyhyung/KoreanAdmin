class KoreanAdmin extends ROMutator;

// entry structure for hex <-> character table
struct KAEntry
{
    var string f; // hex in utf-16
    var string o; // single Korean character
};

function PreBeginPlay()
{
    // Replace BroadcastHandler to intercept every messages on server-side
    ROGameInfo(WorldInfo.Game).BroadcastHandlerClass = class'KABroadcastHandler';
    ROGameInfo(WorldInfo.Game).BroadcastHandler = spawn(class'KABroadcastHandler');
    super.PreBeginPlay();
}