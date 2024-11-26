Return-Path: <linux-next+bounces-4846-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A95E9D913F
	for <lists+linux-next@lfdr.de>; Tue, 26 Nov 2024 06:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79E09B2427F
	for <lists+linux-next@lfdr.de>; Tue, 26 Nov 2024 05:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB3917E782;
	Tue, 26 Nov 2024 05:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Wz9VXFOS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296FA7E9;
	Tue, 26 Nov 2024 05:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732597700; cv=none; b=BIdTiVYt5ojF9hj1b0MqwmmKe01BOQ9bC/VrsyWpqSkNLRAG//QjKWesUW6p42S0FI+FP56SMSVsesdGZnOT45PflmkxclzXp5NkhVTSu/I8LXsvv5pasec6BBRZJmTPRykb3X3pSMfkUxP83CEPSAqYmYvpp9kREy7tMbZJQaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732597700; c=relaxed/simple;
	bh=hTQsyQcuGVfuQ9NOyeTAmUkRITBZSTe8R39SLQEkriA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Gu8DDrPjeeiBcmA8ftI5EOGOkIN/G/8fxyVIo/MQzAVe0/jUS7Cf4Qz5NFzdAGG+BVgWbIruYT4WrX+amsLDbbNlhRghv6Cqp8fXrCN7Exb+A9i7rkvTj+/i18Wrrkb8nZlKUSkaWYAcVSZC55qM6mh9U3zjXcfu1XNgowQBotA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Wz9VXFOS; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732597690;
	bh=DcZ/PKp9RJkxFnq0nxzunNQQc/Kms2eZJm18JRu2Bmc=;
	h=Date:From:To:Cc:Subject:From;
	b=Wz9VXFOSuY6iHPVx+sW87SoExMTN193mz29GakXBe/ZZMMFz5d27HjrmFu2LFwigC
	 NS2ypwv/tnJPJa0QpHDA/0FwicMwg+tfzpjOYvz8OSmgSBapoKswJnYbses7+4o1dz
	 euBseXs7N5R84u358QpLPmGXbExKyEZvnjTmwUTeSGqigRj6asZRkw5e/9+a1cQ4Nq
	 N5LcQL/c3dV6AemZ/vj+Luyp/zXX8gSnZrKltfxMCFjilQPSOFk6VdlXbLYnlnjMZ4
	 BoRr872iDeHsUMon7ZcNqzPQ8F6/oWkAJZZqdVav1kn2806VenAXVQ5VnfAudqOgfG
	 FRBxGIrOVwkOQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xy9ZL66FSz4wcZ;
	Tue, 26 Nov 2024 16:08:10 +1100 (AEDT)
Date: Tue, 26 Nov 2024 16:08:13 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patch in the i2c-host-fixes tree
Message-ID: <20241126160813.40678c23@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xep.35yH4geBjFRhM.OGBvk";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Xep.35yH4geBjFRhM.OGBvk
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commit is also in Linus Torvalds' tree as a different commit
(but the same patch):

  523930e4528f ("MAINTAINERS: transfer i2c-aspeed maintainership from Brend=
an to Ryan")

This is commit

  16470f606666 ("MAINTAINERS: transfer i2c-aspeed maintainership from Brend=
an to Ryan")

in Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/Xep.35yH4geBjFRhM.OGBvk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmdFV70ACgkQAVBC80lX
0Gw0DAf/fhrgZYERHCy4haw5RTSU03n+pwuKVJ0IBikNv8rmfPz2+0YOTFFlaQkG
h7Zmfi+OM0RLKpYrqUiWAHR0rZrW5ovGI41UVdQSujybh30Y60rJKQBxUW9srE3D
kEpxO1S9zjx/Ab3nx02rcblyY0la0FMGGPT6AjzeS1JrEo0fu4K0KAB7dHQBpsio
9k7pPr99LNiZWzoOKEGS8AR5dt8OsG4zkJ0W0Qn6A1Ucps/xkWdWy46ZY7/60gcQ
UIk6QZ5tkpL0z4Ji1/BuHToAFkoO0rLD6LRDWMSTkbiVP70cV/9jHTr74CkFi+/V
OMn5fQUXZgoUOF+I2mOCoh/X2zUkEw==
=f9Ie
-----END PGP SIGNATURE-----

--Sig_/Xep.35yH4geBjFRhM.OGBvk--

