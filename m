Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16EF14310A4
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 08:37:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbhJRGjV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 02:39:21 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:56926 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhJRGjV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2021 02:39:21 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 8EB2921A6B;
        Mon, 18 Oct 2021 06:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1634539029; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=axkVwMCJWGOjTC2SPYws1bBoVFyPgvGOg+EGo3bGeEc=;
        b=G1in2rQNCWV3Zq4oJ6CRFZnWQxNt2qNX6fSByLuILS+S1XH0lH9uKsnraRDjnJfuCe5qeY
        B4927tstZNkRhXvhI5kWRaR0rK+mbMjs4ut3vXNgZvfUG8IN4yfVs/FtaGAmiXinjC71n4
        FOZRkd9jKV9aVgykAFoGjX+7HZE6r7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1634539029;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
        bh=axkVwMCJWGOjTC2SPYws1bBoVFyPgvGOg+EGo3bGeEc=;
        b=i17mdPTgwkhGgZKMOWKjtKWlcS4xFcE0jm0FwMDn+/5p9aFKlig5xgLY4lhRrQAOdKE7DZ
        /LyMi5GKmMIlrtBA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
        by relay2.suse.de (Postfix) with ESMTP id 7AB09A3B84;
        Mon, 18 Oct 2021 06:37:09 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     alsa-devel@alsa-project.org
Cc:     Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: firewire: Fix C++ style comments in uapi header
Date:   Mon, 18 Oct 2021 08:37:00 +0200
Message-Id: <20211018063700.30834-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

UAPI headers are built with -std=c90 and C++ style comments are
explicitly prohibited.  The recent commit overlooked the rule and
caused the error at header installation.  This patch corrects those.

Fixes: bea36afa102e ("ALSA: firewire-motu: add message parser to gather meter information in register DSP model")
Fixes: 90b28f3bb85c ("ALSA: firewire-motu: add message parser for meter information in command DSP model")
Fixes: 634ec0b2906e ("ALSA: firewire-motu: notify event for parameter change in register DSP model")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Link: https://lore.kernel.org/r/20211018113812.0a16efb0@canb.auug.org.au
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/uapi/sound/firewire.h | 70 ++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/include/uapi/sound/firewire.h b/include/uapi/sound/firewire.h
index 76190a0cb069..e52a97b3ceaa 100644
--- a/include/uapi/sound/firewire.h
+++ b/include/uapi/sound/firewire.h
@@ -68,8 +68,8 @@ struct snd_firewire_event_tascam_control {
 
 struct snd_firewire_event_motu_register_dsp_change {
 	unsigned int type;
-	__u32 count;		// The number of changes.
-	__u32 changes[];	// Encoded event for change of register DSP.
+	__u32 count;		/* The number of changes. */
+	__u32 changes[];	/* Encoded event for change of register DSP. */
 };
 
 union snd_firewire_event {
@@ -119,25 +119,27 @@ struct snd_firewire_tascam_state {
 	__be32 data[SNDRV_FIREWIRE_TASCAM_STATE_COUNT];
 };
 
-// In below MOTU models, software is allowed to control their DSP by accessing to registers.
-//  - 828mk2
-//  - 896hd
-//  - Traveler
-//  - 8 pre
-//  - Ultralite
-//  - 4 pre
-//  - Audio Express
-//
-// On the other hand, the status of DSP is split into specific messages included in the sequence of
-// isochronous packet. ALSA firewire-motu driver gathers the messages and allow userspace applications
-// to read it via ioctl. In 828mk2, 896hd, and Traveler, hardware meter for all of physical inputs
-// are put into the message, while one pair of physical outputs is selected. The selection is done by
-// LSB one byte in asynchronous write quadlet transaction to 0x'ffff'f000'0b2c.
-//
-// I note that V3HD/V4HD uses asynchronous transaction for the purpose. The destination address is
-// registered to 0x'ffff'f000'0b38 and '0b3c by asynchronous write quadlet request. The size of
-// message differs between 23 and 51 quadlets. For the case, the number of mixer bus can be extended
-// up to 12.
+/*
+ * In below MOTU models, software is allowed to control their DSP by accessing to registers.
+ *  - 828mk2
+ *  - 896hd
+ *  - Traveler
+ *  - 8 pre
+ *  - Ultralite
+ *  - 4 pre
+ *  - Audio Express
+ *
+ * On the other hand, the status of DSP is split into specific messages included in the sequence of
+ * isochronous packet. ALSA firewire-motu driver gathers the messages and allow userspace applications
+ * to read it via ioctl. In 828mk2, 896hd, and Traveler, hardware meter for all of physical inputs
+ * are put into the message, while one pair of physical outputs is selected. The selection is done by
+ * LSB one byte in asynchronous write quadlet transaction to 0x'ffff'f000'0b2c.
+ *
+ * I note that V3HD/V4HD uses asynchronous transaction for the purpose. The destination address is
+ * registered to 0x'ffff'f000'0b38 and '0b3c by asynchronous write quadlet request. The size of
+ * message differs between 23 and 51 quadlets. For the case, the number of mixer bus can be extended
+ * up to 12.
+ */
 
 #define SNDRV_FIREWIRE_MOTU_REGISTER_DSP_METER_COUNT	40
 
@@ -219,18 +221,20 @@ struct snd_firewire_motu_register_dsp_parameter {
 	__u8 reserved[64];
 };
 
-// In below MOTU models, software is allowed to control their DSP by command in frame of
-// asynchronous transaction to 0x'ffff'0001'0000:
-//
-//  - 828 mk3 (FireWire only and Hybrid)
-//  - 896 mk3 (FireWire only and Hybrid)
-//  - Ultralite mk3 (FireWire only and Hybrid)
-//  - Traveler mk3
-//  - Track 16
-//
-// On the other hand, the states of hardware meter is split into specific messages included in the
-// sequence of isochronous packet. ALSA firewire-motu driver gathers the message and allow userspace
-// application to read it via ioctl.
+/*
+ * In below MOTU models, software is allowed to control their DSP by command in frame of
+ * asynchronous transaction to 0x'ffff'0001'0000:
+ *
+ *  - 828 mk3 (FireWire only and Hybrid)
+ *  - 896 mk3 (FireWire only and Hybrid)
+ *  - Ultralite mk3 (FireWire only and Hybrid)
+ *  - Traveler mk3
+ *  - Track 16
+ *
+ * On the other hand, the states of hardware meter is split into specific messages included in the
+ * sequence of isochronous packet. ALSA firewire-motu driver gathers the message and allow userspace
+ * application to read it via ioctl.
+ */
 
 #define SNDRV_FIREWIRE_MOTU_COMMAND_DSP_METER_COUNT	400
 
-- 
2.26.2

