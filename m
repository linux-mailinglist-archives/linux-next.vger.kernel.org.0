Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3F5E129B58
	for <lists+linux-next@lfdr.de>; Mon, 23 Dec 2019 23:01:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfLWWBx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Dec 2019 17:01:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:33156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726817AbfLWWBw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Dec 2019 17:01:52 -0500
Received: from X1 (nat-ab2241.sltdut.senawave.net [162.218.216.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A6D4206B7;
        Mon, 23 Dec 2019 22:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577138512;
        bh=cvBxc4WmSagTT1y4VAUM0/tpLY90rFtmuzPh60X44l0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=dUQyymDZpS8ieDiLpX7hkhz6mBdQuLmrcPET7KIRfHOhXojpwj0s0BlzgLCJpWaj2
         E2oPEZcZqqs4seNr/Mu0YH/rkQXPgdtJN03vRggrcdL7QWwnRzd8IAOxWfdZZ9GSjA
         37rmBkc5T3XJVAHC7iLWSs0+PEpIHWksAKbeBCvA=
Date:   Mon, 23 Dec 2019 14:01:51 -0800
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 generic-ioremap tree
Message-Id: <20191223140151.7aceb059297338f5912b0f35@linux-foundation.org>
In-Reply-To: <20191221083211.GA3465@lst.de>
References: <20191218133025.15356802@canb.auug.org.au>
        <20191221083211.GA3465@lst.de>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, 21 Dec 2019 09:32:11 +0100 Christoph Hellwig <hch@lst.de> wrote:

> Andrew,
> 
> do you plan to send this to Linus for 5.5 to fix the warning from the
> new devm_ioremap_uc addition in this cycle?  If so I can rebase the
> ioremap tree one more time.

I'm not sure what to do about this because of
https://lore.kernel.org/lkml/CAMuHMdUO=cZMsFx4t_uULNRuwnGLjbRYOJAo7j5gC-iSV3wy5w@mail.gmail.com/

I'd rather just drop the patch.  Can you please take care of it all?  


From: Nick Desaulniers <ndesaulniers@google.com>
Subject: hexagon: define ioremap_uc

Similar to commit 38e45d81d14e ("sparc64: implement ioremap_uc") define
ioremap_uc for hexagon to avoid errors from
-Wimplicit-function-definition.

Link: http://lkml.kernel.org/r/20191209222956.239798-2-ndesaulniers@google.com
Link: https://github.com/ClangBuiltLinux/linux/issues/797
Fixes: e537654b7039 ("lib: devres: add a helper function for ioremap_uc")
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
Acked-by: Brian Cain <bcain@codeaurora.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tuowen Zhao <ztuowen@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexios Zavras <alexios.zavras@intel.com>
Cc: Allison Randal <allison@lohutok.net>
Cc: Will Deacon <will@kernel.org>
Cc: Richard Fontana <rfontana@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 arch/hexagon/include/asm/io.h |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/hexagon/include/asm/io.h~hexagon-define-ioremap_uc
+++ a/arch/hexagon/include/asm/io.h
@@ -173,6 +173,7 @@ static inline void writel(u32 data, vola
 
 void __iomem *ioremap(unsigned long phys_addr, unsigned long size);
 #define ioremap_nocache ioremap
+#define ioremap_uc(X, Y) ioremap((X), (Y))
 
 
 #define __raw_writel writel
_

