Return-Path: <linux-next+bounces-3569-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5C696AAE8
	for <lists+linux-next@lfdr.de>; Wed,  4 Sep 2024 00:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 95E5C1F24B21
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2024 22:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811AD13B586;
	Tue,  3 Sep 2024 22:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="PXqu6s/Q"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAC620E3;
	Tue,  3 Sep 2024 22:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725400929; cv=none; b=JFPgPd/lhkZf3ZJuKoKcvktGYsp2RQw048dVWj+RedDpvD7Jn8JzlTUbVOJd+7rP5O2EppNIQhw63pK/nk400+x4rbhYBVBLLU400vwVGCt9VQdZUhgL2E0X29xWG9i+mGTMwRDpnKTjEkjaS1dpVVeVC+yROeprDGjiKjulUcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725400929; c=relaxed/simple;
	bh=EfifHid4kClQJhQWPQom1+8HJZDuZTUfeLBrCVzIM9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZEM9wDLNpRD9GevYhO4F4zhUhqmtm6oEY/OUGwy2ixr2+YGwfSL4cfshssuzS2xryGXoEwXCTKZ9POIsIZASjZ2nfhc7u8zVYbVbhXfELTz4dKYQl3jEpu8elPmOVCF5fSk8b0MMBhKoraKpx1ZQ96BBZONqqh7xcKRnzQeS+/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=PXqu6s/Q; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1725400923;
	bh=6IN/pXc9Cu3yMoiJEdxAM9wlCtoBiMTyLoBt4ITq+ew=;
	h=Date:From:To:Cc:Subject:From;
	b=PXqu6s/Q//Cc5OKfP55yAjtxmXmUr9UIEdqtWi/OrsFURhgkzBD0+Y9j1YIHlhEff
	 duezOzmWJzv+uboOZHSRSqGm4LVn7XL/uhe+0/8uL5ZTsSYtmSwimGbTfAdabi0KHh
	 qHcK6AxHXKEbhHYqgiiKga1Fn3DqeIa7x2429bqn9zKwHWQukdqaiU+JSRsCH/qnGo
	 pqwj9+lavWo1bZH3PqbgzbN0MzO9I7tHK17yVsKWFMaL6XlSvII9Tp/EXB01+iyKvR
	 EYObo1RG8GWiqD3XUcOSU98FcsFodX66RNKHMQ/m4sIRMYb6cUE4T6lnF1l8xyg9xi
	 e6ceD15JREjBQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wz02y5SnMz4wbr;
	Wed,  4 Sep 2024 08:02:01 +1000 (AEST)
Date: Wed, 4 Sep 2024 08:02:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Borislav Petkov
 <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the edac tree
Message-ID: <20240904080201.407ada9b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZsM=slIfyodQ.YrIgWRIPfh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZsM=slIfyodQ.YrIgWRIPfh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  b4765ca18f95 ("EDAC/sb_edac: Fix the compile warning of large frame size")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/ZsM=slIfyodQ.YrIgWRIPfh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbXh1kACgkQAVBC80lX
0Gw50wgAgCunn58xzZ5JAhwHl3PkGnz0mjIyTjQ14vpfizH4JJnPmHWSuNlcMEUM
RlF3JrNggaXVKX+mDa/KMaoTaprnpk4Ol6RWY6Pq2fE2N+CVNopC8b5QWS744gUR
UUAngVqAd/2ym7CJHNFS1r/yKS4DR+CBdj35UgN3fnsEcr0oj+1zsvB+hwKWWwlg
WrIOCxezl6f2WbX2ggR1dl/X2CaZAHIwyFz/p6r8+FQjhV0+LGyBdrQsOlQGcN4A
y6Z0xGSmJYk3rzeiXo8LsSTYfZdkKfaLBs/KkUCZ4UJAoW652CIxMnZDtC3FnvTr
QhZsI1fro+3e8zlzUqMC626JDh52lg==
=EuW3
-----END PGP SIGNATURE-----

--Sig_/ZsM=slIfyodQ.YrIgWRIPfh--

