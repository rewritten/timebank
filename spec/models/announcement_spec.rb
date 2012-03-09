require 'spec_helper'

describe Announcement do
  context "creating full text index" do
    it "should translate accents" do
      # "ésser bläs ñoñas strauß"
      t = "\xC3\xA9sser bl\xC3\xA4s \xC3\xB1o\xC3\xB1as strau\xC3\x9F".force_encoding("utf-8")
      r = Announcement.new text: t
      r.create_full_text_index
      r.text.should == t
      r.fti.should == %w(esser blas nonas strauss)
    end
  end

  context "scopes" do
    it "should correctly see an open conversation" do
      u1 = User.create email: "uno@bdt.com", password: "12345678"
      u2 = User.create email: "dos@bdt.com", password: "12345678"
      ann = Announcement.create type: "offer", text: "blah blah", user: u1
      ann.conversations = [Conversation.new(interlocutor: u2)]
      Announcement.open(u2).count.should == 1
    end
  end
end
