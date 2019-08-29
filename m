Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFE44A22EA
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 19:59:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727546AbfH2R7g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 13:59:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35050 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726810AbfH2R7f (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Aug 2019 13:59:35 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 913003086258;
        Thu, 29 Aug 2019 17:59:34 +0000 (UTC)
Received: from treble (ovpn-121-55.rdu2.redhat.com [10.10.121.55])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D9CA600C1;
        Thu, 29 Aug 2019 17:59:33 +0000 (UTC)
Date:   Thu, 29 Aug 2019 12:59:31 -0500
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Aug 27 (objtool)
Message-ID: <20190829175931.sru23aud33hrdqbj@treble>
References: <20190827190526.6f27e763@canb.auug.org.au>
 <6c42e32f-901d-be78-e69b-cb9ff8703932@infradead.org>
 <20190827155911.ct2zzo2zhcrauf3z@treble>
 <2e8b18a0-a09c-b67e-c99f-45066ab9d511@infradead.org>
 <20190828155147.v6eowc7rr7upr7dr@treble>
 <f354f4be-99c7-346f-c7c5-ac5ce8a72a16@infradead.org>
 <20190828161331.kvikro257blxtzu5@treble>
 <20190828163433.4ltoxmtuujkqspar@treble>
 <20190829105356.1fd4859f49c142945146855f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190829105356.1fd4859f49c142945146855f@kernel.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 29 Aug 2019 17:59:34 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 29, 2019 at 10:53:56AM +0900, Masami Hiramatsu wrote:
> Hi Josh,
> 
> On Wed, 28 Aug 2019 11:34:33 -0500
> Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> 
> > On Wed, Aug 28, 2019 at 11:13:31AM -0500, Josh Poimboeuf wrote:
> > > Turns out this patch does break something:
> > > 
> > >   arch/x86/xen/enlighten_pv.o: warning: objtool: xen_cpuid()+0x25: can't find jump dest instruction at .text+0x9c
> > > 
> > > I'll need to figure out a better way to whitelist that
> > > XEN_EMULATE_PREFIX fake instruction thing.  I'll probably just teach
> > > the objtool decoder about it.
> > 
> > Hi Masami,
> > 
> > Is it possible for the kernel x86 decoder to recognize the
> > XEN_EMULATE_PREFIX prefix?
> > 
> >         asm(XEN_EMULATE_PREFIX "cpuid"
> >                 : "=a" (*ax),
> >                   "=b" (*bx),
> >                   "=c" (*cx),
> >                   "=d" (*dx)
> >                 : "0" (*ax), "2" (*cx));
> > 
> > is disassembled to:
> > 
> >       33:       0f 0b                   ud2
> >       35:       78 65                   js     9c <xen_store_tr+0xc>
> >       37:       6e                      outsb  %ds:(%rsi),(%dx)
> >       38:       0f a2                   cpuid
> > 
> > which confuses objtool.  Presumably that would confuse other users of
> > the decoder as well.
> 
> Good catch! It should be problematic, since x86 decoder sanity test is
> based on objtool.

I think you mean the decoder test is based on objdump, not objtool?

Actually I wonder if X86_DECODER_SELFTEST is even still needed these
days, since objtool is enabled on default configs.  Objtool already uses
the decoder to disassemble every instruction in the kernel (except for a
few whitelisted files).

> But I don't want to change the test code itself,
> because this problem is highly depending on Xen.
> 
> > That's a highly unlikely sequence of instructions, maybe the kernel
> > decoder should recognize it as a single instruction.
> 
> OK, it is better to be done in decoder (only for CONFIG_XEN_PVHVM)
> 
> BTW, could you also share what test case would you using?

Enable CONFIG_XEN_PV and CONFIG_STACK_VALIDATION, and remove the
STACK_FRAME_NON_STANDARD(xen_cpuid) line from
arch/x86/xen/enlighten_pv.c.  objtool will complain:

  arch/x86/xen/enlighten_pv.o: warning: objtool: xen_cpuid()+0x25: can't find jump dest instruction at .text+0x9c

Basing it on CONFIG_XEN_PVHVM may be problematic.  The decoder is
duplicated in the tools directory so objtool can use it.  But the tools
don't know about kernel configs.

BTW, I'm not sure if you're aware of this, but both objtool and perf
have identical copies of the decoder.  The makefiles warn if they get
out of sync with the kernel version.

We will always need at least one copy of the decoder in tools, because
the tools subdir is supposed to be standalone from the rest of the
kernel.  Still, I may look at combining the perf and objtool copies into
a single shared copy.

> And what about attached patch? (just compile checked with/without CONFIG_XEN_PVHVM)

I copied the decoder to objtool, removed the CONFIG_XEN_PVHVM ifdef, and
played a bit with the includes, and got it to compile with objtool, but
it still fails:

  $ make arch/x86/xen/enlighten_pv.o
  arch/x86/xen/enlighten_pv.o: warning: objtool: xen_cpuid()+0x25: can't find jump dest instruction at .text+0x9c

Patch below:

diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 58f79ab32358..dbba9b2dc408 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -193,7 +193,6 @@ static void xen_cpuid(unsigned int *ax, unsigned int *bx,
 
 	*bx &= maskebx;
 }
-STACK_FRAME_NON_STANDARD(xen_cpuid); /* XEN_EMULATE_PREFIX */
 
 static bool __init xen_check_mwait(void)
 {
diff --git a/tools/objtool/arch/x86/include/asm/xen/interface.h b/tools/objtool/arch/x86/include/asm/xen/interface.h
new file mode 100644
index 000000000000..c11286eac21c
--- /dev/null
+++ b/tools/objtool/arch/x86/include/asm/xen/interface.h
@@ -0,0 +1,38 @@
+/******************************************************************************
+ * arch-x86_32.h
+ *
+ * Guest OS interface to x86 Xen.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Copyright (c) 2004-2006, K A Fraser
+ */
+#ifndef _ASM_X86_XEN_INTERFACE_H
+#define _ASM_X86_XEN_INTERFACE_H
+
+#include <linux/stringify.h>
+/*
+ * Prefix forces emulation of some non-trapping instructions.
+ * Currently only CPUID.
+ */
+#define __XEN_EMULATE_PREFIX  0x0f,0x0b,0x78,0x65,0x6e
+#define __XEN_EMULATE_PREFIX_STR  __stringify(__XEN_EMULATE_PREFIX)
+#define XEN_EMULATE_PREFIX ".byte " __XEN_EMULATE_PREFIX_STR " ; "
+
+#endif /* _ASM_X86_XEN_INTERFACE_H */
diff --git a/tools/objtool/arch/x86/lib/insn.c b/tools/objtool/arch/x86/lib/insn.c
index 0b5862ba6a75..bc77f607932e 100644
--- a/tools/objtool/arch/x86/lib/insn.c
+++ b/tools/objtool/arch/x86/lib/insn.c
@@ -10,6 +10,8 @@
 #else
 #include <string.h>
 #endif
+#include <linux/kernel.h>
+#include <asm/xen/interface.h>
 #include <asm/inat.h>
 #include <asm/insn.h>
 
@@ -58,6 +60,30 @@ void insn_init(struct insn *insn, const void *kaddr, int buf_len, int x86_64)
 		insn->addr_bytes = 4;
 }
 
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
+
 /**
  * insn_get_prefixes - scan x86 instruction prefix bytes
  * @insn:	&struct insn containing instruction
@@ -79,6 +105,10 @@ void insn_get_prefixes(struct insn *insn)
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
