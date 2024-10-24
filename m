Return-Path: <linux-next+bounces-4417-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB0D9AEFDC
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 20:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11B012816ED
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 18:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34851FF7B6;
	Thu, 24 Oct 2024 18:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abdE0CM/"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992D51FBF4D;
	Thu, 24 Oct 2024 18:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729795810; cv=none; b=WxzmW9gKI1QycGU2Rdfkfdr76kmcFX7DC0RGk+DkakdLQug4Oq/RqP1trpfsBIzrHoFtm08tbYn++MKDxyPCSB73dY3rZ4Y2a1sB6GI10G7TZcJ+KtXn855ss7tqk/QBK7uygplRs1Y3XvFgAQdi3WwEjxgjP8YK1Lx0ZPFB28Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729795810; c=relaxed/simple;
	bh=c4pRXVZZpdrfmz/eJyqa3tSDxrnrf3pd3Cgq4p7YY60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=UAhcndkR28Qsv/g0oqnY0S2vOBuE2Mjjbvt65QTlkiwcOkegLCoSOBOR0Mci42PtO1g6jXRTAA2okWUnnmfCBiA/HCtWhBtU+87MqOAjfsNhGkMnzzxiJb029omen2BU7FoJwJkuQ2I8Q4SOU+xnnRDjZ4KsMnXBqotVvk4Rfy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abdE0CM/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4445C4CEC7;
	Thu, 24 Oct 2024 18:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729795810;
	bh=c4pRXVZZpdrfmz/eJyqa3tSDxrnrf3pd3Cgq4p7YY60=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=abdE0CM/hOmVHHN017h8Nv8h91/CPeoFzXI3mQtvvEDP6NAR0+g9A4EwMVOdGh8VP
	 HkRGyOYm4ZXaSpRnpxf8kzPfHyqCKqMXnyIkdyCPnSvA0cmHKs1sUSJkvmNe5gkrvM
	 SYFdufbjERksrEtrnvypkUfVxJ4kXPUB3hRtJsUxx+AX+/CGydu/xC0lKYz/UnQBQK
	 po0Dp9HzMcVnO6XN8OBull7wjLCG+5b9d0H82os0+sb0xZHeCpf3oExA4+JLhv4Jvc
	 1ms8+3Wbcx1GiqqJpS9RoafbqU8u7YdnFK+M37KWTwTv3O3Mm8UzLrMm1ZC+SsyqRE
	 h8kdZn0ZFQDqQ==
Date: Thu, 24 Oct 2024 13:50:07 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the pci tree with the pci-current
 tree
Message-ID: <20241024185007.GA968089@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACMJSesMpF9v76Geob83ONLUQUh7DXRYbPV+JOGNkCN=Fd-phw@mail.gmail.com>

On Thu, Oct 24, 2024 at 08:56:11AM +0200, Bartosz Golaszewski wrote:
> On Thu, 24 Oct 2024 at 02:25, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Today's linux-next merge of the pci tree got a conflict in:
> >
> >   drivers/pci/pwrctl/pci-pwrctl-pwrseq.c
> >
> > between commit:
> >
> >   ad783b9f8e78 ("PCI/pwrctl: Abandon QCom WCN probe on pre-pwrseq device-trees")
> >
> > from the pci-current tree and commit:
> >
> >   98cb476c98e9 ("PCI/pwrctl: Use generic device_get_match_data() instead of OF version")
> >
> 
> This can be dropped from pci-current given that the former will get
> upstream into v6.12.

I dropped 98cb476c98e9 from pci/next, thanks!

> > from the pci tree.
> >
> > I fixed it up (the former commit includes the changes from the latter)
> > and can carry the fix as necessary. This is now fixed as far as linux-next
> > is concerned, but any non trivial conflicts should be mentioned to your
> > upstream maintainer when your tree is submitted for merging.  You may
> > also want to consider cooperating with the maintainer of the conflicting
> > tree to minimise any particularly complex conflicts.
> >
> > --
> > Cheers,
> > Stephen Rothwell

