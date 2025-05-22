Return-Path: <linux-next+bounces-6903-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0820AC09AA
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 12:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95B634A5429
	for <lists+linux-next@lfdr.de>; Thu, 22 May 2025 10:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767FB2356CF;
	Thu, 22 May 2025 10:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjkZHu0v"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF712914;
	Thu, 22 May 2025 10:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747909306; cv=none; b=iIaN2e6eNTMdknQXXz582JQRPEnClSnUonsvorDO+A2OaCXHOUXixx9umMN8dW6GcczkHBdc9Mua/jFgMT+kDYche1N22FrlwwXNXV0sDQCLI7Av1puggokC4pVR4SR6SdNZOaFR7YDYVsdLs+yktHXDHrOckOllehyK71waACU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747909306; c=relaxed/simple;
	bh=OnvfjV2Ytkp+8rluyeFdgjw9hNFzApuN+yOjStGIyio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kF6+zCE/xb81ut01X9dzxKa2mJg1QOoYiTYyBHkv40FErmmDVG5gTCENTqs/WLYFf7Ft0myvNno3X/hBa9ijwAeYYOVrapF8aNDFc3F2vWlMfB8phAGDLue4/YtD3A2sizPHFTjLAZ8CbEczR4etQE28KtsglLUoq7KY6K31gGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JjkZHu0v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE70C4CEE4;
	Thu, 22 May 2025 10:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747909304;
	bh=OnvfjV2Ytkp+8rluyeFdgjw9hNFzApuN+yOjStGIyio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JjkZHu0vZft3xIAyND75AUq5ntpROhSXxGuBdSiPf8mlAhdxdGFcKH03Cg2R+vhUQ
	 0voWM+nADhPJ39ie1W7dOFynNEIbGMRsL/T7S9w9MVO/J2RZYoKClufbu9TYeobKqE
	 +vB9GrOZBczSAq/ytqoTnCtm7WXIPUDI+9ROBBqHK9Wk4ySJjEq2Re+n49Zf4zO3ls
	 03h7+CFccjJAMkrOtlbTXCN5vWLr8827DjsStIE64+yJiKxxAUVT891NEU/sZx7Jz2
	 vM1bzoJgGNp/gwCY1bSdU6vcML0HHSWi38bpwyUM/sOwteWBOIqHdag6Smtsp5UbZg
	 0I0THRw9Mkdrw==
Date: Thu, 22 May 2025 11:21:40 +0100
From: Will Deacon <will@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm64 tree
Message-ID: <20250522102139.GA21627@willie-the-truck>
References: <20250521213910.303c8546@canb.auug.org.au>
 <CAL_JsqKCQ=b7+ZtuKWncX1ROHipNjRzCCEWruEC0obNkiHREDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqKCQ=b7+ZtuKWncX1ROHipNjRzCCEWruEC0obNkiHREDg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, May 21, 2025 at 06:56:09AM -0500, Rob Herring wrote:
> On Wed, May 21, 2025 at 6:39 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Commit
> >
> >   54b8070548c6 ("arm64: el2_setup.h: Make __init_el2_fgt labels consistent, again")
> >
> > is missing a Signed-off-by from its author.
> 
> The error here actually is the author should be me. Will, can you fix that up?

Sorry, I didn't spot that. I'll fix it now.

Cheers,

Will

