Return-Path: <linux-next+bounces-3685-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C50E9714FF
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 12:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7D3D1C22EB2
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 10:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593111B3B2D;
	Mon,  9 Sep 2024 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CDurDg17"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326761AD3EF;
	Mon,  9 Sep 2024 10:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725876801; cv=none; b=Se2BY4V+bXehL86kltif46LlhFiGyk7+vFfwPn0tm6Qasivi+7HNFfPAI1hlrwHToVIh6HuQocd0UfEkru8gXg5bJoSIM92rrI0j2ypqZEIvkPWigBdc9l6B6oc4iZbYJKpXDoCSW2QuYQPco38my5zwz39rsuS5q9rLFN+NBho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725876801; c=relaxed/simple;
	bh=I5HI8cNFc5entTO/TBxtd+2VVtuu8FDZlqMxS7uJYRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VAUbACZTW81WPnktVgg03nkycB3WL90eF1Asp5v16fJS11xNlhHXdAD6l/vpyqIb449gdfxEWVAfJ0EYzdIxOtspMl4XZIRrGDi5euMwG0Opq0EC/k2JWuMZuw0H3oE8AMQbJYITVdJ2MPuFneB7bQmdH/5iQn5Rlt98D51hTCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CDurDg17; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D706FC4CEC5;
	Mon,  9 Sep 2024 10:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725876801;
	bh=I5HI8cNFc5entTO/TBxtd+2VVtuu8FDZlqMxS7uJYRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CDurDg17o6i8NSdGF5d7Ptz+c4zUF74jehOMANv0k9zssFhWK/8K2MvpMeNRayG9L
	 S1OQjRds2g11uBPXSyErriGTBCzNaRzUDk1mO+wy4d+lmtXdWmLnTsptO6oUlnH2On
	 Z6ZETfd9tOJiqZRnBDcTU4zgmr9fMKIQiCwgoz4LNtq4iItb+A3yYRk6bTWF0HHxxT
	 jXQ1zbc0QWI212dAz8V30sfNtx/hfs/7hOLp2gGdD/n/1aUokjM3hF5ltzCqi/zg5R
	 z0kVvCRe1Qc5B7LJ75hUjuYy24T3peSOLyrxrxkNhBX35Cy7uqSkfwuiA15Yc8rCw9
	 nF3IExCWA7LOQ==
Date: Mon, 9 Sep 2024 12:13:17 +0200
From: Christian Brauner <brauner@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the slab tree
Message-ID: <20240909-anvisiert-weltweit-d3b485680666@brauner>
References: <20240909171220.32e862e3@canb.auug.org.au>
 <af23f1d3-27de-4591-ab0a-02268ef547a3@suse.cz>
 <20240909-organismus-sattbekommen-06332e10fcd1@brauner>
 <5661a983-9875-4cdb-8bdb-fc83e82f0b58@suse.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5661a983-9875-4cdb-8bdb-fc83e82f0b58@suse.cz>

On Mon, Sep 09, 2024 at 11:40:25AM GMT, Vlastimil Babka wrote:
> On 9/9/24 11:16, Christian Brauner wrote:
> > On Mon, Sep 09, 2024 at 09:18:57AM GMT, Vlastimil Babka wrote:
> >> On 9/9/24 09:12, Stephen Rothwell wrote:
> >> > Hi all,
> >> > 
> >> > The following commits are also in the vfs-brauner tree as different
> >> > commits (but the same patches):
> >> > 
> >> >   c0390d541128 ("fs: pack struct file")
> >> >   ea566e18b4de ("fs: use kmem_cache_create_rcu()")
> >> >   d345bd2e9834 ("mm: add kmem_cache_create_rcu()")
> >> >   e446f18e98e8 ("mm: remove unused argument from create_cache()")
> >> >   0f389adb4b80 ("mm: Removed @freeptr_offset to prevent doc warning")
> >> > 
> >> > These are commits
> >> > 
> >> >   f2b8943e64a8 ("fs: pack struct file")
> >> >   d1e381aa30cb ("fs: use kmem_cache_create_rcu()")
> >> >   ba8108d69e5b ("mm: add kmem_cache_create_rcu()")
> >> >   a85ba9858175 ("mm: remove unused argument from create_cache()")
> >> >   6e016babce7c ("mm: Removed @freeptr_offset to prevent doc warning")
> >> > 
> >> > in the vfs-brauner tree.
> >> > 
> >> > These duplicates are causing unnecessary comflicts ...
> >> 
> >> Thanks,
> >> 
> >> Christian told me merging the vfs.file branch (a necessary prerequisity for
> >> one series in slab) would be ok as it was stable at that point. What
> >> happened? If I do redo with a new merge, will that stay unchanged until the
> >> merge window?
> > 
> > Hm, that's very odd that the IDs changed. The only thing that I did was
> > b4 trailers -u on the branch to quickly check whether I missed an RvBs
> > or Acks. But there were none so I assumed that the commit ids wouldn't
> 
> I guess b4 could be smarter and not perform/rollback the history rewrite if
> there's nothing to change.
> I hope I would have caught such surprise by trying git push without --force
> if I assumed there was no rebase and only new patches added on top. But
> maybe you had some intended rebase in some of the newer patches there.
> 
> > change. Let me check and rollback if that was the case.
> 
> Thank!

No problem. I promised a stable branch so you'll get one. :)

So I rebased vfs.file onto the previous patches and pushed it out.
Note that I've merged an additional series into vfs.file but that should
not matter to you as long as you keep using our shared base.

Note, I also pulled

git pull -S slab slab/for-6.12/kmem_cache_args

into vfs.file.slab for a test and that works fine so commit ids should
be back to their previous state. But please do double-check.

