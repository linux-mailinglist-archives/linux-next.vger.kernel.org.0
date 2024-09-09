Return-Path: <linux-next+bounces-3677-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43675971322
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 11:17:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E54C1C2258F
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 09:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC6D1B2ED5;
	Mon,  9 Sep 2024 09:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AImWo+aX"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45C5176251;
	Mon,  9 Sep 2024 09:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725873423; cv=none; b=AagxjGSGNMRsGX0pAZ0VhpcjTPtm6kQruzOwsRlDDGc9Jhjw0gEBg6Az7IksdaqehE3N0aPjza2v5qf9YIkooUxkCQxdf6qXs5mII6xe/yEF8exUKcDh3hZKodKIBMBG/0cVBI/lT4aT8Lw8OvOfOOJ7nHVb4+bfY6ZgrgXacvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725873423; c=relaxed/simple;
	bh=UCclFN4DSuU1jgt9Ttymvx9iX/xdLRTfLdT7a53xE/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvXR0VRBtAUgLTb8MuDWEScoLCXtznjw9O3Vtzje6gTuGFwn8l82YV7zxBPtgG+lWzq0K2vKLTfgdGi3ecfaALErqAIW/FA9XulD3BRBnUBCTcM94UqW1Q7hQUbdB1jo6IJwfHdf6DGHBVH2gFXZ/k3+w4P5xFsjLPKq/TS6B7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AImWo+aX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EE47C4CEC6;
	Mon,  9 Sep 2024 09:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725873423;
	bh=UCclFN4DSuU1jgt9Ttymvx9iX/xdLRTfLdT7a53xE/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AImWo+aXG41BsTu9O9/XCvxNdY2Ux8mrQHze/dgvhRV0/b5f8lbikvlwC9xRX4/4Z
	 5LK4H2pcYkRAeoOumgT/qRaycHFkMWh5ly7zzULMiTnd6n3e6yXZKrdnhYulklPyeu
	 gv7ckVU7NnFsxGMC7z96oXVGu4j9qtnHmCtF3fZQJjzoSz26lsTPXgdmU6dPQkTNpq
	 61wscV02GNR3s+nsSrUK4kK4QSgGKZl567tPe6eUtv5ZWaP3bHzq9SrEAmPJywk7Sa
	 SnPu7O2s21iTbenMyvbWZWGzdKfh//uu7DzRF+D5I8HelW0rn1OuX9jTupSC6CI40R
	 Y3W0t13OVBkIQ==
Date: Mon, 9 Sep 2024 11:16:59 +0200
From: Christian Brauner <brauner@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the slab tree
Message-ID: <20240909-organismus-sattbekommen-06332e10fcd1@brauner>
References: <20240909171220.32e862e3@canb.auug.org.au>
 <af23f1d3-27de-4591-ab0a-02268ef547a3@suse.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <af23f1d3-27de-4591-ab0a-02268ef547a3@suse.cz>

On Mon, Sep 09, 2024 at 09:18:57AM GMT, Vlastimil Babka wrote:
> On 9/9/24 09:12, Stephen Rothwell wrote:
> > Hi all,
> > 
> > The following commits are also in the vfs-brauner tree as different
> > commits (but the same patches):
> > 
> >   c0390d541128 ("fs: pack struct file")
> >   ea566e18b4de ("fs: use kmem_cache_create_rcu()")
> >   d345bd2e9834 ("mm: add kmem_cache_create_rcu()")
> >   e446f18e98e8 ("mm: remove unused argument from create_cache()")
> >   0f389adb4b80 ("mm: Removed @freeptr_offset to prevent doc warning")
> > 
> > These are commits
> > 
> >   f2b8943e64a8 ("fs: pack struct file")
> >   d1e381aa30cb ("fs: use kmem_cache_create_rcu()")
> >   ba8108d69e5b ("mm: add kmem_cache_create_rcu()")
> >   a85ba9858175 ("mm: remove unused argument from create_cache()")
> >   6e016babce7c ("mm: Removed @freeptr_offset to prevent doc warning")
> > 
> > in the vfs-brauner tree.
> > 
> > These duplicates are causing unnecessary comflicts ...
> 
> Thanks,
> 
> Christian told me merging the vfs.file branch (a necessary prerequisity for
> one series in slab) would be ok as it was stable at that point. What
> happened? If I do redo with a new merge, will that stay unchanged until the
> merge window?

Hm, that's very odd that the IDs changed. The only thing that I did was
b4 trailers -u on the branch to quickly check whether I missed an RvBs
or Acks. But there were none so I assumed that the commit ids wouldn't
change. Let me check and rollback if that was the case.

