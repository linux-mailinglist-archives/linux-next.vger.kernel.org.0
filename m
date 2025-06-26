Return-Path: <linux-next+bounces-7256-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3733AE9840
	for <lists+linux-next@lfdr.de>; Thu, 26 Jun 2025 10:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3A204A1553
	for <lists+linux-next@lfdr.de>; Thu, 26 Jun 2025 08:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BBD725A65C;
	Thu, 26 Jun 2025 08:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="YV6l0oRI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40C01FF7DC;
	Thu, 26 Jun 2025 08:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750926410; cv=none; b=Bc+fftYZsyplU6GgAy7uHYqXgzkWTV376Y6I/MjxEc+OVQ0mCSTBDmugcrbwcC0ZfmacK24q6j6tVAvwQtVobwuMcCQqqi0hcmaFa4BWE+GPMGzLSCv668JjhOHi7uuAM8T8j0AEtRjjOYvMbKRsgXliAKWmDvrR3JUL470oXpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750926410; c=relaxed/simple;
	bh=9YirAqnMLiDLkmtiBwL36pK7a4tyq9TH23A4yQwG4v4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nIkqNaRm88qmjxREqGHiUwyc1BWg9DAiFrPIVGEceEY2RKbtrBK1Nplfd0rIy3r4B4El4zYWN+q9M3TbKeYC+DzPikSYlSECVV7Hpq37YQ+1Js4PhGXKJJ9GIslOt1AgZQczQNZbaWYx95jeiEp4/PeIlVsMcxd6liXM9sbE/fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=YV6l0oRI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1750926402;
	bh=XQhlw9hW1V4xH49QUIqIX2PzzH3zHe1L+j1DjnPGyJg=;
	h=Date:From:To:Cc:Subject:From;
	b=YV6l0oRIH97Qvo49QuEVyzeVZhiTQuXc60LxRsdgHCMSFwjTfqGiCZTRL5hxR8YYv
	 NOIBzmCkpkhMr1CrF8hXiKUjiqkocaScbN8AxsQHuzlHC6IOPKflBr6VpyeuCjTKIq
	 76J+FJTP4FZXVNqStXeINxDDP722+57CyVMJmJytKXTK3ebG0sMwqEVq6UL7rok4mi
	 hEEX1MobtI55j1ngh5kL5FNez9oNVgjkxmORXG1DBlE1Jy5F0ezGBPD8kg7n78t6sc
	 6CEQAy64eFtfzlatbInxYG8azVJFTjxnepi+Qd7MdB3l+jxFIILzy0566i5I76kjXl
	 Sx4lauJ4HKn+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4bSWxZ2vGNz4wcm;
	Thu, 26 Jun 2025 18:26:42 +1000 (AEST)
Date: Thu, 26 Jun 2025 18:26:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: "Yury Norov [NVIDIA]" <yury.norov@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the rdma tree
Message-ID: <20250626182641.6020e11e@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TTeCn_zqdUEivs5h4sLopj+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TTeCn_zqdUEivs5h4sLopj+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commits

  185e34e8f249 ("RDMI: hfi1: drop cpumask_empty() call in hfi1/affinity.c")
  7c2c2f3a205b ("RDMA: hfi1: simplify hfi1_get_proc_affinity()")
  9370795029d4 ("RDMA: hfi1: use rounddown in find_hw_thread_mask()")
  9c965445a636 ("RDMA: hfi1: simplify init_real_cpu_mask()")
  f2c2afbba77c ("RDMA: hfi1: simplify find_hw_thread_mask()")
  37b3cba54b40 ("RDMA: hfi1: fix possible divide-by-zero in find_hw_thread_=
mask()")
  c15d5e70db96 ("cpumask: add cpumask_clear_cpus()")

are missing a Signed-off-by from their author.

--=20
Cheers,
Stephen Rothwell

--Sig_/TTeCn_zqdUEivs5h4sLopj+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmhdBEIACgkQAVBC80lX
0GxUeAf9Hc6d/dQfFyzMxow08xLMyxjGRMo4jW05sf7/Q/eZe/+XZ5E1y/Rl0PZy
C/MstmpbSy5wMSlh6zTx464EA6DDejMO/BpEQfLFZWnWLEZDMqbNQh2L8aZy6AhH
QAEYMc0Cc7dZEc9zof12pYz6v7IISXWcaOZm7xuEuVQi4tXB2v5Wcq3A3n8NLxpW
dnxvV/8smwkYTN38nh9PT570Owag3v9Unyj0XjlzqWOm7J8kXtoAqNDxyzTRRLTy
ro6olVHbE2zETlyWa/pj4XP/obpg35xDjTY3wIhxVuTshC4eIOrtOnZwXXQlPxki
IECZ0NPpWoJ29FhojFu3BXwG0fSFCw==
=mLTG
-----END PGP SIGNATURE-----

--Sig_/TTeCn_zqdUEivs5h4sLopj+--

