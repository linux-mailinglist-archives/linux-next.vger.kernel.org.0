Return-Path: <linux-next+bounces-9535-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04969CF1D4C
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 05:57:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 954FC300C2B5
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 04:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD0631AA90;
	Mon,  5 Jan 2026 04:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oCFTD19T"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976E92BCF7F;
	Mon,  5 Jan 2026 04:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767589061; cv=none; b=GxxmeZevc1SIj3vmWZbzammB0FfQiws9RpaDw2R2goxh3BkBCYojzPSkMWDazzQMCn9vQAeaSZc0fCHx1g4zldPiAOpaz6A0F7qkOv7mLxcNl0SXmlRvTxDkHATNr2kLOB8KQ2ICO0Zt/8MwUUnkkaHDb+cvsof5AV0PjjQeYe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767589061; c=relaxed/simple;
	bh=4NMGDkbkAqsThD3dQP9d/k18Foh7z4K8NS4kQRUCBZw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ArD/cvBQOaMCDx3TZydCvMaA2j2qP3+MfV9OH2s/9PhOVFwZpiKmBVwigwYiKFZmogCgdo1PCYUPe06vO0E31qJdNBmM4J2ZF354GWFNLhfSlePURPWSj7DOoLc4MkYjhLW+SFHTkbQ/K4mGdyvaCVHPPeXD6P9azVNHfhpbk6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oCFTD19T; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767589056;
	bh=92VY6OEmaTZZIFAl4VC6nS4a/om3Rxq94YffNwRAQo8=;
	h=Date:From:To:Cc:Subject:From;
	b=oCFTD19TmMuKgXIaF+nRUZXsK9H/4SLNgDnk8JjTQZrIMm0WwT5BYCXMcZaOyqid0
	 ouXJ5hSXl61tg6TDKl5k1ONSzCCmBBEv3LFdiGt+tPlfgFMDS97ntBS6mGNxV3U6EH
	 Cf/fH0VmVyM8HxNzXetOg7pzAWRzrvchHOYtQ1nIcjzDjFYHnqyTknsS2Pb9bXT8W3
	 QJiJv/NKunY6uNZKJQRcuxYFETAGgIgIdGY1+Z07wixvCiZ2jcQ0L2yjNqNSHWI1MW
	 WadwZPw3oWNo+rGvGB3DCmRr+n5R3CoBEENckbqyp01xBA1R2Ix/YRkOfsTwxZmArn
	 vdEp0e9uKm2UQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dl29C5NnBz4wCx;
	Mon, 05 Jan 2026 15:57:35 +1100 (AEDT)
Date: Mon, 5 Jan 2026 15:57:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20260105155735.3b4012b6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mQg3VFDK4CcorqkjrtTadez";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mQg3VFDK4CcorqkjrtTadez
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/gpu/drm-kms-helpers:197: drivers/gpu/drm/drm_bridge.c:1521: E=
RROR: Unexpected indentation. [docutils]
Documentation/gpu/drm-kms-helpers:197: drivers/gpu/drm/drm_bridge.c:1523: W=
ARNING: Block quote ends without a blank line; unexpected unindent. [docuti=
ls]

Introduced by commit

  9da0e06abda8 ("drm/bridge: deprecate of_drm_find_bridge()")

--=20
Cheers,
Stephen Rothwell

--Sig_/mQg3VFDK4CcorqkjrtTadez
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlbRL8ACgkQAVBC80lX
0GyEuAf/T0+PXVWEAkBFuCVUBXiA1pl6OPWL+FdWThgz+5DP24PFdJNMOsaDhfYf
y11ZPc98EI0yFuQCmxfI2FQq6te2/TZO3FPCIXysJXKYiG9AZz6EUyzIpgQNE8kq
JnveUlv1mUr+iobiU5dBfeuN4xKDmdMP07V3GRc5TMBgIKVskmMbjwuDjpAVvtbK
Apudp/QcXoS+eJWy1PFWGxgei+Zo7njQdnTAhOxggIVH1SRUL2hYpu6v9abRY1jP
7Q6WeJ5jdNdeEOlf8K90fhGpvy4mbpOpjiPp/ybSwmQsD4GqNrGH1SOXYCXfRpgK
LtOW+RqRXpqScJaadtJbvb+1Qeg4MA==
=IQUf
-----END PGP SIGNATURE-----

--Sig_/mQg3VFDK4CcorqkjrtTadez--

