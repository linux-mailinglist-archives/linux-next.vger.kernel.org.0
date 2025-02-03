Return-Path: <linux-next+bounces-5361-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A621A255B7
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2025 10:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28A261887B56
	for <lists+linux-next@lfdr.de>; Mon,  3 Feb 2025 09:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063971FF1B8;
	Mon,  3 Feb 2025 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="bWGY/UM/"
X-Original-To: linux-next@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1A735966;
	Mon,  3 Feb 2025 09:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574516; cv=none; b=MxlCne+lnX0S8tzVCw7WDteSb6dn2T9Nug0yH6k7S8l+SHcILeIlNT5Crj2hzsS+2oPbFktRnQ7em34bq5+M836TdbzrJz0BuXAe0DnCooc02JAC1/C0QdRCuSjd/QmF5y+VPcAidXhHBcn+v9847+GtHTMsK8JQ9Crm+jNSl6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574516; c=relaxed/simple;
	bh=KNqKEeCDHiGL7pdfu/w4wP8bp23/cWumUhFQarKaWmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PjNzuwifspV0ZlYDGcq4hXQKGaIJT4jbMJqpIPJO69ZsFL7xt3WNjjLSDMJIYIKl0xtg3s9eSWMX2Kq13gVY1vlM/KBUYyWXZfrrHRkcD+mcWRv7uStg+daBmUy4YxDfevEDQ6M8G6Q5Z+3zI9DmDVAZMHxiIzmYTxAOGfM24c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=bWGY/UM/; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h7DSJ574upxaEZnY0esT4/q/9aBrG8kbT8CGi3ihZqs=; b=bWGY/UM/1SMPzr8tDGZFGwaoXo
	boDNqb/nPWDznFoUNcanSmNIuEMeHvpOmxKJuiMwSXkuX6YWVh1+XT1exOOL7/MCJCmG1GpCl9GAF
	c2TRf8uPG4ufFTcQ4WzxdMdW4EhiDqbNIhaetb068Ux4+TUOAOqCPSiUwos3LbSDmHoeP0qvozlSU
	EihJ0sFEH/0qNGh25sx5CIVYB798kYPDBb4uObHIxDE5xYGHV30AVQoh1dvvJbFgoZpgzz82Ni8e2
	3Zd7rEPkJ6Ehah9NmyoBO7EZfoDKxFFfsgPy5IRJ4yXMKmn7J85+k5ZikMJeFL8OJ1GsMxe5HFGnK
	pUGwLuMQ==;
Received: from i53875b5c.versanet.de ([83.135.91.92] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1teseN-0006Lx-9C; Mon, 03 Feb 2025 10:21:51 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Lukasz Czechowski <lukasz.czechowski@thaumatec.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the rockchip tree
Date: Mon, 03 Feb 2025 10:21:50 +0100
Message-ID: <3359983.44csPzL39Z@diego>
In-Reply-To: <20250203193313.0740304d@canb.auug.org.au>
References: <20250203193313.0740304d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Stephen,

Am Montag, 3. Februar 2025, 09:33:13 MEZ schrieb Stephen Rothwell:
> Hi all,
>=20
> In commit
>=20
>   11534d3c53d5 ("arm64: dts: rockchip: Disable DMA for uart5 on px30-ring=
neck")
>=20
> Fixes tag
>=20
>   Fixes: <commit hash>

thanks for noticing and should be fixed now.

It seems b4 smuggled that in from a _previous_ review iteration of the
series, where the fixes tag was suggested and explained:

  =E2=9C=97 [PATCH v2 1/2] arm64: dts: rockchip: Move uart5 pin configurati=
on to SoM dtsi
  =E2=9C=97 [PATCH v2 2/2] arm64: dts: rockchip: Disable DMA for uart5 on p=
x30-ringneck
    + Fixes: <commit hash> (=E2=9C=93 DKIM/cherry.de)

The commit of course already had a proper fixes tag.




