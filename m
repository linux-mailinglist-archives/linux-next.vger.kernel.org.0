Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920BC33EEE5
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 11:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbhCQKym (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 06:54:42 -0400
Received: from mx2.suse.de ([195.135.220.15]:36966 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230473AbhCQKyh (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Mar 2021 06:54:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2AB8CAC75;
        Wed, 17 Mar 2021 10:54:36 +0000 (UTC)
Date:   Wed, 17 Mar 2021 11:54:32 +0100
From:   Borislav Petkov <bp@suse.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Ian Rogers <irogers@google.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20210317105432.GA32135@zn.tnic>
References: <20210317150858.02b1bbc8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210317150858.02b1bbc8@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

+ Ian.

On Wed, Mar 17, 2021 at 03:08:58PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (native perf)
> failed like this:
> 
> In file included from util/intel-pt-decoder/intel-pt-insn-decoder.c:15:
> util/intel-pt-decoder/../../../arch/x86/lib/insn.c:14:10: fatal error: asm/inat.h: No such file or directory
>    14 | #include <asm/inat.h> /*__ignore_sync_check__ */
>       |          ^~~~~~~~~~~~
> 
> This is a powerpc build of perf.  I can't see what caused this failure,
> so I have used the version of the tip tree from next-20210316 for today.

Yah, this has come up in the past during review but the wrong version
somehow snuck in, sorry. ;-\

Can you guys verify this fixes the build issue? I don't have a ppc build
setup.

Thx.

---
From 50d91054fc421e2a90923706d5ca79e941e28300 Mon Sep 17 00:00:00 2001
From: Borislav Petkov <bp@suse.de>
Date: Wed, 17 Mar 2021 11:33:04 +0100
Subject: [PATCH] tools/insn: Restore the relative include paths for cross
 building

Building perf on ppc causes:

  In file included from util/intel-pt-decoder/intel-pt-insn-decoder.c:15:
  util/intel-pt-decoder/../../../arch/x86/lib/insn.c:14:10: fatal error: asm/inat.h: No such file or directory
     14 | #include <asm/inat.h> /*__ignore_sync_check__ */
        |          ^~~~~~~~~~~~

Restore the relative include paths so that the compiler can find the
headers.

Fixes: 93281c4a9657 ("x86/insn: Add an insn_decode() API")
Reported-by: Ian Rogers <irogers@google.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
NOT-Signed-off-by: Borislav Petkov <bp@suse.de>
---
 tools/arch/x86/lib/insn.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/arch/x86/lib/insn.c b/tools/arch/x86/lib/insn.c
index cd4dedde3265..999fbd4c9bea 100644
--- a/tools/arch/x86/lib/insn.c
+++ b/tools/arch/x86/lib/insn.c
@@ -11,8 +11,8 @@
 #else
 #include <string.h>
 #endif
-#include <asm/inat.h> /*__ignore_sync_check__ */
-#include <asm/insn.h> /* __ignore_sync_check__ */
+#include "../include/asm/inat.h" /* __ignore_sync_check__ */
+#include "../include/asm/insn.h" /* __ignore_sync_check__ */
 
 #include <linux/errno.h>
 #include <linux/kconfig.h>
-- 
2.29.2

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
