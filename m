Return-Path: <linux-next+bounces-3233-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4057A947C70
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 16:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70FEF1C21C75
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 14:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B9355894;
	Mon,  5 Aug 2024 14:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U31jojI1"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E97F17C64;
	Mon,  5 Aug 2024 14:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722866658; cv=none; b=Wg8dErFwICVNDKogQ/SZwJqpfs43PeSu+kCyFsWp0+5VCybI/MQ5TNS/z5DDoHzl/DZa93XoqcLSiWqW1yn3+2AQXUHB8IuOhgq9n8s29dxfPlox5fqYMxURcOyqd57pBzR9NHWfEKzUlwArzRsEgDpwZtjxmMqeENiYH0sh1Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722866658; c=relaxed/simple;
	bh=H2e1R/s4Mr7IoA3Yx6wFdbdoHXeN81Eg3q1yzIMF7IE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuP4X61pYz+GfYmMYXZQNTBN1y1aWe1n1PmdY0BoHDgIiJPqs8TsMFphPNa8xK6/AkHww/t+2hwz7dw5l2hjM3xpnYX0x/ZtuKqbXSBNjMysY8s6wOB9byNUytkJUeiGck6fzUohC8tesemxe013DdhZ690dH2Nw5pJvh8d5FdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U31jojI1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE16C32782;
	Mon,  5 Aug 2024 14:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722866657;
	bh=H2e1R/s4Mr7IoA3Yx6wFdbdoHXeN81Eg3q1yzIMF7IE=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=U31jojI1QIzLBAUBltwWL/Rup0ERuvie3G7NPUQ6iYaiTJx564wbUgXGkfvC/kwv5
	 oXwR78QT6b9wHif86cCaOzXwVjo/IbXM3CrkLPeaKKp50IOMNeqoXRdsgdZ1iO73cd
	 vlEZHywqgFbNvLRpTAOWdnFMLyB8NnMKDM5khqP1ifs+Xw9zhgpclPvKzAPzW/TQBG
	 jA/qG9GDeUojmLmcSYNQ4DFsfVfrLcxx9WOd3QQ18dFpyNE36fgxPFrLvfLe8Z3uyY
	 6ZyEeko6AEGhLwnnT66uwHbDaJppdS2KRiAu8em66N813dTT3nFR3YqPfnXDjL92+Q
	 yrZolYJ/dfpVw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 74CB4CE09DB; Mon,  5 Aug 2024 07:04:17 -0700 (PDT)
Date: Mon, 5 Aug 2024 07:04:17 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the paulmck tree
Message-ID: <656ec6fb-648a-4d71-8ce4-83f930e4b3e1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20240805145714.75dc55a3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805145714.75dc55a3@canb.auug.org.au>

On Mon, Aug 05, 2024 at 02:57:14PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in Linus Torvalds' tree as a different commit
> (but the same patch):
> 
>   88b4d7bfe7c2 ("clocksource: Fix brown-bag boolean thinko in cs_watchdog_read()")
> 
> This is commit
> 
>   f2655ac2c06a ("clocksource: Fix brown-bag boolean thinko in cs_watchdog_read()")
> 
> in Linus' tree.

Thank you, and I will drop my copy.

							Thanx, Paul

