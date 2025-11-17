Return-Path: <linux-next+bounces-9031-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E15C61F8D
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 01:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8AD6E3AD8E0
	for <lists+linux-next@lfdr.de>; Mon, 17 Nov 2025 00:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5081F1DA0E1;
	Mon, 17 Nov 2025 00:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="JTwWsV3f"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B267286A7;
	Mon, 17 Nov 2025 00:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763341159; cv=none; b=Wm2YANGcR+MNieGOjwDkuxCeXaT70l/Wx1wxs/X1xoT/fkPP+QPzip2Ve30wGCZhBulR5OoAm2emu1GaJRHeL+TNm3IeXuW8co+5GAhFipWh6UAGPN7L/XwcVckP4tOyOo4bbcAd3brtv5Iq/kuug/sMu4McHRQisa/D+3eJT0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763341159; c=relaxed/simple;
	bh=blNTIBzAk0vPeVK3CVdtXbd7yEbQhFnXERiYUyfKSJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7b+9W1oGac5Y+UPc0RdL1C+MDy6Ygfuf1lRNIOf7RpNtf4DYjI3FSoA+9yVyrw71fGmnHtJQikleZR15qatxu4Yn6+6WTUhuyeuKiN9uaumKwvmzAfjnW5tsFqVY+frCgh/2BT2UIJOnc8VNffQHjSc4rwBOp+i9BDGgNo/wJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=JTwWsV3f; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=0qLRAV21nVss0TLbWn09s+a488qve0rg3hpPzNV+aKw=;
	b=JTwWsV3fjMZYvlYZS5sSkgv5eezGr6byNF06rjQlxBWzj9j9qL1tA+VjS3dMKw
	8t3KAiT4Fb0srDJ6Va3Bl1Ag8zC6l0GZPFDy97exyC4ycHofzjmsm2uIpglrwpn9
	wS0B9aybC3ETna8KSpVZeZhXJkgepowgWuYaagpUEA0Bc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnYJQ+cxppWX0gAg--.8176S3;
	Mon, 17 Nov 2025 08:58:40 +0800 (CST)
Date: Mon, 17 Nov 2025 08:58:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tags need some work in the imx-mxs tree
Message-ID: <aRpzPt8bx2tl8Um8@dragon>
References: <20251117064509.18014915@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117064509.18014915@canb.auug.org.au>
X-CM-TRANSID:M88vCgAnYJQ+cxppWX0gAg--.8176S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZr15tr47uFyxZF1rXrWxtFb_yoWxWrcEgr
	1Fyw4kGrZ3Xw4xJryakas5Z3Wxtr40yrW8Xr90kws0ywnxXan8AanYyF10qFW8GrsrtF97
	Cw1rZw1jgFWYgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUppB3UUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIgDNM2kac0D32wAA3w

On Mon, Nov 17, 2025 at 06:45:09AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   d207441fb3da ("arm64: dts: imx95-tqma9596sa: reduce maximum FlexSPI frequency to 66MHz")
> 
> Fixes tag
> 
>   Fixes: d2c4d71b6cde ("arm64: dt: imx95: Add TQMa95xxSA")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> In commit
> 
>   fd0e24c7d631 ("arm64: dts: imx95-tqma9596sa: fix TPM5 pinctrl node name")
> 
> Fixes tag
> 
>   Fixes: d2c4d71b6cde ("arm64: dt: imx95: Add TQMa95xxSA")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 91d1ff322c47 ("arm64: dt: imx95: Add TQMa95xxSA")

Fixed, thanks!

Shawn


