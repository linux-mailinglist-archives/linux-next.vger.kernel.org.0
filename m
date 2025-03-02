Return-Path: <linux-next+bounces-5619-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB12DA4AF3C
	for <lists+linux-next@lfdr.de>; Sun,  2 Mar 2025 05:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4C617A5E0E
	for <lists+linux-next@lfdr.de>; Sun,  2 Mar 2025 04:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87D8470803;
	Sun,  2 Mar 2025 04:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="jZf32p+E"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0335217991;
	Sun,  2 Mar 2025 04:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740888872; cv=none; b=dcr3Wj3IGkrFsSEIDuwvaRpg5lJTYsaiRg7mWDs/HBEKM0T6t+8xbiAtepnHyDFkmhsqahpubYunf23WmCVBSU/GRRr7LEhRuCoyHn0dwHbOYBDZjlWkoj31YVag0Xx+EFgyV3GuVNXAZAPWwQZ4ABPxXzwZPTnnY0Pg5stWHZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740888872; c=relaxed/simple;
	bh=IY0NMxMu6YhCOW5uWm27vRReUNUwGpsbX5NibNGTG2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RiMU+Nys90UtinnuJzvlCvXLAnp+nY8a4X0wYklFWMeCPrWdgup+/YKgzIttdi18W19G2TEWfLXCdDBI12MgGAhkVPXLyX9iKQ9TnJvPxW3/v8dEaIr2MXLGDXZ1A0WQn/HwSUMO7kSpuSeKNV4NnUai1Sd4lhRKlv7ond/X+sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=jZf32p+E; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1740888857;
	bh=khOim0MhfOubFEYq1bRGLS5ShR4p1FnIMV0xLDNWy6I=;
	h=Date:From:To:Cc:Subject:From;
	b=jZf32p+EzQlRs8Cr45ba8i8aApRktxox6ZNCuUXUOH7vTrJFIX6pda4pbddW3qa7n
	 1jfjb8vVDKYQ/lmzGF39R8X+ndZGMU2nFkwX5BRDdzccl+75u5UBpz2apHa9PLSc+P
	 zvPvMF0zYoGtyaBB9jKGz/WL3CjljriP2LFD3zVnNHcLmCq71KgOeTLhg1NgouNE9k
	 SjD1flhfQ9lO6UL2m04ZQZJG2eoXkjHhiG6+OyKeGQLgf1+ACV7sbtbRJZFINnm+go
	 doIZXrj9qwOluLmQLaOrJefQWsyaMEpu5mPidf2KCruMVEVAWyDsUMShm9L1cHnwGY
	 BBwIGwY/LadYQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z57qs5yj6z4wd0;
	Sun,  2 Mar 2025 15:14:17 +1100 (AEDT)
Date: Sun, 2 Mar 2025 15:14:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the loongarch tree
Message-ID: <20250302151403.44bf219a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ead3PC/4MZxi/TltVf=uWzA";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ead3PC/4MZxi/TltVf=uWzA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  6251d8bdca63 ("LoongArch: KVM: Implement arch-specific functions for gues=
t perf")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/ead3PC/4MZxi/TltVf=uWzA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfD2wsACgkQAVBC80lX
0Gzopwf9GlNm5UCfnysxrJo/rJ/dUv9A57lIw6CKxtZKahyjMhFI9FFUTIhQIzxr
ISDhLdTtmD9ygvuwkimRJa+Ljwc43+tBEc0G0T8kyZ6e3eXKzPC/9Zsp132d3t6l
LpL9fSV3kZOLjycwcBpsdqjoGPuL4BMIil7KgoAxRLUuIeUdCgxUFNfyXIK2SAN/
k5iIz4KvEakna2Dj1MJuVwQkpWsA/65W1oJlMXqVkGFIE4c6YRrcOd/ThOQGjpGL
eJ/9r9UMEQxHeiCDYs09ot7tQetEi7lAnnlSAUDxziJznWNVU6nm5wNAJLN0s9y+
chnQhbdbLxEVKIEcc6qtUyCO3qwKsQ==
=hYHT
-----END PGP SIGNATURE-----

--Sig_/ead3PC/4MZxi/TltVf=uWzA--

