require "zbase32/version"

module ZBase32
  MNET32 = 'ybndrfg8ejkmcpqxot1uwisza345h769'

  extend self

  def encode(bytes)
    to_5bit(bytes).map { |value| MNET32[value] }.join('')
  end

  def decode(bytes)
    from_5bit(bytes.split('').map { |chr| MNET32.index(chr) }).pack('c*')
  end

  private

  def get_bit(byte, offset)
    (byte >> offset) & 0x01
  end

  def to_5bit(ab)
    bytes = ab.bytes.to_a.reverse

    bit_count = 0
    chunks = []
    current_chunk = 0
    bytes.each do |b|
      8.times do |j|
        current_chunk = (current_chunk >> 1) | (get_bit(b, j) << 4)
        bit_count += 1
        next unless bit_count > 4

        bit_count = 0
        chunks.push(current_chunk)
        current_chunk = 0
      end
    end

    chunks.push(current_chunk >> (5 - bit_count)) if bit_count > 0

    chunks.reverse
  end

  def from_5bit(ab)
    chunks = ab.reverse

    bit_count = 0
    bytes = []
    current_byte = 0
    chunks.each do |chunk|
      5.times do |j|
        current_byte = (current_byte >> 1) | (get_bit(chunk, j) << 7)
        bit_count += 1
        next unless bit_count > 7

        bit_count = 0
        bytes.push(current_byte)
        current_byte = 0
      end
    end

    bytes.reverse
  end
end
