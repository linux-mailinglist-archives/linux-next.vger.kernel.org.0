Return-Path: <linux-next+bounces-8727-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F9CC12774
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 02:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A9FC5354288
	for <lists+linux-next@lfdr.de>; Tue, 28 Oct 2025 01:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F193171C9;
	Tue, 28 Oct 2025 01:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HueENnLR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC11F3207;
	Tue, 28 Oct 2025 01:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761613349; cv=none; b=Qw4D1LH2fuN0HsQDjFP6tUnVY3rlDdZ0/T2fOKCvTN3YmAjF5S9HdnWVpl0VIlXCAYU/UrEVEQ5VWRTMbkxGvJQSAQOXA+f4RbOwje4AUGLWBs9FFpj8MqjUhAsNeGkaM/ESZd4RW0yvCcsQnP691ArQ0QgTiAU8+PsNjobBky0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761613349; c=relaxed/simple;
	bh=Zft5UJKPNRfXEhWS9UdC9PG6NexTu2ou8aH8z4zzJ2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uV5Zm0KXLDAnDnEEgjEQI7GQLdvkTybBZKaailtO3hd7ov47ezVpmddL+YARN7nyRrrsydYLa7k+il7xotSWZJ3zs6mGUD117QSmXiyrnGpLRq8wqvH5CxRXKrKmFJm3JyXKYSIUswQAvFfZhRxwxPpkLEZInP2IpH3a+PmOlmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HueENnLR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761613345;
	bh=Gu8L4giSdqr9CbgpfITrspbijPD8f9hc0mGilDSs99A=;
	h=Date:From:To:Cc:Subject:From;
	b=HueENnLRUXE4iwDGprpO2JVwO48Wh+9jYdycsPMGrVXuJRfRB+WqMzSqgyITxRdKC
	 Eo93C1An3NVDMNEqYZ+phVxfsecliHgrX3cggNsdtsbymPFnn0znQNzcZP8DLVL23c
	 wALKCJUnNxT4hdPsydkRAby701iblqf4m8WcbNelz0btfaw4EWNUiW3EPWCPY+uWW6
	 jHjJecDGqcOpHFu5lGaxq7PJIstz/P29N+StRvmzhIpBKJlN+gbkKlP03VBOkgxhaS
	 mEmSkgjdiJrPFqWLXklPtUGPvp+OhEL3UCQhGvUSQvtlAU1ktPblHMgqG4Kmex3XIh
	 ctMtAq3m1v4vA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cwXCj08kfz4w2J;
	Tue, 28 Oct 2025 12:02:24 +1100 (AEDT)
Date: Tue, 28 Oct 2025 12:02:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate patches in the pinctrl tree
Message-ID: <20251028120224.1c7ff0eb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/2D6cESGG8+Cm2CgO2XsFHxm";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/2D6cESGG8+Cm2CgO2XsFHxm
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

The following commits are also in the devicetree tree as different commits
(but the same patches):

  9760089ca4b6 ("dt-bindings: arm: Convert Marvell AP80x System Controller =
to DT schema")
  0385f89a0cbc ("dt-bindings: arm: Convert Marvell CP110 System Controller =
to DT schema")

These are commits

  3fa6e2a0ce21 ("dt-bindings: arm: Convert Marvell AP80x System Controller =
to DT schema")
  5024ac81c4cd ("dt-bindings: arm: Convert Marvell CP110 System Controller =
to DT schema")

in the devicetree tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/2D6cESGG8+Cm2CgO2XsFHxm
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkAFiAACgkQAVBC80lX
0GxldQf+ICzs7GhIkrg5ataBF+QjXDKwLZRu+RrBM1yuMSe7f7qL4GPBGT+vsWcd
vtW1Fvm9U8C/X9FFJKR1gqObxO9kuGftWal/72epKYsd/T4w8bjObpOmKKWU/hGM
n3kd1v8Nm2CX1elECN9VRZDSoknKNZR5jfMN71mxySWV2rx0fzUQPN5zpaioRvOr
2/V6vCZLiB0zGaviXLwjy58iWfA3Ekh0EMyymTMVvKbY2K8k2Yi0ZLc1pFKJkBKy
LEGUAxv3nw/8Bam7W9gU/PKBx3uiQMiMEmpOqcryW3GB7s0iFa5K0hywlPk9280/
/YNdVf1F9Qph4VYRZDFpgdmtpzYKYQ==
=Q7Cq
-----END PGP SIGNATURE-----

--Sig_/2D6cESGG8+Cm2CgO2XsFHxm--

