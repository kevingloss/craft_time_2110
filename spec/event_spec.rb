require './lib/person'
require './lib/craft'
require './lib/event'

RSpec.describe Event do

  describe '#initialize' do
    before(:each) do
      @craft = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @person = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      @event = Event.new("Carla's Craft Connection", [@craft], [@person])
    end

    it 'exists' do
      expect(@event).to be_an_instance_of(Event)
    end

    it 'has attributes' do
      expect(@event.name).to eq("Carla's Craft Connection")
      expect(@event.crafts).to eq([@craft])
      expect(@event.attendees).to eq([@person])
    end
  end

  describe 'Iteration 2' do
    before(:each) do
      @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1, sewing_needles: 1})
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @event = Event.new("Carla's Craft Connection", [@sewing, @knitting], [@hector, @toni])
    end

    it '#attendee_names' do
      expect(@event.attendee_names).to eq(['Hector', 'Toni'])
    end

    it '#craft_with_most_supplies' do
      expect(@event.craft_with_most_supplies).to eq('sewing')
    end

    it '#supply_list' do
      expect(@event.supply_list).to eq(["fabric", "scissors", "thread", "sewing_needles", "yarn", "knitting_needles"])
    end
  end

  describe 'Iteration 3' do
    before(:each) do
      @hector = Person.new({name: 'Hector', interests: ['sewing', 'millinery', 'drawing']})
      @toni = Person.new({name: 'Toni', interests: ['sewing', 'knitting']})
      @tony = Person.new({name: 'Tony', interests: ['drawing', 'knitting']})
      @knitting = Craft.new('knitting', {yarn: 20, scissors: 1, knitting_needles: 2})
      @sewing = Craft.new('sewing', {fabric: 5, scissors: 1, thread: 1})
      @painting = Craft.new('painting', {canvas: 1, paint_brush: 2, paints: 5})
      @event = Event.new("Carla's Craft Connection", [@knitting, @painting, @sewing], [@hector, @toni, @tony])
    end

    it '#attendees_by_craft_interest' do
      expected = {
        'knitting' => [@toni, @tony],
        'painting' => [],
        'sewing' => [@hector, @toni]
      }

      expect(@event.attendees_by_craft_interest).to eq(expected)
    end

    it '#crafts_that_use' do
      expect(@event.crafts_that_use('scissors')).to eq([@knitting, @sewing])
      expect(@event.crafts_that_use('fire')).to eq([])
    end
  end
end
