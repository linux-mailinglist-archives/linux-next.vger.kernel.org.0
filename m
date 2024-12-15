Return-Path: <linux-next+bounces-4955-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDCA9F2642
	for <lists+linux-next@lfdr.de>; Sun, 15 Dec 2024 22:28:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28F181885FE4
	for <lists+linux-next@lfdr.de>; Sun, 15 Dec 2024 21:28:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D93F1BD4F7;
	Sun, 15 Dec 2024 21:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Z/1lAyFh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC5D1B5ECB;
	Sun, 15 Dec 2024 21:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734298098; cv=none; b=VYu2OPIM74fuWcX39D11Cks9S4uX90CSKUjfAr0npzwLohkEW+i36AOjinv+Lba2mQTFR/zgml5EseA62Wjpim7PLmpMIoJfCeh9ZOzoDUqBPqJ3tia+ZQGGwSZm16+NOKdhVTzsid91WYeghB7kYRwVyO9Dq1YxkzdG95T8WWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734298098; c=relaxed/simple;
	bh=L9hHf01pDnp/0wQWMVgHF/7+HuN3TlH8PUjf3W1qgTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uBkv578U/yoHvbI5mJF7PbLSJ4PjcF/o3apVqHqqq2kXlDEg6Kcql+8v5QrjP89xFGu83R9e9FkLtiv0wbHrsEnujRSoiLNrTkFpJtUgq7vWTQ87GtMktayThJLF9iH2tiHnlB20ccYJN/l1MkIF8qMK6FD2mQ8XUE7NrZ4vngU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Z/1lAyFh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1734298081;
	bh=YBUgyDT/h/HjXUDNky4SSyDW2nyBFCJipC/qzXgEW/w=;
	h=Date:From:To:Cc:Subject:From;
	b=Z/1lAyFhtVpvqlOXMnJE/xmEKMA09UCFFD7rWt1cKOPgV4emIJ+V6uRW29b2XBV0P
	 2IqOeBRrUcFKUBwdjyLRvlQwc5AdIuM50IIGmOhS2EmVHE2Ys4PyXS4UhnqIHBGSCy
	 52JDapTJMHrTv5TbZY+figw3lqhzFoN4iSvfZh+Lpdqt9T0HRWc+Cign88twzOMSCm
	 dVjEIsUCShzcq01inZwDNVoV1B4XGbL12fEi8EcdbsIsYwrN6nGbLS0nEZIfjM8Cxf
	 V2ggmDjyw9xui/1uXSW9Mexdnd1sIBYqevkD5x3QMoT9LS3lNa9zc0AvM7gXZt6jMN
	 9wlVaqEtOXLcg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YBGQ94qZwz4wcD;
	Mon, 16 Dec 2024 08:28:01 +1100 (AEDT)
Date: Mon, 16 Dec 2024 08:27:25 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>, Namhyung Kim
 <namhyung@kernel.org>
Cc: Ruffalo Lavoisier <ruffalolavoisier@gmail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the perf tree
Message-ID: <20241216082725.2ef47ce1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/bqowpAJmZLCvncreCGinz+g";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/bqowpAJmZLCvncreCGinz+g
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  8791a78fb70e ("perf test: Remove duplicate word")

is missing a Signed-off-by from its author.

This is probably not necessarily necessary ;-)

--=20
Cheers,
Stephen Rothwell

--Sig_/bqowpAJmZLCvncreCGinz+g
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdfSb0ACgkQAVBC80lX
0GxLsAf+MSCVnUgEgqAa7Pq+cSaViVlvvpYHNFoQA7Q9TphvLybWwQaF+UWZ+cWD
jh4MONB7jqyqHR8r74w5NjWkjn6R7pOH318Tq5UFH+pFyT5n2PEmVO3VAHdZqgyU
rHaqRCcvDeJaH5FAzbNsmcilK+wHaskTFt7Tis5V2ZkVb3fotbQD9hHVYjvWLXtI
cdxJYYHtbJzlWzKLA3Fo80g5+kWKArv5/v8AmIvHUtHBsPyHQdy4Yz0hFLtmnV89
sby8i2iPowFKB/eAl3a9+sA3lSlHbm1C4ekAIzLoEzTueb9f1IZg6VIICfVFtu6X
00clxV40F0w28FVUywVSTk0ROxXONQ==
=Iwo1
-----END PGP SIGNATURE-----

--Sig_/bqowpAJmZLCvncreCGinz+g--

