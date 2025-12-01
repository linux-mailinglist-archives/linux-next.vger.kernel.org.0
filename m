Return-Path: <linux-next+bounces-9290-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8DAC99821
	for <lists+linux-next@lfdr.de>; Tue, 02 Dec 2025 00:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD8F43A5FB1
	for <lists+linux-next@lfdr.de>; Mon,  1 Dec 2025 23:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01ED0275112;
	Mon,  1 Dec 2025 23:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="h+fQ4NMB"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A312877CD;
	Mon,  1 Dec 2025 23:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764630114; cv=none; b=IjCLohaIWjm4N9gb4uWelZamlm42JKgXHTbd8cLsU/rDdlMrvjUh7fxbyuY0MNvMPbFvVJOASiJoIh2JPM4zeJhoS1fJ2ZbLKo5wDAN1VpGV+wWJV8gT3sDqxmJe6PXC/dDUzC6CJI+NYNJJrlGkCTegakFsV09PBr07DzbCWho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764630114; c=relaxed/simple;
	bh=fvdFQqGMPMN661GTbSkgGpxlkwOEGcFQAQItZj5l4i8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FmjVuL3Rm6eX0TdHKILQsAaEpO/mz9CR9khk2O6o+TN4otgXNTISKF9GqHzAoVXNBkJzl2nAg9Z7O2ukgdOfEyHum47NEz/YrePUoLg9o7B9NbE2NY7Ruo5s/37zAFEUnFV/WyUMSHP45LOf2eoy52mjnjG4ga7Ec1HJKBC7oSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=h+fQ4NMB; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764630107;
	bh=LgPTPNq1WOVEW5KMFEgmp3G/p/52ZNdeWB7hq9rfeQM=;
	h=Date:From:To:Cc:Subject:From;
	b=h+fQ4NMBT6aToNfN1kbTqNfr1uarx7AKh4LVwcMi+EMzfnKgWYN9qVHNZ+E6BD0BN
	 kDvixR0H7/lQr48yWgwZaoW/Z8iqizyWab2f4Np86eRbig/yuZGlbRqtIVoR/TUc/O
	 Czspmy9FExyG3mK7mkmFZC5HBamg/R786dtzl27tthVMQvYPrF7V9GYGSFGN4UHZte
	 A9ZhqNtap7wlDk6iZYDua+M/sFENZ72hRTKZ5q2WNMD7fs9l+jTQ0FlKnj4RbUtIIk
	 5ovDJYpZqokeHjqiGVUltUGdYxo2OUWJsCRnq0mwTRuVhmUgLx652/epclLrYNdvHw
	 i2+kWEtl/N0Xw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dKztL1g9Jz4w23;
	Tue, 02 Dec 2025 10:01:46 +1100 (AEDT)
Date: Tue, 2 Dec 2025 10:01:44 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Richard Weinberger <richard@nod.at>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the uml tree
Message-ID: <20251202100144.41716106@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/KuHQ6i0mCFGa1Ea3ta+Mg5g";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/KuHQ6i0mCFGa1Ea3ta+Mg5g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the mm-hotifxes tree as a different commit
(but the same patch):

  a3209bb94b36 ("um: Disable KASAN_INLINE when STATIC_LINK is selected")

This is commit

  1e88293a9dc1 ("um: disable KASAN_INLINE when STATIC_LINK is selected")

in the mm-hotfixes-unstable branch of the mm-hotfixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/KuHQ6i0mCFGa1Ea3ta+Mg5g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkuHlgACgkQAVBC80lX
0Gz/Dwf/Ygg88tDijSc5jqSO03ZvLZw67zPixToIamHiipyMLfnd95k0YiqUhtfC
JCF3QVhn7ULNVch6w1jQ6smV49+CWcWUT7rqxKVamIIwOlp9KIuTmzk3RyhIG/7r
VVs0rtTDW/ucx/LaLodDLoh4pYlR24ptEEJ5oQ1aIwPTkjSHBLskqPRF5RFD4iNf
gVmi22gLf3WQjsHCFoFkj97IkX5Mdo2CCvbKnFD8nobyLEruRA2TrVUZrVrtWSCc
Ep0kjLdq9xwrnAnTuGFDohMbATDZJPsCiNGgdOmvknLxVKWGoqi9i8VOLoc6Vg3r
Dv4VZxsNEXLjTMOeNWfmRuZLbZo+wA==
=Rvtp
-----END PGP SIGNATURE-----

--Sig_/KuHQ6i0mCFGa1Ea3ta+Mg5g--

