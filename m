Return-Path: <linux-next+bounces-8363-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A91B81325
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 19:35:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8122A465402
	for <lists+linux-next@lfdr.de>; Wed, 17 Sep 2025 17:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC9B2FE05B;
	Wed, 17 Sep 2025 17:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TmxA0jyt"
X-Original-To: linux-next@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58733248F68
	for <linux-next@vger.kernel.org>; Wed, 17 Sep 2025 17:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758130553; cv=none; b=jceoDkSeFoGX+V7rxXb32jibqTHMGFYrGXyDCMBT8QSH2jWCE0/VkKc+oivjN/mptDWoYc+PJkBD5JJTpDDFNffwi5tIFaKHZnyNuf+nU3Wa5tBV/+eUqn0yEm53Fy1kiZQRbhbfY+oqocW65JS+U4ANeeaQfNEfqznBi60upFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758130553; c=relaxed/simple;
	bh=enp5T2S73bFz2dOT6+VrZd/Q79Aya5bqNSEhZmshZWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPyTnRstgj9PhF8/3wXpCwbIqE4SDJSFjiSBZCLePQsUDHwbbeUkiBqYHUS9u4pRuQsgsZypcXFqGDafTuNW4YJZH3GsWAXgU88Dq0wkkdSp7YAWurwEhEFnH/akwPgkQHPi7Nwr9dsPmYXJOxBKdLJMrlXOlcKXfyTQFXx6VeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TmxA0jyt; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7B35E1A0E92;
	Wed, 17 Sep 2025 17:35:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43DE66063E;
	Wed, 17 Sep 2025 17:35:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A39B102F1772;
	Wed, 17 Sep 2025 19:35:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758130547; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=oYx1BtAJGtofFykpjo4lAP1P/0RIQb9d9M2cvOUsnVg=;
	b=TmxA0jytEu/2oqEq6KBuBDbaAQdZ5PieL4bNdJCqbCwADA1RieUmB/KKU8mtSG/u3gkUeY
	SjI+P8B6VhRBsz/a/ZWJ/qrOteL903hCfkzTZfOEmTjn2WnPz8beA4J8hrsIjVXILVtVFJ
	rAVkHObW7CrAenSxKgSte3KyomPVldqKwQ80tbIM/x8APpU5tHtpkND9/z4SrT/oOo7e2d
	LdlTJHpiS1OkHgvCths/Bo7ke3HZQWXsuVlDDfzFVGwWdz5Py+PybWSQyGDFFS74m1FG0n
	6JSvnM9uxdzggQqwGpUS18zTMerhvSimgMYMSHbaAxsro2aBeLVqy1eMlPW1HA==
Date: Wed, 17 Sep 2025 19:35:41 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Jorge Marques <jorge.marques@analog.com>,
	Frank Li <Frank.Li@nxp.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the i3c tree
Message-ID: <20250917173541a0e86f6e@mail.local>
References: <aMh95LzHnl-9-w5Y@sirena.org.uk>
 <2025091619124436ec80e5@mail.local>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025091619124436ec80e5@mail.local>
X-Last-TLS-Session-Version: TLSv1.3

On 16/09/2025 21:13:03+0200, Alexandre Belloni wrote:
> Hello Mark,
> 
> On 15/09/2025 21:58:12+0100, Mark Brown wrote:
> > Hi all,
> > 
> > After merging the i3c tree, today's linux-next build (x86 allmodconfig)
> > failed like this:
> > 
> > /tmp/next/build/drivers/i3c/master/adi-i3c-master.c:13:10: fatal error: linux/fpga/adi-axi-common.h: No such file or directory
> >    13 | #include <linux/fpga/adi-axi-common.h>
> >       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > compilation terminated.
> > 
> > Caused by commit
> > 
> >   63cae74bea7cc ("i3c: master: Add driver for Analog Devices I3C Controller IP")
> > 
> > I have used the version from next-20250912 instead.
> 
> Thanks for the heads up, I didn't realize I wasn't rebased on top of
> v6.17-rc1. I sent a patch but I will only be able to push it tomorrow so
> the i3c tree is going to fail again today.

This should be fixed now.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

