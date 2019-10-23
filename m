Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0FEEE11D7
	for <lists+linux-next@lfdr.de>; Wed, 23 Oct 2019 07:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732144AbfJWFtV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Oct 2019 01:49:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:44044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731847AbfJWFtV (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Oct 2019 01:49:21 -0400
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC981214B2;
        Wed, 23 Oct 2019 05:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571809760;
        bh=snDD2TGm/p3To1d+GTgma+dC7mp1sEZRotHc0mSrxgk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=jXp1j7nLsX2w5XE8QjSsMsPsl6XNtnpXMoeAsWx7LgtVt9dh19xs8SCMDNPbgwxPw
         6VN5Z0HebFWqLdi6aej3/2KW2YqTHTNy4xg/jI9KXWPKB8I7d7f0qw7Zlc1qKC0QQ9
         a4iUCnJ0h0ATuVIBaLQ15t9K3Wj/afO/hHwllWRU=
Date:   Wed, 23 Oct 2019 14:49:16 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masami Hiramatsu <mhiramat@redhat.com>
Subject: Re: linux-next: Tree for Oct 14 (insn_decoder_test)
Message-Id: <20191023144916.2cbd0ea16363b4cd4574f5ad@kernel.org>
In-Reply-To: <2d83682b-6206-4992-63cc-342d61641c0a@infradead.org>
References: <20191014174707.469f596f@canb.auug.org.au>
        <2d83682b-6206-4992-63cc-342d61641c0a@infradead.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Mon, 14 Oct 2019 08:30:02 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> On 10/13/19 11:47 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20191011:
> > 
> 
> on x86_64:
> 
>   HOSTCC  arch/x86/tools/insn_decoder_test
>   HOSTCC  arch/x86/tools/insn_sanity
>   TEST    posttest
> arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
> arch/x86/tools/insn_decoder_test: warning: ffffffff81000bf1:	f7 0b 00 01 08 00    	testl  $0x80100,(%rbx)
> arch/x86/tools/insn_decoder_test: warning: objdump says 6 bytes, but insn_get_length() says 2
> arch/x86/tools/insn_decoder_test: warning: Decoded and checked 11913894 instructions with 1 failures
>   TEST    posttest
> arch/x86/tools/insn_sanity: Success: decoded and checked 1000000 random instructions with 0 errors (seed:0x871ce29c)

Hmm, curious.

x86-opcode-map.txt said,
f7: Grp3_2 Ev (1A)

and "0x0b" is 00001011b, Group encoding bits are 5,4,3 (reg field),
so group index is 001.

GrpTable: Grp3_2
0: TEST Ev,Iz
1:

Hmm, "f7 0b" is not assigned to any instruction... (testl should be f7 03)

I've checked Intel SDM May 2019 version(*), but the Opcode Map (Table A-6. Opecode
Extensions for One- and Two-byte Opecodes by Group Number) showed the group index
001 is still blank. I've also checked that Table B-13 (General Purpose Instruction
 Formats and Encodings for Non-64-Bit Modes (Note that this has no REX prefix)) but
I couldn't find "f7 0b".

At last, I found that on AMD64 Architecture Programmer's Manual Volume 3, Appendix A.2
Table A-6. ModRM.reg Extensions for the Primary Opcode Map(**), which shows that both
f7 + reg=000 and f7 + reg=001 are same. So only on AMD64, it is officially available
instruction.

(*) https://software.intel.com/sites/default/files/managed/a4/60/325383-sdm-vol-2abcd.pdf
(**) https://www.amd.com/system/files/TechDocs/24594.pdf

OK, so this should be fixed with below patch.

------
From b3f45b86df25be59fcf417730ab4c69c6310eaad Mon Sep 17 00:00:00 2001
From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Wed, 23 Oct 2019 14:45:35 +0900
Subject: [PATCH] x86/decoder: Add TEST opcode to Group3-2

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
---
 arch/x86/lib/x86-opcode-map.txt       | 2 +-
 tools/arch/x86/lib/x86-opcode-map.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/lib/x86-opcode-map.txt b/arch/x86/lib/x86-opcode-map.txt
index e0b85930dd77..4635ce298d1d 100644
--- a/arch/x86/lib/x86-opcode-map.txt
+++ b/arch/x86/lib/x86-opcode-map.txt
@@ -907,7 +907,7 @@ EndTable
 
 GrpTable: Grp3_2
 0: TEST Ev,Iz
-1:
+1: TEST Ev,Iz
 2: NOT Ev
 3: NEG Ev
 4: MUL rAX,Ev
diff --git a/tools/arch/x86/lib/x86-opcode-map.txt b/tools/arch/x86/lib/x86-opcode-map.txt
index e0b85930dd77..4635ce298d1d 100644
--- a/tools/arch/x86/lib/x86-opcode-map.txt
+++ b/tools/arch/x86/lib/x86-opcode-map.txt
@@ -907,7 +907,7 @@ EndTable
 
 GrpTable: Grp3_2
 0: TEST Ev,Iz
-1:
+1: TEST Ev,Iz
 2: NOT Ev
 3: NEG Ev
 4: MUL rAX,Ev
-- 
2.20.1
-- 
Masami Hiramatsu <mhiramat@kernel.org>
