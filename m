Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8C239B733
	for <lists+linux-next@lfdr.de>; Fri,  4 Jun 2021 12:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbhFDKhn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Jun 2021 06:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhFDKhn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Jun 2021 06:37:43 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E712AC061763
        for <linux-next@vger.kernel.org>; Fri,  4 Jun 2021 03:35:56 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:f130:bbcb:eb08:8a92])
        by laurent.telenet-ops.be with bizsmtp
        id Cybt250012NEgeT01ybtHG; Fri, 04 Jun 2021 12:35:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lp7BA-00Cc2O-MU; Fri, 04 Jun 2021 12:35:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lp5id-001cIZ-N9; Fri, 04 Jun 2021 11:02:19 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Steve French <sfrench@samba.org>,
        Shyam Prasad N <sprasad@microsoft.com>
Cc:     linux-cifs@vger.kernel.org, linux-next@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] cifs: Change cifs_ses.chans_need_reconnect and chan_index to "unsigned long"
Date:   Fri,  4 Jun 2021 11:02:19 +0200
Message-Id: <20210604090219.385504-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 32-bit (e.g. m68k):

    fs/cifs/cifssmb.c: In function ‘cifs_reconnect_tcon’:
    ./include/linux/kern_levels.h:5:18: warning: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 2 has type ‘size_t’ {aka ‘unsigned int’} [-Wformat=]
    fs/cifs/cifssmb.c:201:42: note: format string is defined here
      201 |  cifs_dbg(FYI, "sess reconnect mask: 0x%lx, tcon reconnect: %d",
	  |                                        ~~^
	  |                                          |
	  |                                          long unsigned int
	  |                                        %x

    fs/cifs/transport.c: In function ‘cifs_pick_channel’:
    fs/cifs/cifsglob.h:955:20: error: passing argument 2 of ‘test_bit’ from incompatible pointer type [-Werror=incompatible-pointer-types]
      955 |  test_bit((index), &(ses)->chans_need_reconnect)
	  |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
	  |                    |
	  |                    size_t * {aka unsigned int *}
    ./arch/m68k/include/asm/bitops.h:151:66: note: expected ‘const volatile long unsigned int *’ but argument is of type ‘size_t *’ {aka ‘unsigned int *’}
      151 | static inline int test_bit(int nr, const volatile unsigned long *vaddr)
	  |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~

    fs/cifs/sess.c: In function ‘cifs_chan_set_need_reconnect’:
    fs/cifs/sess.c:98:22: error: passing argument 2 of ‘bset_mem_set_bit’ from incompatible pointer type [-Werror=incompatible-pointer-types]
       98 |  set_bit(chan_index, &ses->chans_need_reconnect);
	  |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
	  |                      |
	  |                      size_t * {aka unsigned int *}
    ./arch/m68k/include/asm/bitops.h:41:69: note: expected ‘volatile long unsigned int *’ but argument is of type ‘size_t *’ {aka ‘unsigned int *’}
       41 | static inline void bset_mem_set_bit(int nr, volatile unsigned long *vaddr)
	  |                                             ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
    fs/cifs/sess.c:98:22: error: passing argument 2 of ‘bfset_mem_set_bit’ from incompatible pointer type [-Werror=incompatible-pointer-types]
       98 |  set_bit(chan_index, &ses->chans_need_reconnect);
	  |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
	  |                      |
	  |                      size_t * {aka unsigned int *}
    ./arch/m68k/include/asm/bitops.h:50:70: note: expected ‘volatile long unsigned int *’ but argument is of type ‘size_t *’ {aka ‘unsigned int *’}
       50 | static inline void bfset_mem_set_bit(int nr, volatile unsigned long *vaddr)
	  |                                              ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~

   [...]

As bitops can only operate on long objects, and
cifs_ses_get_chan_index() already returns "unsigned long", fix this by
changing cifs_ses.chans_need_reconnect and chan_index from "size_t" to
"unsigned long".

Fixes: 374c6c7bba3cbaa1 ("cifs: changes to support multichannel during channel reconnect")
Reported-by: noreply@ellerman.id.au
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Can you please add Link: headers when committing patches?
I could not find this patch in the lore archives of linux-cifs or
linux-fsdevel, presumably it was posted elsewhere?
Thanks!
---
 fs/cifs/cifsglob.h | 2 +-
 fs/cifs/sess.c     | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
index 8fea2ddd2bd7af26..a9c026af21e1e9d1 100644
--- a/fs/cifs/cifsglob.h
+++ b/fs/cifs/cifsglob.h
@@ -968,7 +968,7 @@ struct cifs_ses {
 	 * enable the sessions on top to continue to live till any
 	 * of the channels below are active.
 	 */
-	size_t chans_need_reconnect;
+	unsigned long chans_need_reconnect;
 };
 
 static inline bool
diff --git a/fs/cifs/sess.c b/fs/cifs/sess.c
index 1721a3b246942266..1a17ddd6abbe5778 100644
--- a/fs/cifs/sess.c
+++ b/fs/cifs/sess.c
@@ -94,7 +94,7 @@ void
 cifs_chan_set_need_reconnect(struct cifs_ses *ses,
 			     struct TCP_Server_Info *server)
 {
-	size_t chan_index = cifs_ses_get_chan_index(ses, server);
+	unsigned long chan_index = cifs_ses_get_chan_index(ses, server);
 	set_bit(chan_index, &ses->chans_need_reconnect);
 	cifs_dbg(FYI, "Set reconnect bitmask for chan %lu; now 0x%lx\n",
 		 chan_index, ses->chans_need_reconnect);
@@ -104,7 +104,7 @@ void
 cifs_chan_clear_need_reconnect(struct cifs_ses *ses,
 			       struct TCP_Server_Info *server)
 {
-	size_t chan_index = cifs_ses_get_chan_index(ses, server);
+	unsigned long chan_index = cifs_ses_get_chan_index(ses, server);
 	clear_bit(chan_index, &ses->chans_need_reconnect);
 	cifs_dbg(FYI, "Cleared reconnect bitmask for chan %lu; now 0x%lx\n",
 		 chan_index, ses->chans_need_reconnect);
@@ -114,7 +114,7 @@ bool
 cifs_chan_needs_reconnect(struct cifs_ses *ses,
 			    struct TCP_Server_Info *server)
 {
-	size_t chan_index = cifs_ses_get_chan_index(ses, server);
+	unsigned long chan_index = cifs_ses_get_chan_index(ses, server);
 	return CIFS_CHAN_NEEDS_RECONNECT(ses, chan_index);
 }
 
-- 
2.25.1

