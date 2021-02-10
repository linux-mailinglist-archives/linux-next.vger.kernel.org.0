Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 836AF31605C
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 08:51:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233001AbhBJHvt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 02:51:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232823AbhBJHvd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 02:51:33 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE266C06178B;
        Tue,  9 Feb 2021 23:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=75/kkYZe/pkc80wGhtF+H66lSSRAfzzQx0D4VyGJYnM=; b=JT1BqEwmM9zxtlDgMoW6fDiG8i
        npJnqAR0tvL9KG8BKntwBo1wHF6lz8fN/0Q0r0sMmDjYOZgLHagUMx2WHO3VQSTu17HXUBgv57Q1y
        QSNqf5No+lLaXAju0SeotMAe7XtaDWkwMH3KH3/CABqdPWsCftTCb9+6xTS+isgMPB0D7inlERiYG
        dKksrQ6/+nvARgbXGOhgqI+frybYxzleeryXCGYFEjtNKi238LHqCOuq3aEEBze6c3ADXAYIMetQ9
        Eg8MP79t/ytmkiWHN00YNl1ph3yKBDMjxCvVJp1i4iG55al3F+8J7QhNFRQp1Vu6Ua9VSjrjtMeRK
        J1gpo6GA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l9kGJ-008XLu-Qk; Wed, 10 Feb 2021 07:50:22 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A553A3006D0;
        Wed, 10 Feb 2021 08:50:08 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 38132201D19B1; Wed, 10 Feb 2021 08:50:08 +0100 (CET)
Date:   Wed, 10 Feb 2021 08:50:08 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] ubsan: remove overflow checks
Message-ID: <YCOQMIjZUGWqvHgA@hirez.programming.kicks-ass.net>
References: <YCJCaDIzIaUZG27F@hirez.programming.kicks-ass.net>
 <20210209232348.20510-1-ryabinin.a.a@gmail.com>
 <202102091617.8FD77890@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202102091617.8FD77890@keescook>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 09, 2021 at 04:19:03PM -0800, Kees Cook wrote:
> On Wed, Feb 10, 2021 at 02:23:48AM +0300, Andrey Ryabinin wrote:
> > Since GCC 8.0 -fsanitize=signed-integer-overflow doesn't work with -fwrapv.
> > -fwrapv makes signed overflows defines and GCC essentially disables
> > ubsan checks. On GCC < 8.0 -fwrapv doesn't have influence on
> > -fsanitize=signed-integer-overflow setting, so it kinda works
> > but generates false-positves and violates uaccess rules:
> > 
> > lib/iov_iter.o: warning: objtool: iovec_from_user()+0x22d: call to __ubsan_handle_add_overflow() with UACCESS enabled
> > 
> > Disable signed overflow checks to avoid these problems.
> > Remove unsigned overflow checks as well.
> > Unsigned overflow appeared as side effect of the commit
> >  cdf8a76fda4a ("ubsan: move cc-option tests into Kconfig"),
> > but it never worked (kernel doesn't boot). And unsigned overflows
> > are allowed by C standard, so it just pointless.
> > 
> > Signed-off-by: Andrey Ryabinin <ryabinin.a.a@gmail.com>
> 
> NAK, please don't remove the entire thing. I want this to work again
> with -fwrapv, and it's not entirely broken under Clang. But the feature
> shouldn't be removed from the kernel.
> 
> I'd prefer Peter's fix instead.

But what do you want it to do? This is UBsan, there's no UB.

If you want signed overflow warnings, call it something else. But I'll
still hate it :-)

FWIW:

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
