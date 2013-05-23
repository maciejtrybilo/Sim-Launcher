module SimLauncher
  class DirectClient
    def initialize( app_path, sdk, family, tall = false )
      @app_path = File.expand_path( app_path )
      @sdk = sdk
      @family = family
      @tall = tall
    end

    def self.for_ipad_app( app_path, sdk = nil )
      self.new( app_path, sdk, 'ipad' )
    end

    def self.for_iphone_app( app_path, sdk = nil )
      self.new( app_path, sdk, 'iphone' )
    end

    def self.for_iphone4in_app( app_path, sdk = nil )
      self.new( app_path, sdk, 'iphone', true )
    end

    def launch
      SimLauncher::Simulator.new.launch_ios_app( @app_path, @sdk, @family, @tall )
    end

    def rotate_left
      simulator = SimLauncher::Simulator.new
      simulator.rotate_left
    end
    
    def rotate_right
      simulator = SimLauncher::Simulator.new
      simulator.rotate_right
    end



    def relaunch
      simulator = SimLauncher::Simulator.new
      simulator.quit_simulator
      simulator.launch_ios_app( @app_path, @sdk, @family, @tall )
    end
  end
end
