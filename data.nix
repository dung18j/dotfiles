{ ... }:
{
  fileSystems."/data" =
    { 
    	device = "/dev/disk/by-label/data";
      	fsType = "ext4";
    };
  
  fileSystems."/home/dun/Downloads" =
    { 
    	device = "/data/Downloads";
	options = [ "bind" ];
    };

  fileSystems."/home/dun/Documents" =
    { 
    	device = "/data/Dropbox/Documents";
	options = [ "bind" ];
    };

  fileSystems."/home/dun/Pictures" =
    { 
    	device = "/data/Dropbox/Pictures";
	options = [ "bind" ];
    };

  fileSystems."/home/dun/Music" =
    { 
    	device = "/data/Music";
	options = [ "bind" ];
    };

  fileSystems."/home/dun/Videos" =
    { 
    	device = "/data/Videos";
	options = [ "bind" ];
    };

  fileSystems."/home/dun/repos" =
    { 
    	device = "/data/repos";
	options = [ "bind" ];
    };

  fileSystems."/home/dun/Templates" =
    { 
    	device = "/data/Dropbox/Templates";
	options = [ "bind" ];
    };
}
