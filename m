Return-Path: <linux-next+bounces-6034-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD77A728F6
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 04:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 130A47A64E9
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 03:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E1F133987;
	Thu, 27 Mar 2025 03:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gL0WSluT"
X-Original-To: linux-next@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ADD381AF
	for <linux-next@vger.kernel.org>; Thu, 27 Mar 2025 03:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743044514; cv=none; b=eJ7kT5KBayv8Qebdo4z1E3geygaE8sq5gGddhx39LPMIeNuFrOhVkhDRAnH526o4IrtGr74HP8d31PLsRfxcbcRoUvWFYA8ERZUvTjAz1sJSvWGhOCCgkanxaY5GAQ0Miw8hJzFTOm6NbwnColh+15aQC3qR+uOZo7F7pRVsCgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743044514; c=relaxed/simple;
	bh=thUuJnJ8VXXwRKxzVkUjo+rftYb0DJPMdsoYf1Xn4lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ld6rkIE4V3q5FCHFPGhG5XQe+yD5Y3vbxFzcl/Iseu6UIkUu7XCiUoD80G+pYyDk0BEpu0bos17mskncQ6u7viw6+tXpEA0qo1pbRZQtMJK3zzddCcb4ZSYzBoehmI2oLic1VTgGKzYHiqpUQud9oiaZTxsu2xzhxnhUExZi7/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gL0WSluT; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Wed, 26 Mar 2025 23:01:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743044508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r3QxKyDhIOrMyYk6XaxrRApzyCoPe9IbM7NQ3fAVW4w=;
	b=gL0WSluTIQowVlKLtVEuPtY0aVmirO9dU3b+k2eArBoyP7keH9VeSae4+kA17nIyQnbqxz
	wTce5or/KKFbMOXxqdiq1U5x3cJjsGn/SGwmiWxY2/fKMqMwzzIZToJUIfnTM5PW4nWfvv
	bn/EJp+YNwptR9IEGNZyjD5P0vkJpMg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Uros Bizjak <ubizjak@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the bcachefs tree
Message-ID: <cce7xktcvlnmttahpsc26cnwwtgpg56c5ko2mmr6stgbllrvda@lnplzn36jlul>
References: <20250326132819.30db65e7@canb.auug.org.au>
 <20250327115403.039e8638@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327115403.039e8638@canb.auug.org.au>
X-Migadu-Flow: FLOW_OUT

On Thu, Mar 27, 2025 at 11:54:03AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 26 Mar 2025 13:28:19 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > After merging the bcachefs tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > fs/bcachefs/time_stats.c: In function 'bch2_time_stats_reset':
> > fs/bcachefs/time_stats.c:165:27: error: comparison of pointers to disjoint address spaces
> >   165 |             stats->buffer != TIME_STATS_NONPCPU) {
> >       |                           ^~
> > fs/bcachefs/time_stats.c: In function 'bch2_time_stats_exit':
> > fs/bcachefs/time_stats.c:175:27: error: comparison of pointers to disjoint address spaces
> >   175 |         if (stats->buffer != TIME_STATS_NONPCPU) {
> >       |                           ^~
> > fs/bcachefs/time_stats.c: In function 'bch2_time_stats_init_no_pcpu':
> > fs/bcachefs/time_stats.c:192:23: error: assignment from pointer to non-enclosed address space
> >   192 |         stats->buffer = TIME_STATS_NONPCPU;
> >       |                       ^
> > fs/bcachefs/time_stats.c:192:23: note: expected '__seg_gs struct time_stat_buffer *' but pointer is of type 'struct time_stat_buffer *'
> > 
> > Caused by commit
> > 
> >   5490554cf06f ("bcachefs: bch2_time_stats_init_no_pcpu()")
> > 
> > interacting with commit
> > 
> >   6a367577153a ("percpu/x86: enable strict percpu checks via named AS qualifiers")
> > (or an associated one)
> > 
> > from the mm-stable tree.
> > 
> > I have applied the following merge fix patch for today (but I think it
> > could just be applied to the bcachefs tree).
> > 
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Wed, 26 Mar 2025 13:15:00 +1100
> > Subject: [PATCH] fix up for "bcachefs: bch2_time_stats_init_no_pcpu()"
> > 
> > interacting with "percpu/x86: enable strict percpu checks via named AS qualifiers"
> > 
> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > ---
> >  fs/bcachefs/time_stats.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/bcachefs/time_stats.c b/fs/bcachefs/time_stats.c
> > index a8382d876835..b16540aa9ca4 100644
> > --- a/fs/bcachefs/time_stats.c
> > +++ b/fs/bcachefs/time_stats.c
> > @@ -11,7 +11,7 @@
> >  #include "time_stats.h"
> >  
> >  /* disable automatic switching to percpu mode */
> > -#define TIME_STATS_NONPCPU	((struct time_stat_buffer *) 1)
> > +#define TIME_STATS_NONPCPU	((struct time_stat_buffer __percpu *) 1)
> >  
> >  static const struct time_unit time_units[] = {
> >  	{ "ns",		1		 },
> > -- 
> > 2.45.2
> 
> This now fails like this:
> 
> fs/bcachefs/time_stats.c: In function 'bch2_time_stats_init_no_pcpu':
> fs/bcachefs/time_stats.c:190:23: error: assignment from pointer to non-enclosed address space
>   190 |         stats->buffer = (struct time_stat_buffer __rcu *) TIME_STATS_NONPCPU;
>       |                       ^
> fs/bcachefs/time_stats.c:190:23: note: expected '__seg_gs struct time_stat_buffer *' but pointer is of type 'struct time_stat_buffer *'
> 
> I have now )instead of the above) applied the following merge fix patch (which should be able to be applied to the bcachefs tree directly):
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 27 Mar 2025 11:42:11 +1100
> Subject: [PATCH] fix up 2 for "bcachefs: bch2_time_stats_init_no_pcpu()"
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/bcachefs/time_stats.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/bcachefs/time_stats.c b/fs/bcachefs/time_stats.c
> index 725d433a246f..2c34fe4be912 100644
> --- a/fs/bcachefs/time_stats.c
> +++ b/fs/bcachefs/time_stats.c
> @@ -187,5 +187,5 @@ void bch2_time_stats_init(struct bch2_time_stats *stats)
>  void bch2_time_stats_init_no_pcpu(struct bch2_time_stats *stats)
>  {
>  	bch2_time_stats_init(stats);
> -	stats->buffer = (struct time_stat_buffer __rcu *) TIME_STATS_NONPCPU;
> +	stats->buffer = (struct time_stat_buffer __percpu *) TIME_STATS_NONPCPU;

Thanks, late night brain fart...

