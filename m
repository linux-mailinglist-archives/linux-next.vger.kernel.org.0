Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3DF12C57E8
	for <lists+linux-next@lfdr.de>; Thu, 26 Nov 2020 16:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390351AbgKZPMm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Nov 2020 10:12:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:45100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389316AbgKZPMm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 26 Nov 2020 10:12:42 -0500
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net [50.39.104.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41D2220B80;
        Thu, 26 Nov 2020 15:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606403561;
        bh=DcgYvX6yRrxf+Fpflpw7rfncRPfHB8xSo5AQgmObgms=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=j49Wj1nO078AkiGVvVX4EZM6Gre5J5HJW357dXeAfh23/pXLc+FW7D96Cv2RkkLBJ
         ZsxW8jda8PmNs4o6dlWHrGN/lqWUZzsRvR33lk6RUw4yzo27Hs8UzUV7fCSRNpwqxl
         IOFp5cZmUFriVfs4NTqHFfvAEs6+toCK6iJsadCI=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id DD7A93520A96; Thu, 26 Nov 2020 07:12:40 -0800 (PST)
Date:   Thu, 26 Nov 2020 07:12:40 -0800
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the rcu tree
Message-ID: <20201126151240.GP1437@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20201126174428.675f3cfd@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126174428.675f3cfd@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 26, 2020 at 05:44:28PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (htmldocs) produced
> these warnings:
> 
> include/linux/rcupdate.h:872: warning: Excess function parameter 'ptr' description in 'kfree_rcu'
> include/linux/rcupdate.h:872: warning: Excess function parameter 'rhf' description in 'kfree_rcu'
> 
> Introduced by commit
> 
>   beba8bdf2f16 ("rcu: Introduce kfree_rcu() single-argument macro")

Heh!  The documentation isn't dealing at all well with this situation.

Would one of the docbook experts have some advice, keeping in mind
that kfree_rcu might have either one or two arguments?

							Thanx, Paul

------------------------------------------------------------------------

/**
 * kfree_rcu() - kfree an object after a grace period.
 * @ptr: pointer to kfree for both single- and double-argument invocations.
 * @rhf: the name of the struct rcu_head within the type of @ptr,
 *       but only for double-argument invocations.
 *
 * Many rcu callbacks functions just call kfree() on the base structure.
 * These functions are trivial, but their size adds up, and furthermore
 * when they are used in a kernel module, that module must invoke the
 * high-latency rcu_barrier() function at module-unload time.
 *
 * The kfree_rcu() function handles this issue.  Rather than encoding a
 * function address in the embedded rcu_head structure, kfree_rcu() instead
 * encodes the offset of the rcu_head structure within the base structure.
 * Because the functions are not allowed in the low-order 4096 bytes of
 * kernel virtual memory, offsets up to 4095 bytes can be accommodated.
 * If the offset is larger than 4095 bytes, a compile-time error will
 * be generated in kvfree_rcu_arg_2(). If this error is triggered, you can
 * either fall back to use of call_rcu() or rearrange the structure to
 * position the rcu_head structure into the first 4096 bytes.
 *
 * Note that the allowable offset might decrease in the future, for example,
 * to allow something like kmem_cache_free_rcu().
 *
 * The BUILD_BUG_ON check must not involve any function calls, hence the
 * checks are done in macros here.
 */
#define kfree_rcu kvfree_rcu
