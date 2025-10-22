Return-Path: <linux-next+bounces-8675-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E24FBF9CF7
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 05:17:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C6F524E7AC1
	for <lists+linux-next@lfdr.de>; Wed, 22 Oct 2025 03:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8309D2264A0;
	Wed, 22 Oct 2025 03:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="fCiRjH/H"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E26319E82A;
	Wed, 22 Oct 2025 03:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761103033; cv=none; b=M2T1cHCv3sBCUpnNyu1gXrvIsugDRVarWWwKsNGLSLDSVkiEoR2n21N1Rp1Kpf7Ca8Ci+oi8Wx+1jn97pz0+3GRMjh8Ou6GuI2DVdFW23kYYSwsq+ftAvFnqfae312UtyLR/c0afBEMnMywKiwXavDNT8q5eyaqrYuOU57HRqZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761103033; c=relaxed/simple;
	bh=nior2QHsSfqjXt7gF5sqo0VrHudLeQr6Vhei1aA4Ohk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jwI8idqvIckHTALojSrvyP0ebE8Nhx1lLlm5rvsswL3amsib3zaCRw9e3FvM1I2hhIh5kgTAhZiQQd5qSXnJYFbmd1PXkyrXnohxkYQmkYGwRcrMTNttMiEdxmR3/1QIbjcwZjh+fo1sGgJIe/KjBpm7TcOaHqDsp6wulRf9jnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=fCiRjH/H; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761103026;
	bh=u+kD9LptVizFe7Bpv5czGKc/bHfylT4QBDtA0fUC0rE=;
	h=Date:From:To:Cc:Subject:From;
	b=fCiRjH/HzAOQHlgL66X2qgV/7oov6vv7IJPBxCSS0LEY9BvHlrbgRNTgVcc+82sqm
	 EdX5oNdWue7wYB/SGZ7uQHRIZxxUZ68nasSN/xMgYvtUpX/4vD43nr3tESJEhFmSrI
	 ox+OUX7m5+ozFG4M3nUj/jxe4vF0kobe+QO6lf5YhCe95IvjoO1H+B6YEDVNBEEj6m
	 Em50+qMb9i9dnommEemYV/K3xYWSDSRugl+2C0yPfnZMj/RVxV6F1wxBPllG/f7qjl
	 8/rfFWEXRWIeXm97AD6U1pyaXkWI0LYI/b0jggoTUxiE3ncuEOSwLidC97lIYzQ/uk
	 q24AzONMUdNDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4crvTt2prCz4wCV;
	Wed, 22 Oct 2025 14:17:06 +1100 (AEDT)
Date: Wed, 22 Oct 2025 14:17:05 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jinmei Wei <weijinmei@linux.spacemit.com>, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the sound-asoc tree
Message-ID: <20251022141705.714b19b5@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bShkLQBYTl6yB_oh_26ckZZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bShkLQBYTl6yB_oh_26ckZZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the sound-asoc tree, today's linux-next build (powercp
allyesconfig) produced this warning:

WARNING: unmet direct dependencies detected for DMA_CMA
  Depends on [n]: HAVE_DMA_CONTIGUOUS [=3Dn] && CMA [=3Dy]
  Selected by [y]:
  - SND_SOC_K1_I2S [=3Dy] && SOUND [=3Dy] && SND [=3Dy] && SND_SOC [=3Dy] &=
& (COMPILE_TEST [=3Dy] || ARCH_SPACEMIT) && HAVE_CLK [=3Dy]

Probably introduced by commit

  fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")

--=20
Cheers,
Stephen Rothwell

--Sig_/bShkLQBYTl6yB_oh_26ckZZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj4TLEACgkQAVBC80lX
0Gxgogf9Ean8AdS8yIU3f//+KXGCC4LMIc/wCKdL54dl+EGdehBdRIn/6H4rh0HW
8vyLi9v2KIHKyAY40543x76anOUsVYwjOnJJDdsWk/La8nsUQ7szcEAnGtU69u0Z
JkbKlJM9kZ3ilS/76EsXc8PQQXKF/BArJ/ZqLjBjkvLated6lWsXsNkL2wUZ/yIp
5FJZJlzH/TPWpoeQR5gLPENETN/5lFWvawdHGuE+/wfK93/BLF5hTyEjQn+yX9x1
IeHuXohiMrKLi5xjOXp+jl/Axeu+qMEQqHVW04fikH2+qFpVYqCyd2Ns8hSEJmFP
lWiDko4BPsk5EKuI0iVLeysi2SAL4g==
=QQaG
-----END PGP SIGNATURE-----

--Sig_/bShkLQBYTl6yB_oh_26ckZZ--

