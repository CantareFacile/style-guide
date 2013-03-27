require "spec_helper"

describe StyleGuide::InstallGenerator do
  describe "#install" do
    before do
      subject.stub(:gem)
      subject.stub(:route)
      subject.stub(:bundle_command)
      subject.stub(:application)
      Rack.stub(:const_get).and_return("constant")
      subject.stub(:routes_rb).and_return("mount StyleGuide::Engine")
      subject.stub(:application_rb).and_return("config.style_guide.paths")
    end

    describe "rails configuration" do
      context "when style guide is not configured in application.rb" do
        before { subject.stub(:application_rb).and_return("") }

        it "adds an entry for style guide partial paths" do
          subject.should_receive(:application).once do |config, options|
            options.should == nil
            config.should include "config.style_guide.paths"
            config.should include subject.default_partial_path
          end
          subject.install
        end
      end

      context "when style guide is configured in application.rb" do
        before { subject.stub(:application_rb).and_return("config.style_guide.paths") }

        it "does not modify application.rb" do
          subject.should_not_receive(:application)
          subject.install
        end
      end
    end

    describe "mounting" do
      context "when style guide is not mounted" do
        before { subject.stub(:routes_rb).and_return("") }

        it "mounts the style guide" do
          subject.should_receive(:route).with('mount StyleGuide::Engine => "/style-guide" if defined?(StyleGuide)')
          subject.install
        end
      end

      context "when style guide is not mounted" do
        before { subject.stub(:routes_rb).and_return("mount StyleGuide::Engine") }

        it "does not mount the style guide" do
          subject.should_not_receive(:route)
          subject.install
        end
      end
    end
  end
end
