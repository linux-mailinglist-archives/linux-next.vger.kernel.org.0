Return-Path: <linux-next+bounces-7479-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0B3B015DB
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 10:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 882B17BB149
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 08:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9911E1DE7;
	Fri, 11 Jul 2025 08:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VI1zijhk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5454B1E5206;
	Fri, 11 Jul 2025 08:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752222308; cv=none; b=Be55nDNOWrAtmkcBtOdl6UNIbhHEFDRNlxO9jhHRR/s2YiI1aRRCBJrjiZzkVZPwYut/aVcf8OqErEnnAz8Lq5JAYLAUg2kxbez4VpELHqeVM2+THdbnNG1RZy/Axcba0TVVZ4IoupCu2hbm6TzFXDsEGLl9aVaBtcY2xyXADdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752222308; c=relaxed/simple;
	bh=UNJr1pxqUUGJD6r78mZe6/WL3qNKVQNZAFdSOcpHbJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tb/mTPIexBJH91WMHAJItqo9q0hMmYLQ2ELiGoIwYWi457RBxZHKuO0zJ+4k7OcOvjx0wwDEDgeVARVGXvdgcnhe2rayyNkljlw9UkaIMCaFT2KaXWBSm3RnLd5JqLDUxQDl31yXzdRE9JqC66T8jVG0F6A+5a3BJow54Rk1MEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VI1zijhk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752222222;
	bh=iNDCaoEE+mbMCJ9M4/sTCNvRYzdrL5YT1RTO5ft07LU=;
	h=Date:From:To:Cc:Subject:From;
	b=VI1zijhk8Ghn0YbovBDpZNVcnJAsyUbWkzOl5328L/4gTI/m9CffXuW8Qko0ah5xV
	 ffAFnzQhsLQjHNG4Fc/QmroZKdLKWEuzBm8dOvtwu2AFVn23lKRuwptwCTlwxKK5I3
	 MmyxKBWtHy4qhNutcFudWU8SzjAGL+QcZPNo5wPbtYFrL+oaeCjCzWtVVjdHitb0aN
	 nA+osiu3xytTlzw0TU4tC1e8JI8OKm4rwICmZ4zvyEYeLucC+wDt6i/Sjkk3sYyfQ1
	 mUcHn0FRtNgbvsaBnZQvcvhCCQmplcFjWRtfBfJvDnPkq682rn3/nByTvLYFX4SDhd
	 t2Dob+wokHu6w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bdl9B3Rpjz4x5Z;
	Fri, 11 Jul 2025 18:23:42 +1000 (AEST)
Date: Fri, 11 Jul 2025 18:25:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the iommufd tree
Message-ID: <20250711182501.29b6b9b8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/24gMgK2xca5USrab0LWkm23";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/24gMgK2xca5USrab0LWkm23
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the iommufd tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/userspace-api/iommufd:335: include/uapi/linux/iommufd.h:1272:=
 ERROR: Unexpected indentation. [docutils]

Introduced by commit

  c4e9e9b4227e ("iommufd/viommu: Add IOMMUFD_CMD_HW_QUEUE_ALLOC ioctl")

--=20
Cheers,
Stephen Rothwell

--Sig_/24gMgK2xca5USrab0LWkm23
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhwyl0ACgkQAVBC80lX
0GzvzQf/eAkpEx7GIh918U6VeGrBKNQqaaYP3HmJ/yVGlXG0LFZ4gxTVvOVyr0OQ
Fjt2IpQDzbOWgm0NV6ryJepc0VS4f0VxReHqGIvXnzXVVz81ZrSQKGT0qmKWoh76
CbdJ5NWdGP4XY1d8tShSk2jqlceStPZSPOA1IpGCnqaYVvnTEz2vVEG2Ujj/hRPk
Ytu3dv10aXkuDOtMdpx9UIL59Sa1xyKzd4e8TZ9GAd6ZJwvXnoJyHXZaA6//j13z
yWW8LolX5cYUqXEkEiLwr4U7BAV/4DaKGTsBdkeG9Xjwb1dZrHpOwypkbQ4s+6e0
AyWy8ZpQ8FBuCStgd0b8bqrUEb+BXg==
=YFQ/
-----END PGP SIGNATURE-----

--Sig_/24gMgK2xca5USrab0LWkm23--

