Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDC19A1399
	for <lists+linux-next@lfdr.de>; Thu, 29 Aug 2019 10:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbfH2I0g (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Aug 2019 04:26:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58688 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbfH2I0g (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 29 Aug 2019 04:26:36 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id B34C7C0546F2;
        Thu, 29 Aug 2019 08:26:35 +0000 (UTC)
Received: from gigantic.usersys.redhat.com (helium.bos.redhat.com [10.18.17.132])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6111D1001925;
        Thu, 29 Aug 2019 08:26:34 +0000 (UTC)
From:   Bandan Das <bsd@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the tip tree
References: <20190829080633.07c7a422@canb.auug.org.au>
Date:   Thu, 29 Aug 2019 04:26:33 -0400
In-Reply-To: <20190829080633.07c7a422@canb.auug.org.au> (Stephen Rothwell's
        message of "Thu, 29 Aug 2019 08:06:33 +1000")
Message-ID: <jpgwoewnzra.fsf@linux.bootlegged.copy>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Thu, 29 Aug 2019 08:26:36 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> In commit
>
>   bae3a8d3308e ("x86/apic: Do not initialize LDR and DFR for bigsmp")
>
> Fixes tag
>
>   Fixes: db7b9e9f26b8 ("[PATCH] Clustered APIC setup for >8 CPU systems")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>

I tried to dig this up and I believe that this is from pre-git.
I went back as far as commit 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2
Author: Linus Torvalds <torvalds@ppc970.osdl.org>
Date:   Sat Apr 16 15:20:36 2005 -0700

    Linux-2.6.12-rc2
    
    Initial git repository build. I'm not bothering with the full history,
    even though we have it. We can create a separate "historical" git
    archive of that later if we want to, and in the meantime it's about
    3.2GB when imported into git - space that would just make the early
    git days unnecessarily complicated, when we don't have a lot of good
    infrastructure for it.
    
    Let it rip!

which adds init_apic_ldr() in include/asm-i386/mach-bigsmp/mach_apic.h with
the following:

+static inline void init_apic_ldr(void)
+{
+       unsigned long val;
+
+       apic_write_around(APIC_DFR, APIC_DFR_VALUE);
+       val = apic_read(APIC_LDR) & ~APIC_LDR_MASK;
+       val = calculate_ldr(val);
+       apic_write_around(APIC_LDR, val);
+}
...


So, the bug seems to be present here as well...

Bandan

> I could not quickly find an obvious match.
