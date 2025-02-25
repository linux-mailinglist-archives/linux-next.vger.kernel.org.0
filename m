Return-Path: <linux-next+bounces-5559-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A531A431EC
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 01:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A2277A455A
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2025 00:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6531853;
	Tue, 25 Feb 2025 00:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="fSAEt3MG"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AB37E9;
	Tue, 25 Feb 2025 00:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740443884; cv=none; b=NyhrY8O8r/JjfcqvwXPAFupPAThw4kOBuRMRVX3sMkbZ/qv5Uu5WSXN2eTVXG69adnz3piP+ExriFq4H3pv9zck4oU6uIezeaxXsmizIIWmHB99U7OUO+IFjUaxRLq2Sw6YTMwogE/7ifbTzYES3ppJAatEftiH7zaGEF5SCiIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740443884; c=relaxed/simple;
	bh=LPLFXZU7AsRZTPS0+yotcBcma/nQJxSkJewLsf1JsXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQn6t/DWoa2kLnE/RB/fYCJ8cGckZdjXuPLLw2bfZlFgu90VFXu2mZyJyfHrQdhXklRMLKfl/PXkavZtKF/CC3dpycjPX+FzUylM6N4OzTtK93Gdu+nW+O7TzreSsv9yW700IGIiduZUIhHj75h924skCq/quPH+IamXTau8Ah8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=fSAEt3MG; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=tHWwn21w6kf/d54h02yTkjRjusvPqQZ2d8QjHVmuP3k=;
	b=fSAEt3MGN+jDXQ9Qf5qEL8T5PnjNOuxeHRzruqChUnSr6z116Do1MsrvQrH1Dv
	VJJGr0Ae3AM6m+GIG54hUSeEE1wURQnaleCIKyNZX2QjMy0jyC7U0lugvBl6tp6L
	c8vzM6HlzHtUHskILKWDnnJO2k6Sb7rNP51UoO9CVUI3o=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgAXf8m6EL1n6EfBCQ--.24500S3;
	Tue, 25 Feb 2025 08:37:16 +0800 (CST)
Date: Tue, 25 Feb 2025 08:37:14 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the regulator tree
Message-ID: <Z70QuuHrIbirDZiB@dragon>
References: <20250219134354.144eb868@canb.auug.org.au>
 <Z7rcC3YskGoNHdvN@dragon>
 <7e616125-5909-41fc-a17f-21d07638d72d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e616125-5909-41fc-a17f-21d07638d72d@sirena.org.uk>
X-CM-TRANSID:Mc8vCgAXf8m6EL1n6EfBCQ--.24500S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw1rZFyDJF1DAF13Zr1kKrg_yoWxZrX_Xr
	17Xa1DCwsrtF1UuwnIkFsI9rW2qr1UArs7Xr4rWF1UZr1fAFZxAFWvkr9aqF4xKanFqrs5
	ur1Yq398WayakjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUppB3UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAj9ZWe8iCGfFQABst

On Mon, Feb 24, 2025 at 04:01:46PM +0000, Mark Brown wrote:
> On Sun, Feb 23, 2025 at 04:27:55PM +0800, Shawn Guo wrote:
> > On Wed, Feb 19, 2025 at 01:43:54PM +1100, Stephen Rothwell wrote:
> 
> > > The following commit is also in the imx-mxs tree as a different commit
> > > (but the same patch):
> 
> > >   b5ec74c2aec7 ("arm64: dts: imx8mp-skov-reva: Use hardware signal for SD card VSELECT")
> 
> > Any particular reason you picked this DTS change?  Would you drop it
> > from regulator tree?
> 
> My understanding was that these fixes all needed to go together since
> the interface changes were a bit dodgy from an ABI point of view.

Let it be with regulator tree.  I dropped it from imx tree.

Shawn


