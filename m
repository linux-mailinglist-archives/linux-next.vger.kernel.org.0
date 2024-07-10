Return-Path: <linux-next+bounces-2915-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E246D92C8DE
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 05:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06E861C22C9B
	for <lists+linux-next@lfdr.de>; Wed, 10 Jul 2024 03:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB62B4AEEA;
	Wed, 10 Jul 2024 03:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="HRhv7ptD"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.18])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF09482D8;
	Wed, 10 Jul 2024 03:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720580652; cv=none; b=oJU/G7XsMIMKIadiawRsmeWITx3PsJpe6bar20GEei0bZ35yktJcn3Y4FXSjYbqIycSZTli+C28NCBwXvUvoF3i2PZvZkjfR8OtQA7JkbFNFutvGUwacncYrCiVdYqWxLOoSaxYqkp2ZdEQbo028JDBfz0B1srz4aG9+CLBicD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720580652; c=relaxed/simple;
	bh=mzB2pR72KMygmv8qJ1h/AzV0GyJz5bsjmqe+iGfGSdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0MctG/cSXdoZ1QQMw9Nu9MLr8zEIwQsplBScunfuRsX2/GfiIyKG9Kho8EQfWNPv77y/t3SD5WZ7KKOPrQ/KA08qlj6SZaTk7yLFrSGsLoF8R7j5tCZYbvtISqL7lymF8zD21tGPhFc85keny1SUOcH5qlaX+VZHxYxk5QWiWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=HRhv7ptD; arc=none smtp.client-ip=220.197.32.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=yYtU1h1eDFudRupuFjOmskdIRg/MaZB4WUfDNPnHm4U=;
	b=HRhv7ptD6fO4Nz6uzsXGaCdpdM6+xJE9ru6t4KQORSTA1Aa3caWMNkbQ0DwQw6
	Ga4IxOvHMWK7bVxwshI+7CG4Tke7lFujMFeIJ6Mb/j7TSEjOLAWkIWbX8Srr2BYr
	kRIqIJOnZDUy16utzMXenXfVZQIxyeJQyWkJNjDGjyrg8=
Received: from dragon (unknown [117.62.10.72])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDnjz6W8o1mWkWBAA--.32164S3;
	Wed, 10 Jul 2024 10:31:52 +0800 (CST)
Date: Wed, 10 Jul 2024 10:31:50 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shawn Guo <shawnguo@kernel.org>, Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>, Fabio Estevam <festevam@denx.de>,
	ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the imx-mxs tree
Message-ID: <Zo3yljWDKlIT1TCU@dragon>
References: <20240710115319.10dae8e2@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710115319.10dae8e2@canb.auug.org.au>
X-CM-TRANSID:Mc8vCgDnjz6W8o1mWkWBAA--.32164S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUwT5lDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCRgYZWZv-fryrAAAs8

On Wed, Jul 10, 2024 at 11:53:19AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the arm-soc tree as a different commit
> (but the same patch):
> 
>   3898bc187cde ("arm64: defconfig: Enable the IWLWIFI driver")
> 
> This is commit
> 
>   465830ad2534 ("arm64: defconfig: Enable the IWLWIFI driver")
> 
> in the arm-soc tree.

Thanks for reporting!  It happened because of that my for-next branch is
outdated.  I just updated it.

Shawn


