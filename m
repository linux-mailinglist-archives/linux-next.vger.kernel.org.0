Return-Path: <linux-next+bounces-3702-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F4235971926
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 14:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B8881C22D86
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 12:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140D81B81A3;
	Mon,  9 Sep 2024 12:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l77CPq6G"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBA01B791A;
	Mon,  9 Sep 2024 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725884321; cv=none; b=ihH1zdoqU0xf5B7jqn3Whczcy2LBBzJaPqRvA0e5roxN/dlAkKMTjD3iLB5soNhi0l2zwQoAJo6K7lrJccQocO7+CSUea4smASzpY7kY5UJzca3T25LafW4MPyqdwdExn8qFzA4jGm4P039qpZq37FSaRVkB2x8o4lV//2GQ7cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725884321; c=relaxed/simple;
	bh=+FkCo+DCZZq5v7Hy/h17h+yQnVDaWOoRIPJRDzB8u+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AM1dRqLlcgiGJC7+X26lupfWXrl+tz77vuKfnGVqP5V0K50eoMXi2K9MegsiKBQsArIjdEJDp+PfssnMvGRz15PsHve68O6JE8h2HACdH8zgqmz6QGdoQc/GMVqPO7OlJrtZx1OfXgjVRSZEwiENbXtYMj+z75ecpCAFpKmAigE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l77CPq6G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7056BC4CEC7;
	Mon,  9 Sep 2024 12:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725884320;
	bh=+FkCo+DCZZq5v7Hy/h17h+yQnVDaWOoRIPJRDzB8u+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l77CPq6G0shiwARqM5UE9CBx1NjNLh7ELzX8N/kAm2aA62dVj0H0SUZSQEPqHvpf8
	 tnNosaYWQ9Uvp2RWaTDqzbnbxINm0wn2mhn469YvekLUDgW5E7BSZ4gobgQ761oGFU
	 bsBxgpgzxKxtNHI7lkOmFc7JthXXxxD2CLhseIvptLUK3vo7Jd5/gtJFmxKxSZIO78
	 wregDSnXmAKJ+qV4Bjk2ZYWxFuc5T025Jcfk+ikhlsrkTxtcUPhzYaRRh67Ab/ga8W
	 DeDFJGnGE6t/IXimmNlTasxEpA5lnnaonCQq+lDsAgGUHre6+Qztx81aTm+rVBrLbs
	 yWhSoJvJjYniQ==
Date: Mon, 9 Sep 2024 14:18:36 +0200
From: Christian Brauner <brauner@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the slab tree
Message-ID: <20240909-modular-funknetz-6db337a36439@brauner>
References: <20240909171220.32e862e3@canb.auug.org.au>
 <af23f1d3-27de-4591-ab0a-02268ef547a3@suse.cz>
 <20240909-organismus-sattbekommen-06332e10fcd1@brauner>
 <5661a983-9875-4cdb-8bdb-fc83e82f0b58@suse.cz>
 <20240909-anvisiert-weltweit-d3b485680666@brauner>
 <ffdcd6ff-b83a-47f6-bb23-e6baca7a3bc2@suse.cz>
 <20240909-missrede-abverlangen-dfccd1414bb2@brauner>
 <20240909-kratzen-holzweg-c1fd7da1f895@brauner>
 <9560c735-1617-4ac8-8973-1af62fe47856@suse.cz>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9560c735-1617-4ac8-8973-1af62fe47856@suse.cz>

On Mon, Sep 09, 2024 at 02:09:14PM GMT, Vlastimil Babka wrote:
> On 9/9/24 13:02, Christian Brauner wrote:
> > On Mon, Sep 09, 2024 at 12:42:53PM GMT, Christian Brauner wrote:
> >> On Mon, Sep 09, 2024 at 12:35:37PM GMT, Vlastimil Babka wrote:
> >> > On 9/9/24 12:13, Christian Brauner wrote:
> >> > > On Mon, Sep 09, 2024 at 11:40:25AM GMT, Vlastimil Babka wrote:
> >> > >> 
> >> > >> > change. Let me check and rollback if that was the case.
> >> > >> 
> >> > >> Thank!
> >> > > 
> >> > > No problem. I promised a stable branch so you'll get one. :)
> >> > > 
> >> > > So I rebased vfs.file onto the previous patches and pushed it out.
> >> > > Note that I've merged an additional series into vfs.file but that should
> >> > > not matter to you as long as you keep using our shared base.
> >> > 
> >> > > Note, I also pulled
> >> > > 
> >> > > git pull -S slab slab/for-6.12/kmem_cache_args
> >> > > 
> >> > > into vfs.file.slab for a test and that works fine so commit ids should
> >> > > be back to their previous state. But please do double-check.
> >> > 
> >> > It seems I'll be fine indeed as our shared base 0f389adb4b80 is back, but
> >> > looks like the top-most merge commit 3a3e007d8946 is wrong as it has
> >> > 6e016babce7c (the rewrite of 0f389adb4b80) as parent instead, so there are
> >> > now duplicated commits in vfs.file itself:
> >> > 
> >> > https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=vfs.file
> >> 
> >> Thanks! Ffs, let me go fix that.
> > 
> > Ok, how's it looking now?
> 
> vfs.file seems ok to me now, but vfs.all has merged the older version of it
> thus is not ok yet, as Stephen pointed out. Thanks.

Yeah, I hadn't pushed that yet in case something went wrong. Pushed now.

