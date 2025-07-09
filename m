Return-Path: <linux-next+bounces-7447-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A54AFF578
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 01:46:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D7B81C82FBA
	for <lists+linux-next@lfdr.de>; Wed,  9 Jul 2025 23:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C948779DA;
	Wed,  9 Jul 2025 23:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="CRqBPvvR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8353BB672;
	Wed,  9 Jul 2025 23:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752104783; cv=none; b=fR4Uzrn0gbAzd739aFYeTYRiJkeOZgaEA32i64MgzOj0lTza/OKg8n85yTeDbUbT6/OFBrRqVTRx0PvfJMboPXPqIZYIM8ZmkZlLDsf8PUv+33SYrkeEa6BgiH3SYpaxeLV/wyB1QzN63bF+kLZhYVfvNpOXk+6+IMkE4C8o4dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752104783; c=relaxed/simple;
	bh=wqvXm9CwNJYSLXBBFuFuzKqsz+QHu9VuvP0QJTSEt3s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kbs85UYdPACeAD4zLkKH3G1DZ6+H1hpWqrdj/igephXG4uj/qHKcsQi9cxql7uMySO2xX+wjA5N3qZ/ewrQpysihw2MpnxXMHSmKKsAzM7Hpe84/Tgd5t4Ys2eRAF2M7/Z2QNb96lNY9pSRvSzh1gTbYgKgL4/MsVbO/suwrsRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=CRqBPvvR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752104703;
	bh=S9E9vuuIIJkua/f5Akf5/Ug81XFvp17MeW/56rpAyA0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CRqBPvvRynJp5xjA+VQX3fIJKXlhcGZ3/wArjJDs2vW6SsMYL7ndqsczXAuAwYUjm
	 4syJzjawlNYyxYyX0+7NNmlLfVdx84k4BRtY/5rVfGvXG2OSoWmJ/pHqumvvJTCQ0z
	 6KR9UKSVsf4Mj0pS88sC4yE0uBaDCVHghJq3TGTDnc6Qo0xZ0HZHQPrQ/NVAhmwrAP
	 +Gt56Tw5VqWPI9Uuo3z9omwxRi1H3y4PEt/Lleaofmrd2kcI3TIXfwJHgUZe+tWJG6
	 T5mikoyOlFuuKNbJGYyIKijhe81rxl/meLD8fTUjS2ZNLS5jf7tCLa1V976nqGw38x
	 NB4F2wTSJQfXg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bcvjB6YM0z4wyk;
	Thu, 10 Jul 2025 09:45:02 +1000 (AEST)
Date: Thu, 10 Jul 2025 09:46:12 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Christoph Hellwig <hch@lst.de>, Jason
 Gunthorpe <jgg@nvidia.com>
Subject: Re: linux-next: boot failure after merge of the dma-mapping tree
Message-ID: <20250710094612.53f2d85b@canb.auug.org.au>
In-Reply-To: <20250709174108.GH592765@unreal>
References: <20250709233953.7afb7a8a@canb.auug.org.au>
	<20250709174108.GH592765@unreal>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9y.fPzP1YhNuUk6=baXl.T7";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9y.fPzP1YhNuUk6=baXl.T7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Leon,

On Wed, 9 Jul 2025 20:41:08 +0300 Leon Romanovsky <leon@kernel.org> wrote:
>
> Can you please provide the kernel command line to determine which DMA
> path is taken?

Sorry I did not respond earlier (your email arrived at 3:41am my time
:-)) but you seem to have figured it out, thanks.  I will let you know
this evening if it has not worked.

For reference the qemu command line was

qemu-system-ppc64 -M pseries,cap-hpt-max-page-size=3D4k,accel=3Dkvm -m 2G -=
vga none -nographic -enable-kvm -kernel $vmlinux -initrd $initrd

The kernel was a powercp pseries_le_defconfig build (but setting
CONFIG_PPC_4K_PAGES=3Dy instead of CONFIG_PPC_64K_PAGES=3Dy).
--=20
Cheers,
Stephen Rothwell

--Sig_/9y.fPzP1YhNuUk6=baXl.T7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhu/0QACgkQAVBC80lX
0GxWnQf9ExNSwlwSMeyaqW9rCST2FE/IAj+lqa+aG7neelPFfaK3ALzTgy6+5fUF
hYa5kX8w0DoLc8XElWtwW2JoI9Tzhvs2APZrE1MYTcir9zRRcX66f8U6udOfnoE+
U+OfoRFV1LEUhATj82NyP1wqguKMFRSP9HhwlcH54pWQlW9ZdNw2zae22ZiQlLhz
X+GEjR9w4Qb+KyNRcSoZSeHuUItFj5Uwa3wI7SPT3Eau6MBv/weTQ/mibCSY/fwh
bPp6QYFgc4ffJrd6WPssyg9lYqCyoWwibcn/zGLG3cL/ZPVfpGUStDTWQ3j3hCYP
chyvkQLpaiMc2YHaDcxt0nJOijxm8g==
=qXGz
-----END PGP SIGNATURE-----

--Sig_/9y.fPzP1YhNuUk6=baXl.T7--

