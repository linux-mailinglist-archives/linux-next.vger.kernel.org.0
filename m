Return-Path: <linux-next+bounces-4290-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED3899FF0F
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 04:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A162F1C24322
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 02:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DDB165EE8;
	Wed, 16 Oct 2024 02:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="RME48r5l"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825AA1534E6;
	Wed, 16 Oct 2024 02:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729047595; cv=none; b=PHPy7idnp2Nq/FBROyDZIFkQtNFDzEzTxm7Ssbtran5pygsSJcToPhpzRXg+wjZUsoUt4lik+Rn6k42ICKmdGjkR353fnGSAalzbdBdttEz2zEa0+k2CHSTsenB13CJ6QYPUaVjmYLVk+nW557LTAMlmguxx6dSRuz8V9DcWmU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729047595; c=relaxed/simple;
	bh=6XA5X0nRimiFX0OIMF/IS4q2aHqb8JQBJwMazjT7zME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wnt/bIzCdT9ip/TRjP97y1JnOG5uX1BvhoCT+vWt8S/8ggE871Uln5Uf365Op/qSJQqY0ynu8TIj4O8WL97vjwb1j+XgwJU+iZ4zWgTaALpd62T+5EM8uPFDRck9OhCrFRi8ceR9Taa599VQtGjDyMfq6jeFlGb/kLic7Qe54dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=RME48r5l; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729047583;
	bh=ztGjjbN9dyOjO9ISl8Tv/p+CzHviENYnDROT8KEXw94=;
	h=Date:From:To:Cc:Subject:From;
	b=RME48r5lAkAQCUTVZ/D33CrEJHfv/ADrO9dt/2wEb+VATAA1MbbUlGKG4v+JrBRBt
	 aTo0beLLIlHUKrGIa9VyLzWrNslFnJvPVAoV+gc9+WesF4dxeMLELhdWAO+sDJMJcN
	 bV1Dsn8KuESd6Y/69uCQTybXg+Zw/oqCaI5srTNqb6vIGmMAAYvobcpMHYPAjLfqRf
	 H29JKamZqTKNJbq2DGGKmywJcma/8dd/KyHgai8orOiKIMqJmwoO2SWclS0mqLq3Xl
	 ZEftMRrESbY0n5keptpxALTv972Sj0Kw9g9dDykp+/LRJLiPoXpBtVWu8eM1lIY159
	 FvxGz0UXCaoBQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XSwg35p59z4wcr;
	Wed, 16 Oct 2024 13:59:43 +1100 (AEDT)
Date: Wed, 16 Oct 2024 13:59:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Lee Jones <lee@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the regulator tree
Message-ID: <20241016135943.24e1fab0@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/5wC3=moiMv_sdBrNtjlm5jb";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/5wC3=moiMv_sdBrNtjlm5jb
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the mfd tree as different commits
(but the same patches):

  d7a5f27342a8 ("mfd: sec-core: add s2dos05 support")
  ef9690c04f3b ("dt-bindings: mfd: add samsung,s2dos05")

These are commits

  59d9022639ed ("mfd: sec-core: Add support for the Samsung s2dos05")
  1d6e7612a129 ("dt-bindings: mfd: Add support for the samsung,s2dos05")

in the mfd tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/5wC3=moiMv_sdBrNtjlm5jb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcPLB8ACgkQAVBC80lX
0GwVpwf/YS0Kx0kaOuH4ZhNoc6s6scCxCiSNK6gcJpydrYtEGEvPkOZbRhYnI05D
0r5MFLQ4htGX4fvYHTlpS51VMqUznlnZFopUCkbDjtgy8eAo3CrCw49xw/regotL
bC6LT3C0eVr5gn7qyXgN1ptGLbkO2LOcyqotZ+i46v6jF7tJ6kQXluMe0E8klTNZ
joRC22XP+Wq+0RkTk7OdwjkMcIrjuwPa+nTxUJLbRNn0swO1IypomruRWexNEHzs
4RWC4O+irxaIdohQZtaR6rupIMeXT+E3zK0yo8P9tc3DJvlimUYbi+DMji5oz0MU
4+lvQyOGdZzAlYlSWws1F/S88yfFAQ==
=/9+C
-----END PGP SIGNATURE-----

--Sig_/5wC3=moiMv_sdBrNtjlm5jb--

