Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4681ED333
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 17:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725810AbgFCPV1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 11:21:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:35900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726050AbgFCPV0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Jun 2020 11:21:26 -0400
Received: from tzanussi-mobl (c-73-211-240-131.hsd1.il.comcast.net [73.211.240.131])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 63D22206A2;
        Wed,  3 Jun 2020 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591197685;
        bh=vvT4i23gbvOoeOEQ0XCGFahp/NNWyT1vHHOKhsnSHy8=;
        h=Subject:From:To:Cc:Date:From;
        b=SZqnUkOEVFoSOuIuuimrBxTb9C6iKnpt9ei/sjXPs3uoqXtHDEWsPG9jwwwXcZspM
         Zn2YKIAJ3Qaxw1CZaY1uO2RR6jxfQtFTIz+j52OINElWS3JjZzrQzV3CJK36RaPm/+
         9/15Bgs6l4OhpcfvZ6SLLcyYKqV06cwril8GFvjE=
Message-ID: <69c291c76964642a417e5dd170d183ba6b552010.camel@kernel.org>
Subject: [PATCH] tracing/doc: Fix ascii-art in histogram-design.rst
From:   Tom Zanussi <zanussi@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Wed, 03 Jun 2020 10:21:24 -0500
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This fixes the Sphinx parallel build error when building htmldocs:

  docutils.utils.SystemMessage: /home/sfr/next/next/Documentation/trace/histogram-design.rst:219: (SEVERE/4) Unexpected section title.

It also fixes a bunch of other warnings I noticed when fixing the
above, caused by mixing ascii-art and text.

Signed-off-by: Tom Zanussi <zanussi@kernel.org>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 Documentation/trace/histogram-design.rst | 48 ++++++++++++------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/Documentation/trace/histogram-design.rst b/Documentation/trace/histogram-design.rst
index 06f5c7e5f2ee..eef840043da9 100644
--- a/Documentation/trace/histogram-design.rst
+++ b/Documentation/trace/histogram-design.rst
@@ -14,7 +14,7 @@ tracing_map.c.
 Note: All the ftrace histogram command examples assume the working
       directory is the ftrace /tracing directory. For example::
 
-  # cd /sys/kernel/debug/tracing
+	# cd /sys/kernel/debug/tracing
 
 Also, the histogram output displayed for those commands will be
 generally be truncated - only enough to make the point is displayed.
@@ -107,7 +107,7 @@ for the hitcount and one key field for the pid key.
 Below that is a diagram of a run-time snapshot of what the tracing_map
 might look like for a given run.  It attempts to show the
 relationships between the hist_data fields and the tracing_map
-elements for a couple hypothetical keys and values.
+elements for a couple hypothetical keys and values.::
 
   +------------------+
   | hist_data        |
@@ -141,20 +141,20 @@ elements for a couple hypothetical keys and values.
                              |              |                            |  |
                              +--------------+                            |  |
                                             n_keys = n_fields - n_vals   |  |
-		                                                         |  |
+
 The hist_data n_vals and n_fields delineate the extent of the fields[]   |  |
 array and separate keys from values for the rest of the code.            |  |
-		                                                         |  |
+
 Below is a run-time representation of the tracing_map part of the        |  |
 histogram, with pointers from various parts of the fields[] array        |  |
 to corresponding parts of the tracing_map.                               |  |
-		                                                         |  |
+
 The tracing_map consists of an array of tracing_map_entrys and a set     |  |
 of preallocated tracing_map_elts (abbreviated below as map_entry and     |  |
 map_elt).  The total number of map_entrys in the hist_data.map array =   |  |
 map->max_elts (actually map->map_size but only max_elts of those are     |  |
 used.  This is a property required by the map_insert() algorithm).       |  |
-		                                                         |  |
+
 If a map_entry is unused, meaning no key has yet hashed into it, its     |  |
 .key value is 0 and its .val pointer is NULL.  Once a map_entry has      |  |
 been claimed, the .key value contains the key's hash value and the       |  |
@@ -163,11 +163,11 @@ for each key or value in the map_elt.fields[] array.  There is an        |  |
 entry in the map_elt.fields[] array corresponding to each hist_field     |  |
 in the histogram, and this is where the continually aggregated sums      |  |
 corresponding to each histogram value are kept.                          |  |
-		                                                         |  |
+
 The diagram attempts to show the relationship between the                |  |
 hist_data.fields[] and the map_elt.fields[] with the links drawn         |  |
-between diagrams::                                                       |  |
-		                                                         |  |
+between diagrams::
+
   +-----------+		                                                 |  |
   | hist_data |		                                                 |  |
   +-----------+		                                                 |  |
@@ -380,7 +380,7 @@ entry, ts0, corresponding to the ts0 variable in the sched_waking
 trigger above.
 
 sched_waking histogram
-----------------------
+----------------------::
 
   +------------------+
   | hist_data        |<-------------------------------------------------------+
@@ -439,25 +439,25 @@ sched_waking histogram
                            +-----------------+                            | | |
                                              n_keys = n_fields - n_vals   | | |
                                                                           | | |
-                                                                          | | |
+
 This is very similar to the basic case.  In the above diagram, we can     | | |
 see a new .flags member has been added to the struct hist_field           | | |
 struct, and a new entry added to hist_data.fields representing the ts0    | | |
 variable.  For a normal val hist_field, .flags is just 0 (modulo          | | |
 modifier flags), but if the value is defined as a variable, the .flags    | | |
 contains a set FL_VAR bit.                                                | | |
-                                                                          | | |
+
 As you can see, the ts0 entry's .var.idx member contains the index        | | |
 into the tracing_map_elts' .vars[] array containing variable values.      | | |
 This idx is used whenever the value of the variable is set or read.       | | |
 The map_elt.vars idx assigned to the given variable is assigned and       | | |
 saved in .var.idx by create_tracing_map_fields() after it calls           | | |
 tracing_map_add_var().                                                    | | |
-                                                                          | | |
+
 Below is a representation of the histogram at run-time, which             | | |
 populates the map, along with correspondence to the above hist_data and   | | |
 hist_field data structures.                                               | | |
-                                                                          | | |
+
 The diagram attempts to show the relationship between the                 | | |
 hist_data.fields[] and the map_elt.fields[] and map_elt.vars[] with       | | |
 the links drawn between diagrams.  For each of the map_elts, you can      | | |
@@ -465,8 +465,8 @@ see that the .fields[] members point to the .sum or .offset of a key      | | |
 or val and the .vars[] members point to the value of a variable.  The     | | |
 arrows between the two diagrams show the linkages between those           | | |
 tracing_map members and the field definitions in the corresponding        | | |
-hist_data fields[] members.                                               | | |
-                                                                          | | |
+hist_data fields[] members.::
+
   +-----------+		                                                  | | |
   | hist_data |		                                                  | | |
   +-----------+		                                                  | | |
@@ -564,27 +564,27 @@ hist_data fields[] members.                                               | | |
                                                       | unused        |     | |
                                                       |               |     | |
                                                       +---------------+     | |
-                                                                            | |
+
 For each used map entry, there's a map_elt pointing to an array of          | |
 .vars containing the current value of the variables associated with         | |
 that histogram entry.  So in the above, the timestamp associated with       | |
 pid 999 is 113345679876, and the timestamp variable in the same             | |
 .var.idx for pid 4444 is 213499240729.                                      | |
-                                                                            | |
+
 sched_switch histogram                                                      | |
 ----------------------                                                      | |
-                                                                            | |
+
 The sched_switch histogram paired with the above sched_waking               | |
 histogram is shown below.  The most important aspect of the                 | |
 sched_switch histogram is that it references a variable on the              | |
 sched_waking histogram above.                                               | |
-                                                                            | |
+
 The histogram diagram is very similar to the others so far displayed,       | |
 but it adds variable references.  You can see the normal hitcount and       | |
 key fields along with a new wakeup_lat variable implemented in the          | |
 same way as the sched_waking ts0 variable, but in addition there's an       | |
 entry with the new FL_VAR_REF (short for HIST_FIELD_FL_VAR_REF) flag.       | |
-                                                                            | |
+
 Associated with the new var ref field are a couple of new hist_field        | |
 members, var.hist_data and var_ref_idx.  For a variable reference, the      | |
 var.hist_data goes with the var.idx, which together uniquely identify       | |
@@ -593,10 +593,10 @@ just the index into the var_ref_vals[] array that caches the values of      | |
 each variable whenever a hist trigger is updated.  Those resulting          | |
 values are then finally accessed by other code such as trace action         | |
 code that uses the var_ref_idx values to assign param values.               | |
-                                                                            | |
+
 The diagram below describes the situation for the sched_switch              | |
-histogram referred to before:                                               | |
-                                                                            | |
+histogram referred to before::
+
   # echo 'hist:keys=next_pid:wakeup_lat=common_timestamp.usecs-$ts0' >>     | |
           events/sched/sched_switch/trigger                                 | |
                                                                             | |
-- 
2.17.1


