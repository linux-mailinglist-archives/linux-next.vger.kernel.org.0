Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56238423A91
	for <lists+linux-next@lfdr.de>; Wed,  6 Oct 2021 11:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231240AbhJFJdN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Oct 2021 05:33:13 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:60402 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbhJFJdN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Oct 2021 05:33:13 -0400
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id B55E3224C0;
        Wed,  6 Oct 2021 09:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1633512680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F2c6GFcbFRrTM/fRz3jOdvzgBLFsLLOg1NUfdovPQQY=;
        b=GOR9p+nk2Ct/dX53lBTiSQe/2JSOo6VkZ4Qp21TuF30hqcU872n+vFNnLh20zRsjRyk4hb
        aa1ZTeiyjAjBxb5fPHB46bUARf/30SBd0FgnUYiLP708MNrSRdbD7pH/AkwvBp9afylWZH
        jbGKFO5mUVZSK6WkSJaDe30g4YfiNSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1633512680;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=F2c6GFcbFRrTM/fRz3jOdvzgBLFsLLOg1NUfdovPQQY=;
        b=vqYoYiwK/JSjYBXWnJnMfbTglv8qhwQvRraszT89BYn9AicNrLbB2QeW/0KQ8kiEzEtfBA
        4bDZZUSfRp10VhCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A4AC813B73;
        Wed,  6 Oct 2021 09:31:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id xj0qKOhsXWFzUQAAMHmgww
        (envelope-from <bp@suse.de>); Wed, 06 Oct 2021 09:31:20 +0000
Date:   Wed, 6 Oct 2021 11:31:00 +0200
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <YV1s1GJ+e/qASPy7@zn.tnic>
References: <20211006135826.3e1783f1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211006135826.3e1783f1@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+ acme.

On Wed, Oct 06, 2021 at 01:58:26PM +1100, Stephen Rothwell wrote:
> After merging the tip tree, today's linux-next build (native perf)
> failed like this:
>
> In file included from util/intel-pt-decoder/../../../arch/x86/lib/insn.c:16,
>                  from util/intel-pt-decoder/intel-pt-insn-decoder.c:15:
> util/intel-pt-decoder/../../../arch/x86/lib/insn.c: In function '__insn_get_emulate_prefix':
> tools/include/../include/asm-generic/unaligned.h:10:15: error: packed attribute is unnecessary [-Werror=packed]
>    10 |  const struct { type x; } __packed *__pptr = (typeof(__pptr))(ptr); \

Thanks for the report - luckily, the patch is the topmost one on the
branch so I can simply edit it.

Here's the new version, you can simply apply the last hunk on your tree
only to verify that it fixes it but it should as the hw arch should not
matter - it explodes because perf tool builds with -Werror and I can
trigger it too.

I'll redo tip/master once you confirm.

Thx.

---
From: Borislav Petkov <bp@suse.de>
Date: Wed, 29 Sep 2021 16:37:53 +0200
Subject: [PATCH] x86/insn: Use get_unaligned() instead of memcpy()

Use get_unaligned() instead of memcpy() to access potentially unaligned
memory, which, when accessed through a pointer, leads to undefined
behavior. get_unaligned() describes much better what is happening there
anyway even if memcpy() does the job.

In addition, since perf tool builds with -Werror, it would fire with:

  util/intel-pt-decoder/../../../arch/x86/lib/insn.c: In function '__insn_get_emulate_prefix':
  tools/include/../include/asm-generic/unaligned.h:10:15: error: packed attribute is unnecessary [-Werror=packed]
     10 |  const struct { type x; } __packed *__pptr = (typeof(__pptr))(ptr); \

because -Werror=packed would complain if the packed attribute would have
no effect on the layout of the structure.

In this case, that is intentional so disable the warning only for that
compilation unit.

That part is Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>

No functional changes.

Fixes: 5ba1071f7554 ("x86/insn, tools/x86: Fix undefined behavior due to potential unaligned accesses")
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Borislav Petkov <bp@suse.de>
Acked-by: Masami Hiramatsu <mhiramat@kernel.org>
Link: https://lkml.kernel.org/r/YVSsIkj9Z29TyUjE@zn.tnic
---
 arch/x86/lib/insn.c                    |  5 +++--
 tools/arch/x86/lib/insn.c              |  5 +++--
 tools/include/asm-generic/unaligned.h  | 23 +++++++++++++++++++++++
 tools/perf/util/intel-pt-decoder/Build |  2 ++
 4 files changed, 31 insertions(+), 4 deletions(-)
 create mode 100644 tools/include/asm-generic/unaligned.h

diff --git a/arch/x86/lib/insn.c b/arch/x86/lib/insn.c
index c565def611e2..55e371cc69fd 100644
--- a/arch/x86/lib/insn.c
+++ b/arch/x86/lib/insn.c
@@ -13,6 +13,7 @@
 #endif
 #include <asm/inat.h> /*__ignore_sync_check__ */
 #include <asm/insn.h> /* __ignore_sync_check__ */
+#include <asm/unaligned.h> /* __ignore_sync_check__ */
 
 #include <linux/errno.h>
 #include <linux/kconfig.h>
@@ -37,10 +38,10 @@
 	((insn)->next_byte + sizeof(t) + n <= (insn)->end_kaddr)
 
 #define __get_next(t, insn)	\
-	({ t r; memcpy(&r, insn->next_byte, sizeof(t)); insn->next_byte += sizeof(t); leXX_to_cpu(t, r); })
+	({ t r = get_unaligned((t *)(insn)->next_byte); (insn)->next_byte += sizeof(t); leXX_to_cpu(t, r); })
 
 #define __peek_nbyte_next(t, insn, n)	\
-	({ t r; memcpy(&r, (insn)->next_byte + n, sizeof(t)); leXX_to_cpu(t, r); })
+	({ t r = get_unaligned((t *)(insn)->next_byte + n); leXX_to_cpu(t, r); })
 
 #define get_next(t, insn)	\
 	({ if (unlikely(!validate_next(t, insn, 0))) goto err_out; __get_next(t, insn); })
diff --git a/tools/arch/x86/lib/insn.c b/tools/arch/x86/lib/insn.c
index 797699462cd8..8fd63a067308 100644
--- a/tools/arch/x86/lib/insn.c
+++ b/tools/arch/x86/lib/insn.c
@@ -13,6 +13,7 @@
 #endif
 #include "../include/asm/inat.h" /* __ignore_sync_check__ */
 #include "../include/asm/insn.h" /* __ignore_sync_check__ */
+#include "../include/asm-generic/unaligned.h" /* __ignore_sync_check__ */
 
 #include <linux/errno.h>
 #include <linux/kconfig.h>
@@ -37,10 +38,10 @@
 	((insn)->next_byte + sizeof(t) + n <= (insn)->end_kaddr)
 
 #define __get_next(t, insn)	\
-	({ t r; memcpy(&r, insn->next_byte, sizeof(t)); insn->next_byte += sizeof(t); leXX_to_cpu(t, r); })
+	({ t r = get_unaligned((t *)(insn)->next_byte); (insn)->next_byte += sizeof(t); leXX_to_cpu(t, r); })
 
 #define __peek_nbyte_next(t, insn, n)	\
-	({ t r; memcpy(&r, (insn)->next_byte + n, sizeof(t)); leXX_to_cpu(t, r); })
+	({ t r = get_unaligned((t *)(insn)->next_byte + n); leXX_to_cpu(t, r); })
 
 #define get_next(t, insn)	\
 	({ if (unlikely(!validate_next(t, insn, 0))) goto err_out; __get_next(t, insn); })
diff --git a/tools/include/asm-generic/unaligned.h b/tools/include/asm-generic/unaligned.h
new file mode 100644
index 000000000000..47387c607035
--- /dev/null
+++ b/tools/include/asm-generic/unaligned.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copied from the kernel sources to tools/perf/:
+ */
+
+#ifndef __TOOLS_LINUX_ASM_GENERIC_UNALIGNED_H
+#define __TOOLS_LINUX_ASM_GENERIC_UNALIGNED_H
+
+#define __get_unaligned_t(type, ptr) ({						\
+	const struct { type x; } __packed *__pptr = (typeof(__pptr))(ptr);	\
+	__pptr->x;								\
+})
+
+#define __put_unaligned_t(type, val, ptr) do {					\
+	struct { type x; } __packed *__pptr = (typeof(__pptr))(ptr);		\
+	__pptr->x = (val);							\
+} while (0)
+
+#define get_unaligned(ptr)	__get_unaligned_t(typeof(*(ptr)), (ptr))
+#define put_unaligned(val, ptr) __put_unaligned_t(typeof(*(ptr)), (val), (ptr))
+
+#endif /* __TOOLS_LINUX_ASM_GENERIC_UNALIGNED_H */
+
diff --git a/tools/perf/util/intel-pt-decoder/Build b/tools/perf/util/intel-pt-decoder/Build
index bc629359826f..b41c2e9c6f88 100644
--- a/tools/perf/util/intel-pt-decoder/Build
+++ b/tools/perf/util/intel-pt-decoder/Build
@@ -18,3 +18,5 @@ CFLAGS_intel-pt-insn-decoder.o += -I$(OUTPUT)util/intel-pt-decoder
 ifeq ($(CC_NO_CLANG), 1)
   CFLAGS_intel-pt-insn-decoder.o += -Wno-override-init
 endif
+
+CFLAGS_intel-pt-insn-decoder.o += -Wno-packed
-- 
2.29.2


-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
