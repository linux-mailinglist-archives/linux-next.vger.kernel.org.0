Return-Path: <linux-next+bounces-3695-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D52971621
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 13:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80714B2369B
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 11:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259F61B5ED9;
	Mon,  9 Sep 2024 11:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bgp1Qspq"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D411B5309;
	Mon,  9 Sep 2024 11:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879728; cv=none; b=L6OSiR1IIB+deYQXd7BKJPrUxZce07pWRspDIqHQ40i5T8+dAggIN/ural+8yTl78O6p9wa3o8ycsKITNLh6k7P3/DwVCzkAcf3HcYTOou60NQxsV9Z5dGAg/cp/JYKwG0fsLcDDJKwAi6bI4bZTZrOQqaSHqx/U0NiqzXFc+9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879728; c=relaxed/simple;
	bh=GKqHj+qCBDEBxXYsoqOUdLI+tU6h55nVvuX++/Np+OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ciC1iwHRCf/uJk2XIy1/8Slts7B1B5MVM7tJWOu65iaIW9Y1eQ4qBbRZR5bV8/syVqKSWPyF0eCqS2Yqdx0ga0rRU9IK7RZpiJzpsm3u0a/jbfr52ofAZAYZA5TxFDRfGlsM9ysHqZowZ+vrZxWmQKq+90jbEoYcfs/iZsA24x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bgp1Qspq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6495DC4CEC5;
	Mon,  9 Sep 2024 11:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725879727;
	bh=GKqHj+qCBDEBxXYsoqOUdLI+tU6h55nVvuX++/Np+OU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bgp1QspqxkFkJuPOmsJuzX1DKu1HykuogwzE77zM/o1vUNG1rutKyuKZfH4AKnFFF
	 rThWHqUVM7HmlLNgpvhnzuc521TaT1wxLiixmPzymbOYIJe5yML85PZpUnwfvCdr7O
	 i4HN70T1QBhl3sy+wuiaNA4/NnTuAXEVoxz0TZ2mJHs7Qa/uhtrMWpHzPRIMqteH6B
	 bgAqLYzILsgexIPb3TEB3i/EVPPSbHW+ThY1rEyeRtr6TgNo3V22UmLv2JtasTxhLT
	 hAKNzzFKE6O57Qc0ieC0kAQDq4VPTilDRoRO9eNX1OwPT25khzuaok8p3KWtx2IaTw
	 qBOERyf6V3Waw==
Date: Mon, 9 Sep 2024 13:02:03 +0200
From: Christian Brauner <brauner@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the slab tree
Message-ID: <20240909-kratzen-holzweg-c1fd7da1f895@brauner>
References: <20240909171220.32e862e3@canb.auug.org.au>
 <af23f1d3-27de-4591-ab0a-02268ef547a3@suse.cz>
 <20240909-organismus-sattbekommen-06332e10fcd1@brauner>
 <5661a983-9875-4cdb-8bdb-fc83e82f0b58@suse.cz>
 <20240909-anvisiert-weltweit-d3b485680666@brauner>
 <ffdcd6ff-b83a-47f6-bb23-e6baca7a3bc2@suse.cz>
 <20240909-missrede-abverlangen-dfccd1414bb2@brauner>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240909-missrede-abverlangen-dfccd1414bb2@brauner>

On Mon, Sep 09, 2024 at 12:42:53PM GMT, Christian Brauner wrote:
> On Mon, Sep 09, 2024 at 12:35:37PM GMT, Vlastimil Babka wrote:
> > On 9/9/24 12:13, Christian Brauner wrote:
> > > On Mon, Sep 09, 2024 at 11:40:25AM GMT, Vlastimil Babka wrote:
> > >> 
> > >> > change. Let me check and rollback if that was the case.
> > >> 
> > >> Thank!
> > > 
> > > No problem. I promised a stable branch so you'll get one. :)
> > > 
> > > So I rebased vfs.file onto the previous patches and pushed it out.
> > > Note that I've merged an additional series into vfs.file but that should
> > > not matter to you as long as you keep using our shared base.
> > 
> > > Note, I also pulled
> > > 
> > > git pull -S slab slab/for-6.12/kmem_cache_args
> > > 
> > > into vfs.file.slab for a test and that works fine so commit ids should
> > > be back to their previous state. But please do double-check.
> > 
> > It seems I'll be fine indeed as our shared base 0f389adb4b80 is back, but
> > looks like the top-most merge commit 3a3e007d8946 is wrong as it has
> > 6e016babce7c (the rewrite of 0f389adb4b80) as parent instead, so there are
> > now duplicated commits in vfs.file itself:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git/log/?h=vfs.file
> 
> Thanks! Ffs, let me go fix that.

Ok, how's it looking now?


