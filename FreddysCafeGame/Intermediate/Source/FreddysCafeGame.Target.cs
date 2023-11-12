using UnrealBuildTool;

public class FreddysCafeGameTarget : TargetRules
{
	public FreddysCafeGameTarget(TargetInfo Target) : base(Target)
	{
		DefaultBuildSettings = BuildSettingsVersion.V2;
		Type = TargetType.Game;
		ExtraModuleNames.Add("FreddysCafeGame");
	}
}
