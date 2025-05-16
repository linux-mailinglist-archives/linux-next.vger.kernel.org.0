Return-Path: <linux-next+bounces-6804-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A611FAB95C4
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 08:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 834AE1BC4405
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 06:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A58221FCD;
	Fri, 16 May 2025 06:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="D8hUTHzx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B6A220F43;
	Fri, 16 May 2025 06:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747375537; cv=none; b=qzDiOrVPKf0teB1dxE4WiosHpSZe96dxfDRSJBH1WvP+znMrDA+5yumWii0l/iAaa4sDC5ISES7MI9tXriadtQ39M2zGGZb3K2ErcG4d37OMuUDrGGtBUqjueBCZR5KLLmD6Sqn42JHdklBTekHHlKkwwZ+5zUOwJ0LipnLFN0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747375537; c=relaxed/simple;
	bh=0jg2LER0GLrklND42PoAivbqYpj6cFxNRoHLdchFWiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cLsucXdtGofiaDrBbngW5MF/NVdS574tjJUUQK3BKXip1Y2fubQMTLxB4D2wJZI2eKxomwzf/rfMDV60ZHHXxd5MZIRpXm4CzdHtTV7W5pWCd4Zn41IysHYC9c793NKKWvQxTsBgooF7QArdyrwBFu1yqFT9tTrcVPvMPbTE5Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=D8hUTHzx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747375523;
	bh=uS/WWVI1KP0tJWmvuLUBWtKjVHN5ixMzKCGv+tDyDQw=;
	h=Date:From:To:Cc:Subject:From;
	b=D8hUTHzxHKlXVQc6rYiRJkRsfxgC/nLdEsYLOZvyODNure+5IvVbxZfyHtglbZ/0n
	 L4J16HNf7OEQA2y8o6QoZ5yfXcTh83t1xUn3Qx+seYz87c3BJaUvYK57Vq20ZgY1Ua
	 CMYPpQp7nUH/hC5+Q45lYdzD8TOruAjhQ51HchFtdEyDdY1SnhZJoOLyAyf99ssX1H
	 YOw2jPLePQEkOnrXrTXqRt2MEIKb04I2wflQqk61/B5/614xhd1mjbGRLnKqTBD0UC
	 82IYsstsaIADU51egnIPaNjrRfTGlw4SIBPqzd8bbUChN2GgVeN5yE3xaSoWW6iWDR
	 gzFpbcP5e0Cdw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZzGlR04HJz4wcm;
	Fri, 16 May 2025 16:05:22 +1000 (AEST)
Date: Fri, 16 May 2025 16:05:21 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joerg Roedel <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>
Cc: Joerg Roedel <jroedel@suse.de>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>, Shuai
 Xue <xueshuai@linux.alibaba.com>
Subject: linux-next: manual merge of the iommu tree with the dmaengine-fixes
 tree
Message-ID: <20250516160521.6620f401@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/s5OYvj.a.WJlzsAT4L8j5_w";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/s5OYvj.a.WJlzsAT4L8j5_w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the iommu tree got a conflict in:

  drivers/dma/idxd/init.c

between commit:

  a409e919ca32 ("dmaengine: idxd: Refactor remove call with idxd_cleanup() =
helper")

from the dmaengine-fixes tree and commit:

  853b01b5efd7 ("dmaengine: idxd: Remove unnecessary IOMMU_DEV_FEAT_IOPF")

from the iommu tree.

I fixed it up (the latter removed a subset of whe the former removed in
idxd_remove()) and can carry the fix as necessary. This is now fixed as
far as linux-next is concerned, but any non trivial conflicts should be
mentioned to your upstream maintainer when your tree is submitted for
merging.  You may also want to consider cooperating with the maintainer
of the conflicting tree to minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/s5OYvj.a.WJlzsAT4L8j5_w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgm1aEACgkQAVBC80lX
0GwZ5gf+I/X5ZZYoD32sHXvpR5f4Ojf7+FGX5LqheWnEm0D19PqYY03s65BzPsD/
F4l2iWDlQICky5AWqvYg5zDvrQREv1/SYEHZ1fup4CWNpQes9v2vcGe+LWUBxjIU
S3i+WdcYhNT2n3MzaFUoOVUfUSIhWlmlYO36b2pFSjzExw8UYLGzWgiFHIaSAky+
5OZ+zwN0QS68NwU27OWD6cfWJTVzA5Ei9/QseEng46QqlWillOLtm4uK9gBBGt6V
SONI7uzqVrfKi2prKWkP41mb30MCp5iXuS2P8pzllwZpxCMLEGZZHlM6emS2Wtuh
yWo0JU+wS7GwD5BWRG6JuxzHfXKjEw==
=PS2O
-----END PGP SIGNATURE-----

--Sig_/s5OYvj.a.WJlzsAT4L8j5_w--

