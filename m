Return-Path: <linux-next+bounces-7439-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA419AFF184
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 21:12:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EA6C5A62DF
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 19:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BACF239E66;
	Wed,  9 Jul 2025 19:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AmD/OdWz"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE3F2264B0;
	Wed,  9 Jul 2025 19:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088324; cv=none; b=EQG4aVn+k4+ak3bHwzKGYX+E/WZ3HHcsbsQGLkxXp365dLkwJoRbK8xwaTSVeu6VElXdpGAWsFElxHRH7UczP6D6vuo8grPHbbw160EziZjjJv802Ee4YdNtNPWT1VDQ46Dzx6n5gvWaSo5rTdIv1Wa56zHzn+laZDXJ79iGa5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088324; c=relaxed/simple;
	bh=SvnG7N1dBZHRJ7PjsRayqq88gPZu/mE8Ot254TQ3Nu4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=BzX9EpgBYxgBpSZvYL6FUKsNIt0oPm6XYxWAjzuURUEr+W+4BVpb+IYiCW4kjOuYzoh2mUMpNSbsFDGTvr4nOrYo8v0rYJzVFakE2q3WN9wj4xXIG/qyXLQbWux2+VWVDWCsH2t0GBlW+YMnhZ8Xs8BszZKW93DfbaZph091YwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AmD/OdWz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9116EC4CEEF;
	Wed,  9 Jul 2025 19:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1752088323;
	bh=SvnG7N1dBZHRJ7PjsRayqq88gPZu/mE8Ot254TQ3Nu4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AmD/OdWzFwapWPRmkF98xkmc0ipnzVTH7vvE2veXT2AqoYj94MdWFY8TJjHmxS2V6
	 RECyu5wRRny+OY9KF0CgMAtK1IZDnsfc8mwYEfACNhnm2z/YlYYvwMmgjA0zThMyAz
	 T1YlkuY0T2cfidqHf3fYVXZDLszHVBjdKZFINTl8=
Date: Wed, 9 Jul 2025 12:12:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin"
 <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the tip tree
Message-Id: <20250709121203.d8edc8d05253bdf04ce580c6@linux-foundation.org>
In-Reply-To: <20250709091702.GAaG4zjs-otcGsMyY2@fat_crate.local>
References: <20250708160037.2ac0b55e@canb.auug.org.au>
	<20250707234817.d09fc28a3510b23c31c461b4@linux-foundation.org>
	<20250709091702.GAaG4zjs-otcGsMyY2@fat_crate.local>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Jul 2025 11:17:02 +0200 Borislav Petkov <bp@alien8.de> wrote:

> > > 
> > > The following commit is also in the mm-hotfixes tree as a different commit
> > > (but the same patch):
> > > 
> > >   f339770f60d9 ("Revert "sched/numa: add statistics of numa balance task"")
> > > 
> > > This is commit
> > > 
> > >   63afea878dc4 ("Revert "sched/numa: add statistics of numa balance task"")
> > > 
> > > in the mm-hotfixes tree.
> > 
> > Thanks, I'll drop the mm.git copy.
> 
> So we actually started adding it to tip for the time being until you send it
> to Linus so that our testing doesn't fail - it was reproducing reliably on my
> test machines.

Ah, OK.

> So can you pls send it to Linus so that we can drop it from tip?

Yup.  Tomorrow seems likely.

