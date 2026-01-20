Return-Path: <linux-next+bounces-9735-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAD6D3C2C9
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 10:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1AC1F489FDF
	for <lists+linux-next@lfdr.de>; Tue, 20 Jan 2026 08:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3ED33B95ED;
	Tue, 20 Jan 2026 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nC4N6BFX"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98883469F4;
	Tue, 20 Jan 2026 08:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768898766; cv=none; b=tNUNgEIPxLfTJWZdGmC06EwDdlJHFIUvruDq9A0XuMCWJWqe3tyFK7cdh2WcGS9Ox6dDpckE6W0fnYpr7xdf3mXmBaebmoTSfYrUyTVQ/0m6zV4X4Tp1PYogJ4mIUCCq8YTVnuVXlVXck1tUlKvUNBYtj+xOobwcnOU5K8AgkO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768898766; c=relaxed/simple;
	bh=LUD/xrSuUEut3M8Oro3w7nYsqHeryUaCfR7/Qz9pX5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FRBQbF1LW+CglUmL7hGxbcRRAHSkTE3T4h/B6EAXEmaMv8/fQkqriE94yNsR5pwHonvyVokKTdhl+oZRbHc5Z+KqkOVUjY63++6EcOqinb3Dh6V4f481UN7gNVGG57fH1iLTS2IeYWcM0wUwEt9wV6GT/C7Vh4l6JfWCkagLf9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nC4N6BFX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2058C19423;
	Tue, 20 Jan 2026 08:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768898765;
	bh=LUD/xrSuUEut3M8Oro3w7nYsqHeryUaCfR7/Qz9pX5s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nC4N6BFXANyUcWDgLFj/zqzbOkplOa5SfDGM/FtSOjTCEpxZEjrC1qMNWIuOZP/k/
	 jzPZQS8wQSDl4SVJiBXOp3/SAzRRFSUe9ra2TmzxglRAWCQ+HBWA0/NKzeo+iGAuaA
	 BzLWaqnJQUQAQ6RhTiQHO/H0ValFbXJlopiIhyKQ2kikVwrtJDLSfDkD2l/Q2mge/f
	 oDTxxMEHE7w1RkDm7bUp+YD01ZNdkWy8jwhYuhayGTKYtbND5uGbse6e58XnMAzlXR
	 gUULVKl6x2Rjzk9iQPtdTN0S6lZmPDHZ4ovvxifQfTOpxCYE/bRW1QkiU3y+2xz2bj
	 DD+mSLdXr7YoA==
Date: Tue, 20 Jan 2026 08:46:00 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the leds-lj tree
Message-ID: <20260120084600.GA1354723@google.com>
References: <20260109124558.25b0eebc@canb.auug.org.au>
 <20260109094147.GC1118061@google.com>
 <9a44bf97-4c51-49b6-bdec-2959780ff128@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a44bf97-4c51-49b6-bdec-2959780ff128@sirena.org.uk>

On Mon, 19 Jan 2026, Mark Brown wrote:

> On Fri, Jan 09, 2026 at 09:41:47AM +0000, Lee Jones wrote:
> > On Fri, 09 Jan 2026, Stephen Rothwell wrote:
> 
> > > ERROR: modpost: missing MODULE_LICENSE() in drivers/leds/rgb/leds-lp5860-core.o
> > > WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/rgb/leds-lp5860-core.o
> > > ERROR: modpost: "lp5860_device_init" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
> > > ERROR: modpost: "lp5860_device_remove" [drivers/leds/rgb/leds-lp5860-spi.ko] undefined!
> 
> > > Caused by commit
> 
> > >   51f7560294c9 ("leds: Add support for TI LP5860 LED driver chip")
> 
> > > I have used the led-lj tree from next-20160108 for today.
> 
> > Please provide a follow-up patch post-haste.
> 
> This issue is still present in today's -next.

Steffen,

Please provide a follow-up or I'll have to remove your patch.

This is blocking testing.

-- 
Lee Jones [李琼斯]

