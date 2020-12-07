Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A91C32D16C0
	for <lists+linux-next@lfdr.de>; Mon,  7 Dec 2020 17:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgLGQrp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 7 Dec 2020 11:47:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:42996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725804AbgLGQro (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 7 Dec 2020 11:47:44 -0500
Date:   Mon, 7 Dec 2020 08:47:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607359624;
        bh=Po6SGiB8kC8wpl8vbPA6UxUzzWrt2PKdruHXPI8zeGo=;
        h=From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=ETPYTkXa/dwkVxgcqtpb/jnyoegGlYqlIAYrFtVGg70vhekpau+xABZt9bGIq57P6
         WDW6grxAxsMEkGI4U6JT9+bKP6GVDluP9oDrAGNOyGdzJ0FnGtpRazTSGpOx3+esQt
         WX5legyJIXLYoqa4QmSyOLdGPJz+ts8V+9FhX5ox/Q/T9Pa/3K4RwCCKefYWgukbv2
         9adH+U/KqfCWED3jZJ7iQNYcx1glgxAAcoMREKbJrYHVg8gkYe2KSgpmNzQboQ/rlx
         DOgWOLKondGyI893H1Fox2hFpR/0WD2ze2Bv/ka4dMdTYTrd0Bw+s9U+U6U9BSOV7r
         6czzQhnJSEYbg==
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rcu tree
Message-ID: <20201207164704.GH2657@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201207192028.5333e4d7@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207192028.5333e4d7@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Dec 07, 2020 at 07:20:28PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/core-api/mm-api:49: mm/slab_common.c:569: WARNING: Inline literal start-string without end-string.
> Documentation/core-api/mm-api:49: mm/slab_common.c:595: WARNING: Inline literal start-string without end-string.
> 
> Maybe introduced by commit
> 
>   f7c3fb4fc476 ("mm: Add kmem_last_alloc() to return last allocation for memory block")
> 
> (or one of the following ones).

I freely confess that I have absolutely no idea what it doesn't like.
It is complaining about this header comment, correct?

/**
 * kmem_last_alloc_stack - Get return address and stack for last allocation
 * @object: object for which to find last-allocation return address.
 * @stackp: %NULL or pointer to location to place return-address stack.
 * @nstackp: maximum number of return addresses that may be stored.
 *
 * If the pointer references a slab-allocated object and if sufficient
 * debugging is enabled, return the return address for the corresponding
 * allocation.  If stackp is non-%NULL in %CONFIG_STACKTRACE kernels running
 * the slub allocator, also copy the return-address stack into @stackp,
 * limited by @nstackp.  Otherwise, return %NULL or an appropriate error
 * code using %ERR_PTR().
 *
 * Return: return address from last allocation, %NULL or negative error code.
 */

							Thanx, Paul
