#!/usr/bin/env ruby

$:.unshift(File.join(File.dirname(__FILE__), '..', '..', '..'))

require 'rex/test'
require 'rex/proto/dcerpc/packet'

class Rex::Proto::DCERPC::Packet::UnitTest < Test::Unit::TestCase

	Klass = Rex::Proto::DCERPC::Packet

	def test_parse

		actual = Klass.make_bind('367abb81-9844-35f1-ad32-98f038001003', '2.0')
		expected = ["\005\000\v\003\020\000\000\000H\000\000\000\000\000\000\000\320\026\320\026\000\000\000\000\001\000\000\000\000\000\001\000\201\273z6D\230\3615\2552\230\3608\000\020\003\002\000\000\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000", 0]
		assert_equal(expected, actual, 'bind')

		srand(0)
		actual = Klass.make_bind_fake_multi('367abb81-9844-35f1-ad32-98f038001003', '2.0')
		expected = [ "\005\000\v\003\020\000\000\0004\003\000\000\000\000\000\000\320\026\320\026\000\000\000\000\022\000\000\000\000\000\001\000u\300C\373\303g\t\323\025\362$WF\330X\214\002\000\001\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\001\000\001\000\346'W\256XQ\245\031MH\t\224s\320\363\305\000\000\002\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\002\000\001\000c\330\261\363\035\223\223\216\247 \301\t\271\177 \037\002\000\000\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\003\000\001\000\227\243\376\313r\267\034\"\200\200\2445\205&\350\364\001\000\003\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\004\000\001\000\204i*\272\037x\001A\347\2519#fw\v\256\002\000\003\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\005\000\001\000\200\216c5\214y\252T\313D\006\304/\177\364\203\004\000\000\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\006\000\001\000\264\350N\217\224\343\272\027\317\215uU01E\251\003\000\000\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\a\000\001\000_\305^\000q\262$\2420]\203b*\315p\347\005\000\001\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\010\000\001\000\177\000\212r+\272\177\027\273\202yb>\243\336{\003\000\002\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\t\000\001\000\256\343\224\3212\233\016):\301$\nV+h\v\002\000\003\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\n\000\001\000P \266\200&\023\256*s\270\274\350M\036\030}\002\000\003\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\v\000\001\000^\342k\rp(H\023_H\232\302\370\264C\354\005\000\002\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\f\000\001\000`\004\303\355\213\374V\315ymK\270\020\230\235\225\001\000\000\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\r\000\001\000\274yvu\275S\241h\240\344\373\373yF\325\037\005\000\003\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\016\000\001\000\201\273z6D\230\3615\2552\230\3608\000\020\003\002\000\000\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\017\000\001\000\270\230O)\022(\266\317\v\246o]\371\201\337v\004\000\000\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\020\000\001\000}\030C\322\357\003\352\314\346#\326\376\275\305\327+\000\000\003\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000\021\000\001\000h\324\212\266\353\245}\234o\350\002\e\323\331\2275\003\000\002\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000", 14]
		assert_equal(expected, actual, 'bind fake multi')

		actual = Klass.make_alter_context('367abb81-9844-35f1-ad32-98f038001003', '2.0')
		expected = "\005\000\016\003\020\000\000\000H\000\000\000\000\000\000\000\320\026\320\026\000\000\000\000\001\000\000\000\000\000\001\000\201\273z6D\230\3615\2552\230\3608\000\020\003\002\000\000\000\004]\210\212\353\034\311\021\237\350\010\000+\020H`\002\000\000\000"
		assert_equal(expected, actual, 'alter context')

		actual = Klass.make_request(1337, '', 1024, 7331)
		expected = ["\005\000\000\003\020\000\000\000\030\000\000\000\000\000\000\000\000\000\000\000\243\0349\005"]
		assert_equal(expected, actual, 'make_request with no stub')

		actual = Klass.make_request(1337, 'ABCD', 1024, 7331)
		expected = ["\005\000\000\003\020\000\000\000\034\000\000\000\000\000\000\000\004\000\000\000\243\0349\005ABCD"]
		assert_equal(expected, actual, 'make_request with stub')

		actual = Klass.make_request(1337, 'ABCD', 3, 7331)
		expected = ["\005\000\000\001\020\000\000\000\e\000\000\000\000\000\000\000\003\000\000\000\243\0349\005ABC", "\005\000\000\002\020\000\000\000\031\000\000\000\000\000\000\000\001\000\000\000\243\0349\005D"]
		assert_equal(expected, actual, 'make_request with 2 frags')

		actual = Klass.make_request(1337, 'ABCD', 1, 7331)
		expected = ["\005\000\000\001\020\000\000\000\031\000\000\000\000\000\000\000\001\000\000\000\243\0349\005A", "\005\000\000\000\020\000\000\000\031\000\000\000\000\000\000\000\001\000\000\000\243\0349\005B", "\005\000\000\000\020\000\000\000\031\000\000\000\000\000\000\000\001\000\000\000\243\0349\005C", "\005\000\000\002\020\000\000\000\031\000\000\000\000\000\000\000\001\000\000\000\243\0349\005D"]
		assert_equal(expected, actual, 'make_request with 4 frags')


		actual = Klass.make_request(1337, '', 1024, 7331, '367abb81-9844-35f1-ad32-98f038001003')
		expected = ["\005\000\000\x83\020\000\000\000\030\000\000\000\000\000\000\000\000\000\000\000\243\0349\005\201\273z6D\230\3615\2552\230\3608\000\020\003"]
		assert_equal(expected, actual, 'make_request with no stub, with object_id')

		actual = Klass.make_request(1337, 'ABCD', 1024, 7331, '367abb81-9844-35f1-ad32-98f038001003')
		expected = ["\005\000\000\x83\020\000\000\000\034\000\000\000\000\000\000\000\004\000\000\000\243\0349\005\201\273z6D\230\3615\2552\230\3608\000\020\003ABCD"]
		assert_equal(expected, actual, 'make_request with stub, with object_id')

		actual = Klass.make_request(1337, 'ABCD', 1, 7331, '367abb81-9844-35f1-ad32-98f038001003')
		expected = ["\005\000\000\x81\020\000\000\000\031\000\000\000\000\000\000\000\001\000\000\000\243\0349\005\201\273z6D\230\3615\2552\230\3608\000\020\003A", "\005\000\000\x80\020\000\000\000\031\000\000\000\000\000\000\000\001\000\000\000\243\0349\005\201\273z6D\230\3615\2552\230\3608\000\020\003B", "\005\000\000\x80\020\000\000\000\031\000\000\000\000\000\000\000\001\000\000\000\243\0349\005\201\273z6D\230\3615\2552\230\3608\000\020\003C", "\005\000\000\x82\020\000\000\000\031\000\000\000\000\000\000\000\001\000\000\000\243\0349\005\201\273z6D\230\3615\2552\230\3608\000\020\003D"]
		assert_equal(expected, actual, 'make_request with 4 frags')
	end
end
