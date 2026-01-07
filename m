Return-Path: <linux-next+bounces-9585-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCE0CFFE56
	for <lists+linux-next@lfdr.de>; Wed, 07 Jan 2026 21:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F485319FCE8
	for <lists+linux-next@lfdr.de>; Wed,  7 Jan 2026 19:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B39318ED9;
	Wed,  7 Jan 2026 19:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kvaGE+NH"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE72272803;
	Wed,  7 Jan 2026 19:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767815209; cv=none; b=XAHRofbdd/7f71Xvm7fVRJ1YeS/0dBHw+LpE5bZFJuqj5WBaSNKU5fdEyu5vRWgox2giEoHkewhD9yE6UYk5Fb28klqxX7pizOMvaOcLkNV5CtxRcnkLxUc63qVxv0VLKgK+V+/629zdRDpdU3f1yJVLw8TQlSLq7WR/DpoSpek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767815209; c=relaxed/simple;
	bh=IZjDV7BJVGHLEQj3+nSODjdtGUczwZym/zi8B++sa54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AElJaeJS0lkZeZ2mku3SStb6lZFlPCvAhzqqWi5PauMNo9+N+ZKa3kYxDg/fqsqgkp13w05k2MuroNOzEAjaY+V2v3hGnPOj7zMdbEWEdIEKhj/MlUNX8snbEA41a8FqRhMbqLOEZUpggDmz1PrdRXHWzS5Qz+gy2WSiVEP725A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kvaGE+NH; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767815196;
	bh=Dws0CK4NkOdres1vwotOePAz/DT8iaMJZsdzwBJNgdM=;
	h=Date:From:To:Cc:Subject:From;
	b=kvaGE+NHKeJp/l+StKwxVmXE9tt1u1D2bz4nFo+9q61O32o/6db9zzQZ2l33CR2HV
	 7kLez/sYHt1wTvkWNe/qmEW869k0SbtncMnMDpcxq2XS23J3XA2GZycwMC2CukpMst
	 OMWD6jCAb6gxxGp2laucn/9fd3dfkHHM6EyQ2RfIp16+JSfWNh5fx0Zo9PitWlQG8z
	 5OSGsokKGWgcnZfLBu1jj0V3l7KKeOed8Q/j+oy+ScWPcciYWZ3yBbacCGKGr+nSzv
	 DrqqlxqEMGPjjK8wNmiI7tYjdCRW3DCwDmverCAyM8fhYvrwxKRgR2xH8ftAuaN7f3
	 7tQ+O4QM5dyow==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dmdp40Hvjz4wC8;
	Thu, 08 Jan 2026 06:46:36 +1100 (AEDT)
Date: Thu, 8 Jan 2026 06:46:35 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the mediatek tree
Message-ID: <20260108064635.42e96272@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WmcyK5qflZR6Ja_4/+C986.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/WmcyK5qflZR6Ja_4/+C986.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in Linus Torvalds' tree as different
commits (but the same patches):

  34e7595912cf ("arm64: dts: mediatek: Apply mt8395-radxa DT overlay at bui=
ld time")
  d977b61d3803 ("arm64: dts: mediatek: mt7988: add dtbs with applied overla=
ys for bpi-r4 (pro)")
  0516c548883b ("arm64: dts: mediatek: mt7986: add dtbs with applied overla=
ys for bpi-r3")

These are commits

  ce7b1d58609a ("arm64: dts: mediatek: Apply mt8395-radxa DT overlay at bui=
ld time")
  0773bc6ab7ec ("arm64: dts: mediatek: mt7988: add dtbs with applied overla=
ys for bpi-r4 (pro)")
  987697749def ("arm64: dts: mediatek: mt7986: add dtbs with applied overla=
ys for bpi-r3")

In Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/WmcyK5qflZR6Ja_4/+C986.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmleuBsACgkQAVBC80lX
0Gwd6Qf/TqmS5DekKHbr68zCso/szKgjsqaSQiT14MBkeGbNMW4qV75odw1PTML8
ks2tjP9e/dGnXBmvBbGiz2dcw3Uy6el9G5FSXcYB8JDoZyKHQuhiXekRZ8ZU5Dq0
PjadKKjQ5G7wBulQEyfvI+R+WSZgMxS312+nOSOk12L+xYfPikAwvizjtsOct8gy
Vp8GzPuShu7f5exzuzPx3eHpLpz+cOJbWuaA9i1pDiYFRENRn8K9DtkCZUJOf7u+
YwjFHY6W1DWPk3twCa7q+0Bt6Vnr1SHKsz0LdpjJhry8kiqb50pvMODYfryw/mFb
Z2t5k5sTLdmEheQrkxkeoo0QTyYC9g==
=qCbA
-----END PGP SIGNATURE-----

--Sig_/WmcyK5qflZR6Ja_4/+C986.--

