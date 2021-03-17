Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2C933F7C2
	for <lists+linux-next@lfdr.de>; Wed, 17 Mar 2021 19:03:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231805AbhCQSCq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 17 Mar 2021 14:02:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:36932 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232852AbhCQSCk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 17 Mar 2021 14:02:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 51798AC1E;
        Wed, 17 Mar 2021 18:02:39 +0000 (UTC)
Date:   Wed, 17 Mar 2021 19:02:36 +0100
From:   Borislav Petkov <bp@suse.de>
To:     Ian Rogers <irogers@google.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20210317180236.GF32135@zn.tnic>
References: <20210317150858.02b1bbc8@canb.auug.org.au>
 <20210317105432.GA32135@zn.tnic>
 <CAP-5=fWKCtJq-9zd5A-XALJWNf8tsds44m-G07sc+kCUoXB8zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fWKCtJq-9zd5A-XALJWNf8tsds44m-G07sc+kCUoXB8zg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Mar 17, 2021 at 09:22:15AM -0700, Ian Rogers wrote:
> The <asm/emulate_prefix.h> path also needs fixing. With the following
> I was able to build for arm64 and powerpc.

Thanks, I've updated and added your Tested-by. I'll give sfr a chance to
test and queue it tomorrow.

---
From d242b2639a23ed03d9aed94cf05b99af5343d4e9 Mon Sep 17 00:00:00 2001
From: Borislav Petkov <bp@suse.de>
Date: Wed, 17 Mar 2021 11:33:04 +0100
Subject: [PATCH] tools/insn: Restore the relative include paths for cross building

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
Signed-off-by: Borislav Petkov <bp@suse.de>
Tested-by: Ian Rogers <irogers@google.com>
---
 tools/arch/x86/lib/insn.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/arch/x86/lib/insn.c b/tools/arch/x86/lib/insn.c
index cd4dedde3265..c41f95815480 100644
--- a/tools/arch/x86/lib/insn.c
+++ b/tools/arch/x86/lib/insn.c
@@ -11,13 +11,13 @@
 #else
 #include <string.h>
 #endif
-#include <asm/inat.h> /*__ignore_sync_check__ */
-#include <asm/insn.h> /* __ignore_sync_check__ */
+#include "../include/asm/inat.h" /* __ignore_sync_check__ */
+#include "../include/asm/insn.h" /* __ignore_sync_check__ */
 
 #include <linux/errno.h>
 #include <linux/kconfig.h>
 
-#include <asm/emulate_prefix.h> /* __ignore_sync_check__ */
+#include "../include/asm/emulate_prefix.h" /* __ignore_sync_check__ */
 
 #define leXX_to_cpu(t, r)						\
 ({									\
-- 
2.29.2

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
