Return-Path: <linux-next+bounces-5251-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FC7A163FC
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2025 22:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3A643163949
	for <lists+linux-next@lfdr.de>; Sun, 19 Jan 2025 21:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E39881DF73E;
	Sun, 19 Jan 2025 21:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="EKosxeul"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D346B1885A1;
	Sun, 19 Jan 2025 21:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737321182; cv=none; b=kDKuDaGZuRszEPDhi0omHIKIubCvULtw37DIZCYmgmoeqnI5qVcW3MYW3X1dpas+Ew2Cvxn+kjFal7Gc7XjETV2siXGc0BtWgEtpiHv9f7rT3+ENL5Qe6sV2yH1eIqF27dltqCvAOZGm/aaJsf8NvouwWD0ZzuOWO4EQ1VwLVTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737321182; c=relaxed/simple;
	bh=/FYz3MHNevsyAxZtb8bERAJkXtcnBUpU2e5vywC0x90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E/yW3NgJm9ILNXKKha+32pBONWYSJUvjnnyFYGskjhGjljte15MNcAy2eFSxs3QJKPC8Td2vM2H/l7yqooV3uA23ifK1ofSR8BzJKodqVCI3k1ILiZhfuqFiTUrfwwp8GG8O3gW6LeTT0SYJBg43FF0RPrIM22murPAgjg31888=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=EKosxeul; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1737321171;
	bh=74XOjcXNy5sDUoKENLxzR5wp27GGY/vWVkIo+Pu1iPo=;
	h=Date:From:To:Cc:Subject:From;
	b=EKosxeul7NFcxWrQSBtypb13ig26Z7OamWmBHl1LHYaA5WcsXEaadO/Twsk0dFdRF
	 Sv1EJoWi17XdUEmrv5/uDFgMqsi6S0hUulqMl2esRICCEPdl60EIkGkC3747ZrI8sq
	 uUpfW17qdiyGCsC+1Ko9qimmIvTYSdRF5Bu9q1e/EAycgTbfeBbWYr0j6We4haLenU
	 oTjLdDn8iZ/z7lW5wiSDBGFZ8iBzT4CyFA/Osc8soiAq33SPP4sgqFJyiKi6zTMkIJ
	 xDwKq10eyOgdYIwAI+m5OR5L5C0cDTfEt9PPK7aNOoIRzbDOhpSkN+fY7hrDRUPasC
	 yU40oJinSpZxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YbmQT36mHz4x89;
	Mon, 20 Jan 2025 08:12:49 +1100 (AEDT)
Date: Mon, 20 Jan 2025 08:12:56 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Helge Deller <deller@gmx.de>
Cc: Soci/Singular <soci@singularcrew.hu>, Zsolt Kajtar <soci@c64.rulez.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the fbdev tree
Message-ID: <20250120081256.2b7a018a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/yeFkw9koun60sn0FmQcvjMI";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/yeFkw9koun60sn0FmQcvjMI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  d57e1961cb58 ("fbdev: vga16fb: fix orig_video_isVGA confusion")

is missing a Signed-off-by from its author.

--=20
Cheers,
Stephen Rothwell

--Sig_/yeFkw9koun60sn0FmQcvjMI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmeNatgACgkQAVBC80lX
0GzMKgf8DUp4yW/PI4a6Jx4ZrTh+W4DUIiSGSLO/b8c8Z69+2pnohqfSmtgOdN5r
C0gD7hkaWt+OyMW6s8jGq6e/YqrGKAbPIQzkQ2OiGU0MIUkvsf4VXD3Q556EJ5kX
79YSC6iw7spNX3Uz5cmNqGYkfp5iWsyCKS8W7u2PrRKRQyBrcZX/xJ6/QvWNkWR7
UATL+5uXZHBgLuw0nvlEP+G8eSgf71lnD8LvpmWmjLCbmIs7mMQpao6iA9Ke3RhD
4ozwDH2yitQcxqz+wKEksts543KMz+mxRKWpCqVewQrwgt5PBslwP68eKUFAdx28
etqZQRYed8QXvW7PoHAkHVa1/nStkA==
=NOS6
-----END PGP SIGNATURE-----

--Sig_/yeFkw9koun60sn0FmQcvjMI--

