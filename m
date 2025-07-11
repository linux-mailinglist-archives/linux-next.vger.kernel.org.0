Return-Path: <linux-next+bounces-7482-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB05B01679
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 10:38:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0EA15638DD
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 08:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F4422C355;
	Fri, 11 Jul 2025 08:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mSxsGg8Q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403F622331C;
	Fri, 11 Jul 2025 08:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222931; cv=none; b=pU0qS1MsNOIfqosXYHPfr7Ic8SpU0aSrHbFMkMdjEFpyKwLLaEiOmjxmiEkQ6VNzY5EcUQuUbabbACasm3cfK/YnUeYQSB0bi/ME6JptxVJvv5aHjVOLHlYCz644WViVxPkV+p15JHiBZoDRwbHjpnaPCJ+EHWW4UYP7hB2k7jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222931; c=relaxed/simple;
	bh=6Y6S05PzQUKs+xhBM9Z68i8/1ah7poZCl9q6QkKjpnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BU3wDZSQuySPefaImQiuKGYChMPyAEOvqym+tR5199efU6G0ueVIQ+RnsPlYGzbXPL++AaLcEMeA7MzKnV2kBH2qAO9Laeq1bFatOXaLvDMiWSPXLRDm+nMXZyYobZkVSI+a0ZVoKtYemAR8haBxpr1QnqpulRTlFOfiuLLYugI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mSxsGg8Q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752222847;
	bh=40uLoAwD1ciV3Bm0n9OC4h0EC1rxr1MUi/34S+ZuYkk=;
	h=Date:From:To:Cc:Subject:From;
	b=mSxsGg8QFqFU8R6qXwhif+DRS+addAQt+n0VAYNl2aTfjiDnsqlWFipnTSQ89sS4S
	 hSP9qMDPrccg5U3vhOmvHBJGDL9eJM531wIy46pyQsH5wOKzM9+2tHfkqAIYBOd3DI
	 94mMiUPdaF0xrmGIcckj5jjZAxZzgHVs8N5VyDWOWgpTMfqjVnvypub9Qfzsgx9dSZ
	 91XHPjxxtl4+U0qHWES0ILlvySm9Wl7oHL1mIpTikVVlkBJiXxyuvfmZB9pl++D5KT
	 7IrQLgQJPzpE7wuNK9E5ZQ4/dMOX7f6lf9VoPwB4A1h7K8lueCTXMAOQa0ZQCO4ore
	 gaUVLaGZTEOrQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bdlPC3zjbz4x3d;
	Fri, 11 Jul 2025 18:34:07 +1000 (AEST)
Date: Fri, 11 Jul 2025 18:35:26 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the iommufd tree
Message-ID: <20250711183526.5c9df5ea@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=AjIvQKWb8=szTG3sS3ttg4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=AjIvQKWb8=szTG3sS3ttg4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iommufd tree, today's linux-next build (htmldocs)
produced this warning:

include/uapi/linux/iommufd.h:607: warning: cannot understand function proto=
type: 'struct iommu_hw_info_tegra241_cmdqv '

Introduced by commit

  b135de24cfc0 ("iommu/tegra241-cmdqv: Add user-space use support")

You forgot the "struct" in the kerneldoc comment.

--=20
Cheers,
Stephen Rothwell

--Sig_/=AjIvQKWb8=szTG3sS3ttg4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhwzM4ACgkQAVBC80lX
0GxMVQf9F/VDJ5UjyaEOjowJ3Sh1W7tJdnTHvoyrWEZWZHDPuIq3PXOj3iVCQP+2
VZExkDG14m3tGRaEUHgHw4PCncANcdtUKq5uUcQwIV760We4IRKndH08+Fc0BbML
enj/efJXg3ljcH5OoqEsHevlkAcwixLDNLO44HaRorlGu4zSVILdnwNzVeD5gg76
lqRILzOXZJojehHcDzO3Syyk5D/Xxaq7IRNP85/DCJ2vLVslWcaucMM4WPR5aD6O
uTi+JFB4f/3mvfMrExnS7SqWQBMY62Yhi0zfw9+49rlCzKe4RfN2Jd0WEZ5cgsmZ
sYOPiWQR+S/uhtnmpBXjrqCgqSWn6g==
=Epzn
-----END PGP SIGNATURE-----

--Sig_/=AjIvQKWb8=szTG3sS3ttg4--

