Return-Path: <linux-next+bounces-8973-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FD3C5AEB8
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 02:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A988934B10B
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 01:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008CF264602;
	Fri, 14 Nov 2025 01:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="en9WjO+4"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C754A95E;
	Fri, 14 Nov 2025 01:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763083841; cv=none; b=Cv4dk2eK9pacVKAl2zfJ+WXm/otZhs8m33X7PUdPG7aJiHCP7TGcptCu6c1DElIa9OTD+eYL6WGfBeCgwKHNTvOuEfsT925PfHlB683kjREVJvPaY/92TyK/UwAAMbQNt5wcbdWmd+ugIpzhWpZ7yBxLS+oFNpMXQFCElLq6t/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763083841; c=relaxed/simple;
	bh=7pXrh0awXTgqsSbDw+s+OUFTwEkJ2/6QBsgqA14Pn2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ap5aShP/10xoF8rMNSz7soAWiL2lXrrsc93FasU5YsVvIAewgOv4odzfTPHdaGKsRD42E58+uaiBHmZ+vOf8xtCKfRfcmiy0hPb1FZcEKK2Z7qZj1rXStNVfKQHL7vt79Jqr7jNoHGlvrE6OrWbDK8kDSrJazsZYxLT3H0nguyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=en9WjO+4; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763083832;
	bh=HM4y12GwXcq/Chrwxhz0HM39maEyoAX3yOpUfxmSexA=;
	h=Date:From:To:Cc:Subject:From;
	b=en9WjO+4tE8I8aiEgocG4gNsT0848j7arp2yxMZxbGlLxwf62RB3KEhYuHqKYWOer
	 yP3BV3zIavK0SpkjCubGHzQqLgMK1e6YGkB8tpj1qqn9FDhB21g6t8Fd7S+QnOqYJI
	 oxSZQ+fv8gG3YQd9Qki8J2Et+TxSNU5lb+F9xvMpMPKwmJp1lYbyMaxmdAQ5NyLHGA
	 WSYwXlA3VH7Zz7NtTKu9cD8goxlnv0I8EUJu1vYKRIYWyzO/RCx+KvP0YwWfloaBSu
	 uOJT2IWH35rd+qmB7fBBSVfp33IpUope9NfOsGbNgBEzjMg7oATkbI5jY2P3bDb8zd
	 iCVVF7LY5u7vg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d702J4Pjdz4wCB;
	Fri, 14 Nov 2025 12:30:32 +1100 (AEDT)
Date: Fri, 14 Nov 2025 12:30:31 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Colin Cross <ccross@android.com>, Thierry Reding <treding@nvidia.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the tegra tree
Message-ID: <20251114123031.136e7429@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/k1H0n8dj7=Inc=gnjuRknFF";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/k1H0n8dj7=Inc=gnjuRknFF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the tegra tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/iommu/amd/init.c: In function 'amd_iommu_disable':
drivers/iommu/amd/init.c:3505:9: error: too few arguments to function 'amd_=
iommu_suspend'
 3505 |         amd_iommu_suspend();
      |         ^~~~~~~~~~~~~~~~~
drivers/iommu/amd/init.c:3041:12: note: declared here
 3041 | static int amd_iommu_suspend(void *data)
      |            ^~~~~~~~~~~~~~~~~
drivers/iommu/amd/init.c: In function 'amd_iommu_reenable':
drivers/iommu/amd/init.c:3510:9: error: too few arguments to function 'amd_=
iommu_resume'
 3510 |         amd_iommu_resume();
      |         ^~~~~~~~~~~~~~~~
drivers/iommu/amd/init.c:3027:13: note: declared here
 3027 | static void amd_iommu_resume(void *data)
      |             ^~~~~~~~~~~~~~~~

Caused by commit

  19debadfa11b ("syscore: Pass context data to callbacks")

I have used the tegra tree from next-20251113 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/k1H0n8dj7=Inc=gnjuRknFF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkWhjcACgkQAVBC80lX
0GxaAQf/ehLUKSq+UU2ns3LCR8LiLhhPDCUjBa9SGhKOEqHZlTM06269iHF3g78Z
x+hfJdbkSPlY/pa5LAOFVhfihTDlnAQrt3nUJq4zwNA++hHBLZ8VU7ZMxrXbLu97
1L9z7jiNWu7D1estcAT4BeZoO+2fQgAaGwo3upda0wxRRRcNz5Hk3J0vJ+Zz4+a6
5/zQlTFadxsuJh25ET8bspBhUzTqHgxnU6uPfvNIPCU56DsrGV1+GO3MMSFk+ohi
EKBogzq9pAqEpfXLRHsVGm8HSEeDc4bCYrOa4KpJ15ztx/EGlv4ifmSegA3Ms8Fa
BFiatQEnycO9KO0fPjeBI3bgQgfclA==
=k682
-----END PGP SIGNATURE-----

--Sig_/k1H0n8dj7=Inc=gnjuRknFF--

