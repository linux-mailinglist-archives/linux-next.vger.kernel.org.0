Return-Path: <linux-next+bounces-2407-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D55568D27C3
	for <lists+linux-next@lfdr.de>; Wed, 29 May 2024 00:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F82E1F24E9F
	for <lists+linux-next@lfdr.de>; Tue, 28 May 2024 22:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835FA13DBA8;
	Tue, 28 May 2024 22:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="sl/GjdDR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5447F1DFD2;
	Tue, 28 May 2024 22:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716934216; cv=none; b=cSmHzqH8oj40Cbqw3EFwgiD12bACplySgHHUfRwlhdtwYMyk7CEKaDtSD9eY6Bf+QtfEyQqv3hQavncm3fdbH8X3J5r8C7XjdljaHRuv/Ia7bfNkBWEJg60Sgn5gsjOGHYOBHYgRCGuu/qtLP6+OvVJg1suLjlZdEN2wgQ44kn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716934216; c=relaxed/simple;
	bh=q4UheeQAzRoTvGhQ+YDr8n67+ycMXWPrLrWe8Kp3Jjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nBkWU3hN4n0Nfhj2Sq7z40sd3dymq7cwjE75oJnMjCXpmUiQW8EdfUD3vmIpwTyhlQkzf87btZoDGQ3shhQFNGsWNlVDJKXGfuoDR9O98Cwu3OgR3KMxEBG26ufXtc4yVOVGb6INIB6Fc79KDJhONovKD25j/kEWG9nXe3de8aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=sl/GjdDR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1716934212;
	bh=Qs1SLL245OD7JBrWU14/Z4wjFVCeemwMQ4GZDomk5uw=;
	h=Date:From:To:Cc:Subject:From;
	b=sl/GjdDRqaSee0BzR2txZpY0aqSH5fwWdaz7d+vGGWah5ZiPPs6cX12GsrlpR2KgI
	 repm1HEIO+ARyH4pp0p6WYlRbAS3b115WLXqYtOI3H5asQvvWP/ZH1abTpsnLqPzLH
	 MLTAKO9071fi/X0o71FGmGdSkfHYT3RKllFTBvIVVi2/frbtYG3/5GAzMWB8Bzkfe8
	 Gp81P4MDplfDqlDZNk/AznXFm22lrmwA4igkkwZKX14zXI2wAnfa8Z0RTkGFENblTH
	 4KUefXJ2RNfVZOK8CZOILmQD8MRdPK0AJeJr0rfx9VbMGC08tjUPOm0w3w9TLCypgR
	 na8p994N7ONEA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vpmsc4Sjmz4x1Y;
	Wed, 29 May 2024 08:10:12 +1000 (AEST)
Date: Wed, 29 May 2024 08:10:11 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the rcu tree
Message-ID: <20240529081011.6f8c3366@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/cu13r/0AdfJ20EQNtIuJdG8";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/cu13r/0AdfJ20EQNtIuJdG8
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  6bfd01c430b9 ("rcu/nocb: Don't use smp_processor_id() in preemptible code=
")

Fixes tag

  Fixes: 8feeeba60711 ("rcu/nocb: Use kthread parking instead of ad-hoc imp=
lementation")

has these problem(s):

  - Target SHA1 does not exist

Maybe you meant

Fixes: a1ae3280882c ("rcu/nocb: Use kthread parking instead of ad-hoc imple=
mentation")

--=20
Cheers,
Stephen Rothwell

--Sig_/cu13r/0AdfJ20EQNtIuJdG8
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZWVkMACgkQAVBC80lX
0Gwm6Qf+Km6mvIyNc/nn6lEhc7RtBvVlySN+VMMuJxNVuQZikiDXZNp2zorsVshW
nKVoD0HpMO/OrGz2VIOLHSobbUxaGiKq7f4B4bJTw6axpePtl8UZQQhxsO4xqaRU
qQ1Cn7Pc0WyBbdraqky5pBqTlPMZlVkWdcFUqSRzYD6huPv2a2SOsc5kfJZLzfRw
bD4cPHfLYgi1m6NQr07YD5iIUVxK0yC+4XYotig3p3srV5ig6cIKQl9YDSYTyoAS
OmSGd2TE2lRfA4wJjqsevdu1JaU1QvCgIfK1dFIXwVNfYORddaw8qkTrFHr6/+C1
gqMcBKOB6mXX+fO036KP5ksyk88WAA==
=8TG+
-----END PGP SIGNATURE-----

--Sig_/cu13r/0AdfJ20EQNtIuJdG8--

