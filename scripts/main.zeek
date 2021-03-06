##! Implements base functionality for NOISE analysis.
##! Generates the Noise.log file.

# Generated by binpac_quickstart

module Noise;

export {
	redef enum Log::ID += { LOG };

	type Info: record {
		## Timestamp for when the event happened.
		ts:     time    &log;
		## Unique ID for the connection.
		uid:    string  &log;
		## The connection's 4-tuple of endpoint addresses/ports.
		id:     conn_id &log;

		# ## TODO: Add other fields here that you'd like to log.
                msg_type:	string &log;
                sender:         string &log &optional;
                receiver:        string &log &optional;
                unenc_ephemeral:    string &log &optional;
                enc_static:    string &log &optional;
                enc_timestamp:    string &log &optional;
                enc_nothing:    string &log &optional;
                nonce:        string &log &optional;
                enc_cookie:    string &log &optional;
                mac1:        string &log &optional;
                mac2:        string &log &optional;
                enc_payload_len:    int &log &optional;
                enc_payload:    string &log &optional;
	};

	## Event that can be handled to access the NOISE record as it is sent on
	## to the loggin framework.
	global log_noise: event(rec: Info);
}

# TODO: The recommended method to do dynamic protocol detection
# (DPD) is with the signatures in dpd.sig. If you can't come up
# with any signatures, then you can do port-based detection by
# uncommenting the following and specifying the port(s):

# const ports = { 1234/udp, 5678/udp };


# redef likely_server_ports += { ports };

event zeek_init() &priority=5
	{
	Log::create_stream(Noise::LOG, [$columns=Info, $ev=log_noise, $path="noise"]);

	}

event noise_initiation(c: connection, sender_index: int, unenc: string, enc_static: string, enc_timestamp: string, mac1: string, mac2: string)
	{
	if ( !c?$service ) { print "NOT SET"; }
        #print "INITIATION PACKET";
	local info: Info;
	info$ts  = network_time();
	info$uid = c$uid;
	info$id  = c$id;
        #local myServcie = join_string_set(c$service,"-");
        #print fmt("Service Length: %d, %s",|c$service|, myService);
        if ( |c$service| == 0 ) {
          add c$service["wireguard"];
          info$sender = fmt("%x",sender_index);
          info$unenc_ephemeral = bytestring_to_hexstr(unenc);
          info$enc_static = bytestring_to_hexstr(enc_static);
          info$enc_timestamp = bytestring_to_hexstr(enc_timestamp);
          info$mac1 = bytestring_to_hexstr(mac1);
          info$mac2 = bytestring_to_hexstr(mac2);
          info$msg_type = "INITIATION";
# 	NOTICE([$note=WireGuard,
#	      $conn = c,
#              $msg = "WireGuard Initiation Match",
#	      $sub = "Place holder"
#	]);
	#print fmt("%x", sender_index);
        #print bytestring_to_hexstr(unenc);
        #print fmt("%s",encode_base64(unenc));
        #print fmt("%s",encode_base64(enc_static));
        #print fmt("%s",encode_base64(enc_timestamp));
        #print bytestring_to_hexstr(mac1);
        #print bytestring_to_hexstr(mac2);
	  Log::write(Noise::LOG, info);
          }
	}

event noise_response(c: connection, sender: int, receiver: int, unenc: string, enc_nothing: string, mac1: string, mac2: string)
{
  #print "";
  #print "RESPONSE PACKET";
  #print fmt("%x",sender);
  #print fmt("%x",receiver);
  #print fmt("%s",encode_base64(unenc));
  local info: Info;
  info$ts  = network_time();
  info$uid = c$uid;
  info$id = c$id;
  info$msg_type = "RESPONSE";
  info$sender = fmt("%x", sender);
  info$receiver = fmt("%x",receiver);
  info$unenc_ephemeral = bytestring_to_hexstr(unenc);
  info$enc_nothing = bytestring_to_hexstr(enc_nothing);
  info$mac1 = bytestring_to_hexstr(mac1);
  info$mac2 = bytestring_to_hexstr(mac2);
#        info$id  = c$id;
#        print x;
#        print fmt("%x", sender_index);
#        print fmt("%x",unenc);
        Log::write(Noise::LOG, info);
        }

event noise_cookie(c: connection, receiver: int) {
	print "COOKIE PACKET";
	print fmt("%x",receiver);
}

event noise_transport(c: connection, receiver: int, icount: int) {
	#print "TRANSPSORT PACKET";
        #print fmt("%x", receiver);
	#print icount;
}
