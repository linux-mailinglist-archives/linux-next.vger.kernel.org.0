Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA3D3149F6
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 09:08:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbhBIIGw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 03:06:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhBIIGv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 9 Feb 2021 03:06:51 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E50FC061786;
        Tue,  9 Feb 2021 00:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=561m1JSOnJd3yK5dZVU8KkZf66IDG0xnVDexH6e2StQ=; b=kClxywIpRgg3p4VbxonBmrqhQv
        MaQar0XCWOzJX+aKT3UZHVzquKaderMu/kfvqsPqWonmFWEFohIBNlxEY0lfp7O+TiLkZRrX2zaKQ
        tmMxy4BOzyvLmm5MaPVpzonMJTbKvN7TkuSjtLuWGRqtD84X6gT+w6jhvHEGLpOEWhSnSo8WfWuMA
        d/nBzAfDUwcNZDzUyRy1dyMoU6xiQU8GzrjZI0x+lZf0d2lUtzLcOS1AYafOwi/ZApXW2HF0HKLsP
        LQuMT+0mc80BNMBolWbMlyuKp3EXoXF4k/gf6EGYky5pV8E1nA1wEVROdNaDRwMdXXtKT155W0Qua
        RmLqeimg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l9O26-0007qe-DU; Tue, 09 Feb 2021 08:06:02 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E4E4530066E;
        Tue,  9 Feb 2021 09:06:00 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 7A4F92BA20223; Tue,  9 Feb 2021 09:06:00 +0100 (CET)
Date:   Tue, 9 Feb 2021 09:06:00 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        aryabinin@virtuozzo.com, dvyukov@google.com, keescook@chromium.org
Subject: Re: linux-next: Tree for Feb 8 (objtool: warnings: 5)
Message-ID: <YCJCaDIzIaUZG27F@hirez.programming.kicks-ass.net>
References: <20210208235246.01cb4daf@canb.auug.org.au>
 <2000eae0-89f4-a88f-a113-7fa47f16def7@infradead.org>
 <20210208212153.vs2v7k2c55a3syvo@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210208212153.vs2v7k2c55a3syvo@treble>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 08, 2021 at 03:21:53PM -0600, Josh Poimboeuf wrote:

> > fs/select.o: warning: objtool: do_sys_poll()+0x8e9: call to __ubsan_handle_sub_overflow() with UACCESS enabled
> > lib/iov_iter.o: warning: objtool: iovec_from_user.part.12()+0x2db: call to __ubsan_handle_add_overflow() with UACCESS enabled
> 
> Peter, we need the patch to prevent UBSAN with gcc7?

I send it a while ago, Andrey wasn't liking it or something :/ But yes,
UBSAN on <GCC8 is buggered. Randy ought to be aware of that though.
Maybe he wanted something like the below?


> > vmlinux.o: warning: objtool: do_machine_check()+0x7ee: call to queue_task_work() leaves .noinstr.text section
> > vmlinux.o: warning: objtool: lock_is_held_type()+0x107: call to warn_bogus_irq_restore() leaves .noinstr.text section
> 
> Peter?

The mce one is a rats nest, Boris has that on his todo list. I'll go
look at the lockdep one.


---
 lib/Kconfig.ubsan | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/Kconfig.ubsan b/lib/Kconfig.ubsan
index 3a0b1c930733..6e4634b3b40e 100644
--- a/lib/Kconfig.ubsan
+++ b/lib/Kconfig.ubsan
@@ -116,6 +116,7 @@ config UBSAN_SIGNED_OVERFLOW
 	bool "Perform checking for signed arithmetic overflow"
 	default UBSAN
 	depends on $(cc-option,-fsanitize=signed-integer-overflow)
+	depends on !CC_IS_GCC || GCC_VERSION >= 80000
 	help
 	  This option enables -fsanitize=signed-integer-overflow which checks
 	  for overflow of any arithmetic operations with signed integers.
