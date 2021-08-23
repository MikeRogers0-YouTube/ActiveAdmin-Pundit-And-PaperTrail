require "rails_helper"

RSpec.describe Post::PublishForm do
  let(:instance) { build(:post_publish_form) }

  describe "#published?" do
    it do
      expect { instance.post.published_at = Time.zone.now }.to change { instance.published? }.from(false).to(true)
    end
  end

  describe "#save" do
    subject { instance.save }

    context "with valid data" do
      it do
        is_expected.to eq(true)
      end

      it do
        expect{ subject }.to change{instance.post.published_at}.from(nil).to(Time)
          .and have_enqueued_job(Post::SyndicateJob).with(instance.post)
      end
    end

    context "with invalid data" do
      let(:instance) { build(:post_publish_form, terms_of_service: "0") }

      it do
        is_expected.to eq(false)
      end

      it do
        expect{ subject }.to_not change{instance.post.published_at}
        expect(Post::SyndicateJob).to_not have_been_enqueued
      end
    end
  end
end
