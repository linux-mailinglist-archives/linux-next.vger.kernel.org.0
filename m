Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE6CA0F4B
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 03:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbfH2ByF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Aug 2019 21:54:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:60092 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbfH2ByE (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Aug 2019 21:54:04 -0400
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3BEDB2070B;
        Thu, 29 Aug 2019 01:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567043641;
        bh=Zrl058AKt+X48Xm1RwlCil4+6XP123XzkWq9PYDitL8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Zj/WJH0ibmSgOWY5Do/DMgaa2KSeAnhFzMl7OodpvXqc2XMuCV+xlci/qSvB/bAYn
         F8NHZNljGT4QT7huo3RwoFgcNla3pjO9SI779BRarvo+yw3IfupZ9aGChzdJBPVAPT
         912L2V200qo8W5gSA/XgfM8PgYq63vBLkzxpdFig=
Date:   Thu, 29 Aug 2019 10:53:56 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 27 (objtool)
Message-Id: <20190829105356.1fd4859f49c142945146855f@kernel.org>
In-Reply-To: <20190828163433.4ltoxmtuujkqspar@treble>
References: <20190827190526.6f27e763@canb.auug.org.au>
        <6c42e32f-901d-be78-e69b-cb9ff8703932@infradead.org>
        <20190827155911.ct2zzo2zhcrauf3z@treble>
        <2e8b18a0-a09c-b67e-c99f-45066ab9d511@infradead.org>
        <20190828155147.v6eowc7rr7upr7dr@treble>
        <f354f4be-99c7-346f-c7c5-ac5ce8a72a16@infradead.org>
        <20190828161331.kvikro257blxtzu5@treble>
        <20190828163433.4ltoxmtuujkqspar@treble>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="Multipart=_Thu__29_Aug_2019_10_53_56_+0900_cV5qrkYoaDhqPZGY"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is a multi-part message in MIME format.

--Multipart=_Thu__29_Aug_2019_10_53_56_+0900_cV5qrkYoaDhqPZGY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Josh,

On Wed, 28 Aug 2019 11:34:33 -0500
Josh Poimboeuf <jpoimboe@redhat.com> wrote:

> On Wed, Aug 28, 2019 at 11:13:31AM -0500, Josh Poimboeuf wrote:
> > Turns out this patch does break something:
> > 
> >   arch/x86/xen/enlighten_pv.o: warning: objtool: xen_cpuid()+0x25: can't find jump dest instruction at .text+0x9c
> > 
> > I'll need to figure out a better way to whitelist that
> > XEN_EMULATE_PREFIX fake instruction thing.  I'll probably just teach
> > the objtool decoder about it.
> 
> Hi Masami,
> 
> Is it possible for the kernel x86 decoder to recognize the
> XEN_EMULATE_PREFIX prefix?
> 
>         asm(XEN_EMULATE_PREFIX "cpuid"
>                 : "=a" (*ax),
>                   "=b" (*bx),
>                   "=c" (*cx),
>                   "=d" (*dx)
>                 : "0" (*ax), "2" (*cx));
> 
> is disassembled to:
> 
>       33:       0f 0b                   ud2
>       35:       78 65                   js     9c <xen_store_tr+0xc>
>       37:       6e                      outsb  %ds:(%rsi),(%dx)
>       38:       0f a2                   cpuid
> 
> which confuses objtool.  Presumably that would confuse other users of
> the decoder as well.

Good catch! It should be problematic, since x86 decoder sanity test is
based on objtool. But I don't want to change the test code itself,
because this problem is highly depending on Xen.

> That's a highly unlikely sequence of instructions, maybe the kernel
> decoder should recognize it as a single instruction.

OK, it is better to be done in decoder (only for CONFIG_XEN_PVHVM)

BTW, could you also share what test case would you using?

And what about attached patch? (just compile checked with/without CONFIG_XEN_PVHVM)

Thank you,


-- 
Masami Hiramatsu <mhiramat@kernel.org>

--Multipart=_Thu__29_Aug_2019_10_53_56_+0900_cV5qrkYoaDhqPZGY
Content-Type: text/x-diff;
 name="0001-x86-xen-insn-Decode-XEN_EMULATE_PREFIX-correctly.patch"
Content-Disposition: attachment;
 filename="0001-x86-xen-insn-Decode-XEN_EMULATE_PREFIX-correctly.patch"
Content-Transfer-Encoding: 7bit

From 9a46833c54fd320afd3836c0e51ade82e4bc6f96 Mon Sep 17 00:00:00 2001
From: Masami Hiramatsu <mhiramat@kernel.org>
Date: Thu, 29 Aug 2019 10:01:55 +0900
Subject: [PATCH] x86: xen: insn: Decode XEN_EMULATE_PREFIX correctly

Add XEN_EMULATE_PREFIX prefix support to x86 insn decoder.
This treats a special sequence of instructions of XEN_EMULATE_PREFIX
as a prefix bytes in x86 insn decoder only if CONFIG_XEN_PVHVM=y.
Note that this prefix is treated as just a dummy code.

Reported-by: Josh Poimboeuf <jpoimboe@redhat.com>
Signed-off-by: Masami Hiramatsu <mhiramat@kernel.org>
---
 arch/x86/include/asm/xen/interface.h |  8 +++++--
 arch/x86/lib/insn.c                  | 35 ++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/xen/interface.h b/arch/x86/include/asm/xen/interface.h
index 62ca03ef5c65..fbee520b1f07 100644
--- a/arch/x86/include/asm/xen/interface.h
+++ b/arch/x86/include/asm/xen/interface.h
@@ -27,6 +27,8 @@
 #ifndef _ASM_X86_XEN_INTERFACE_H
 #define _ASM_X86_XEN_INTERFACE_H
 
+#include <linux/stringify.h>
+
 /*
  * XEN_GUEST_HANDLE represents a guest pointer, when passed as a field
  * in a struct in memory.
@@ -379,11 +381,13 @@ struct xen_pmu_arch {
  * Prefix forces emulation of some non-trapping instructions.
  * Currently only CPUID.
  */
+#define __XEN_EMULATE_PREFIX  0x0f,0x0b,0x78,0x65,0x6e
+#define __XEN_EMULATE_PREFIX_STR  __stringify(__XEN_EMULATE_PREFIX)
 #ifdef __ASSEMBLY__
-#define XEN_EMULATE_PREFIX .byte 0x0f,0x0b,0x78,0x65,0x6e ;
+#define XEN_EMULATE_PREFIX .byte __XEN_EMULATE_PREFIX ;
 #define XEN_CPUID          XEN_EMULATE_PREFIX cpuid
 #else
-#define XEN_EMULATE_PREFIX ".byte 0x0f,0x0b,0x78,0x65,0x6e ; "
+#define XEN_EMULATE_PREFIX ".byte " __XEN_EMULATE_PREFIX_STR " ; "
 #define XEN_CPUID          XEN_EMULATE_PREFIX "cpuid"
 #endif
 
diff --git a/arch/x86/lib/insn.c b/arch/x86/lib/insn.c
index 0b5862ba6a75..2401a6fc9509 100644
--- a/arch/x86/lib/insn.c
+++ b/arch/x86/lib/insn.c
@@ -7,6 +7,9 @@
 
 #ifdef __KERNEL__
 #include <linux/string.h>
+#include <linux/kernel.h>
+/* For special Xen prefix */
+#include <asm/xen/interface.h>
 #else
 #include <string.h>
 #endif
@@ -58,6 +61,34 @@ void insn_init(struct insn *insn, const void *kaddr, int buf_len, int x86_64)
 		insn->addr_bytes = 4;
 }
 
+#ifdef CONFIG_XEN_PVHVM
+static const insn_byte_t xen_prefix[] = { XEN_EMULATE_PREFIX };
+
+static int insn_xen_prefix(struct insn *insn, insn_byte_t b)
+{
+	struct insn_field *prefixes = &insn->prefixes;
+	int i = 0;
+
+	while (i < ARRAY_SIZE(xen_prefix) && b == xen_prefix[i])
+		b = peek_nbyte_next(insn_byte_t, insn, ++i);
+
+	if (unlikely(i == ARRAY_SIZE(xen_prefix))) {
+		memcpy(prefixes->bytes, xen_prefix, 3);
+		prefixes->bytes[3] = xen_prefix[ARRAY_SIZE(xen_prefix) - 1];
+		prefixes->nbytes = ARRAY_SIZE(xen_prefix);
+		insn->next_byte += prefixes->nbytes;
+		prefixes->got = 1;
+
+		return 1;
+	}
+
+err_out:
+	return 0;
+}
+#else
+#define insn_xen_prefix(insn,b)	(0)
+#endif
+
 /**
  * insn_get_prefixes - scan x86 instruction prefix bytes
  * @insn:	&struct insn containing instruction
@@ -79,6 +110,10 @@ void insn_get_prefixes(struct insn *insn)
 	nb = 0;
 	lb = 0;
 	b = peek_next(insn_byte_t, insn);
+
+	if (insn_xen_prefix(insn, b))
+		return;
+
 	attr = inat_get_opcode_attribute(b);
 	while (inat_is_legacy_prefix(attr)) {
 		/* Skip if same prefix */
-- 
2.20.1


--Multipart=_Thu__29_Aug_2019_10_53_56_+0900_cV5qrkYoaDhqPZGY--
