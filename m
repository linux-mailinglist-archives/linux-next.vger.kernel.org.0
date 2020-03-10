Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0082D17F73D
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 13:17:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgCJMRy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 08:17:54 -0400
Received: from foss.arm.com ([217.140.110.172]:34848 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbgCJMRy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Mar 2020 08:17:54 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B1ED30E;
        Tue, 10 Mar 2020 05:17:53 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 593743F67D;
        Tue, 10 Mar 2020 05:17:52 -0700 (PDT)
Date:   Tue, 10 Mar 2020 12:17:47 +0000
From:   Mark Rutland <mark.rutland@arm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Theodore Ts'o <tytso@mit.edu>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the random tree
Message-ID: <20200310121747.GA49602@lakrids.cambridge.arm.com>
References: <20200302144452.6a7c4907@canb.auug.org.au>
 <20200306155348.7bdc9622@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306155348.7bdc9622@canb.auug.org.au>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Mar 06, 2020 at 03:53:48PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 2 Mar 2020 14:44:52 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the random tree, today's linux-next build (x86_64
> > allnoconfig) produced this warning:
> > 
> > drivers/char/random.c:820:13: warning: 'crng_initialize_secondary' defined but not used [-Wunused-function]
> >   820 | static void crng_initialize_secondary(struct crng_state *crng)
> >       |             ^~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > Introduced by commit
> > 
> >   5cbe0f13b51a ("random: split primary/secondary crng init paths")
> 
> I am still getting this warning.

Sorry, this is my bad.

We only call crng_initialize_secondary() in do_numa_crng_init(), which
is only built for CONFIG_NUMA. We can either drop both
crng_initialize_secondary() and crng_init_try_arch() under the
CONFIG_NUMA ifdef, or add __maybe_unused to crng_initialize_secondary().

Ted, does the below look ok to you? Or would you prefer moving things
under the ifdeffery?

Thanks,
Mark.

---->8----
From 6c3a35cd562d53066e11f5f8a6c3a6f63701d3ed Mon Sep 17 00:00:00 2001
From: Mark Rutland <mark.rutland@arm.com>
Date: Tue, 10 Mar 2020 12:09:12 +0000
Subject: [PATCH] random: avoid warnings for !CONFIG_NUMA builds

As crng_initialize_secondary() is only called by do_numa_crng_init(),
and the latter is under ifdeffery for CONFIG_NUMA, when CONFIG_NUMA is
not selected the compiler will warn that the former is unused:

| drivers/char/random.c:820:13: warning: 'crng_initialize_secondary' defined but not used [-Wunused-function]
|   820 | static void crng_initialize_secondary(struct crng_state *crng)
|       |             ^~~~~~~~~~~~~~~~~~~~~~~~~

Stephen reports that this happens for x86_64 noallconfig builds.

We could move crng_initialize_secondary() and crng_init_try_arch() under
the CONFIG_NUMA ifdeffery, but this has the unfortunate property of
separating them from crng_initialize_primary() and
crng_init_try_arch_early() respectively. Instead, let's mark
crng_initialize_secondary() as __maybe_unused.

Fixes: 5cbe0f13b51a ("random: split primary/secondary crng init paths")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Theodore Ts'o <tytso@mit.edu>
---
 drivers/char/random.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index f43f65c2195d..0d10e31fd342 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -817,7 +817,7 @@ static bool __init crng_init_try_arch_early(struct crng_state *crng)
 	return arch_init;
 }
 
-static void crng_initialize_secondary(struct crng_state *crng)
+static void __maybe_unused crng_initialize_secondary(struct crng_state *crng)
 {
 	memcpy(&crng->state[0], "expand 32-byte k", 16);
 	_get_random_bytes(&crng->state[4], sizeof(__u32) * 12);
-- 
2.11.0

