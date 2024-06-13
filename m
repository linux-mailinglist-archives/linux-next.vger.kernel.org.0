Return-Path: <linux-next+bounces-2544-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 416CC906F81
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 14:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB1BE1F215E5
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 12:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54A81487F9;
	Thu, 13 Jun 2024 12:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuWlNS+J"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE008146A7C;
	Thu, 13 Jun 2024 12:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718281025; cv=none; b=dvwRf6R1dXk37Kv9eAUsR6ElRvJtn6nxZrpsy9yOharJBtVQAHcYSS/p0KMElWqzC12seCeQ6Wcih6cQ93jPTtm4459qf1cEWWn7ltbUfyHLtPkMikDPEVC7/qQ0UEo+acXdQzzYQYMfHVvzRzcLK9Lh5dfRJ1yH2reEpHvvcmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718281025; c=relaxed/simple;
	bh=uDLg8xiOH40eyMHiYNaLHIVcAX1qZ6rlVbwNjieRvrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ceZwsR1Jt/vmaYiY0/BjlobdV3KyM6gbpfplY8qVE/cfbwNGyp3Le3gDpIpN+ropU5reiDqLzEmA+jTbhbEVNqBz9WkEzUBtKcNgwQzO/ySsDU6KN4T4TP9qMB1k6pNqGv458anVnJmNIrzdUdsMLGAI0SOP0ZQIqUqKgYjS5VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuWlNS+J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99966C2BBFC;
	Thu, 13 Jun 2024 12:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718281025;
	bh=uDLg8xiOH40eyMHiYNaLHIVcAX1qZ6rlVbwNjieRvrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fuWlNS+JHIG7EynXsDfmMY5B+ZFkkNZF3txxm5xMTBBGLCBCzTUCAbBQ1d2/SNQKq
	 OT+Go3+0rRW0Hk5xwDQSvD6MEYi9InvTCUrLBMD5y7Pr2iagHKlj6XbY73+yPvmvF8
	 inkftWkJyv2uDB/6D5G3QaLkWLC9SWdcx9LhHjodaL6b8P0LPdgKL6vb9kkKX4xpov
	 oliUM25pN6l2G1ALsNaDbYK3DAw4/WPt8lqfpBayYP2xo4De228TXP4PmtcViCrOP6
	 kBYMiFJtrMaaB1kvriwFHKzIMw0z3ATPj4hmBwuASa5j+omjD9e8TosNZS4wsJg6HN
	 5JybM4h6eiDlw==
Date: Thu, 13 Jun 2024 14:17:01 +0200
From: Christian Brauner <brauner@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20240613-verbogen-daneben-84c61797c60a@brauner>
References: <20240613104837.346519cc@canb.auug.org.au>
 <20240612192141.69896438b5f6e674e07d418e@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240612192141.69896438b5f6e674e07d418e@linux-foundation.org>

On Wed, Jun 12, 2024 at 07:21:41PM GMT, Andrew Morton wrote:
> On Thu, 13 Jun 2024 10:48:37 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > The following commits are also in Linus Torvalds' tree as different
> > commits (but the same patch):
> > 
> >   08ce6f724ce9 ("proc: Remove usage of the deprecated ida_simple_xx() API")
> > 
> > This is commit
> > 
> >   d92c9986e4db ("proc: remove usage of the deprecated ida_simple_xx() API")
> > 
> > in the mm-nonmm-unstable branch of the mm tree.
> 
> That's one patch from a three-patch series in a different tree.
> 
> Also,
> 
> hp2:/usr/src/mm> git log fs/proc/ | grep "Signed-off-by.*brauner" | wc -l  
> 22
> hp2:/usr/src/mm> git log fs/proc/ | grep "Signed-off-by.*akpm" | wc -l 
> 1211
> 
> Christian, if procfs patches are to henceforth go via the vfs tree,
> let's be a bit more organized about it?

Sure. I simply didn't see any any "applied" message from you so I just
assumed to pick the parts that are relevant. Sorry about that.

