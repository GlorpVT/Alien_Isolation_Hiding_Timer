state("AI", "Steam")
{
	int fadeState : 0x15D24B4;
	float fadeNum : 0x15D24B8;
	byte gameFlowState : 0x12F0C88, 0x48, 0x8; // FlowState 5 = Death Screen (includes FF)
	int levelManagerState : 0x12F0C88, 0x3C, 0x4C;
	int missionNum : 0x17E4814, 0x4, 0x4E8;
	byte loadingIcon : 0x134A7D0, 0x1D;
	string35 Map : 0x017E4814, 0x4, 0x470;
	string35 Main_Menu : 0x17E4814, 0x4, 0x430;
	float Xaxis : 0x123623C, 0x14, 0x374, 0x4, 0x70;
	float Yaxis : 0x123623C, 0x14, 0x374, 0x4, 0x74;
	float Zaxis : 0x123623C, 0x14, 0x374, 0x4, 0x78;
	byte Save_Icon : 0x134A7D0, 0x15;
	int StandState : 0x03EE358, 0x8C;
    int M1StandState : 0x03EE358, 0x3FC;
}
state("AI", "Epic Games")
{
	int fadeState : 0x15E2664;
	float fadeNum : 0x15E2668;
	byte gameFlowState : 0x12526BC, 0x8;
	int levelManagerState : 0x1BDD628, 0x54;
	int missionNum : 0x130D1A8, 0x78, 0x10EC;
	string25 Map : 0x17F49B4, 0x4, 0x446;
    float MainMenu : 0x3FF598, 0x80;
	float FinalLevel : 0x3FF598, 0x84;
    float loadingScreen : 0x3FF598, 0x88;
    
}
state("AI", "Xbox GamePass") 
{
	int fadeState : 0x01D7B2D8;
	float fadeNum : 0x0197FE98, 0xB40, 0xFD4;
	byte gameFlowState : 0x17EEBD0, 0x8;
	int levelManagerState : 0x01915A88, 0x78, 0x90;
    int missionNum : 0x19759D0, 0x280;
	string25 Map : 0x0198EA88, 0x1A0;
    float MainMenu : 0x01918418, 0xC0;
    float FinalLevel : 0x01918418, 0xC4;
	float loadingScreen : 0x01918418, 0xC8;
}


startup // Contains Variable Declarations
{
	// Variable Declaration for when the Splitter is loaded
	vars.loading = false;
	vars.final = false;
	vars.mission = null;
    vars.StandState = null;
}

init // Checks Game Version
{
	vars.loading = false;
	vars.saving = false;
	vars.final = false;
	 
	// The following determines which version of AI you are currently running.
	if(modules.First().ModuleMemorySize == 0x1F81000){
        version = "Steam";
        } 
	if(modules.First().ModuleMemorySize == 0x1F9F000){
        version = "Epic";
        }
	if(modules.First().ModuleMemorySize == 0x2766000){
        version = "Xbox Gamepass";
        }
	
}

start // Establishes Values for Variables
{ 
	vars.loading = false;
	vars.final = false;
	vars.saving = false;
	vars.mission = null;
	if(current.fadeState == 2 && current.fadeNum > 0 || old.gameFlowState == 6 && current.gameFlowState == 4){
		vars.loading = true;
		return true;}
}
 
update // Main Code
{
        vars.loading = true;
        if (current.missionNum == 19 && current.fadeState == 2 && old.fadeNum < 0.5 && current.fadeNum > 0.5){vars.final = true;}
        if(current.Map == "PRESENCE_BSP_TORRENS" && current.M1StandState == 2){vars.loading = false;}
        if(current.StandState == 2){vars.loading = false;}
        if(current.StandState == 3){vars.loading = false;}
    
        if(current.Map == "PRESENCE_HAB_AIRPORT") // Spaceflight Terminal (Spaceflight)
        {
        if (current.Xaxis >= 19.6 && current.Xaxis <= 19.7 && current.Zaxis >= -65.1 && current.Zaxis <= -65.0){vars.loading = false;}
        }
        if(current.Map == "PRESENCE_TECH_HUB")
        {
            if (current.Xaxis >= -3.39 && current.Xaxis <= -3.37 && current.Zaxis >= 58.0 && current.Zaxis <= 58.1){vars.loading = false;}
            if (current.Xaxis >= 8.55 && current.Xaxis <= 8.58 && current.Zaxis >= 88.5 && current.Zaxis <= 88.55){vars.loading = false;}
            if (current.Xaxis >= 12.35 && current.Xaxis <= 12.4 && current.Zaxis >= 55.9 && current.Zaxis <= 55.95){vars.loading = false;}
            if (current.Xaxis >= -4.06 && current.Xaxis <= -4.05 && current.Zaxis >= 71.0 && current.Zaxis <= 71.05){vars.loading = false;}
            if (current.Xaxis >= -3.38 && current.Xaxis <= -3.37 && current.Zaxis >= 34.8 && current.Zaxis <= 34.82){vars.loading = false;}
            if (current.Xaxis >= 0.638 && current.Xaxis <= 0.65 && current.Zaxis >= 3.1 && current.Zaxis <= 3.2){vars.loading = false;}
            if (current.Xaxis >= 13.05 && current.Xaxis <= 13.1 && current.Zaxis >= 20.62 && current.Zaxis <= 20.64){vars.loading = false;}
            if (current.Xaxis >= 14.55 && current.Xaxis <= 14.57 && current.Zaxis >= 20.62 && current.Zaxis <= 20.64){vars.loading = false;}
            if (current.Xaxis >= -6.94 && current.Xaxis <= -6.93 && current.Zaxis >= 2.88 && current.Zaxis <= 2.89){vars.loading = false;}
            if (current.Xaxis >= -5.065 && current.Xaxis <= -5.064 && current.Zaxis >= -17.39 && current.Zaxis <= -17.37){vars.loading = false;}
            if (current.Xaxis >= 23.86 && current.Xaxis <= 26.87 && current.Zaxis >= -39.19 && current.Zaxis <= -39.18){vars.loading = false;}
            if (current.Xaxis >= 23.865 && current.Xaxis <= 23.87 && current.Zaxis >= -39.187 && current.Zaxis <= -39.186){vars.loading = false;}
            if (current.Xaxis >= 38.3 && current.Xaxis <= 38.4 && current.Zaxis >= -37.1 && current.Zaxis <= -36.95){vars.loading = false;}
            if (current.Xaxis >= 25.89 && current.Xaxis <= 25.91 && current.Zaxis >= -24.19 && current.Zaxis <= -24.18){vars.loading = false;}
            if (current.Xaxis >= 47.19 && current.Xaxis <= 47.20 && current.Zaxis >= -68.515 && current.Zaxis <= -68.510){vars.loading = false;}
            if (current.Xaxis >= 41.19 && current.Xaxis <= 41.20 && current.Zaxis >= -68.515 && current.Zaxis <= -68.510){vars.loading = false;}
            if (current.Xaxis >= 32.34 && current.Xaxis <= 32.355 && current.Zaxis >= -46.388 && current.Zaxis <= -46.382){vars.loading = false;}
            if (current.Xaxis >= 23.61 && current.Xaxis <= 23.62 && current.Zaxis >= -44.45 && current.Zaxis <= -44.43){vars.loading = false;}
            if (current.Xaxis >= 51.628 && current.Xaxis <= 51.632 && current.Zaxis >= -11.56 && current.Zaxis <= -11.54){vars.loading = false;}
            if (current.Xaxis >= 73.90 && current.Xaxis <= 73.905 && current.Zaxis >= -32.631 && current.Zaxis <= -32.630){vars.loading = false;}
            if (current.Xaxis >= 103.95 && current.Xaxis <= 103.99 && current.Zaxis >= -52.035 && current.Zaxis <= -52.03){vars.loading = false;}
            if (current.Xaxis >= 91.81 && current.Xaxis <= 91.815 && current.Zaxis >= -30.807 && current.Zaxis <= -30.803){vars.loading = false;}
            if (current.Xaxis >= 84.825 && current.Xaxis <= 84.83 && current.Zaxis >= -39.85 && current.Zaxis <= -39.845){vars.loading = false;}
            if (current.Xaxis >= 98.29 && current.Xaxis <= 98.295 && current.Zaxis >= -18.73 && current.Zaxis <= -18.725){vars.loading = false;}
            if (current.Xaxis >= 88.80 && current.Xaxis <= 88.81 && current.Zaxis >= -18.838 && current.Zaxis <= -18.834){vars.loading = false;}
            if (current.Xaxis >= 102.13 && current.Xaxis <= 102.145 && current.Zaxis >= 4.43 && current.Zaxis <= 4.435){vars.loading = false;}
            if (current.Xaxis >= 59.37 && current.Xaxis <= 59.375 && current.Zaxis >= 3.065 && current.Zaxis <= 3.07){vars.loading = false;}
            if (current.Xaxis >= 76.63 && current.Xaxis <= 76.64 && current.Zaxis >= -26.345 && current.Zaxis <= -26.341){vars.loading = false;}
            if (current.Xaxis >= 13.36 && current.Xaxis <= 13.365 && current.Zaxis >= -35.94 && current.Zaxis <= -35.93 && current.Yaxis >= 14.86){vars.loading = false;}
            if (current.Xaxis >= 13.36 && current.Xaxis <= 13.365 && current.Zaxis >= -35.938 && current.Zaxis <= -35.936 && current.Yaxis <= 14.78){vars.loading = false;}
        }
        if(current.Map == "PRESENCE_TECH_COMMS") // Seegson Comms (SeegComms)
        {
            if (current.Xaxis >= 5.68 && current.Xaxis <= 5.7 && current.Zaxis >= -54.87 && current.Zaxis <= -54.86){vars.loading = false;}
            if (current.Xaxis >= -5.33 && current.Xaxis <= -5.325 && current.Zaxis >= -61.728 && current.Zaxis <= -61.724){vars.loading = false;}
            if (current.Xaxis >= -22.62 && current.Xaxis <= -22.615 && current.Zaxis >= -65.42 && current.Zaxis <= -65.415){vars.loading = false;}
            if (current.Xaxis >= -22.62 && current.Xaxis <= -22.615 && current.Zaxis >= -66.418 && current.Zaxis <= -66.414){vars.loading = false;}
            if (current.Xaxis >= 15.575 && current.Xaxis <= 15.578 && current.Zaxis >= -79.717 && current.Zaxis <= -79.715){vars.loading = false;}
            if (current.Xaxis >= 20.144 && current.Xaxis <= 20.145 && current.Zaxis >= -68.312 && current.Zaxis <= -68.309){vars.loading = false;}
            if (current.Xaxis >= 21.420 && current.Xaxis <= 21.425 && current.Zaxis >= -67.7041 && current.Zaxis <= -67.7039){vars.loading = false;}
            if (current.Xaxis >= -3.210 && current.Xaxis <= -3.208 && current.Zaxis >= -46.5175 && current.Zaxis <= -46.515){vars.loading = false;}
            if (current.Xaxis >= -43.125 && current.Xaxis <= -43.118 && current.Zaxis >= -69.300 && current.Zaxis <= -69.290){vars.loading = false;}
            if (current.Xaxis >= -42.125 && current.Xaxis <= -42.118 && current.Zaxis >= -69.297 && current.Zaxis <= -69.293){vars.loading = false;}
            if (current.Xaxis >= -37.635 && current.Xaxis <= -37.634 && current.Zaxis >= -40.915 && current.Zaxis <= -40.910){vars.loading = false;}
            if (current.Xaxis >= -19.315 && current.Xaxis <= -19.310 && current.Zaxis >= -35.015 && current.Zaxis <= -35.005){vars.loading = false;}
            if (current.Xaxis >= -23.645 && current.Xaxis <= -23.640 && current.Zaxis >= -43.090 && current.Zaxis <= -43.085){vars.loading = false;}
            if (current.Xaxis >= -29.675 && current.Xaxis <= -29.672 && current.Zaxis >= -47.255 && current.Zaxis <= -47.248){vars.loading = false;}
            if (current.Xaxis >= -12.898 && current.Xaxis <= -12.895 && current.Zaxis >= -26.189 && current.Zaxis <= -26.185){vars.loading = false;}
            if (current.Xaxis >= -0.3645 && current.Xaxis <= -0.36397 && current.Zaxis >= -24.068 && current.Zaxis <= -24.063){vars.loading = false;}
            if (current.Xaxis >= -0.3643 && current.Xaxis <= -0.3634 && current.Zaxis >= -23.068 && current.Zaxis <= -23.063){vars.loading = false;}
            if (current.Xaxis >= -0.3645 && current.Xaxis <= -0.36397 && current.Zaxis >= -22.068 && current.Zaxis <= -22.063){vars.loading = false;}
            if (current.Xaxis >= -1.69 && current.Xaxis <= -1.68 && current.Zaxis >= -19.115 && current.Zaxis <= -19.113){vars.loading = false;}
            if (current.Xaxis >= 7.301 && current.Xaxis <= 7.3017 && current.Zaxis >= -17.699 && current.Zaxis <= -17.698){vars.loading = false;}
            if (current.Xaxis >= 7.301 && current.Xaxis <= 7.3017 && current.Zaxis >= -16.699 && current.Zaxis <= -16.698){vars.loading = false;}
            if (current.Xaxis >= -15.682 && current.Xaxis <= -15.6815 && current.Zaxis >= -1.6575 && current.Zaxis <= -1.6570){vars.loading = false;}
            if (current.Xaxis >= -15.682 && current.Xaxis <= -15.6815 && current.Zaxis >= 0.276 && current.Zaxis <= 0.277){vars.loading = false;}
            if (current.Xaxis >= -15.52 && current.Xaxis <= -15.519 && current.Zaxis >= 20.00 && current.Zaxis <= 20.015 && current.Yaxis <= 26){vars.loading = false;}
            if (current.Xaxis >= -15.52 && current.Xaxis <= -15.519 && current.Zaxis >= 19.00 && current.Zaxis <= 19.015 && current.Yaxis <= 26){vars.loading = false;}
            if (current.Xaxis >= -15.52 && current.Xaxis <= -15.518 && current.Zaxis >= 20.00 && current.Zaxis <= 20.015 && current.Yaxis >= 26){vars.loading = false;}
            if (current.Xaxis >= -15.52 && current.Xaxis <= -15.518 && current.Zaxis >= 19.00 && current.Zaxis <= 19.015 && current.Yaxis >= 26){vars.loading = false;}
            if (current.Xaxis >= -2.345 && current.Xaxis <= -2.340 && current.Zaxis >= 11.97 && current.Zaxis <= 11.98){vars.loading = false;}
            if (current.Xaxis >= -2.345 && current.Xaxis <= -2.340 && current.Zaxis >= 12.97 && current.Zaxis <= 12.98){vars.loading = false;}
            if (current.Xaxis >= -8.598 && current.Xaxis <= -8.596 && current.Zaxis >= 34.37 && current.Zaxis <= 37.38){vars.loading = false;}
            if (current.Xaxis >= -18.508 && current.Xaxis <= -18.505 && current.Zaxis >= 53.605 && current.Zaxis <= 53.608){vars.loading = false;}
            if (current.Xaxis >= 12.67 && current.Xaxis <= 12.675 && current.Zaxis >= 46.94 && current.Zaxis <= 46.948){vars.loading = false;}
            if (current.Xaxis >= 19.98 && current.Xaxis <= 20.00 && current.Zaxis >= 33.54 && current.Zaxis <= 33.55){vars.loading = false;}
            if (current.Xaxis >= 36.458 && current.Xaxis <= 36.465 && current.Zaxis >= 31.39 && current.Zaxis <= 31.40){vars.loading = false;}
            if (current.Xaxis >= -20.288 && current.Xaxis <= -20.283 && current.Zaxis >= -82.608 && current.Zaxis <= -82.600){vars.loading = false;}
            if (current.Xaxis >= 45.522 && current.Xaxis <= 45.524 && current.Zaxis >= 30.85 && current.Zaxis <= 30.855){vars.loading = false;}
            if (current.Xaxis >= 46.10 && current.Xaxis <= 46.102 && current.Zaxis >= 46.88 && current.Zaxis <= 46.885){vars.loading = false;}
            if (current.Xaxis >= 59.99 && current.Xaxis <= 59.995 && current.Zaxis >= 53.28 && current.Zaxis <= 53.285){vars.loading = false;}
            if (current.Xaxis >= 76.541 && current.Xaxis <= 76.545 && current.Zaxis >= 49.681 && current.Zaxis <= 49.683){vars.loading = false;}
            if (current.Xaxis >= 71.633 && current.Xaxis <= 71.635 && current.Zaxis >= 42.983 && current.Zaxis <= 42.985){vars.loading = false;}
            if (current.Xaxis >= 81.40 && current.Xaxis <= 81.41 && current.Zaxis >= 29.225 && current.Zaxis <= 29.228){vars.loading = false;}
            if (current.Xaxis >= 81.40 && current.Xaxis <= 81.41 && current.Zaxis >= 28.225 && current.Zaxis <= 28.228){vars.loading = false;}
            if (current.Xaxis >= 19.396 && current.Xaxis <= 19.698 && current.Zaxis >= 45.08 && current.Zaxis <= 45.085){vars.loading = false;}
            if (current.Xaxis >= -30.795 && current.Xaxis <= -30.792 && current.Zaxis >= 48.65 && current.Zaxis <= 48.67){vars.loading = false;}
        }
        if(current.Map == "PRESENCE_SCI_HUB") // SciMed Tower (Crisis)
        {
            if (current.Xaxis >= -11.565 && current.Xaxis <= -11.5634 && current.Zaxis >= 37.523 && current.Zaxis <= 37.527){vars.loading = false;}
            if (current.Xaxis >= -10.688 && current.Xaxis <= -10.686 && current.Zaxis >= 53.295 && current.Zaxis <= 53.299){vars.loading = false;}
            if (current.Xaxis >= 11.812 && current.Xaxis <= 11.8125 && current.Zaxis >= 53.295 && current.Zaxis <= 53.297){vars.loading = false;}
            if (current.Xaxis >= 10.685 && current.Xaxis <= 10.688 && current.Zaxis >= 37.521 && current.Zaxis <= 37.524){vars.loading = false;}
            if (current.Xaxis >= 22.558 && current.Xaxis <= 22.565 && current.Zaxis >= 72.545 && current.Zaxis <= 72.55){vars.loading = false;}
            if (current.Xaxis >= 21.558 && current.Xaxis <= 21.565 && current.Zaxis >= 72.545 && current.Zaxis <= 72.55){vars.loading = false;}
            if (current.Xaxis >= 21.430 && current.Xaxis <= 21.435 && current.Zaxis >= 53.273 && current.Zaxis <= 53.278){vars.loading = false;}
            if (current.Xaxis >= 22.430 && current.Xaxis <= 22.435 && current.Zaxis >= 53.273 && current.Zaxis <= 53.278){vars.loading = false;}
        }
        if(current.Map == "PRESENCE_SCI_HOSPITAL_UPPER") // Crisis Stabilization (Crisis)
        {
            if (current.Xaxis >= 58.282 && current.Xaxis <= 58.283 && current.Zaxis >= -30.495 && current.Zaxis <= -30.494){vars.loading = false;}
            if (current.Xaxis >= 48.773 && current.Xaxis <= 48.775 && current.Zaxis >= -37.029 && current.Zaxis <= -37.026){vars.loading = false;}
            if (current.Xaxis >= 46.853 && current.Xaxis <= 46.8548 && current.Zaxis >= -48.278 && current.Zaxis <= -48.277){vars.loading = false;}
            if (current.Xaxis >= 40.848 && current.Xaxis <= 40.849 && current.Zaxis >= -55.085 && current.Zaxis <= -55.080){vars.loading = false;}
            if (current.Xaxis >= 53.3865 && current.Xaxis <= 53.3875 && current.Zaxis >= -57.705 && current.Zaxis <= -57.701){vars.loading = false;}
            if (current.Xaxis >= 64.554 && current.Xaxis <= 64.5555 && current.Zaxis >= -59.625 && current.Zaxis <= -59.621){vars.loading = false;}
            if (current.Xaxis >= 64.93 && current.Xaxis <= 64.94 && current.Zaxis >= -63.105 && current.Zaxis <= -63.10){vars.loading = false;}
            if (current.Xaxis >= 43.586 && current.Xaxis <= 43.588 && current.Zaxis >= -60.718 && current.Zaxis <= -60.714){vars.loading = false;}
            if (current.Xaxis >= 42.879 && current.Xaxis <= 42.880 && current.Zaxis >= -60.009 && current.Zaxis <= -60.007){vars.loading = false;}
            if (current.Xaxis >= 32.56 && current.Xaxis <= 32.568 && current.Zaxis >= -50.61 && current.Zaxis <= -50.604){vars.loading = false;}
            if (current.Xaxis >= 29.64 && current.Xaxis <= 29.645 && current.Zaxis >= -53.723 && current.Zaxis <= -53.722){vars.loading = false;}
            if (current.Xaxis >= 24.392 && current.Xaxis <= 24.395 && current.Zaxis >= -74.94 && current.Zaxis <= -74.935){vars.loading = false;}
            if (current.Xaxis >= 23.082 && current.Xaxis <= 23.084 && current.Zaxis >= -71.815 && current.Zaxis <= -71.811){vars.loading = false;}
            if (current.Xaxis >= -9.688 && current.Xaxis <= -9.685 && current.Zaxis >= -56.155 && current.Zaxis <= -56.151){vars.loading = false;}
            if (current.Xaxis >= 6.073 && current.Xaxis <= 6.074 && current.Zaxis >= -48.16 && current.Zaxis <= -48.155){vars.loading = false;}
            if (current.Xaxis >= 23.36 && current.Xaxis <= 23.365 && current.Zaxis >= -51.439 && current.Zaxis <= -51.434){vars.loading = false;}
            if (current.Xaxis >= 22.8135 && current.Xaxis <= 22.8145 && current.Zaxis >= -52.615 && current.Zaxis <= -52.614){vars.loading = false;}
            if (current.Xaxis >= 23.688 && current.Xaxis <= 23.69 && current.Zaxis >= -56.385 && current.Zaxis <= -56.380){vars.loading = false;}
            if (current.Xaxis >= 19.277 && current.Xaxis <= 19.279 && current.Zaxis >= -58.813 && current.Zaxis <= -58.812){vars.loading = false;}
            if (current.Xaxis >= 10.7135 && current.Xaxis <= 10.715 && current.Zaxis >= -44.588 && current.Zaxis <= -44.5865){vars.loading = false;}
            if (current.Xaxis >= 26.85 && current.Xaxis <= 26.855 && current.Zaxis >= -31.788 && current.Zaxis <= -31.7865){vars.loading = false;}
            if (current.Xaxis >= 12.75 && current.Xaxis <= 12.755 && current.Zaxis >= -34.687 && current.Zaxis <= -34.684){vars.loading = false;}
            if (current.Xaxis >= -9.14 && current.Xaxis <= -9.13 && current.Zaxis >= -28.745 && current.Zaxis <= -28.741){vars.loading = false;}
            if (current.Xaxis >= -9.14 && current.Xaxis <= -9.13 && current.Zaxis >= -27.765 && current.Zaxis <= -27.750){vars.loading = false;}
            if (current.Xaxis >= -4.638 && current.Xaxis <= -4.635 && current.Zaxis >= -23.438 && current.Zaxis <= -23.435){vars.loading = false;}
            if (current.Xaxis >= 35.634 && current.Xaxis <= 35.637 && current.Zaxis >= -29.566 && current.Zaxis <= -26.564){vars.loading = false;}
            if (current.Xaxis >= 33.884 && current.Xaxis <= 33.886 && current.Zaxis >= -38.068 && current.Zaxis <= -38.063){vars.loading = false;}
            if (current.Xaxis >= 45.658 && current.Xaxis <= 45.665 && current.Zaxis >= -20.345 && current.Zaxis <= -20.340){vars.loading = false;}
            if (current.Xaxis >= 54.84 && current.Xaxis <= 54.85 && current.Zaxis >= -19.81 && current.Zaxis <= -19.80){vars.loading = false;}
            if (current.Xaxis >= 49.685 && current.Xaxis <= 49.692 && current.Zaxis >= -15.068 && current.Zaxis <= -15.062){vars.loading = false;}
            if (current.Xaxis >= 50.66 && current.Xaxis <= 50.67 && current.Zaxis >= -15.0665 && current.Zaxis <= -15.0650){vars.loading = false;}
            if (current.Xaxis >= 26.685 && current.Xaxis <= 26.689 && current.Zaxis >= -10.135 && current.Zaxis <= -10.130){vars.loading = false;}
            if (current.Xaxis >= 25.685 && current.Xaxis <= 25.689 && current.Zaxis >= -10.135 && current.Zaxis <= -10.130){vars.loading = false;}
            if (current.Xaxis >= 22.57 && current.Xaxis <= 22.58 && current.Zaxis >= -1.446 && current.Zaxis <= -1.443){vars.loading = false;}
            if (current.Xaxis >= 44.18 && current.Xaxis <= 44.19 && current.Zaxis >= 6.468 && current.Zaxis <= 6.475){vars.loading = false;}
            if (current.Xaxis >= 39.05 && current.Xaxis <= 39.06 && current.Zaxis >= 5.00 && current.Zaxis <= 5.01){vars.loading = false;}
        }
        if(current.Map == "PRESENCE_SCI_HOSPITAL_LOWER") // San Cristobal Medical (Medical)
        {
            if (current.Xaxis >= -14.8 && current.Xaxis <= -14.79 && current.Zaxis >= -1.855 && current.Zaxis <= -1.850){vars.loading = false;}
            if (current.Xaxis >= -27.415 && current.Xaxis <= -27.410 && current.Zaxis >= -8.345 && current.Zaxis <= -8.335){vars.loading = false;}
            if (current.Xaxis >= -12.695 && current.Xaxis <= -12.690 && current.Zaxis >= -16.021 && current.Zaxis <= -16.017){vars.loading = false;}
            if (current.Xaxis >= -6.87 && current.Xaxis <= -6.865 && current.Zaxis >= -22.315 && current.Zaxis <= -22.314){vars.loading = false;}
            if (current.Xaxis >= -29.78 && current.Xaxis <= -29.775 && current.Zaxis >= -23.89 && current.Zaxis <= -23.88){vars.loading = false;}
            if (current.Xaxis >= -25.01 && current.Xaxis <= -24.995 && current.Zaxis >= -11.05 && current.Zaxis <= -11.045){vars.loading = false;}
            if (current.Xaxis >= -18.87 && current.Xaxis <= -18.863 && current.Zaxis >= -0.565 && current.Zaxis <= -0.559){vars.loading = false;}
            if (current.Xaxis >= -12.208 && current.Xaxis <= -12.202 && current.Zaxis >= -34.757 && current.Zaxis <= -34.753){vars.loading = false;}
            if (current.Xaxis >= -17.89 && current.Xaxis <= -17.88 && current.Zaxis >= -34.44 && current.Zaxis <= -34.43){vars.loading = false;}
            if (current.Xaxis >= 0.584 && current.Xaxis <= 0.585 && current.Zaxis >= -16.18 && current.Zaxis <= -16.17){vars.loading = false;}
            if (current.Xaxis >= 4.13 && current.Xaxis <= 4.14 && current.Zaxis >= -17.067 && current.Zaxis <= -17.06){vars.loading = false;}
            if (current.Xaxis >= 0.933 && current.Xaxis <= 0.9348 && current.Zaxis >= -31.639 && current.Zaxis <= -31.634){vars.loading = false;}
            if (current.Xaxis >= 23.19 && current.Xaxis <= 23.197 && current.Zaxis >= -33.678 && current.Zaxis <= -33.673){vars.loading = false;}
            if (current.Xaxis >= 31.81 && current.Xaxis <= 31.815 && current.Zaxis >= -34.44 && current.Zaxis <= -34.435){vars.loading = false;}
            if (current.Xaxis >= 42.363 && current.Xaxis <= 42.368 && current.Zaxis >= -19.96 && current.Zaxis <= -19.94){vars.loading = false;}
            if (current.Xaxis >= 53.635 && current.Xaxis <= 53.64 && current.Zaxis >= -16.575 && current.Zaxis <= -16.570){vars.loading = false;}
            if (current.Xaxis >= 35.062 && current.Xaxis <= 35.066 && current.Zaxis >= 9.87 && current.Zaxis <= 9.872){vars.loading = false;}
            if (current.Xaxis >= 32.185 && current.Xaxis <= 32.19 && current.Zaxis >= -12.389 && current.Zaxis <= -12.388){vars.loading = false;}
            if (current.Xaxis >= 13.187 && current.Xaxis <= 13.1875 && current.Zaxis >= -18.425 && current.Zaxis <= -18.419){vars.loading = false;}
            if (current.Xaxis >= 7.1355 && current.Xaxis <= 7.1365 && current.Zaxis >= 7.66 && current.Zaxis <= 7.67){vars.loading = false;}
            if (current.Xaxis >= 11.568 && current.Xaxis <= 11.571 && current.Zaxis >= 9.875 && current.Zaxis <= 9.878){vars.loading = false;}
            if (current.Xaxis >= 14.115 && current.Xaxis <= 14.117 && current.Zaxis >= 2.56 && current.Zaxis <= 2.561){vars.loading = false;}
            if (current.Xaxis >= 26.355 && current.Xaxis <= 26.362 && current.Zaxis >= 2.430 && current.Zaxis <= 2.435){vars.loading = false;}
            if (current.Xaxis >= 33.56 && current.Xaxis <= 33.57 && current.Zaxis >= -20.114 && current.Zaxis <= -20.113){vars.loading = false;}
            if (current.Xaxis >= 27.56 && current.Xaxis <= 27.568 && current.Zaxis >= -18.618 && current.Zaxis <= -18.613){vars.loading = false;}
            if (current.Xaxis >= 85.843 && current.Xaxis <= 85.844 && current.Zaxis >= -57.626 && current.Zaxis <= -57.625){vars.loading = false;}
        }
        if(current.Map == "PRESENCE_TECH_RND") // Gemini Exoplanets (Gemini)
        {
            if (current.Xaxis >= 5.749 && current.Xaxis <= 5.750 && current.Zaxis >= 18.635 && current.Zaxis <= 18.637){vars.loading = false;}
            if (current.Xaxis >= -1.604 && current.Xaxis <= -1.602 && current.Zaxis >= 25.095 && current.Zaxis <= 25.1){vars.loading = false;}
            if (current.Xaxis >= -14.6779 && current.Xaxis <= -14.677 && current.Zaxis >= 21.575 && current.Zaxis <= 21.5755){vars.loading = false;}
            if (current.Xaxis >= 3.122 && current.Xaxis <= 3.1225 && current.Zaxis >= 51.728 && current.Zaxis <= 51.729){vars.loading = false;}
            if (current.Xaxis >= 2.1185 && current.Xaxis <= 2.12 && current.Zaxis >= 45.082 && current.Zaxis <= 45.085){vars.loading = false;}
            if (current.Xaxis >= 2.01 && current.Xaxis <= 2.0105 && current.Zaxis >= 38.5 && current.Zaxis <= 38.56){vars.loading = false;}
            if (current.Xaxis >= 1.77 && current.Xaxis <= 1.777 && current.Zaxis >= 41.0 && current.Zaxis <= 41.015){vars.loading = false;}
            if (current.Xaxis >= -23.308 && current.Xaxis <= -23.306 && current.Zaxis >= 56.88 && current.Zaxis <= 56.89){vars.loading = false;}
            if (current.Xaxis >= -22.495 && current.Xaxis <= -22.494 && current.Zaxis >= 52.08 && current.Zaxis <= 52.09){vars.loading = false;}
            if (current.Xaxis >= -43.885 && current.Xaxis <= -43.882 && current.Zaxis >= 58.107 && current.Zaxis <= 58.11){vars.loading = false;}
            if (current.Xaxis >= -57.439 && current.Xaxis <= -57.435 && current.Zaxis >= 59.10 && current.Zaxis <= 59.11){vars.loading = false;}
            if (current.Xaxis >= -37.562 && current.Xaxis <= -37.56 && current.Zaxis >=75.33 && current.Zaxis <= 75.34){vars.loading = false;}
            if (current.Xaxis >= -39.728 && current.Xaxis <= -39.723 && current.Zaxis >= 71.515 && current.Zaxis <= 71.519){vars.loading = false;}
            if (current.Xaxis >= -12.219 && current.Xaxis <= -12.2175 && current.Zaxis >= 80.895 && current.Zaxis <= 80.905){vars.loading = false;}
            if (current.Xaxis >= -12.362 && current.Xaxis <= -12.360 && current.Zaxis >= 66.65 && current.Zaxis <= 66.66){vars.loading = false;}
            if (current.Xaxis >= -12.91 && current.Xaxis <= -12.899 && current.Zaxis >= 87.39 && current.Zaxis <= 87.395){vars.loading = false;}
            if (current.Xaxis >= -7.66 && current.Xaxis <= -7.658 && current.Zaxis >= 101.13 && current.Zaxis <= 101.15){vars.loading = false;}
            if (current.Xaxis >= -21.834 && current.Xaxis <= -21.832 && current.Zaxis >= 94.671 && current.Zaxis <= 94.675){vars.loading = false;}
            if (current.Xaxis >= -29.3635 && current.Xaxis <= -29.3625 && current.Zaxis >= 78.039 && current.Zaxis <= 78.043){vars.loading = false;}
            if (current.Xaxis >= 19.122 && current.Xaxis <= 19.1245 && current.Zaxis >= 63.499 && current.Zaxis <= 63.509 && current.Yaxis >= 0.5){vars.loading = false;}
            if (current.Xaxis >= 17.813 && current.Xaxis <= 17.815 && current.Zaxis >= 83.384 && current.Zaxis <= 83.388 && current.Yaxis <= 0.5){vars.loading = false;}
            if (current.Xaxis >= 9.485 && current.Xaxis <= 9.489 && current.Zaxis >= 69.44 && current.Zaxis <= 69.45 && current.Yaxis <= 0.5){vars.loading = false;}
            if (current.Xaxis >= 8.8220 && current.Xaxis <= 8.8225 && current.Zaxis >= 25.262 && current.Zaxis <= 25.266){vars.loading = false;}
            if (current.Xaxis >= -9.41 && current.Xaxis <= -9.40 && current.Zaxis >= 92.64 && current.Zaxis <= 92.65){vars.loading = false;}
            if (current.Xaxis >= -14.6779 && current.Xaxis <= -14.677 && current.Zaxis >= 17.575 && current.Zaxis <= 17.5755){vars.loading = false;}
            if (current.Xaxis >= -1.01 && current.Xaxis <= -1.00 && current.Zaxis >= 64.95 && current.Zaxis <= 65.00){vars.loading = false;}
            if (current.Xaxis >= -2.636 && current.Xaxis <= -2.635 && current.Zaxis >= 72.68 && current.Zaxis <= 72.69){vars.loading = false;}
        }
        if(current.Map == "PRESENCE_TECH_RND_HZDLAB") // Project KG348 (KG348)
        {
            if (current.Xaxis >= -4.852 && current.Xaxis <= -4.850 && current.Zaxis >= 30.56 && current.Zaxis <= 30.562){vars.loading = false;}
            if (current.Xaxis >= -25.959 && current.Xaxis <= -25.957 && current.Zaxis >= -12.747 && current.Zaxis <= -12.744){vars.loading = false;}
            if (current.Xaxis >= -13.187 && current.Xaxis <= -13.185 && current.Zaxis >= 10.135 && current.Zaxis <= 10.137){vars.loading = false;}
            if (current.Xaxis >= 15.693 && current.Xaxis <= 15.694 && current.Zaxis >= 4.108 && current.Zaxis <= 4.11){vars.loading = false;}
            if (current.Xaxis >= 2.873 && current.Xaxis <= 2.875 && current.Zaxis >= 8.77 && current.Zaxis <= 8.774){vars.loading = false;}
            if (current.Xaxis >= -17.597 && current.Xaxis <= -17.59595 && current.Zaxis >= -16.455 && current.Zaxis <= -16.453){vars.loading = false;}
            if (current.Xaxis >= -17.587 && current.Xaxis <= -17.584 && current.Zaxis >= -33.191 && current.Zaxis <= -33.190){vars.loading = false;}
            if (current.Xaxis >= 10.6075 && current.Xaxis <= 10.61 && current.Zaxis >= -33.303 && current.Zaxis <= -33.30){vars.loading = false;}
        }
        if(current.Map == "PRESENCE_SCI_ANDROIDLAB") // Seegson Synthetics (SeegSynths)
        {
            if (current.Xaxis >= -91.606 && current.Xaxis <= -91.604 && current.Zaxis >= 31.85 && current.Zaxis <= 31.853){vars.loading = false;}
            if (current.Xaxis >= -73.435 && current.Xaxis <= -73.434 && current.Zaxis >= 22.34 && current.Zaxis <= 22.348){vars.loading = false;}
            if (current.Xaxis >= -73.9327 && current.Xaxis <= -73.9323 && current.Zaxis >= 10.697 && current.Zaxis <= 10.698){vars.loading = false;}
            if (current.Xaxis >= 6.55 && current.Xaxis <= 6.556 && current.Zaxis >= 29.00 && current.Zaxis <= 29.008){vars.loading = false;}
            if (current.Xaxis >= 19.84 && current.Xaxis <= 19.845 && current.Zaxis >= 31.365 && current.Zaxis <= 31.368){vars.loading = false;}
        }
        if(current.Map == "PRESENCE_TECH_MUTHRCORE") // APOLLO Core (Apollo)
        {
            if (current.Xaxis >= 20.125 && current.Xaxis <= 20.126 && current.Zaxis >= -14.752 && current.Zaxis <= -14.751){vars.loading = false;}
            if (current.Xaxis >= 8.405 && current.Xaxis <= 8.4053 && current.Zaxis >= -26.344 && current.Zaxis <= -26.343){vars.loading = false;}
            if (current.Xaxis >= -3.8246 && current.Xaxis <= -3.8244 && current.Zaxis >= -42.477 && current.Zaxis <= -42.476){vars.loading = false;}
            if (current.Xaxis >= -13.23 && current.Xaxis <= -13.22 && current.Zaxis >= -22.99 && current.Zaxis <= -22.98){vars.loading = false;}
            if (current.Xaxis >= -9.938 && current.Xaxis <= -9.937 && current.Zaxis >= -16.677 && current.Zaxis <= -16.676){vars.loading = false;}
            if (current.Xaxis >= -17.272 && current.Xaxis <= -17.270 && current.Zaxis >= 4.660 && current.Zaxis <= 4.662){vars.loading = false;}
            if (current.Xaxis >= -17.394 && current.Xaxis <= -17.392 && current.Zaxis >= -4.654 && current.Zaxis <= -4.6535){vars.loading = false;}
            if (current.Xaxis >= -13.185 && current.Xaxis <= -13.18395 && current.Zaxis >= 22.982 && current.Zaxis <= 22.984){vars.loading = false;}
            if (current.Xaxis >= -5.1351 && current.Xaxis <= -5.1349 && current.Zaxis >= 42.472 && current.Zaxis <= 42.473){vars.loading = false;}
            if (current.Xaxis >= 8.536 && current.Xaxis <= 8.5366 && current.Zaxis >= 26.340 && current.Zaxis <= 26.343){vars.loading = false;}
        }
        if(current.Map == "PRESENCE_ENG_REACTORCORE") // Reactor Core (Reactor)
        {
            if (current.Xaxis >= -20.704 && current.Xaxis <= -20.703 && current.Zaxis >= -9.282 && current.Zaxis <= -9.281){vars.loading = false;}
            if (current.Xaxis >= -34.997 && current.Xaxis <= -34.995 && current.Zaxis >= -26.997 && current.Zaxis <= -26.995){vars.loading = false;}
            if (current.Xaxis >= -22.637 && current.Xaxis <= -22.636 && current.Zaxis >= -47.796 && current.Zaxis <= -47.793){vars.loading = false;}
            if (current.Xaxis >= -25.207 && current.Xaxis <= -25.204 && current.Zaxis >= -38.592 && current.Zaxis <= -38.589){vars.loading = false;}
            if (current.Xaxis >= -11.394 && current.Xaxis <= -11.39299 && current.Zaxis >= -34.084 && current.Zaxis <= -34.083){vars.loading = false;}
            if (current.Xaxis >= 32.376 && current.Xaxis <= 32.38 && current.Zaxis >= -54.036 && current.Zaxis <= -54.03){vars.loading = false;}
            if (current.Xaxis >= 35.284 && current.Xaxis <= 35.285 && current.Zaxis >= -59.371 && current.Zaxis <= -59.369){vars.loading = false;}
            if (current.Xaxis >= 40.20 && current.Xaxis <= 40.21 && current.Zaxis >= -48.153 && current.Zaxis <= -48.151){vars.loading = false;}
            if (current.Xaxis >= 1.023 && current.Xaxis <= 1.024 && current.Zaxis >= -4.388 && current.Zaxis <= -4.387){vars.loading = false;}
        }
        if(current.Map == "PRESENCE_ENG_ALIEN_NEST") // Reactor Maintainance (Nest)
        {
            if (current.Xaxis >= -46.54 && current.Xaxis <= -46.535 && current.Zaxis >= 27.038 && current.Zaxis <= 27.042){vars.loading = false;}
            if (current.Xaxis >= -37.886 && current.Xaxis <= -37.885 && current.Zaxis >= 21.54 && current.Zaxis <= 21.55){vars.loading = false;}
            if (current.Xaxis >= -40.83 && current.Xaxis <= -40.826 && current.Zaxis >= 41.95 && current.Zaxis <= 41.952){vars.loading = false;}
            if (current.Xaxis >= -16.705 && current.Xaxis <= -16.703 && current.Zaxis >= 28.63 && current.Zaxis <= 28.64){vars.loading = false;}
            if (current.Xaxis >= -20.7399 && current.Xaxis <= -20.739 && current.Zaxis >= 37.893 && current.Zaxis <= 37.8933){vars.loading = false;}
            if (current.Xaxis >= -23.671 && current.Xaxis <= -23.670 && current.Zaxis >= 10.62 && current.Zaxis <= 10.621){vars.loading = false;}
            if (current.Xaxis >= -35.253 && current.Xaxis <= -35.252 && current.Zaxis >= 5.92 && current.Zaxis <= 5.925){vars.loading = false;}
            if (current.Xaxis >= -44.882 && current.Xaxis <= -44.880 && current.Zaxis >= -1.539 && current.Zaxis <= -1.537){vars.loading = false;}
            if (current.Xaxis >= -4.316 && current.Xaxis <= -4.315 && current.Zaxis >= -10.261 && current.Zaxis <= -10.260){vars.loading = false;}
            if (current.Xaxis >= -11.483 && current.Xaxis <= -11.481 && current.Zaxis >= -16.893 && current.Zaxis <= -16.891){vars.loading = false;}
            if (current.Xaxis >= -59.32 && current.Xaxis <= -59.31 && current.Zaxis >= 18.28 && current.Zaxis <= 18.29){vars.loading = false;}
        }
        if(current.Map == "PRESENCE_SOLACE") // the Anesidora (Anesidora)
        {
            if (current.Xaxis >= 4.864 && current.Xaxis <= 4.865 && current.Zaxis >= -34.408 && current.Zaxis <= -34.407){vars.loading = false;}
            if (current.Xaxis >= 4.864 && current.Xaxis <= 4.865 && current.Zaxis >= -32.408 && current.Zaxis <= -32.407){vars.loading = false;}
        }
        if(current.Map == "PRESENCE_HAB_CORPORATEPENT") // Habitation (Habitation)
        {
            if (current.Xaxis >= -48.124 && current.Xaxis <= -48.122 && current.Zaxis >= -56.376 && current.Zaxis <= -56.370){vars.loading = false;}
            if (current.Xaxis >= -39.068 && current.Xaxis <= -39.066 && current.Zaxis >= -40.696 && current.Zaxis <= -40.694){vars.loading = false;}
            if (current.Xaxis >= -39.244 && current.Xaxis <= -39.243 && current.Zaxis >= -55.021 && current.Zaxis <= -55.018){vars.loading = false;}
            if (current.Xaxis >= 28.257 && current.Xaxis <= 28.259 && current.Zaxis >= -34.108 && current.Zaxis <= -34.106){vars.loading = false;}
            if (current.Xaxis >= 22.896 && current.Xaxis <= 22.898 && current.Zaxis >= -35.964 && current.Zaxis <= -35.963){vars.loading = false;}
            if (current.Xaxis >= -13.328 && current.Xaxis <= -13.326 && current.Zaxis >= -50.824 && current.Zaxis <= -50.822){vars.loading = false;}
            if (current.Xaxis >= -5.975 && current.Xaxis <= -5.974 && current.Zaxis >= -57.854 && current.Zaxis <= -57.853){vars.loading = false;}
        }
        if(current.Map == "PRESENCE_ENG_TOWPLATFORM") // Towing Platform (Towing)
        {
            if (current.Xaxis >= 17.435 && current.Xaxis <= 17.437 && current.Zaxis >= -0.637 && current.Zaxis <= -0.636){vars.loading = false;}
            if (current.Xaxis >= 5.563 && current.Xaxis <= 5.564 && current.Zaxis >= 19.29 && current.Zaxis <= 19.30){vars.loading = false;}
            if (current.Xaxis >= -17.979 && current.Xaxis <= -17.978 && current.Zaxis >= 6.495 && current.Zaxis <= 6.511){vars.loading = false;}
            if (current.Xaxis >= -18.564 && current.Xaxis <= -18.563 && current.Zaxis >= 0.155 && current.Zaxis <= 0.159){vars.loading = false;}
            if (current.Xaxis >= -0.144 && current.Xaxis <= -0.143 && current.Zaxis >= 24.328 && current.Zaxis <= 24.330 && current.Yaxis >= -16)
            if (current.Xaxis >= 9.56 && current.Xaxis <= 9.562 && current.Zaxis >= 1.44 && current.Zaxis <= 1.45 && current.Yaxis >= -16){vars.loading = false;}
            if (current.Xaxis >= -9.593 && current.Xaxis <= -9.591 && current.Zaxis >= 1.562 && current.Zaxis <= 1.564 && current.Yaxis >= -16){vars.loading = false;}
            if (current.Xaxis >= -8.940 && current.Xaxis <= -8.930 && current.Zaxis >= 19.25 && current.Zaxis <= 19.30){vars.loading = false;}
        }
}
split // Standard AI Autosplitter Code
{
	if (vars.mission != null && current.missionNum > vars.mission){vars.mission = current.missionNum;
		return true;}
	else if (vars.final == true && current.fadeState == 1 && current.gameFlowState == 4){vars.final = false;
		return true;}
}

isLoading
{
	// Pauses the timer when the loading icon is present
	return vars.loading;
}
 
reset{} // EOF