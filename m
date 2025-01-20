Return-Path: <linux-next+bounces-5258-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF08A16753
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 08:28:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA8A5188994A
	for <lists+linux-next@lfdr.de>; Mon, 20 Jan 2025 07:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E454118FC83;
	Mon, 20 Jan 2025 07:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlH8s5aY"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEDA35968;
	Mon, 20 Jan 2025 07:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737358092; cv=none; b=XhiXbvBm+muVCDu1B9hoR5+HVbTcVrrr0hoCjd7Zih5MDyVVkLtyXroUBWsqh4NO4tDX6vjyWlbHiCEW/2GBMKPIh2z3So2+S9x1rj4U6Xyg3bGEksyaODgtH/hEi3a5c9ghNFph7zcmrgWIt2t4WHqRbcCFfrw71sXGKdLUul0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737358092; c=relaxed/simple;
	bh=n7un73QXVHM+zPtIZsWMUp9isg165xTGEFUODLgci2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oOTV8gm1aocg6GBiUThZdj3IZ2OcMZc4GDiCPkMV/96VvBsGrG8P7hr17pBB8xHevI/NpcfblnAIt2AXefeiFPgffHjlcnmfihDWruwvdiLIMD0FHWiPJmTH9i2cLuu3/jxFrPSwDZSN+qqRPQ+uB3SOBmyuFDc/0ClbR5FsrQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlH8s5aY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BFF3C4CEDD;
	Mon, 20 Jan 2025 07:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737358092;
	bh=n7un73QXVHM+zPtIZsWMUp9isg165xTGEFUODLgci2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jlH8s5aYE5ZFbegFSiLoOri14gK4zhbop4UhCTCE4TCL1GKUgRJzhrlUEtm9Xzfk1
	 3VvoP6dRkrq/ZWrLfYZI5K8XtQMCJ+Utdk6lHbI0mGu8KlHgFnBmhvOGsOiTLGX0of
	 jfEUPujPJSd+gEXdgz1e1mJJU5f2wxEN2UIQzU7GC9FtXQjxdB3orLqIjVboNUMrn7
	 zY8MaW/wEgY7goLqf6g1xY3wAjoXdhfP3kHrHrvR0YyA++RRwFFGT50D82G/utu00z
	 niohv6OVsRoeE3SuCx0mj8xxpgPNvUfIGnhxGXi4khPZJHyoaFTu944XKqHlC9+whQ
	 Semy0Z/0zL+gA==
Date: Sun, 19 Jan 2025 23:28:10 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, Baojun Xu <baojun.xu@ti.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the crc and sound trees
Message-ID: <20250120072810.GA68617@sol.localdomain>
References: <20250120181744.6433557e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120181744.6433557e@canb.auug.org.au>

On Mon, Jan 20, 2025 at 06:17:44PM +1100, Stephen Rothwell wrote:
> Probably caused by commit
> 
>   bb5f86ea50ff ("ALSA: hda/tas2781: Add tas2781 hda SPI driver")
> 
> from the sound tree - it selects CRC32_SARWATE.

It needs to select CRC32, not CRC32_SARWATE.  See 86c96e7289c5 where I already
fixed the last one.  Not sure why the same bug is getting added again.

- Eric

