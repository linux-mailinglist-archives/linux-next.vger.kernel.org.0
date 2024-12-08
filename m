Return-Path: <linux-next+bounces-4899-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 557599E87E9
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 21:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52BB118804CD
	for <lists+linux-next@lfdr.de>; Sun,  8 Dec 2024 20:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DBB1178362;
	Sun,  8 Dec 2024 20:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="I8ZQgzA1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19CD1586FE;
	Sun,  8 Dec 2024 20:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733691042; cv=none; b=h8+s2TS5snx4beKFt/XI3R154MvK36zSOzj+arnluFl+XT3Ty9IuHpuNS+jnSHHIRcdHISvnLzwWmCDlq76PGFqf9hls88p/m11GuJ8L4LbL+sUNdefkgDRkxXBWhHYIAsPkasb9OkFsrCs19NxA7BpoA6IvGbgdXnNqg2aSZNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733691042; c=relaxed/simple;
	bh=+RGux93q/gOXwb2pey89YrkbiuoWJpkVRT2cCB6MJkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XwUJaytHNu7NxO7+XTrBXhY1xAaTigLvLGE0l8Ghd0vEfKcOYPhdwl5b7B89EE8Mm4f61Im+dkhvRofjPTBultb8FJ7RIMGMakBiybZ7nE12TcG2gN37UFWfQWjTZvc3CzbN8rqjB0Js4b4XxrLMp+CJBy2bH3qjdaWrM5Ke6s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=I8ZQgzA1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1733691033;
	bh=ckH7xrCW/bjAYasrA3zpdTmx2P4iIyEIcYXm54BXfwA=;
	h=Date:From:To:Cc:Subject:From;
	b=I8ZQgzA1JmzuSBe5F//vZK4YNrDdNdpXU3gmgWrA4y1xOqZVcU9l1ApZWbaYeqvZP
	 dzfy098Av2r5TAPvfU39kXzn5yDXUvFDvOUR9aoF1ceE+DSNcd75UJajwajaDRJ+rC
	 ZcS6wSMiLStRuJ4LaZemWP/XbxhOP/zr/PaNF4kPq2ZiFYUKHX4BLklNXLpa0niCex
	 KBJGX9RWutMcsvVqnC8Ks1oUlR92eu7gz/eiS0VDJ/f9zsbXE0W/NzOXy488BU9NHr
	 vHKNMto+wajrBBRrRdfjjncL27lyZoZxSbj8Z4C8ECokkNhM3bnoWCO5ZgIRSix5uf
	 5WzWcVTJRUFwg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Y5xw91810z4wp0;
	Mon,  9 Dec 2024 07:50:33 +1100 (AEDT)
Date: Mon, 9 Dec 2024 07:50:36 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Vinod Koul <vkoul@kernel.org>
Cc: "=?UTF-8?B?Q3PDs2vDoXMs?= Bence" <csokas.bence@prolan.hu>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Signed-off-by missing for commit in the dmaengine tree
Message-ID: <20241209075036.055e0729@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tExtwn9eEpieIYfLh7_N1we";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/tExtwn9eEpieIYfLh7_N1we
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  1ad2ebf3be83 ("dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA")

is missing a Signed-off-by from its author.

Scripting confused by the comma in the origin SoB line?

Also, please keep all the commit message tags together at the end of
the commit message.

--=20
Cheers,
Stephen Rothwell

--Sig_/tExtwn9eEpieIYfLh7_N1we
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdWBpwACgkQAVBC80lX
0GyxCggAlmrIpEa2THTFV6N6ZNNJirrqqGbnX6G3q/a0p7cIodguEq/43carKMtR
lRF7YFo7/P+Wb0UAKTLSNlIHEQDZ+pewPmwqRlhG2ejcXRNON1tXT7uhadAJfIXx
hkTy6iGmC6edG2uw6pU1c1yR2QwaiSaX+mV1dKyRiptXb6W/EHzA8wP3VyNxQTLZ
ACcTLBWbC+tbOAxDxFUN/wE0e6ZeuFqPJQR6KfRjvD3qcZl0XNCV9FX4QDH4CNRo
Rh4YpnMEJUOw29DP6L+CJj/o9AwO3NY+nsIM8ZdSyLpT7QDEzqqh4bBrLW3G+2De
w4wJs1tqdmk4g23uB7BqRZcIknR/mw==
=5pc+
-----END PGP SIGNATURE-----

--Sig_/tExtwn9eEpieIYfLh7_N1we--

