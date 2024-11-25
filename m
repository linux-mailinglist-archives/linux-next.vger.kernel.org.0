Return-Path: <linux-next+bounces-4837-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFC59D79B2
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2024 02:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2290AB21173
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2024 01:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8819F10F9;
	Mon, 25 Nov 2024 01:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NbQBNF29"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EF017C60;
	Mon, 25 Nov 2024 01:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732496974; cv=none; b=U2bU5erQ4F8HpbdajW7ExHiif1pAOOjKCQJP9xiww/Y2ycYH6RC9fUTP4Wvunlqka09Sgf3Prxl9ebZjK7ISXYieuEthwea2fZj1uyQbRDIOmnU33/JSiEeVZKZVaQnB4rPLDJICvh7mZdI1W66EB8cHNqqDESvH4Bkk63Bx+L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732496974; c=relaxed/simple;
	bh=MrizqgFeahr33sqTryZ723cEdfval7sND/3f8Nu1bL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FPuO83MPLTLuR98MN0+kANVB1TgdW+/lG7j2odVDWtO0ypWTsRLy7D043BxgocC0LG0Hp3cDT5ybJbvAWRfYIi6aN+w+eNJsHnnwpf1fPuTeCorZvxE9AUz0W/JNEiAidGv289M2pqS0b59UklLnOmRLfBK+C3VDp40Dq9DISsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NbQBNF29; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732496961;
	bh=NPFuZFCQNR5Yu8G5vMI1GfSK3jYB5bbGOIq1W9kVn5g=;
	h=Date:From:To:Cc:Subject:From;
	b=NbQBNF29Uba8no9mBtJ+Wc0Wgbl3WeuldOP/xHU6ibA4QAdkI+sNtfM9iG3yO2KpO
	 rLexf67fC8h5ApDEiax8Jt4kqchMBrYBLr5oEctti5GRy8moQ4imLxQk2t4SUBPcTb
	 BPdonLMvwJc4CwVu7ec/dB0VXLyvCiTfEdxSOfYaJ+JhZVdw1Ppe74JA8TqyBy7ueF
	 /h0RPOG3Nxjw7DQa7nE20XET9dNG5tFT00mBUclJ5OrJOO92xh3ClghKajmrKwE+bV
	 dkEmERGmd4F3PrYaK8ahMyDeaIcb/yHgdZ45jYdDrd7J8ZNJ2VD4gnSuPSeBLj6neB
	 rIxEgoTL3aoMQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XxSKD2Jjkz4xcr;
	Mon, 25 Nov 2024 12:09:20 +1100 (AEDT)
Date: Mon, 25 Nov 2024 12:09:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0?=
 =?UTF-8?B?csO2bQ==?= <thomas.hellstrom@linux.intel.com>, DRM XE List
 <intel-xe@lists.freedesktop.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Matt Atwood <matthew.s.atwood@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with Linus' tree
Message-ID: <20241125120921.1bbc1930@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TRQk6h/duJpsAjl_b/MgMX=";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TRQk6h/duJpsAjl_b/MgMX=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  include/drm/intel/xe_pciids.h

between commit:

  493454445c95 ("drm/xe: switch to common PCI ID macros")

from Linus' tree and commit:

  ae78ec0a52c4 ("drm/xe/ptl: Add another PTL PCI ID")

from the drm-xe tree.

I fixed it up (I deleted the file and added the following merge fix patch)
and can carry the fix as necessary. This is now fixed as far as linux-next
is concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 25 Nov 2024 12:05:38 +1100
Subject: [PATCH] fix up for "drm/xe/ptl: Add another PTL PCI ID"

interacting with "drm/xe: switch to common PCI ID macros" from Linus'
tree.
---
 include/drm/intel/pciids.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
index 32480b5563db..7883384acd5e 100644
--- a/include/drm/intel/pciids.h
+++ b/include/drm/intel/pciids.h
@@ -829,6 +829,7 @@
 	MACRO__(0xB092, ## __VA_ARGS__), \
 	MACRO__(0xB0A0, ## __VA_ARGS__), \
 	MACRO__(0xB0A1, ## __VA_ARGS__), \
-	MACRO__(0xB0A2, ## __VA_ARGS__)
+	MACRO__(0xB0A2, ## __VA_ARGS__), \
+	MACRO__(0xB0B0, ## __VA_ARGS__)
=20
 #endif /* __PCIIDS_H__ */
--=20
2.45.2

--=20
Cheers,
Stephen Rothwell

--Sig_/TRQk6h/duJpsAjl_b/MgMX=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdDzkEACgkQAVBC80lX
0GzECgf/YC2AiNdRic9ux2wvMJJ0CemZuFLuK4Jj/J+4zj0Ps/EzgjHiLrA2HqQ7
kW+qK7baw9lusW2LXKKYi/nx4W+83umMJrwlnwYNdTAxAIsawoYO9UCYy/7Sd5mi
I0Hi0U6g6FUss6vfItrjocpQIiBjoKifkNNHvVZhXSDfIz5nneQ8Ykq6FrcZ1Mlz
JDe5GvT07Mcb8MNXqnwpUDV4rIVf/7btkkXJk+j3yo8ad9as8KHNalNA2ezp+EiP
pYm3SYJ3i8k9lNmIKy7CEhFzk2eLw7UUTkAK3d+V9xqi/yT7+Ei1lKfB39ZBtcsS
doxGBTR2wAzC3GqBZl5hy//xiDTHNQ==
=vlyl
-----END PGP SIGNATURE-----

--Sig_/TRQk6h/duJpsAjl_b/MgMX=--

