Return-Path: <linux-next+bounces-7755-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADB6B155B7
	for <lists+linux-next@lfdr.de>; Wed, 30 Jul 2025 01:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F11F167511
	for <lists+linux-next@lfdr.de>; Tue, 29 Jul 2025 23:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BFF27816B;
	Tue, 29 Jul 2025 23:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="DZHJpSeR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2703821E0B2;
	Tue, 29 Jul 2025 23:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753830404; cv=none; b=ZvNj5Lnrx+S6AlSnKkGQOLD0DtBjuZCWdQyI8TZnOix7Xs3AsoNDgiCsk/W4SEkxD+bHKPjLf0IxsvfcOynJ7fMHnQlB2FPfLUQxnmFfscLZdn2vGDfbqg4+A30h+XJq5CmO7uBmm1POehLoLu4fQW9RU2Wvuv+yQErLGXTggXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753830404; c=relaxed/simple;
	bh=vivJoPfEh+E5z2OMIKp/fe9efm9lDIEm+iMQRnWJkWo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EHg1Jxmq7Qp29Rli8z0mhc6mPElkyJxxojrlP3K6cuA9oSFxryuSMz0SKA6YubHxLkh4JwYjBvxDPDbUaTatcIz2XlelyqRZLR/DRufOhyay6K5WoaQxO/axkLy/iOttFHJYNvkMoxpQYc7NAT+lF0t6EIjNKx9agJMRnJletBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=DZHJpSeR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1753830186;
	bh=tob2Ed0c4DvvffJ6EWp2hU7hxuDjBpEwudWzYizVwnY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DZHJpSeRA4hefKSOT+qJwI4kmhtKbgAEcyiYg6HUGRztFwtMYI/9W1KDHAeER5GFh
	 pn4D5nxFqlnD49lQKwDP2x+7z81pabFHPv6IqHVQv9SFSu99lrNs8Tv9LJS/KftZmR
	 ssSv/JF+aeJb1X7OTpGhugn+RadLV/Sxn2Dv8oMclz2Ww3KPnFUVg+wYMypyUMdvDd
	 9QltwABPtxDC9pDY4RG6wgsyx/lsp586GfitlKhQLp8wlUeyy6rdUdpVPkNyfnUBoz
	 fXc/QbkF6R9vnIFWhjyw0vAHQya1m2g9VP5nbHoikPG0PMHt3+NZdl8nwgLH9osSiP
	 U/sNUUISE889Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bs9qZ3CCNz4wcn;
	Wed, 30 Jul 2025 09:03:06 +1000 (AEST)
Date: Wed, 30 Jul 2025 09:06:39 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Eric Biggers <ebiggers@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, Eric Biggers
 <ebiggers@google.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the crc tree with the s390 tree
Message-ID: <20250730090639.5a3e6c75@canb.auug.org.au>
In-Reply-To: <20250618144750.092d01b8@canb.auug.org.au>
References: <20250618144750.092d01b8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ugmq/73VSB5is9gB8/9bpWr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ugmq/73VSB5is9gB8/9bpWr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 18 Jun 2025 14:47:50 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the crc tree got a conflict in:
>=20
>   lib/crc/s390/crc32.h
>=20
> between commit:
>=20
>   65c9a9f92502 ("s390: Explicitly include <linux/export.h>")
>=20
> from the s390 tree and commit:
>=20
>   47e6269f497a ("lib/crc/s390: migrate s390-optimized CRC code into lib/c=
rc/")
>=20
> from the crc tree.
>=20
> I fixed it up (I just used the latter version) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

This is now a conflict between the s390 tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ugmq/73VSB5is9gB8/9bpWr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiJU/8ACgkQAVBC80lX
0Gzy9ggAhc0Fp7mVUeWQgg18XG79UsgMhfCBQ0Gj/Bjrruzyf3rLgbdZ7z/VMjcd
+iHoOC0GE3KT5cP3gxBGVDnBhxpZt8da7yzQk30evOy9zvZ/3Kh7/+jdSohMkSY+
H3izD2Z8UtsyMid3u4IhAfyRedPjWU67LlOV5zirbomhOtxCfXT19d7AolX2WZ5E
nLEvLD0/d/n3LU9dK4IceOBSy8NNOE3spTyJ0v+ErXaRSqJ4HOa5+GCuPLVkAd2d
lWKyrR2ijKPQqm/3OIqLt03+aBv4kR5ig3LQHfGSP+j5A6EaDzl6ayZ0JVtd6SWN
0cQRVNAzLiYDbBcBRTorpzDUAvoLsA==
=KUu3
-----END PGP SIGNATURE-----

--Sig_/ugmq/73VSB5is9gB8/9bpWr--

