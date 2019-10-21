Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D12E5DEC59
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 14:36:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbfJUMgX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 08:36:23 -0400
Received: from merlin.infradead.org ([205.233.59.134]:55790 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726767AbfJUMgW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Oct 2019 08:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=kzNw9AJwFphfNGOQaTkaa4fB2KpsEPpAX8/rrHD5/dI=; b=xaNK+bSmI5Z8KEmTxBj9AFoOe
        KNPDi+fHfrsNBBxYC8nReHQOfdL9QkGNAzs8+5Eix4bCuF08JIBagKp25j1SC+7Aa/wG3HVIvyPhX
        t186JBbrrAuHRioD7t3gjO3ZCXHo6mFaifvvicdngqhaKtKiuTTGJGkgPMeM8QTJGIg3eJrurcMHf
        qeiy73Zw0DQo2cV7pc2qdP+i/ePdP0eJ+ZBCdCV96/z4BzC2NWLOiWzdYPecFHQdvCvtETh5h1vgB
        qiheet7c1W0GC+xqc5X+tQ3TIZpm3qEz82OrYywR1uNaNUHL2ajSIMiZEZcpBpjQavXBQfiDqHu1u
        /RI+CTuxg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iMWuf-0004Pn-3h; Mon, 21 Oct 2019 12:35:53 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 66DDC303DA1;
        Mon, 21 Oct 2019 14:34:52 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id E07CE201BAD9A; Mon, 21 Oct 2019 14:35:49 +0200 (CEST)
Date:   Mon, 21 Oct 2019 14:35:49 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>, linux@rasmusvillemoes.dk,
        cyphar@cyphar.com, keescook@chromium.org,
        christian.brauner@ubuntu.com
Subject: Re: linux-next: Tree for Oct 18 (objtool)
Message-ID: <20191021123549.GC1817@hirez.programming.kicks-ass.net>
References: <20191018180300.090dbcb9@canb.auug.org.au>
 <40de4e26-450e-b932-3d73-e833c8aeaa2e@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40de4e26-450e-b932-3d73-e833c8aeaa2e@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 18, 2019 at 08:33:11AM -0700, Randy Dunlap wrote:
> On 10/18/19 12:03 AM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20191017:
> > 
> 
> on x86_64:
> lib/usercopy.o: warning: objtool: check_zeroed_user()+0x35f: call to __ubsan_handle_shift_out_of_bounds() with UACCESS enabled

Blergh... I suppose the below will fix that. I'm a bit conflicted on it
though, the alternative is annotating more ubsan crud.

---
 lib/usercopy.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/lib/usercopy.c b/lib/usercopy.c
index cbb4d9ec00f2..9c5245778dfd 100644
--- a/lib/usercopy.c
+++ b/lib/usercopy.c
@@ -49,21 +49,28 @@ EXPORT_SYMBOL(_copy_to_user);
  */
 int check_zeroed_user(const void __user *from, size_t size)
 {
+	unsigned long head_mask, tail_mask;
 	unsigned long val;
-	uintptr_t align = (uintptr_t) from % sizeof(unsigned long);
+	uintptr_t align;
 
 	if (unlikely(size == 0))
 		return 1;
 
-	from -= align;
-	size += align;
+	align = (uintptr_t) from % sizeof(unsigned long);
+	if (align) {
+		from -= align;
+		size += align;
+		head_mask = ~aligned_byte_mask(align);
+	}
+
+	tail_mask = aligned_byte_mask(size % sizeof(unsigned long));
 
 	if (!user_access_begin(from, size))
 		return -EFAULT;
 
 	unsafe_get_user(val, (unsigned long __user *) from, err_fault);
 	if (align)
-		val &= ~aligned_byte_mask(align);
+		val &= head_mask;
 
 	while (size > sizeof(unsigned long)) {
 		if (unlikely(val))
@@ -76,7 +83,7 @@ int check_zeroed_user(const void __user *from, size_t size)
 	}
 
 	if (size < sizeof(unsigned long))
-		val &= aligned_byte_mask(size);
+		val &= tail_mask;
 
 done:
 	user_access_end();
