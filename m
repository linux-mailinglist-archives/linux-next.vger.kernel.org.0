Return-Path: <linux-next+bounces-5767-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97942A5D6CB
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 08:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8155177955
	for <lists+linux-next@lfdr.de>; Wed, 12 Mar 2025 07:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1777E1E7C19;
	Wed, 12 Mar 2025 07:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="FCu76uj8"
X-Original-To: linux-next@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE59818858A;
	Wed, 12 Mar 2025 07:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741763015; cv=none; b=qRjwx/UsTpvWU51mG7LqOILRtnTHXlmnl2VqZNuZhRyZp+ka/eqdFEusR77RGmqnNq0fF4GYIXw80UXqgH4ToxcOs1uxI7h95/9+4vBXnzCgx6y01b48n9ErvEa57l6kZI1Emft2yuDFSSR1l4YA5ZcHvUOkFteq6iMSOAgf6l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741763015; c=relaxed/simple;
	bh=7TDb34oGNMe0QfS+9S9q9/NfkMtcz48n5X+/oqeXS5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GrX+Ca1XKmW9tl3Lqg4vToIE7Au277WD50Jzt3cFuxlkauxnBef99TxDJ2OafedLUKryzfdkPv7GHjgS+USkD4+sQKVlRmuZNRIpw/+djo3/Icvs4f/oACMzb6sUx6Ax4TeStd9qqq2awdK4/DCmhfbfmsCXjL8D7r0D7Lve0jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=FCu76uj8; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=GssCyzw4bJImuWV+VY4l2Cw8GECeAM/HvdiRWBFW+bI=; b=FCu76uj8/0gZPisgHHd2IZHLvV
	WlF9ti1qyzdNwZ1EbpKuPXNP8jXUApKto8SYjDujCwaqOJ677tWV+iNW1KNzgdlCxIwvsL4HOv4O/
	jllyS+Wiep0/CtM9W+Lpf8O+vgL1o5d3gYNeHULrQQtVzOHZSvBYXqGlgyfzjhJTpqXhm7KwiGg+p
	aZurr+IgrqVH6MS5dZ/EyTLpwH/lnvREFmr2WlrQyVODOVgnE+rUmzBIc/6RKndHuk4dmtJNeKS2b
	sjqceTTv2mLWOE8UoCHsarueoSBML9sJSW8mHn4LYrjmTNvPs9WxQ1t52bVfdpjtbnm/qI/0BVoVK
	kPES/QtA==;
Received: from ip-185-104-138-79.ptr.icomera.net ([185.104.138.79] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tsG7X-0005g0-Q5; Wed, 12 Mar 2025 08:03:15 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: linux-next: manual merge of the scsi tree with the rockchip tree
Date: Wed, 12 Mar 2025 08:03:14 +0100
Message-ID: <2300961.iZASKD2KPV@phil>
In-Reply-To: <20250312085101.58cdd1e5@canb.auug.org.au>
References:
 <20250311183524.38989e83@canb.auug.org.au> <6134949.lOV4Wx5bFT@earth>
 <20250312085101.58cdd1e5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 11. M=C3=A4rz 2025, 22:51:01 MEZ schrieb Stephen Rothwell:
> Hi Detlev,
>=20
> On Tue, 11 Mar 2025 12:24:25 -0400 Detlev Casanova <detlev.casanova@colla=
bora.com> wrote:
> >
> > Unfortunately, this fix is incorrect as nodes must be in address order,=
 so=20
> > ufshc: ufshc@2a2d0000 must be above sfc1: spi@2a300000.
>=20
> OK, I have switched it around in my resolution.
>=20
> > As we are close the the merge window, I won't mind if the patches have =
to be=20
> > postponed to the next cycle, but some device trees won't build anymore.
> >=20
> > This can also be left as is with a new patch to fix the order (to be ba=
ckported=20
> > if needed)
>=20
> This merge resolution will be redone by Linus when the trees are merged
> during the merge window.  Someone just needs to mention it to him.

I mentioned it now in my devicetree pull-request for the soc-side
see https://lore.kernel.org/soc/3339830.aeNJFYEL58@phil/

Heiko




