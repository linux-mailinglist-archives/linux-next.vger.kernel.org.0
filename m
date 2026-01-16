Return-Path: <linux-next+bounces-9693-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A42D388B8
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 22:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64F90300B92C
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 21:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D3230101F;
	Fri, 16 Jan 2026 21:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2bHtKUM"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FB41F9F70;
	Fri, 16 Jan 2026 21:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768599654; cv=none; b=cFpXlf1ceQTPbmf58OK1vXtuC01ZtK/Kjxr06M1jw046hUSdUmwXiV4DJStmFWb5NmutOJ2dH6GKxBoF8+lOjoGqRgT2G02W170AvKJwRKhcV2PdTgcPrD8Uo/+CFxofDLlaZ47NxJDCWK8so+Zf42jTvtniOgcZKv824PS8W4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768599654; c=relaxed/simple;
	bh=RJodH6R4G5GN7lo+Q+PFNflAFSMHfJdAO78sTCahdq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I6luWShTO7BuOcRbk3YTerrjlZuYhpX1MY/JHvfhFkpd3iauzjM2jYn4pk4PIiySJujNXJBqnQbB3OXL4MEaric8wzWSec9fxwkTSYF6TqIcF6kEGXU5Oxuk//y6U2wegfEJolx4yGMw/4UbqgoQ8wip5tHxjLQBiV2ONU7MzDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2bHtKUM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1E0FC116C6;
	Fri, 16 Jan 2026 21:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768599654;
	bh=RJodH6R4G5GN7lo+Q+PFNflAFSMHfJdAO78sTCahdq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2bHtKUMVSpRR4E3hn/J19FY5pBvZvKH25bistxdw4LTsgYHrpjHIsa2XYkwmHkVI
	 c82psmKzhGZVZy5yEQQmqNP0YYDydKYo18zHYdBAj5aOsyJPDsjh34Ka2UD8K2VHcu
	 1rA0D+vv/r83qhe4IsPRtXF9gAD4RLW2OCVyDAgOdb3q3uPTugsNwGR71g32L0iItd
	 6sYD7YU8sx4IGYFqdOXPSC5uWKP9qPB5sG3d58cgLN83ysYjDF744LyBAMomGtYwc8
	 JAgm5ekJhmlal0sN44Ah62tv8Qi5K+IJyP2WuiLtfeWkuKO1B7J1ZQkXbXkrKw7AxQ
	 WYfusIAdKZMaQ==
Date: Fri, 16 Jan 2026 15:40:51 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Andy Gross <agross@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the qcom tree
Message-ID: <uxjng2v4ywrwks6gukzqsbrjfl6uo5dvduafhcqdglg3hy4bkf@f6aawfe3f2yt>
References: <20260113080606.07743e2b@canb.auug.org.au>
 <aWV9Az3SuQgvSBQ0@redhat.com>
 <olnhf2ritwl4eh4plujlcthohsortsspagdioaqcugvdlgquad@l6pljrt4k4ws>
 <aWqaDCvjs-mR12_c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWqaDCvjs-mR12_c@redhat.com>

On Fri, Jan 16, 2026 at 03:05:32PM -0500, Brian Masney wrote:
> On Fri, Jan 16, 2026 at 01:42:56PM -0600, Bjorn Andersson wrote:
> > On Mon, Jan 12, 2026 at 06:00:19PM -0500, Brian Masney wrote:
> > > + Bjorn and Konrad,
> > > 
> > > On Tue, Jan 13, 2026 at 08:06:06AM +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > > 
> > > > In commit
> > > > 
> > > >   35a48f41b63f ("clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()")
> > > > 
> > > > Fixes tag
> > > > 
> > > >   Fixes: 859a7e020b23 ("clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()")
> > > > 
> > > > has these problem(s):
> > > > 
> > > >   - Target SHA1 does not exist
> > > > 
> > > > Also, the subject in the fixes tag is the same as the fixing commit,
> > > > so I have not idea which commit was intended.
> > > 
> > > I missed up my Fixes tag on this commit that was applied to the qcom clk
> > > tree:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=clk-for-6.20&id=35a48f41b63f67c490f3a2a89b042536be67cf0f
> > > 
> > > The Fixes tag should be:
> > > 
> > > Fixes: b6f90511c165 ("clk: qcom: regmap-divider: convert from round_rate() to determine_rate()")
> > > 
> > > The SHA is correct. I just have the wrong commit description.
> > > 
> > 
> > I believe you're saying that both commits should have:
> > 
> > Fixes: b6f90511c165 ("clk: qcom: regmap-divider: convert from round_rate() to determine_rate()")
> > 
> > Can you confirm?
> 
> Yes, that is correct.
> 

I've updated the clk-for-6.20 branch, please let me know if there are
any issues.

Thank you,
Bjorn

> > It's the top two commits of the branch, so if you can confirm my
> > understanding I'll just fix up HEAD^.
> 
> Thank you, Bjorn!
> 
> Brian
> 

