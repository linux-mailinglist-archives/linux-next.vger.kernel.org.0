Return-Path: <linux-next+bounces-2776-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E990491E8B4
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 21:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 947091F22034
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 19:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E97C16F849;
	Mon,  1 Jul 2024 19:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kTI1OjQ3"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A9A16D9BA;
	Mon,  1 Jul 2024 19:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719862672; cv=none; b=CmrYG7hmLs8MpQ7Y+EBNEa/cHZaDhCL6hdwh13lHQHgjT2s1p2yMZMKATrtRcpygKhZ77WNl9VpckfnMAqTiIzkVHLpPTAJHMLBfc7mf1uR1mfjwbgAb+/Yyq+F8W+NPyRjZS02OifxhXtA9JNLEBRtAXmyY5iU1D66BLtVBcYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719862672; c=relaxed/simple;
	bh=JvEGwaN/9XbY1DtP/rttcBqr23B2vlS6TCPNQogcg7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=I2PZ3lj72nLEF5gnDEOWfXhX6CJSjLKQi2T+yNjZYzK0xxHpiF3Z1pg2A/f3YYh/5ebCzHptQ5C7ash1G3hdz2vBtInBGYZlWfmIL8y7V3zH+U31N4p0gloTvVvkksPcd8eZp639aic9cH6hArEDsI41+pkJFQw7jQKyDX2poSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kTI1OjQ3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58152C116B1;
	Mon,  1 Jul 2024 19:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719862672;
	bh=JvEGwaN/9XbY1DtP/rttcBqr23B2vlS6TCPNQogcg7k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=kTI1OjQ3lURSz6uUeJ6y8EHYFTVzGUFKQxdeHJZJT1ElQELag1nhZ0xiCgcgTwTwD
	 4nJQeMPU9cKAQtFaN1pMMvbo8mhSDoxuo4Ogyxqd13rNv5OW7IMwr2xDPecOHFlVbX
	 bPHPfi+dRBScSVEgktgpCryTiOITB6bSBCfo+q9Q5HcfpsOKpUDsEI8xLYoY4mDrYx
	 Cjj3UacmAnsYXJnTgt8muM/EhWPnr765LE7lzlAP6C/7Dwzmi8bHpZLlZWHwsu2YR+
	 9wYxWSK33CO9apmUl3OEmy8Dr5M0Nq1vtzk+MJt4iCoO3mx1B8slAW9LetobRgMF2K
	 /6crstEv6c42g==
Date: Mon, 1 Jul 2024 14:37:48 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Philipp Stanner <pstanner@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pci tree
Message-ID: <20240701193748.GA13881@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701192453.3e4a0a3e@canb.auug.org.au>

On Mon, Jul 01, 2024 at 07:24:53PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pci tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/driver-api/pci/pci:10: drivers/pci/devres.c:556: WARNING: Inline emphasis start-string without end-string.
> 
> Introduced by commit
> 
>   06fa2e1e9116 ("PCI: Deprecate pcim_iomap_table(), pcim_iomap_regions_request_all()")

I fixed by changing * to \* here:

  * void __iomem \*mappy = pcim_iomap(pdev, bar, length);

