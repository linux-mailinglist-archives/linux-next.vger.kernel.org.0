Return-Path: <linux-next+bounces-5532-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF5AA40D63
	for <lists+linux-next@lfdr.de>; Sun, 23 Feb 2025 09:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 748017A658F
	for <lists+linux-next@lfdr.de>; Sun, 23 Feb 2025 08:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7411C84C2;
	Sun, 23 Feb 2025 08:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="nCpCRjvQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.14])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427AB1FCF5B;
	Sun, 23 Feb 2025 08:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740299329; cv=none; b=AdL1DtLMJ78gE+LssmC+XwbxJqi4fLqA7m8bjOTCvmfGoxc1eXkTf0n5tNGGsKGizPqyWGTtybdMovyepzqea9EK370ps3vMzn5T3YHU6IeUqcPMh8ijQzWrRVg+CS1HKLBWnMh1H8n/8+x7ULsRS8PP5qdaCrIkDjyyYKb9M34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740299329; c=relaxed/simple;
	bh=BLLEcxi5Valr83XCBImMbsQs+SRclbSuX5Ufy5dWkxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pUagvZ2JREhGtS7UzvQV7iF6xkU/7tbM2tkiNswYL+XAKM4l8BpIBXXi6vUpcy2g6Y58VFXfRe9qvN12tFM/xgnSszF8Rm0lWcRi4sztz7ISSC2jCFiKAqayO1dZOO40s1Xq0wOK0W45as+mtcglD7AyLlPeD2Qlz0+IKcfisZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=nCpCRjvQ; arc=none smtp.client-ip=1.95.21.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=16FFplOXDe2qlZ3CZQWPEx47sTdPoDpjPNcXAW2Suxw=;
	b=nCpCRjvQ/vRugb3+iwQcIDKNYJZImRU+q0KJnl2+/6lbT0EvRpsOmkmv7QHDqi
	quOuk0DzuWfSOAe428rN7IleTY+D+yVy4qqyj2Dgv8hYS95pH+SQHvb60yleR8CJ
	tqVQt/GZjwmbZwZMQxLmu3Eh/Bp7PRUDG2mcKRm7F57nQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgA3WEgL3Lpn2GHJCQ--.24260S3;
	Sun, 23 Feb 2025 16:27:57 +0800 (CST)
Date: Sun, 23 Feb 2025 16:27:55 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the regulator tree
Message-ID: <Z7rcC3YskGoNHdvN@dragon>
References: <20250219134354.144eb868@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219134354.144eb868@canb.auug.org.au>
X-CM-TRANSID:Ms8vCgA3WEgL3Lpn2GHJCQ--.24260S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUotCzDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhv8ZWe6kuH3-QAAs0

Hi Mark,

On Wed, Feb 19, 2025 at 01:43:54PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the imx-mxs tree as a different commit
> (but the same patch):
> 
>   b5ec74c2aec7 ("arm64: dts: imx8mp-skov-reva: Use hardware signal for SD card VSELECT")

Any particular reason you picked this DTS change?  Would you drop it
from regulator tree?

Shawn

> 
> This is commit
> 
>   38db2315c465 ("arm64: dts: imx8mp-skov-reva: Use hardware signal for SD card VSELECT")
> 
> in the imx-mxs tree.


