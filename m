Return-Path: <linux-next+bounces-7387-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA1EAFBF6D
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 02:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19191168C75
	for <lists+linux-next@lfdr.de>; Tue,  8 Jul 2025 00:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9907935963;
	Tue,  8 Jul 2025 00:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="rKNd6mYb"
X-Original-To: linux-next@vger.kernel.org
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7179A81ACA;
	Tue,  8 Jul 2025 00:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751935554; cv=none; b=vGVJXTLw28svE31yzMYiBpFuxI6Y4EWbHnaVg0jrTgfpTp/NaKG+yO7EowjaASkAuXO0qusmyiQOzFoBMndjm7dSUqmzvIhHcgTL8fOQcAIydgIqZHv4l3S5xDHhFcPL5+bSrQuqcedcmWKV0aNMfn+aUpTWvEM0ZWI4E94ZStk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751935554; c=relaxed/simple;
	bh=dc51OxDkeOLE3k5yqnHBgbnkKVNafIV8S6PdCVjhv6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ym5u2BlaX/W4+bPopitHNgkzm8gbYdYZcrf9WuHdJtuVfKxkbeBNG5FbmmHw109XjwdnXdsfb7Lo7D8EMGGwP9DVrN2NAZmKTBYy+rDGmVAXHUroj2m1Vz+5WYnNOe6ECNlf4IYYabJkQ4lpus+D1bPUn76MQ+E/YTaFDzSSYac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=rKNd6mYb; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ywMfgS1GufDJcq3Y2zC1VBHBidzypIj+jBDjbdaiBEM=; b=rKNd6mYbQM2I8ZniLk4bKysPm9
	WesUyQS92bxFbrgRHfLgMf68pjlWHmIvl3jL7zavBcyG2zlwlC+s12U2czKkfu/xfLFNQt2i6D3C/
	D8p94BLrP4ww8GK/tMyekb/SiLgaYLAGb+GAfzAb7tVfEkpMXvyytwojqCQmNkJ9LB33xJ/WE3nlS
	Ya9MF2AgZMFKgChM/z8fXdTvys+04rdQO/X0LEgcxIpiRrg0v5PsiKLUKXMvFxB0kptyS4oPDyXak
	rY8V8VZkQFZe+60JXuKaWz9eDfggWQQ9oPC74xoJRPZpXPoAXPrpHIhU7eI9G76EP4cFOY0KKGDQF
	h8AD0UAg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYwT0-00000005A07-1QvU;
	Tue, 08 Jul 2025 00:45:50 +0000
Date: Tue, 8 Jul 2025 01:45:50 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs tree with the vfs-brauner
 tree
Message-ID: <20250708004550.GS1880847@ZenIV>
References: <20250708093837.52e3a89d@canb.auug.org.au>
 <20250708002509.GR1880847@ZenIV>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708002509.GR1880847@ZenIV>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, Jul 08, 2025 at 01:25:09AM +0100, Al Viro wrote:

> Umm...  Let's do it that way - fs/fhandle.c chunk of that commit is
> trivially split off and the rest should not conflict at all.
> 
> Christian, would you mind throwing this on top of your vfs.pidfs?  I'm dropping
> that part from my #work.misc commit...

Argh...  Sorry, no go - that chunk needs to go before the rest of conversion
commit.  Hmm...

See vfs/vfs.git #vfs-6.17.fs_struct; that branches off your "reflow" commit
and it merges clean with #vfs.all, AFAICS.

Are you OK with that variant?  I've no strong preferences re branchpoints,
but some folks do - no idea if you have any policies in that respect.

If you don't have any problems with it, just merge it into #vfs.all
and I'll drop that commit from #work.misc

