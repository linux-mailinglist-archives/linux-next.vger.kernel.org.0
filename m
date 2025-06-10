Return-Path: <linux-next+bounces-7114-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27582AD2C3B
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 05:47:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0A943A559B
	for <lists+linux-next@lfdr.de>; Tue, 10 Jun 2025 03:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851B22566FD;
	Tue, 10 Jun 2025 03:46:34 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631254C79;
	Tue, 10 Jun 2025 03:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749527194; cv=none; b=g9A1G9Mexf2kJ2lRyhK18T7zHsAEi9Mj22P5zDDibxtC0FcHtoAtQFQgi+cPMMVL2YyOvEz1FtoFXc80ENKueldX0vhNioZpodDFwtqtKuJ44wj2STlYOGngUufLVqcC4zwe1YKOETs0xAKgmLiY60yaHuLI/rRowH11YJQp8eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749527194; c=relaxed/simple;
	bh=/ooAxAyEjHlFh74xc8x9Oc3T855VmP88qIFBViVQgJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIsfLJQdAZTqxPU4plkgJ6k0O/bkz9xe5HaTqVsYXDk4Ms3PjywNwUYK3H/gTWbzGrP97ncjiDX7jrNr8H6dAIeLzLSsjgsVHeYGOkPKPx7fRUVqoGNqfTm7a/k0SNPTLN/3XsICOOtzP4rIzS3aG7D/5Ia7sIt2+hbneyxkXew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id D8F322009D00;
	Tue, 10 Jun 2025 05:46:27 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id C1C6835A1DC; Tue, 10 Jun 2025 05:46:27 +0200 (CEST)
Date: Tue, 10 Jun 2025 05:46:27 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: semantic conflict  between  the drm-misc tree and
 Linus' tree
Message-ID: <aEeqkw670ZcuDdZO@wunner.de>
References: <20250610124809.1e1ff0cd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610124809.1e1ff0cd@canb.auug.org.au>

On Tue, Jun 10, 2025 at 12:48:09PM +1000, Stephen Rothwell wrote:
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> drivers/accel/qaic/qaic_ras.c: In function 'decode_ras_msg':
> drivers/accel/qaic/qaic_ras.c:325:17: error: implicit declaration of function 'pci_printk'; did you mean 'pci_intx'? [-Wimplicit-function-declaration]
>   325 |                 pci_printk(level, qdev->pdev, "RAS event.\nClass:%s\nDescription:%s %s %s\nError Threshold for this report %d\nSyndrome:\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n    0x%llx\n",
>       |                 ^~~~~~~~~~
>       |                 pci_intx
> 
> Caused by commit
> 
>   c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Serviceability (RAS)")
> 
> interacting with commit
> 
>   1c8a0ed2043c ("PCI: Remove unused pci_printk()")
> 
> from Linus' tree (in v6.16-rc1).
> 
> As a fix up patch would be a bit of a mess, I have used the drm-misc
> tree from next-20250606 for today.

The simplest fix is to use dev_printk() and replace qdev->pdev with
&qdev->pdev->dev.

The PCI core already contains one occurrence of dev_printk() in
drivers/pci/tlp.c (introduced this cycle - 82013ff394ea).

Additionally drivers/pci/aer.c goes so far as to define a custom
aer_printk() for lack of a pci_printk().

drivers/pci/controller/dwc/pcie-tegra194.c contains further
occurrences of dev_printk() which could use pci_printk() instead.

Those occurrences suggest that the removal of pci_printk() was
perhaps uncalled for.

Thanks,

Lukas

