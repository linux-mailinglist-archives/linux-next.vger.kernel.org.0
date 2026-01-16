Return-Path: <linux-next+bounces-9691-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BA1D38622
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 20:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64E94302C9FC
	for <lists+linux-next@lfdr.de>; Fri, 16 Jan 2026 19:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AE093939A4;
	Fri, 16 Jan 2026 19:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OF1wxYHK"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E8234AB1D;
	Fri, 16 Jan 2026 19:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768592579; cv=none; b=tP2fLwLexlMReQTBeZFjhshZs7qIv2sTVWEIxLEc37eg3pNkt+Wf1p73dB/SVT//ihkqvKTuwSUtZN5wdbPuX9iPY4pTmWq0clSNgC4t5uNBKZS5BhPOVhGrA+M6355BpYE8Aqo2mBVajHHns5JA9nwaPg57vdPnqVT5Vi06Izc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768592579; c=relaxed/simple;
	bh=6zMPUcAQhgnID2AHZp0hfBXJHe8GjGou3A+xwP0nQDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uVNbJiqU70Nv1A1vfaenavKsfSnyHi4MoPdK7i7y5CSLMY5+idOOwG2jSFREQ2jdLrIT53EO86jkqLxHbf72R3Or6Bt3Z6ZK6BqH2YwFbh+IoS4+s1SL7MkCbg1nqP48nMj1GrQ62BdeJgCOwWU74GNuVItOh5DjmY5Yxy+O2x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OF1wxYHK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D906C116C6;
	Fri, 16 Jan 2026 19:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768592578;
	bh=6zMPUcAQhgnID2AHZp0hfBXJHe8GjGou3A+xwP0nQDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OF1wxYHKeK+/BatvX2LxXyWCOY8YT9YEiA0HuoIBHKCimP8gek2Qyde+bCpVsf+OO
	 kOA2DY/MSUHbekM9jfkcjwO7WsaHwwwbK005Ilp+WcY3cep5SSCxlyagm/jntffomQ
	 pEBpv6w8AZZFKL5EbBDDD3acGhx3YSSDkS9WM+3kAh31TxkYIadEElwzqwqx0iQNxW
	 MX9g7S002ofmpmRxN+NCb0FWRMASmDcGj/kE7PQA+bz5tOuCLNYxBYW4KJePwANysG
	 cs4hrM84yBIiWf+Ik9ApStohy3Xqwb3ZD6BPteGwX+kQS/TRaIwHGL9k98RHMCxlb3
	 cngUZMwBl5rTw==
Date: Fri, 16 Jan 2026 13:42:56 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Andy Gross <agross@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the qcom tree
Message-ID: <olnhf2ritwl4eh4plujlcthohsortsspagdioaqcugvdlgquad@l6pljrt4k4ws>
References: <20260113080606.07743e2b@canb.auug.org.au>
 <aWV9Az3SuQgvSBQ0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWV9Az3SuQgvSBQ0@redhat.com>

On Mon, Jan 12, 2026 at 06:00:19PM -0500, Brian Masney wrote:
> + Bjorn and Konrad,
> 
> On Tue, Jan 13, 2026 at 08:06:06AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > In commit
> > 
> >   35a48f41b63f ("clk: qcom: regmap-divider: convert from divider_ro_round_rate() to divider_ro_determine_rate()")
> > 
> > Fixes tag
> > 
> >   Fixes: 859a7e020b23 ("clk: qcom: regmap-divider: convert from divider_round_rate() to divider_determine_rate()")
> > 
> > has these problem(s):
> > 
> >   - Target SHA1 does not exist
> > 
> > Also, the subject in the fixes tag is the same as the fixing commit,
> > so I have not idea which commit was intended.
> 
> I missed up my Fixes tag on this commit that was applied to the qcom clk
> tree:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=clk-for-6.20&id=35a48f41b63f67c490f3a2a89b042536be67cf0f
> 
> The Fixes tag should be:
> 
> Fixes: b6f90511c165 ("clk: qcom: regmap-divider: convert from round_rate() to determine_rate()")
> 
> The SHA is correct. I just have the wrong commit description.
> 

I believe you're saying that both commits should have:

Fixes: b6f90511c165 ("clk: qcom: regmap-divider: convert from round_rate() to determine_rate()")

Can you confirm?

> Bjorn: How would you like to handle this? Do you want me to repost a new
> version of that patch, and you can drop the current version? Or can you
> rebase your branch with the correct Fixes tag?
> 

It's the top two commits of the branch, so if you can confirm my
understanding I'll just fix up HEAD^.

> Sorry about the extra work. Copy and paste error on my part.
> 

No worries, sorry for not catching your mail earlier.

Regards,
Bjorn

> Brian
> 

