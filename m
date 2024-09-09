Return-Path: <linux-next+bounces-3692-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C5D971590
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 12:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D28D51C22761
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 10:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416ED1B5302;
	Mon,  9 Sep 2024 10:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHRfcH5C"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189BD1B4C5E;
	Mon,  9 Sep 2024 10:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725878573; cv=none; b=e8IXvT9p4YgQSLRPBmZjhNnOGMsTSrZ8bKF57orkuZnu7ZvDd+WISsmeuTRKQ368hmM8lmD8qTQYHj1X1jPK3VQ1+nmH9pNHHc2ZN5dnk2jjBJBJEDsFUgoiWfoVWO097cZmXI4ZGxViFTEVgTWFyULoFff6wBGzsx5LBjfEH9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725878573; c=relaxed/simple;
	bh=nlu614aJMcFr5KDJqPfw88wW840/Pm0amHzoXbPMKXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtDMJ3g9jOYFi/QT82lq31/XsHgemTBGD1t1mSNVlHjHfQOYXHcFzxTlP9Bq/JTM+kvVraACCHdEod7A1bY+EliG5AYaRrJoiHbaG6ytuxrCWKgANjIHU7SS3fhdpwPZiKhn39+zGzP4n0e5BkMpWXCY5E+bqZfpXANEpficgmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHRfcH5C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C626FC4CEC8;
	Mon,  9 Sep 2024 10:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725878572;
	bh=nlu614aJMcFr5KDJqPfw88wW840/Pm0amHzoXbPMKXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eHRfcH5CubFj7v8wpXyRQbKbj5GNrWWBRyOQEwWUG395QevHmNnf5ytIi0Ma0kDtj
	 Xxcymf+nFq6CO+ktj4W2ZvRl/xLdo5nY6vrPBV2rtSirZNq5XNU+gLgcf48rE+j53C
	 gYSZU7W3eEl/yOeIdd6i28bzJiPcTvfBbltmdXdy+/wtX6Xv69eMET+WJ0xYErg995
	 CtEFDTSrnqJrx4kn8Ryms97zTtQ5sEexxJcUYIK03lt5MfA3K6glrnntWVG/2EjK3t
	 xppWYZPHmKj+JJX4q/bldSAXDy4yNd5P2mKNfMHRdHAMvvDzUOS4ztS3QN2eZfObsW
	 1B64ZnQO+hcIA==
Date: Mon, 9 Sep 2024 12:42:47 +0200
From: Christian Brauner <brauner@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the slab tree
Message-ID: <20240909-missrede-abverlangen-dfccd1414bb2@brauner>
References: <20240909171220.32e862e3@canb.auug.org.au>
 <af23f1d3-27de-4591-ab0a-02268ef547a3@suse.cz>
 <20240909-organismus-sattbekommen-06332e10fcd1@brauner>
 <5661a983-9875-4cdb-8bdb-fc83e82f0b58@suse.cz>
 <20240909-anvisiert-weltweit-d3b485680666@brauner>
 <ffdcd6ff-b83a-47f6-bb23-e6baca7a3bc2@suse.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ffdcd6ff-b83a-47f6-bb23-e6baca7a3bc2@suse.cz>

On Mon, Sep 09, 2024 at 12:35:37PM GMT, Vlastimil Babka wrote:
> On 9/9/24 12:13, Christian Brauner wrote:
> > On Mon, Sep 09, 2024 at 11:40:25AM GMT, Vlastimil Babka wrote:
> >> 
> >> > change. Let me check and rollback if that was the case.
> >> 
> >> Thank!
> > 
> > No problem. I promised a stable branch so you'll get one. :)
> > 
> > So I rebased vfs.file onto the previous patches and pushed it out.
> > Note that I've merged an additional series into vfs.file but that should
> > not matter to you as long as you keep using our shared base.
> 
> > Note, I also pulled
> > 
> > git pull -S slab slab/for-6.12/kmem_cache_args
> > 
> > into vfs.file.slab for a test and that works fine so commit ids should
> > be back to their previous state. But please do double-check.
> 
> It seems I'll be fine indeed as our shared base 0f389adb4b80 is back, but
> looks like the top-most merge commit 3a3e007d8946 is wrong as it has
> 6e016babce7c (the rewrite of 0f389adb4b80) as parent instead, so there are
> now duplicated commits in vfs.file itself:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=vfs.file

Thanks! Ffs, let me go fix that.

