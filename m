Return-Path: <linux-next+bounces-7578-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 809D9B073E8
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 12:48:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F240D189E6B0
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 10:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E32A2C327F;
	Wed, 16 Jul 2025 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="gTskIEN+"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566992BE62B;
	Wed, 16 Jul 2025 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752662901; cv=none; b=uomY6ArG3r8g9eoBMVo5T7xUn+/e9SHa6+em9YsfGM1T7mws7P6Ix+5RufXSzKBrl7pBicyV+i2ikj2/Nw3usVZnNKnuzN/68cVs0om7BBYIhtKM/ejIzyBKcXU0iKq21T7zLYKL2d0yQHd6HGjUVotdkAM9YA/28im9ynjDaZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752662901; c=relaxed/simple;
	bh=AkyIPOSUcL4xI7yVqMtxz7c2SaIdKKpv6vBD/wqQlV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=cZK/wF8VLxKPQe3bjgpV74Ed9F1Kml518T4j633tdKqOX/f8RJTV1PH0+4+p9+FTdvc/XoEMFFKIKpuXt49krhFTifdpnynMUIZqK9GkWb4dEogiXfHGslEbvF8P656GtyJtgzSrjI5NbHfyip1+o38IMEfO56u/WESdZJghDy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=gTskIEN+; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1752662780;
	bh=iU5kEA++ad4tKwqs7nF/glwet5H2VsE6rt10Gmg7rvA=;
	h=Date:From:To:Cc:Subject:From;
	b=gTskIEN+mEdQMQq5FSL213m3i6GEuogXIl0ykWKHJGKePL1h5Zv3NRxJmVIn7drV6
	 5A9nW/Wv+ouNs9BVia9y1oHBeLCHbENeYBtEDAu6PY97y89ppq0I9oXzY26lX2gk+E
	 J1EpOR1dyhWKzPcAPhsHRVuIlUOS/9qyoxSuLXT93qlEe7/eyw2vM2WuGYKMhiwKY0
	 KKwjnQMNQYkC4cNp8X251mg1Uwl7WOVXRYVuuaVeYLIlZO7P0bs6SJ5Ns4YIxz+hup
	 vTXeEgqiUAXGuVVvpGtH4+ElNcjvLNQ5OYXLZh12b05VAVtxWdcVTfeDJPlpYXGfJ6
	 xyBmutzzgYlmg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bht5S0C8Sz4wbn;
	Wed, 16 Jul 2025 20:46:19 +1000 (AEST)
Date: Wed, 16 Jul 2025 20:48:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the clockevents tree
Message-ID: <20250716204815.33e16b6a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rg1Ctvl2mN+_6xrAI.qs_kw";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/rg1Ctvl2mN+_6xrAI.qs_kw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mediatek tree as a different commit
(but the same patch):

  791a2ba9e668 ("dt-bindings: timer: mediatek: add MT6572")

This is commit

  7827b0ff3bb3 ("dt-bindings: timer: mediatek: add MT6572")

in the mediatek tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/rg1Ctvl2mN+_6xrAI.qs_kw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmh3g28ACgkQAVBC80lX
0GxhJwf+NR4eU4mIWHl5185KpiQXuytjdWtdIdB8a7UHemkxh75nwj9XWEv5LBer
gGFEdPbmBpQjgbxPakxxsHx/A0eWDS09DNPgoWiJOGaQrJjXwSCFDfdOMAJFS6m2
ZpfTd9QPzZ3hECi9m+fZIls2wuFMd6v1IXF1ILYLAgabUp07gNnsNOYjRc7OYILo
vATYSbphKy82+WLJPbrkrNasGbjTU/SU2LpDbUFGLi4/IG+zWg6x47eWP+EuyUQ8
4WYeZHCfG/IQ2vPXTB3+wNjkYotpG26WRQvgMY7PxNojQ1Qy97dlVCaRcbN6NxWl
d/zoLJEhUKLSG8x0KOPQTH0cytjiJg==
=XUe6
-----END PGP SIGNATURE-----

--Sig_/rg1Ctvl2mN+_6xrAI.qs_kw--

