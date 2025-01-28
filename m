Return-Path: <linux-next+bounces-5336-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FCAA202BF
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2025 01:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C933D1887A12
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2025 00:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C97A3D561;
	Tue, 28 Jan 2025 00:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="dOzkT64u"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5CC3A1CD;
	Tue, 28 Jan 2025 00:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738025519; cv=none; b=t45vcszdVtY+WRp+HogLFL0bYpPLGXNDWs3Dd1DtnAqVbRhpXBaKOOW/ioqZsdSHTT1cP5ty2gA9SJBgRwoG5NtxuxCfHm540gBpHJT/rMfHIlkbA+NAL9ySTkplHMUIc3H29pAEH7bkUeBURY1oQz0qY7VRox9L2MexJhC9Co8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738025519; c=relaxed/simple;
	bh=fUePO4A0Xp61BBLfVTL9nR/eyhDkuy6TVcJaIeQuV9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HzOJ93ofeyobB7mgeBLnuyUdHjQbG8CK0qqsPshWpafSwIzluYS/zJ2f4SmaAfLUw73iLjospwpN6UTemag3YsBEiKtxqaJxjdtjLDx75TRTc/Dvw6XrucjZQb+Zs5pDZ1Z/ch326XlglsFpvxiVkRZe6zqS8PV2n8PHiajvTL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=dOzkT64u; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738025505;
	bh=1kS9ODH3P7/ZOFrEAcJdv9iT97e19wiq3PPPaD1DzPI=;
	h=Date:From:To:Cc:Subject:From;
	b=dOzkT64u1cPy7bLHLJxOw5WujABhnHOGyfqTEjOW9YPMsQRrhCEW2JjTHlesurtyv
	 iToBMdz/+REwUy4Tvx7NTB6+BbYbzuF7TFl1V7x3310UxX5Z7e6iRLpJmPig+9qqxj
	 GId+00WPn4B692tuSgDqbewGJL3TSkCmVsT1mK4ju7fZ5G1J/Mae9jnRqEubex9qlW
	 RrxMvvSef7B/1NFRGWCdk8lBjld7UfwRgjzaW3OwQqxtQyM3B2QZE/vo3D+TvGVilE
	 aBdlJdF5u+BWCjppt2oFM2qkoeWAL+29DcEXahLDlioimBML+4j9Vw1iSDl49lu/vw
	 s1bzlb3CKqNjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YhmvP3Z8Sz4wc4;
	Tue, 28 Jan 2025 11:51:45 +1100 (AEDT)
Date: Tue, 28 Jan 2025 11:51:53 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the cpufreq-arm tree
Message-ID: <20250128115153.4dff400b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u/Nu=uokbZe1.XHWp=wU_UJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/u/Nu=uokbZe1.XHWp=wU_UJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the pm tree as a different commit (but
the same patch):

  236b227e929e ("cpufreq: s3c64xx: Fix compilation warning")

This is commit

  43855ac61483 ("cpufreq: s3c64xx: Fix compilation warning")

in the pm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/u/Nu=uokbZe1.XHWp=wU_UJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeYKikACgkQAVBC80lX
0GyS/ggAksk6M86EQm8eDLT1T//+LOrLD/gCkeqN5H1LAmPyXOnjbRckmlfHwFFW
5S40wBRclrgjhgAhXXgIajju7bAzQlyCwDyGEAhelnxydSWvY5ypUICt53c2Brk2
7MUOtzxlbACYRB8XiZEgGmElOmHq3qASqksCUxMMkKoLVoG8GiJ98JWpuNBeewil
WDRQpE90GMuCpOzLKm9gZPQV2yM4XVK3t+gHLOtMP4sUwUWp8/ABsh9sm2Iki1ea
vqilMbxfc5/DLmREbMFXiFkRbqjQ5Yt8qmhe3qXK3kWalLldSlsESJISs24kPi1x
tGl6+pzIgzt9WE+yH7aF9TcpZF8IJA==
=Eyxh
-----END PGP SIGNATURE-----

--Sig_/u/Nu=uokbZe1.XHWp=wU_UJ--

