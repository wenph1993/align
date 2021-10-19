require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { User.first }

  describe 'tasks' do
    let(:new_task) {
      build(:task, user_id: user.id, description: "rdadfasdfa#{rand(1000)}", status: Task.statuses[:start], import: [true, false].sample, urgent: [true, false].sample)
    }
    let(:start_task) { Task.where(status: Task.statuses[:start]).first }
    let(:process_task) { Task.where(status: Task.statuses[:process]).first }
    it 'create user tasks' do
      expect(new_task.save).to eq true
    end

    it 'tasks from start to process' do
      expect(start_task.update(status: Task.statuses[:process])).to eq true
    end

    it 'tasks from process to done' do
      expect(process_task.update(status: Task.statuses[:done])).to eq true
    end
  end
end
