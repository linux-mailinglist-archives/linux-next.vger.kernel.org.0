Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 678CD231EC5
	for <lists+linux-next@lfdr.de>; Wed, 29 Jul 2020 14:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgG2MsK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Jul 2020 08:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgG2MsK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 29 Jul 2020 08:48:10 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04FE3C061794;
        Wed, 29 Jul 2020 05:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=yYkMg9oo+eIA5xPDTODwyrduO9h1EYb6IRxHzdvCDzM=; b=BxoZM5q3nVMman3md9NIGIcJj+
        gDcrN6pf7bPrP5mIR61HwNxBP7+WN01L+Yam0o2fgbhmyfpEb7mZmQQqBrIL0aogqE+WxlNDfe/I9
        AJBdjlX+Yy2jXpTT2UZIBGof8kkmz48pmeKF2hMFcwZ1/H19C/eEZRBIlzuGg0y1qjzm0a4lm1INA
        7dS58u2kVhqbynAHp36mhcmW03HOjbc4Zf3HUrsY0KtIK/eWEDgfHhCWe5m3zxgPZmpIgkNg6ZLHX
        aYafkV1wwcjb+pkoiQSqIr3hiVudsA49yqenwv9osKXgrOqmpnxO44PqgbY1/Uh99qXSzbLSAcgz7
        mApOt57w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k0lUo-0000os-Do; Wed, 29 Jul 2020 12:47:46 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 993E030411F;
        Wed, 29 Jul 2020 14:47:44 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 7682F203D06A4; Wed, 29 Jul 2020 14:47:44 +0200 (CEST)
Date:   Wed, 29 Jul 2020 14:47:44 +0200
From:   peterz@infradead.org
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Petr Mladek <pmladek@suse.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 0/2] locking/qspinlock: Break qspinlock_types.h header
 loop
Message-ID: <20200729124744.GC2638@hirez.programming.kicks-ass.net>
References: <20200729210311.425d0e9b@canb.auug.org.au>
 <20200729114757.GA19388@gondor.apana.org.au>
 <20200729122807.GA7047@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200729122807.GA7047@gondor.apana.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 29, 2020 at 10:28:07PM +1000, Herbert Xu wrote:
> This miniseries breaks a header loop involving qspinlock_types.h.
> The issue is that qspinlock_types.h includes atomic.h, which then
> eventually includes kernel.h which could lead back to the original
> file via spinlock_types.h.

How did you run into this, I haven't seen any build failures due to
this.

> The first patch moves ATOMIC_INIT into linux/types.h while the second
> patch actuallys breaks the loop by no longer including atomic.h
> in qspinlock_types.h.

Anyway, the patches look sane enough, I'll go stick them in
tip/locking/core or somesuch.
