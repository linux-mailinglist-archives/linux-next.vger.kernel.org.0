Return-Path: <linux-next+bounces-5375-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4534FA29E15
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 01:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D106F166D78
	for <lists+linux-next@lfdr.de>; Thu,  6 Feb 2025 00:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8BF38DE0;
	Thu,  6 Feb 2025 00:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kI7AcahW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD77B33CFC;
	Thu,  6 Feb 2025 00:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738803249; cv=none; b=orht5+dUhs/nJHMcI1VEXUgX8hPBcaVQvWR9iPrX+JHRvKUIugqNYBk7tBBsDMMKR7Xye6HnG+zmqm0YQ8spuQsNzGD3axWgpPUpJFW/HVIZakD9o6lYuKaTev9bgqyJMclwoMXA3fpgukgugBeSLdUTaKQzWSkN42sd6zpq7iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738803249; c=relaxed/simple;
	bh=KS1O7VJl/smOPBCTS+CRZ/awRjtHZ8EU6EYIlUt6Zyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FrzK8LmwZXj522SK0xWus3C2k5zQmTEgcGCzieRddhPPZxDpWymjfSHSQLGhF3e8PLphopW0//TWSn/RmfnsI4OjTFdwzMCzO3ViiB7c18ZlglfUFA+X62Sh9TO7L5CQlxS3hpqAyc/DtMssVXf+gT9VJa752MDycPf3CZrBMrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kI7AcahW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1738803234;
	bh=REPhhY9Fv9wIK1kwt25xl0XEh1XhrGRhkKP7fCV53+Y=;
	h=Date:From:To:Cc:Subject:From;
	b=kI7AcahWIeb1RLJiP5j1zYFKDzMFe+YNVFkBNmCziDzqEqWXBy7351qfwZ1DOZSBq
	 eEzzbM9SvZf1JdIs9KEHz8nuD8hLeWrbherc4Z5DLJKNwekNHATgAtHadZY6gx7iTp
	 yK5UAFFq0XGFWaWERLCysbMtQOEy2ALjiVH1c8rp6joofxKehp9gBLWX+/8MjsNEkH
	 mnr1gQxOGblo1QFXb8uWj7rF0dPnK9V8j1ifQmir1LNOuPs9jW3rg7gml/vQlC1rlN
	 hdpD82I8B1QUGOUuwY5dHjM/bcqqb66DHv8+1lex+Mmo/O2Oa89RusBD1xq73lmI2H
	 rxmYBDhlLqIqQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YpJWk1nLtz4wnp;
	Thu,  6 Feb 2025 11:53:54 +1100 (AEDT)
Date: Thu, 6 Feb 2025 11:54:03 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the cpufreq-arm tree
Message-ID: <20250206115403.67140b26@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Cq94Kt63_TGeFxsElfhTfhZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Cq94Kt63_TGeFxsElfhTfhZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the pm tree as a different commit (but
the same patch):

  9d51d2710061 ("cpufreq: airoha: modify CONFIG_OF dependency")

This is commit

  90508a1bb8f0 ("cpufreq: airoha: modify CONFIG_OF dependency")

in the pm tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Cq94Kt63_TGeFxsElfhTfhZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmekCCsACgkQAVBC80lX
0GyDnQf/WkjTev0bgky041wijTPr8OiWfDGk2KMGqix3hRH1aFW0FbWjMkBBcuX6
AR6x22o4SgJzIrW2DzKBsjcTut/ClJdoQ3LiKq4XYYZZtFK4pgJPnvegbNrX7CFi
J9sdUmFrnqAgoVOovDq4osTVf7SrkqfMFCW32qS4KujMEvN41dvy/GFoFRPDWcLF
SjR8gg5ZmLFTnoSgWkbIFHwrG5PtdouPIE6w852B+p9ttJ2Zm4nFdgKaWYeNXuSe
fnXotaPEyggyigyRkcmmVshzAT6g+kZUyHVQicePis0tIaFbv2lSXUHEtsqDSbl0
QNZ+ePIsl0o/eF0rrcvr2unUgQ5mBQ==
=QtNx
-----END PGP SIGNATURE-----

--Sig_/Cq94Kt63_TGeFxsElfhTfhZ--

