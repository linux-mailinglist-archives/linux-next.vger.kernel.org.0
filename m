Return-Path: <linux-next+bounces-8482-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0007B9EC41
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 12:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA67E1669EB
	for <lists+linux-next@lfdr.de>; Thu, 25 Sep 2025 10:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85DE306D3F;
	Thu, 25 Sep 2025 10:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPPV3WZG"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0697306D26;
	Thu, 25 Sep 2025 10:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758796730; cv=none; b=ewyUK85Pye4xwTn9b7KhZkILs8r/+4i6qV1w2sRM1BXfP/egVLytRDWlbLGhui2LvQ1ZmVpoVMJ1faBXGs3gcq08AVAEI43uBrCsieNjV3rSPQNii19jBnmsmmBx/CUpSNIfDa4adfci3FvfndBqFyvVMYC43wsHBqv3U5lWpo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758796730; c=relaxed/simple;
	bh=A7CHXafhJtRXT17+BIfB+E/zKB/h2v8dsc2vga1xlg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ljJ8hybwnTJ5CBvM7e3EHPOE+POYEDSOKgA7Ai8UdPFrB6cCXcSIXB7rjcfEuAjJHsiCsj2FoYAKouxWITooF+oJ9OjfAkKkSaDCgq/ZWrI8QlrcuxeAvVz+LOsrZmbVcBbYfvMMxAd25k+PKOufEmaSKoY3yfbSbSlskv6VeE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPPV3WZG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC44C4CEF0;
	Thu, 25 Sep 2025 10:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758796730;
	bh=A7CHXafhJtRXT17+BIfB+E/zKB/h2v8dsc2vga1xlg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kPPV3WZGZfoINkMYO6CVXmu8qOr4w01ljO4FJOzap/VpWpUdqIOFH2NLNXul/Kk7I
	 1j8DSGq8zZGQ2iofS+frTix6DBAtMEVgr42ME2LQ+o4eDd41dCqYY83Ez0XPRraSWL
	 wN76qXup+o2tstvSmP34gQccYFxXsvcBpXFQ05elgFEGFRrkQ/9VpLDKDbeVttfSnw
	 qef/H2gL/XkTLyYdFykLk5KLe/luoqqlfyCpN86U7GJOSwsXHsAgjHwa7EhG6Ap6u7
	 4edPH6dNG28pOp2Eiu+Kmv0n7ndnIa/B/+DaU7YhbEkZRstD59yhv4MqNPURGoZ3T6
	 HCfPQB5mxs2ow==
Date: Thu, 25 Sep 2025 11:38:46 +0100
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Ming Yu <a0282524688@gmail.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the mfd tree
Message-ID: <20250925103846.GA8757@google.com>
References: <aNEedsR5CDuVBoyo@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aNEedsR5CDuVBoyo@finisterre.sirena.org.uk>

On Mon, 22 Sep 2025, Mark Brown wrote:

> Hi all,
> 
> Today's linux-next merge of the gpio-brgl tree got a conflict in:
> 
>   MAINTAINERS
> 
> between commit:
> 
>   8c13787893fde ("mfd: Add core driver for Nuvoton NCT6694")
> 
> from the mfd tree and commits:
> 
>   51dad33ede636 ("mfd: Add core driver for Nuvoton NCT6694")
>   611a995e8ae1a ("gpio: Add Nuvoton NCT6694 GPIO support")
>   197e779d29d87 ("hwmon: Add Nuvoton NCT6694 HWMON support")
>   c5cf27dbaeb6e ("i2c: Add Nuvoton NCT6694 I2C support")
>   8a204684d0ffd ("can: Add Nuvoton NCT6694 CANFD support")
>   d463bb1405836 ("rtc: Add Nuvoton NCT6694 RTC support")
>   f9d737a7d84ff ("watchdog: Add Nuvoton NCT6694 WDT support")
> 
> from the gpio-brgl tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> 
> diff --cc MAINTAINERS
> index 55288f2ffb6b3,681fbc8258052..0000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS

Missing diff?

-- 
Lee Jones [李琼斯]

