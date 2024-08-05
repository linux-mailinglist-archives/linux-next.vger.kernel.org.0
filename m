Return-Path: <linux-next+bounces-3225-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8764C94733C
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 03:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 344451F21433
	for <lists+linux-next@lfdr.de>; Mon,  5 Aug 2024 01:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38E9E3BBCB;
	Mon,  5 Aug 2024 01:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="GHVjes+c"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C2220B0F;
	Mon,  5 Aug 2024 01:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722823113; cv=none; b=PYOhZNTskQV/+OXqBAdNWFfIXU2SgKm/iTqEpMYCOwOLC5S+9xUoiZeR4eG3RbMrSj9Pdatz22Ymrc5b7NqZU0SIlKdamLnLFwu50fEaFuFozYK0xCPQIBbAcp3gMjkG7X/RP591EEml4wuK8IaH43fmGssuoD9q+08te311YGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722823113; c=relaxed/simple;
	bh=1d5czxmfJcJMHxsZfqnkokWa7a1ENj6r5wILMkAQ218=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=onW0ztAFTd2UrKjYO2KU+KxexGi/h9ckYsmh5prygFrJdIP1dRksFxyGQmCoucHuFIffpg1zIJWPjoq7FXD2Kkg/dG3RhpFZiGoFg8p94GDPd0CQkDmvLiLJP+xPSFxVNr+cJxlN7W2pkW4GNG1rrygXo/EPoHIJeMOFdtYMzlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=GHVjes+c; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722823105;
	bh=XVc/WnEVk23tlrO45DVVKSJRhYtpa7tAYGsRAtDnkHE=;
	h=Date:From:To:Cc:Subject:From;
	b=GHVjes+cVGqG+hd+bQMzq4AxPoU1fw6+sBLonOJZ6jNNycKqTVf8T5upu/IXyUXeJ
	 Xd6zDQHpSHFsdyphuoSsKCBuoCdDqsepYa+qSSRwozyAXlTWNOqKl6V/LwS4XbomYZ
	 3wqg9dBcvDQuydSZnfJ1z31XClj2VJ2Q3+5rBkkzd01o2PfbRY/MWn6s86/iHpRD7+
	 jZvajc8i8UNUnWqBuSOxTiVOrGAX/XeLbVioPr7AClqURsx7QzXSTXYh1/9Q9geVGV
	 EwPqcBYO9N9GAToI3XJHkKQMmnbMHMzbWGuKAKWhEqVGNLWdAhcrLTEvWY9Nita6bm
	 styZMVNLfubjw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WcfjX75MRz4wbR;
	Mon,  5 Aug 2024 11:58:24 +1000 (AEST)
Date: Mon, 5 Aug 2024 11:58:22 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the pm tree
Message-ID: <20240805115822.037798df@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/UfL.NUMOVX1E_hITqf9dm66";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/UfL.NUMOVX1E_hITqf9dm66
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm tree as a different commit (but
the same patch):

  0f127178892e ("cpufreq: powerpc: add missing MODULE_DESCRIPTION() macros")

This is commit

  93bc6ba3e8c7 ("cpufreq: powerpc: add missing MODULE_DESCRIPTION() macros")

from the mm-nonmm-unstable branch of the mm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/UfL.NUMOVX1E_hITqf9dm66
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmawMb4ACgkQAVBC80lX
0Gyi2Qf7BOhHYzh7bYRWKm3roo9xBOQe5SIF092PvvwJYfS6hb73acOg7hcUA/48
W08+cib62M5aZ/x6KBe+S3d+CJ0LSX99Y4ClMvfrpylLWWRbDzf0xIell4O73YKr
iYOKZZLSRaqJeGB0MVV1w9nncsZfiUPUJ5DPs+eQ2XAVVv/ucr/X4fIUu4Arx43A
X9ZQ0ZtC2ZpsBRTdirFRdqFTkTtDeuurYrUJYBy296OJzbifn60KeRhr84NwUUUz
GqsUJpu+YuuWP7tJV2V348Dar3CeQ1jfdStb3sBgkjz2ArvbT4Xf00/KJhFg8r0e
j/LMjb4lboSR9ZsnSW0XLQt3m4OG2w==
=IMgN
-----END PGP SIGNATURE-----

--Sig_/UfL.NUMOVX1E_hITqf9dm66--

