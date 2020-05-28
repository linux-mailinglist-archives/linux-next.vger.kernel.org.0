Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 019121E677C
	for <lists+linux-next@lfdr.de>; Thu, 28 May 2020 18:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405048AbgE1QeA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 12:34:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:38038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405023AbgE1Qd7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 May 2020 12:33:59 -0400
Received: from paulmck-ThinkPad-P72.home (50-39-105-78.bvtn.or.frontiernet.net [50.39.105.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 221E020721;
        Thu, 28 May 2020 16:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590683639;
        bh=lp2SwfPlzvdvwArWtsuyPtJAzHI9heMo9lfveCAl0Zg=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=J0FyzdG/RR5D6IvFOHZJlnVnTXlBRDXKN8PAfxYvVtK8VeITU3sxv3qGjvJuy7j3D
         x/UZXjheUJ6neRycJD5aFrJqBa2L8g6UMXeH7VRNa3krcUrIMYYvpqi3i8e4A5J252
         uEyyEtm8RAz8JSP3HoPL6FfE/Irwi44WKZ8CIKbs=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
        id 0A29035228F0; Thu, 28 May 2020 09:33:59 -0700 (PDT)
Date:   Thu, 28 May 2020 09:33:59 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>
Subject: Re: linux-next: build failure after merge of the rcu tree
Message-ID: <20200528163358.GK2869@paulmck-ThinkPad-P72>
Reply-To: paulmck@kernel.org
References: <20200528190501.10135e9f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200528190501.10135e9f@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 28, 2020 at 07:05:01PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the rcu tree, today's linux-next build (powercp
> allyesconfig) failed like this:
> 
> ld: kernel/rcu/refperf.o:(.discard+0x0): multiple definition of `__pcpu_unique_srcu_ctl_perf_srcu_data'; kernel/rcu/rcuperf.o:(.discard+0x0): first defined here
> 
> Caused by commit
> 
>   786a25497743 ("refperf: Add a test to measure performance of read-side synchronization")
> 
> From srcutree.h:
> 
>  * Note that although DEFINE_STATIC_SRCU() hides the name from other
>  * files, the per-CPU variable rules nevertheless require that the
>  * chosen name be globally unique.
> 
> I have applied the following patch for today.

I have a patch queued, but it is currently blocked by other broken
commits which I expect to have straightened out today.

Yet again, please accept my apologies for the hassle!

							Thanx, Paul

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 28 May 2020 18:57:17 +1000
> Subject: [PATCH] refperf: uniqify name
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  kernel/rcu/refperf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/rcu/refperf.c b/kernel/rcu/refperf.c
> index 8c4a63257be9..47df72c492b3 100644
> --- a/kernel/rcu/refperf.c
> +++ b/kernel/rcu/refperf.c
> @@ -133,8 +133,8 @@ static struct ref_perf_ops rcu_ops = {
>  
>  
>  // Definitions for SRCU ref perf testing.
> -DEFINE_STATIC_SRCU(srcu_ctl_perf);
> -static struct srcu_struct *srcu_ctlp = &srcu_ctl_perf;
> +DEFINE_STATIC_SRCU(ref_srcu_ctl_perf);
> +static struct srcu_struct *srcu_ctlp = &ref_srcu_ctl_perf;
>  
>  static void srcu_ref_perf_read_section(int nloops)
>  {
> -- 
> 2.26.2
> 
> -- 
> Cheers,
> Stephen Rothwell


