Return-Path: <linux-next+bounces-6419-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB09A9F07B
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 14:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B367D188B957
	for <lists+linux-next@lfdr.de>; Mon, 28 Apr 2025 12:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 354821E4AE;
	Mon, 28 Apr 2025 12:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="qYtTfF38"
X-Original-To: linux-next@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30254C91;
	Mon, 28 Apr 2025 12:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842669; cv=none; b=bXg+QGwfobYoQVK9USIC439PsD8VbWU1ndhDFxOiekIW5DSbDogPGKQzSe4L6+w8msiReuoMLvniBgFiuRSy8qfFp9SQHPCDcb8P0TpSB39yhTE0qG2IX2Y6cpzwfDAn7UwKDotSvIlpGKg/7KqT2ldQQMH2/MTppsuEb3tQ3Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842669; c=relaxed/simple;
	bh=P3parEjgsTHZ/P9V5+9aFVZYr8vAnwpcuWEh5ru1KdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=slJZ2Bq6ljb7jH2uz8HazCRvCBUTImv9qfiJuDl3eQHCzAp1jUvzVDZH/+QyTRN+IsNWdl22+5pGm4MBrhAVeJiQjx43TZLDByd8NDv+BzSK2WgrsSsY59RpULAbWgk0wMET8/xvp3PIHVaf+487NwHyf9x5DySW70gfRu/an2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=qYtTfF38; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=VxgZ6a/j/IRQEjoMfGq77quUnJzRwBUMN3NjzuLuPPY=; b=qYtTfF38ZjCl6rxc5IHt7kOCjd
	4ILBZ/ivrLc5OKPv19NwK6sv99zm4f7mDKezSkHcEmDC/4db1WUE6FAF1YzaKpoluPDcR4YiktFA2
	WCB9c5AEvM07EVKKEHN07aPJBmxuDRMciplYkYtQCo7po67WbS9e7dLf7nNuwBt14feftsXrQPqtK
	4HWiJJkR5iTfRqvOzozr4WRcV+TRAx3/rce2gEovS4Y9/m1z6RevRwlL0Dyk8VcDflyBU0o/4nEBa
	C9wK38C+edVFPSfwAFQjYYsqZg3IWaubqKhuszGGda6kQ6RvEKHxfQRzQarinRmjhF6tggD64RtIW
	WlOZ66dw==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u9NQU-000051-Sh; Mon, 28 Apr 2025 14:17:34 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Heiko Stuebner <heiko.stuebner@cherry.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rockchip tree
Date: Mon, 28 Apr 2025 14:17:34 +0200
Message-ID: <3363882.44csPzL39Z@diego>
In-Reply-To: <20250428215539.0ce8d1a0@canb.auug.org.au>
References: <20250428215539.0ce8d1a0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Stephen,

Am Montag, 28. April 2025, 13:55:39 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Stephen Rothwell:
> Hi all,
>=20
> After merging the rockchip tree, today's linux-next build (arm64
> defconfig) failed like this:
>=20
> make[4]: *** No rule to make target 'arch/arm64/boot/dts/rockchip/rk3588-=
tiger-haikou-video-demo.dtb', needed by 'arch/arm64/boot/dts/rockchip/'.  S=
top.
>=20
> Caused by commit
>=20
>   14e506dcf3b0 ("arm64: dts: rockchip: add overlay for tiger-haikou video=
=2Ddemo adapter")
>=20
> I have reverted that commit for today.

sorry about me messing up when applying the patch.
I've amended the patch to build correctly now and re-created the for-next
branch.

Sorry again
Heiko



