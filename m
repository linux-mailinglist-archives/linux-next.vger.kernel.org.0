Return-Path: <linux-next+bounces-9531-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E3CCF1AC7
	for <lists+linux-next@lfdr.de>; Mon, 05 Jan 2026 03:48:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB48930184FA
	for <lists+linux-next@lfdr.de>; Mon,  5 Jan 2026 02:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472292D781B;
	Mon,  5 Jan 2026 02:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="pfvZRVsZ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C12D2D7DD3;
	Mon,  5 Jan 2026 02:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767580916; cv=none; b=MD5xElFhx+o0wU76hiijGtpbS4abAJHwh0BtxgP+QUrUQWfawciTPRcrk8kQCLC6OxquvWINMZYDJoHlzGRoFOoRH1rmwlR4iKwEmalv1uJXJEqw+SDnToOS+oJwb/l1tDjvWO3apTME2t7nEy2KmcXfEkQ3vNEZCL+IOg7go4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767580916; c=relaxed/simple;
	bh=AYW2b0Zy3+wslJPEloHOZfVYtzp28LEz8ZW2+4ScAEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aZswZL/iK/2vuG870n6kJ2eg/q3xIys+IrOIZPBPN7huVIYkSQhjj18jfeRdG27QAzfKB+VJd66KFS7AvUGodBtSFfsSa7l2Q8VNWVpcu+apJ1p9mmvjfT/OG+n85HJaK5zxxE69URWp9Jr0iDWsT9rrZM2ot8IO0NpogfVtPJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=pfvZRVsZ; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1767580912;
	bh=lXp7ZXtf/cXQUJdzjXc4EQ8W2tw8kFEMooBYCm2n2l0=;
	h=Date:From:To:Cc:Subject:From;
	b=pfvZRVsZfsXxps+0LSAusQiJtoAsG7a+XydqE1Hv14kQkKWXpsqNABo4W3MGC3Lus
	 YPByqHYEF01BgM70SxwGbXhzioCZJ3LfE32ze/seynjLEnK18M81XHeJhY2+2UvTHh
	 VBkR2gtm2d7C9u2hjLxsXD1IhThKOz7dEPRxr5TJgsQczrNU1KJOZdf4SB08If5rjd
	 Ol/woiQMGEuSmBokfgbnjBW52KQl7mVSsgVg0duJlVCCD01KS9o6M10kXsGQu8xaRv
	 wUipr1dvxTp9asbNJ3kKjJMkCMDTJ2yTHoEpwe8Y9nQnpOkEYZRbG1WVqOtd0PUmPQ
	 oKcJWd7KBETsw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dkz8c1mlbz4w11;
	Mon, 05 Jan 2026 13:41:52 +1100 (AEDT)
Date: Mon, 5 Jan 2026 13:41:51 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the tip tree with the renesas tree
Message-ID: <20260105134151.1302f303@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/mcPq3TtDaxRZl_VIHRj_Mul";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/mcPq3TtDaxRZl_VIHRj_Mul
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/arm64/boot/dts/renesas/r9a09g087.dtsi

between commit:

  666e5eabd623 ("arm64: dts: renesas: r9a09g087: Add ICU support")

from the renesas tree and commit:

  97232dc43e83 ("arm64: dts: renesas: r9a09g087: Add ICU support")

from the tip tree.

I fixed it up (I arbitrarily used the former version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/mcPq3TtDaxRZl_VIHRj_Mul
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmlbJO8ACgkQAVBC80lX
0GwHrgf/VUvCg/3De0QwxGDbx3zd35ba/3zZjooZS9+Oeuj4IoEXK851K2DmNRLo
887dAatIQcVE8xnhYt2DEMTurAv343sOaYrphGPLn20EYk1q+M1a8VwcFZBWR1Aw
4gVCC+XG/qR3xX18To+2hGeSmSBbKBj9OvOma3Fzd5kc/Io67sbWdIFS+wRVffCR
DlIMLwQ1JDnnElbTvhHd8xI1IoRrux4idXJn3sxixl+hzp0aKF/vNLMG+iU4u0KP
CNa4ASVVh4/JERVj99AxKyKYPeBzc+6sGESvbHsLtk4b2gxvXrQblGHNgUD52t+f
IE9KRDwRQnlaRQyb4tK7QsFomxfz9g==
=ajIO
-----END PGP SIGNATURE-----

--Sig_/mcPq3TtDaxRZl_VIHRj_Mul--

