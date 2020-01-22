Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4668F144AB8
	for <lists+linux-next@lfdr.de>; Wed, 22 Jan 2020 05:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgAVEL7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 21 Jan 2020 23:11:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:57792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727141AbgAVEL7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Jan 2020 23:11:59 -0500
Received: from localhost.localdomain (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C134F2070C;
        Wed, 22 Jan 2020 04:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579666318;
        bh=v29QQvk5dO+gNH/UWuB5vLE2PNIwKeDSrqt3jQ8zSH4=;
        h=From:To:Cc:Subject:Date:From;
        b=I0Mn4qCt9fghJspZGWTvyWcZ0hohhHl4QR7wkS6Q5qkxGTqI7NiES5StcLYpY8851
         ncD+JLBJVjC0zhi+GK0n8LXlizKjoLuK38A/k2yr47p9cuBwmAWF7vOwYj9Ekk4x6m
         Q2a1fAxXMsRpDhFXniMMflyco4DjPhYuptn9HxSE=
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Ingo Molnar <mingo@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        X86 ML <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH -tip] [RESEND] x86/decoder: Add TEST opcode to Group3-2
Date:   Wed, 22 Jan 2020 13:11:54 +0900
Message-Id: <157966631413.9580.10311036595431878351.stgit@devnote2>
X-Mailer: git-send-email 2.20.1
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Add TEST opcode to Group3-2 reg=001b as same as Group3-1 does.

Commit 12a78d43de76 ("x86/decoder: Add new TEST instruction pattern")
added a TEST opcode assignment to f6 XX/001/XXX (Group 3-1), but not
added f7 XX/001/XXX (Group 3-2). Actually these TEST opcode is not
described in Intel SDM Vol2, but described in AMD64 Architecture
Programmer's Manual Vol.3, Appendix A.2 Table A-6. ModRM.reg
Extensions for the Primary Opcode Map.

Without this fix, Randy found a warning by insn_decoder_test related
to this issue as below.

  HOSTCC  arch/x86/tools/insn_decoder_test
  HOSTCC  arch/x86/tools/insn_sanity
  TEST    posttest
arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
arch/x86/tools/insn_decoder_test: warning: ffffffff81000bf1:	f7 0b 00 01 08 00    	testl  $0x80100,(%rbx)
arch/x86/tools/insn_decoder_test: warning: objdump says 6 bytes, but insn_get_length() says 2
arch/x86/tools/insn_decoder_test: warning: Decoded and checked 11913894 instructions with 1 failures
  TEST    posttest
arch/x86/tools/insn_sanity: Success: decoded and checked 1000000 random instructions with 0 errors (seed:0x871ce29c)

To fix this error, add TEST opcode according to AMD64 APM Vol.3.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 arch/x86/lib/x86-opcode-map.txt       |    2 +-
 tools/arch/x86/lib/x86-opcode-map.txt |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/lib/x86-opcode-map.txt b/arch/x86/lib/x86-opcode-map.txt
index 8908c58bd6cd..53adc1762ec0 100644
--- a/arch/x86/lib/x86-opcode-map.txt
+++ b/arch/x86/lib/x86-opcode-map.txt
@@ -929,7 +929,7 @@ EndTable
 
 GrpTable: Grp3_2
 0: TEST Ev,Iz
-1:
+1: TEST Ev,Iz
 2: NOT Ev
 3: NEG Ev
 4: MUL rAX,Ev
diff --git a/tools/arch/x86/lib/x86-opcode-map.txt b/tools/arch/x86/lib/x86-opcode-map.txt
index 8908c58bd6cd..53adc1762ec0 100644
--- a/tools/arch/x86/lib/x86-opcode-map.txt
+++ b/tools/arch/x86/lib/x86-opcode-map.txt
@@ -929,7 +929,7 @@ EndTable
 
 GrpTable: Grp3_2
 0: TEST Ev,Iz
-1:
+1: TEST Ev,Iz
 2: NOT Ev
 3: NEG Ev
 4: MUL rAX,Ev

