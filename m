Return-Path: <linux-next+bounces-8722-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D9744C11676
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 21:33:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D996C4E39C3
	for <lists+linux-next@lfdr.de>; Mon, 27 Oct 2025 20:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84D2D2E5B2D;
	Mon, 27 Oct 2025 20:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="S/5lrswk"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFDC2798E5;
	Mon, 27 Oct 2025 20:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761597233; cv=none; b=KqWXyqNhj72aIy0m3GjiBkYSbX5I6Ykk2qCHh7/bxTnUKc/oLEW/5z9Ul3MoRpcysYr9VNFcwVBGAM42YfBHqHsb6gGwEND0aCcbdfNK8dnP0N7f+9+6OYSaEPT/54NW+JxD0jrEB7N7vI2x92IE7jo5b6WQ5hJRCYqrW/UPHso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761597233; c=relaxed/simple;
	bh=b5H+F37/o9lsYiGVraQlhoBZ6eD/dJKpuvYEJQehGoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Ffsmj98gkXF0P6OogKK21fxWTqh0GwGnpxn7IvYsI55OYClEf7CBAoa4Zq2wPDr70CCsSGElt72iX7p5ij2g+GuHnUI5wPMoS3UP/A/5+378xRGc0yPDagtOFpG4rQ06Eu/SKlOSAQJ/XfSmrlB6XnKHJr77NHRY1Tk+pRjQQ3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=S/5lrswk; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761597227;
	bh=WpFOgQ3IxrsnuvBh57s4oQBCb1X/url4lH7l5vfSbf4=;
	h=Date:From:To:Cc:Subject:From;
	b=S/5lrswkPf/MgdDhFfK36jIv6m+bUuZNhrQKaWR06E4Iw752tIKXboQ5a/MRH/BG5
	 1dDRHKZA67Ov8KCLlgtsginHbOoqb5Rc8z2MndSfNWAon5zBgDYk1ksXPjAGbClZ7A
	 wUkmfgEpkJLIk0KfvK+lEr3FJ5FPQIpoQ6HOYJoK82tMz+KCOGXouHfurzkuDi2LNj
	 qJjLVf+O3WBJqyEFrgyMVzcf95Xq+B+KJE1AYDpTlmJMQcvxWMRLYP8pVizWXjROw6
	 6DBRXyP45HRLZ9hSxPjVCt9dkpGQ3BVnMrdY6YvcZy3FVi+nD9NOW2vE1k222AuENv
	 cJExYdttKW2Og==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cwQFk6L5Fz4w0q;
	Tue, 28 Oct 2025 07:33:46 +1100 (AEDT)
Date: Tue, 28 Oct 2025 07:33:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: Fixes tag needs some work in the imx-mxs tree
Message-ID: <20251028073346.4b8d68ce@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/shv1UqIrD6BGI6trRWfPnKM";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/shv1UqIrD6BGI6trRWfPnKM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  9bab9019faa5 ("arm64: dts: imx8mp-kontron: Fix USB OTG role switching")

Fixes tag

  Fixes: 827c007db5f2 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP S=
oM and BL carrier board")

has these problem(s):

Maybe you meant

Fixes: 946ab10e3f40 ("arm64: dts: Add support for Kontron OSM-S i.MX8MP SoM=
 and BL carrier board")

--=20
Cheers,
Stephen Rothwell

--Sig_/shv1UqIrD6BGI6trRWfPnKM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmj/1yoACgkQAVBC80lX
0GwqKAf/SribIHPRJh8f9B9QbbstR43K0w4Woev3/vdvxUG+7JwKHw2ONLqY8qfe
higyiiWBz1jz5QvP9ilRrIQgywoArcxLWweeZi79ZFcPNfFabK5zPZnBpfj9ZDTN
2slzQV4dmXDS15PbDjV5b3jqWX5qLTD5+/4nkZhasDV9tD1I4yQtgyRaxf8SUIhw
Ii5YInI46lhh+yqlv0PWrS0ktmxoZk1CwpP0sxgTSY1Z+VcUvPQnZ6nizTO6o29U
ZGlcBYhkjLsUUx0CjHetfc/eZNAM3ctjnFENL4z+O+kLcaHEGCCkH6/k5+caALov
sSp7RoYL2vSy9cnq5tsK+AtPJpyd5Q==
=2l7d
-----END PGP SIGNATURE-----

--Sig_/shv1UqIrD6BGI6trRWfPnKM--

