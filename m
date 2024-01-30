Return-Path: <linux-next+bounces-908-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3119C842505
	for <lists+linux-next@lfdr.de>; Tue, 30 Jan 2024 13:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B681828913F
	for <lists+linux-next@lfdr.de>; Tue, 30 Jan 2024 12:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C336A330;
	Tue, 30 Jan 2024 12:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIFrzMir"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C603B6A32E
	for <linux-next@vger.kernel.org>; Tue, 30 Jan 2024 12:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706618141; cv=none; b=VykT+EekKNBAB516r07XfCbrD7XdldJns0N0tBw5PrSv6z4cEkxt9gALmG+FJLSsHTJAqLq6aVmtcoR2ot2stsLQkgrRh3ERQy6hHhuIMv4vj5WJa7LWK6ow7NmLXAAHx8srIpeqesYMm5NDV4/P3SUIGCXCsh2Tx8DU+L1Ci28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706618141; c=relaxed/simple;
	bh=xqDmpUcCzg21jtvkooOJyCufAD6vHGlswXrnbM9T9zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0lHyalL6J/5C3HbDY9kgqYWfwlCoY9vFrnm890j3G6ZB8hfRbk5hoexvgzko8vBEbu7Dd9jlflCrjXg0xyvVv9eAuCxwDhDOiUNkOYNhwdSM8S92wwZlCgbWgiutmyjhWUcf6y55+tM2agQxC0v/Gsc7wB4P5mQQsF4WZWTtUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIFrzMir; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04E4C433C7;
	Tue, 30 Jan 2024 12:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706618141;
	bh=xqDmpUcCzg21jtvkooOJyCufAD6vHGlswXrnbM9T9zs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TIFrzMirWtv0LvgHIf6lzbo03mvjkepBPznTaaMcIwbH/Mkj64wj7Cpw2UXnPwRKh
	 GgnNoBS27ayCoESLz/pBTovKy/00udhZR81uxbXscW3uRykIVoj1ePw8GR7//izMaz
	 y8v+gTY/n/jKlxKCBF49tF2NICBROelrlg3xk312Tjs9Dq1lepCopGVyedrra7aEOY
	 sVfRawtc0/ldl5fKyvmkuflpbd+QqifsL83KOLEjY6aEP/3nsMcPIFc9xTEhYaWqqj
	 rtzaZRJ3E+8WzmW0BIIimrQb1dnOzhQd+yX9krR8L5NF9OMPrUAL4knMcOfWOBS/Ka
	 2eTyUsQMKZzBw==
Date: Tue, 30 Jan 2024 13:35:35 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
	linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c re-inclusion in linux-next
Message-ID: <xewyobkwecyhluztyrpwzhnuv3f25eq56iwkh3obfzxgqghe7p@2agb275csehd>
References: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
 <20240128142804.21d49045@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240128142804.21d49045@canb.auug.org.au>

Hi Stephen,

On Sun, Jan 28, 2024 at 02:28:04PM +1100, Stephen Rothwell wrote:
> On Thu, 25 Jan 2024 21:28:09 +0100 Andi Shyti <andi.shyti@kernel.org> wrote:
> > could you please include in the linux-next i2c related branches
> > from my repository:
> > 
> > https://kernel.googlesource.com/pub/scm/linux/kernel/git/andi.shyti/linux.git
> > 
> > the following branches:
> > 
> > for next:       i2c/for-next
> > fixes:          i2c/for-current
> > 
> > I have requested this branch to be the main repository for
> > collecting i2c host patches[*].
> 
> I have added the 2 i2c-host trees using
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git
> 
> i2c/for-current branch is known as i2c-host-fixes
> i2c/for-next branch is know as i2c-host

Thanks! I have renamed them in my repo as i2c-host and
i2c-host-fixes to be aligned with your naming. I'll keep both
naming for a while until you decide to update.

> both are useful as Mark Brown pointed out.

Thanks, Mark!

> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.

Thanks, Stephen!

Andi

