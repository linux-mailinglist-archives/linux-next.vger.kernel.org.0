Return-Path: <linux-next+bounces-4286-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C55799FD35
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 02:36:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A8DCB244A3
	for <lists+linux-next@lfdr.de>; Wed, 16 Oct 2024 00:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 837101078B;
	Wed, 16 Oct 2024 00:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="KVKQdl3Y"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5AFE574;
	Wed, 16 Oct 2024 00:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729039009; cv=none; b=VJzmFpv6NRapAk5PJrJlnBi2quyYsGOinYFJluOYW7S3zcm36/dG5nsopy4Qe6s221Sd8XilnOIepcRkSplREZ5E5TduvlBWqOGv+Fnus+nM5FwkAQr7xi5eEz+Kq+K9YXMfy76TTEYUswHs8TBCPHbuC/kV2qv7NCFPrI7p/Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729039009; c=relaxed/simple;
	bh=rC10s3/T+CDqxNHSOPwu+kWBbXQSkRJs/3YRTIMFosk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pBTdhedACWHxZwYfYGI+WtDkccS9Dyw37p9lh5/qonR3lZFEVYOarE8mZv6O7S8H81hZA9asbF180uBfVtVQa/GQbu0csVKrHu0wzDYoaob/nT0cQ+q6S3D4pi+VEsEXdDTFUdDlS7UZT09oTb0pd6nuHJk7ug5sWroUlpPh19I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=KVKQdl3Y; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729039001;
	bh=K2u1W1IHvt0NPeIsbPuIOVvJQnQsI8Cc7VlpkitureU=;
	h=Date:From:To:Cc:Subject:From;
	b=KVKQdl3YkrKu1sxqhEI2lmTG0HXkd7AvVQdryqtnPCN0XtmEEWR5bncv9afqMaCbJ
	 7SQlxntXbPHLKfLxJrEeTQZ8+JKcPuBnvH23w5qZTGVVQobWTs/UPF/CDg1unQGrds
	 GxbE3MFpDH1NYaYX2Izf3PE2nFvnA5vBrgMx7El9zheXaJ1sTtwu0Jh9bd2i2lhh8L
	 GXQxnISQnTXKT2NcmshMkY48SzLPs4ok2WqVysGypxwe3nm6rD1LuBlEPIj1YqwonQ
	 BM/LPbgy7DSmOfKBEnFe6gNeDLTsvDiW54LZ0cuZNUMMgv4NFitEL1ln7yQmaulSMl
	 s7S703IQUGuEg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XSsV11DdQz4wcy;
	Wed, 16 Oct 2024 11:36:41 +1100 (AEDT)
Date: Wed, 16 Oct 2024 11:36:41 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the v4l-dvb tree
Message-ID: <20241016113641.646f55fa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/9eT3RhVsSkH2rOwkq_D4bD1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/9eT3RhVsSkH2rOwkq_D4bD1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in the v4l-dvb-fixes tree as a different
commit (but the same patch):

  bfe703ac0c9f ("media: dvb-core: add missing buffer index check")

This is commit

  fa88dc7db176 ("media: dvb-core: add missing buffer index check")

in the dvb-v4l-fixes tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/9eT3RhVsSkH2rOwkq_D4bD1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcPCpkACgkQAVBC80lX
0GwwXwf/ah55d33Awlus4RnqON1mH9ZLZunyri1xEqFS2iiIXBbVaEXWWhgKuE1o
JTIo/02N4pLI44i/EfS0ako3nwnl0RO16/GjcK5KJbe5VbLRNCceYKcEUBTu2DB/
je/WwHM+XPGH8z07hVS1yJNxoV0g60RzlTa6syFVlOQs6CIaSNznJ0G5UgdwlvmR
Nh/aD2OgNBCyEp22VLGbzjRA13txqIwZT/Ifa9HVmAg282Mfk42xSTgjJCWRplb+
oX7EdEBemP1md1Zby4brCoqIeU+jr18NFCV078RFjp1bT7K5S2e6VsdX6kQtQ3Y1
L9JPYjN1MYl2q8xJ9RX6+97C//1/pA==
=zd+l
-----END PGP SIGNATURE-----

--Sig_/9eT3RhVsSkH2rOwkq_D4bD1--

