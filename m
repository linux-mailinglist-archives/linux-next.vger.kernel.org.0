Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37587233052
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 12:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728897AbgG3KZw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 06:25:52 -0400
Received: from disco-boy.misterjones.org ([51.254.78.96]:58890 "EHLO
        disco-boy.misterjones.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgG3KZv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jul 2020 06:25:51 -0400
X-Greylist: delayed 1589 seconds by postgrey-1.27 at vger.kernel.org; Thu, 30 Jul 2020 06:25:50 EDT
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@misterjones.org>)
        id 1k15LC-00GDgU-2i; Thu, 30 Jul 2020 10:59:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 30 Jul 2020 10:59:09 +0100
From:   Marc Zyngier <maz@misterjones.org>
To:     Willy Tarreau <w@1wt.eu>
Cc:     Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Emese Revfy <re.emese@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        =?UTF-8?Q?Daniel_D=C3=ADaz?= <daniel.diaz@linaro.org>
Subject: Re: linux-next: build failure after merge of the origin tree
In-Reply-To: <20200730061407.GA7941@1wt.eu>
References: <20200730090828.2349e159@canb.auug.org.au>
 <CAHk-=wjK8+12i8iDC41LXfZBcMjGsF+WyW_+ncPFmrexRT0yxw@mail.gmail.com>
 <202007292007.D87DBD34B@keescook> <20200730032250.GB7790@1wt.eu>
 <20200730061407.GA7941@1wt.eu>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <102fc7a6fa4c2767879a6f911a9a16d5@misterjones.org>
X-Sender: maz@misterjones.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: w@1wt.eu, keescook@chromium.org, torvalds@linux-foundation.org, sfr@canb.auug.org.au, re.emese@gmail.com, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, samitolvanen@google.com, daniel.diaz@linaro.org
X-SA-Exim-Mail-From: maz@misterjones.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020-07-30 07:14, Willy Tarreau wrote:
> On Thu, Jul 30, 2020 at 05:22:50AM +0200, Willy Tarreau wrote:
>> On Wed, Jul 29, 2020 at 08:17:48PM -0700, Kees Cook wrote:
>> > And just another heads-up, the patch[1] (which was never sent to a public
>> > list) also breaks arm64 (circular header needs?):
>> (...)
>> 
>> Definitely, we've just got a report about this, I'll have a look once
>> I'm at the office. I'd like to check that we don't obviously break
>> another arch by just removing percpu. If at least shuffling them 
>> around
>> is sufficient that'd be nice. Otherwise we'll likely need a separate
>> header (which is not a bad thing for the long term).
> 
> So Linus proposed a clean solution which might be harder to backport
> but looks better for 5.8. However the attached one addresses the issue
> for me on arm64 and still works on x86_64, arm, mips. I think we should
> go with this one first then apply Linus' one on top of it to be long
> term proof, and backport only the first one. Linus ?

So for what it's worth, this patch fixes the arm64 compilation problem
for me:

Tested-by: Marc Zyngier <maz@kernel.org>

I had come up with a different fix, only touching arm64 (see below).

Thanks,

         M.

 From 33d819f4efa0a4474b5dc2e4bcaef1b886ca30c3 Mon Sep 17 00:00:00 2001
 From: Marc Zyngier <maz@kernel.org>
Date: Thu, 30 Jul 2020 10:53:05 +0100
Subject: [PATCH] arm64: Drop unnecessary include from asm/smp.h

asm/pointer_auth.h is not needed anymore in asm/smp.h, as 62a679cb2825
("arm64: simplify ptrauth initialization") removed the keys from the
secondary_data structure.

This also cures a compilation issue introduced by f227e3ec3b5c
("random32: update the net random state on interrupt and activity").

Fixes: 62a679cb2825 ("arm64: simplify ptrauth initialization")
Fixes: f227e3ec3b5c ("random32: update the net random state on interrupt 
and activity")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
  arch/arm64/include/asm/smp.h | 1 -
  1 file changed, 1 deletion(-)

diff --git a/arch/arm64/include/asm/smp.h b/arch/arm64/include/asm/smp.h
index ea268d88b6f7..a0c8a0b65259 100644
--- a/arch/arm64/include/asm/smp.h
+++ b/arch/arm64/include/asm/smp.h
@@ -30,7 +30,6 @@
  #include <linux/threads.h>
  #include <linux/cpumask.h>
  #include <linux/thread_info.h>
-#include <asm/pointer_auth.h>

  DECLARE_PER_CPU_READ_MOSTLY(int, cpu_number);

-- 
2.27.0


-- 
Who you jivin' with that Cosmik Debris?
