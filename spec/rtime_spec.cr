require "spec"
require "../rtime"

describe "rtime" do
  describe "with past timestamps" do
    it "formats seconds correctly" do
      now = Time.utc
      timestamp = (now - 30.seconds).to_unix
      rtime(timestamp).should eq "30 seconds ago"
    end

    it "formats single second correctly" do
      now = Time.utc
      timestamp = (now - 1.second).to_unix
      rtime(timestamp).should eq "1 second ago"
    end

    it "formats minutes correctly" do
      now = Time.utc
      timestamp = (now - 5.minutes).to_unix
      rtime(timestamp).should eq "5 minutes ago"
    end

    it "formats single minute correctly" do
      now = Time.utc
      timestamp = (now - 1.minute).to_unix
      rtime(timestamp).should eq "1 minute ago"
    end

    it "formats hours correctly" do
      now = Time.utc
      timestamp = (now - 3.hours).to_unix
      rtime(timestamp).should eq "3 hours ago"
    end

    it "formats single hour correctly" do
      now = Time.utc
      timestamp = (now - 1.hour).to_unix
      rtime(timestamp).should eq "1 hour ago"
    end

    it "formats days correctly" do
      now = Time.utc
      timestamp = (now - 4.days).to_unix
      rtime(timestamp).should eq "4 days ago"
    end

    it "formats single day correctly" do
      now = Time.utc
      timestamp = (now - 1.day).to_unix
      rtime(timestamp).should eq "1 day ago"
    end

    it "formats weeks correctly" do
      now = Time.utc
      timestamp = (now - 2.weeks).to_unix
      rtime(timestamp).should eq "2 weeks ago"
    end

    it "formats single week correctly" do
      now = Time.utc
      timestamp = (now - 1.week).to_unix
      rtime(timestamp).should eq "1 week ago"
    end

    it "formats months correctly" do
      now = Time.utc
      timestamp = (now - 60.days).to_unix
      rtime(timestamp).should eq "2 months ago"
    end

    it "formats single month correctly" do
      now = Time.utc
      timestamp = (now - 30.days).to_unix
      rtime(timestamp).should eq "1 month ago"
    end

    it "formats years correctly" do
      now = Time.utc
      timestamp = (now - 730.days).to_unix
      rtime(timestamp).should eq "2 years ago"
    end

    it "formats single year correctly" do
      now = Time.utc
      timestamp = (now - 365.days).to_unix
      rtime(timestamp).should eq "1 year ago"
    end
  end

  describe "with future timestamps" do
    it "returns 'in the future' for future timestamps" do
      now = Time.utc
      timestamp = (now + 1.hour).to_unix
      rtime(timestamp).should eq "in the future"
    end
  end

  describe "edge cases" do
    it "handles 0 seconds correctly" do
      now = Time.utc
      timestamp = now.to_unix
      rtime(timestamp).should eq "0 seconds ago"
    end

    it "handles boundary between seconds and minutes" do
      now = Time.utc
      timestamp = (now - 59.seconds).to_unix
      rtime(timestamp).should eq "59 seconds ago"
    end

    it "handles boundary between minutes and hours" do
      now = Time.utc
      timestamp = (now - 59.minutes).to_unix
      rtime(timestamp).should eq "59 minutes ago"
    end

    it "handles boundary between hours and days" do
      now = Time.utc
      timestamp = (now - 23.hours).to_unix
      rtime(timestamp).should eq "23 hours ago"
    end
  end
end
