require 'rspec'

require_relative 'spacecraft' 

RSpec.describe Spacecraft do
  describe '#initialize' do
    it 'sets the initial position and direction' do
      craft = Spacecraft.new(1, 2, 3, 'N')
      expect(craft.position).to eq({ 'x' => 1, 'y' => 2, 'z' => 3 })
      expect(craft.direction).to eq('N')
    end
  end

  describe '#move_forward' do
    it 'moves the spacecraft forward based on north direction' do
      craft = Spacecraft.new(0, 0, 0, 'N')
      craft.move_forward
      expect(craft.position).to eq({ 'x' => 0, 'y' => 1, 'z' => 0 })
    end
    
    it 'moves the spacecraft forward based on south direction' do
      craft = Spacecraft.new(0, 0, 0, 'S')
      craft.move_forward
      expect(craft.position).to eq({ 'x' => 0, 'y' => -1, 'z' => 0 })
    end

    it 'moves the spacecraft forward based on east direction' do
      craft = Spacecraft.new(0, 0, 0, 'E')
      craft.move_forward
      expect(craft.position).to eq({ 'x' => 1, 'y' => 0, 'z' => 0 })
    end

    it 'moves the spacecraft forward based on west direction' do
      craft = Spacecraft.new(0, 0, 0, 'W')
      craft.move_forward
      expect(craft.position).to eq({ 'x' => -1, 'y' => 0, 'z' => 0 })
    end

    it 'moves the spacecraft forward based on down direction' do
      craft = Spacecraft.new(0, 0, 0, 'Down')
      craft.move_forward
      expect(craft.position).to eq({ 'x' => 0, 'y' => 0, 'z' => -1 })
    end

    it 'moves the spacecraft forward based on up direction' do
      craft = Spacecraft.new(0, 0, 0, 'Up')
      craft.move_forward
      expect(craft.position).to eq({ 'x' => 0, 'y' => 0, 'z' => 1 })
    end

  end
  
  describe '#move_backward' do
    it 'moves the spacecraft backward based on north direction' do
      craft = Spacecraft.new(0, 0, 0, 'N')
      craft.move_backward
      expect(craft.position).to eq({ 'x' => 0, 'y' => -1, 'z' => 0 })
    end

    it 'moves the spacecraft backward based on south direction' do
      craft = Spacecraft.new(0, 0, 0, 'S')
      craft.move_backward
      expect(craft.position).to eq({ 'x' => 0, 'y' => 1, 'z' => 0 })
    end

    it 'moves the spacecraft backward based on east direction' do
      craft = Spacecraft.new(0, 0, 0, 'E')
      craft.move_backward
      expect(craft.position).to eq({ 'x' => -1, 'y' => 0, 'z' => 0 })
    end
    
    it 'moves the spacecraft backward based on west direction' do
      craft = Spacecraft.new(0, 0, 0, 'W')
      craft.move_backward
      expect(craft.position).to eq({ 'x' => 1, 'y' => 0, 'z' => 0 })
    end
    
    it 'moves the spacecraft backward based on up direction' do
      craft = Spacecraft.new(0, 0, 0, 'Up')
      craft.move_backward
      expect(craft.position).to eq({ 'x' => 0, 'y' => 0, 'z' => -1 })
    end

    it 'moves the spacecraft backward based on down direction' do
      craft = Spacecraft.new(0, 0, 0, 'Down')
      craft.move_backward
      expect(craft.position).to eq({ 'x' => 0, 'y' => 0, 'z' => 1 })
    end
  end

  describe '#turn_left' do
    it 'moves the spacecraft left based on east direction' do
      craft = Spacecraft.new(0, 0, 0, 'E')
      craft.turn_left
      expect(craft.direction).to eq('N')
    end
    
    it 'moves the spacecraft left based on west direction' do
      craft = Spacecraft.new(0, 0, 0, 'W')
      craft.turn_left
      expect(craft.direction).to eq('S')
    end

    it 'moves the spacecraft left based on north direction' do
      craft = Spacecraft.new(0, 0, 0, 'N')
      craft.turn_left
      expect(craft.direction).to eq('W')
    end

    it 'moves the spacecraft left based on south direction' do
      craft = Spacecraft.new(0, 0, 0, 'S')
      craft.turn_left
      expect(craft.direction).to eq('E')
    end
  end

  describe '#turn_right' do
    it 'moves the spacecraft right based on east direction' do
      craft = Spacecraft.new(0, 0, 0, 'E')
      craft.turn_right
      expect(craft.direction).to eq('S')
    end
    
    it 'moves the spacecraft right based on west direction' do
      craft = Spacecraft.new(0, 0, 0, 'W')
      craft.turn_right
      expect(craft.direction).to eq('N')
    end
    
    it 'moves the spacecraft right based on north direction' do
      craft = Spacecraft.new(0, 0, 0, 'N')
      craft.turn_right
      expect(craft.direction).to eq('E')
    end
    
    it 'moves the spacecraft right based on south direction' do
      craft = Spacecraft.new(0, 0, 0, 'S')
      craft.turn_right
      expect(craft.direction).to eq('W')
    end
  end

  describe '#execute_commands' do
    it 'executes a sequence of commands and updates position and direction' do
      craft = Spacecraft.new(0, 0, 0, 'N')
      commands = ["f", "r", "u", "b", "l"]
      craft.execute_commands(commands)
      expect(craft.position).to eq({ 'x' => 0, 'y' => 1, 'z' => -1 })
      expect(craft.direction).to eq('N')
    end
  end
end