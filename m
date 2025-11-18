Return-Path: <linux-next+bounces-9064-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D96C670BF
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 03:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 185DB4E14DB
	for <lists+linux-next@lfdr.de>; Tue, 18 Nov 2025 02:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A67852FF660;
	Tue, 18 Nov 2025 02:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="ALOsH9gM"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5557929ACD1;
	Tue, 18 Nov 2025 02:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763433895; cv=none; b=uQhTCboGXPDdCxQ/ZQzkYLMwNCLNYl5omr8gaVN3EpxMHUgkTrDUv7Tt1VWiL/htJplufIlDJ2IisWRE75P0fbDKT3Vfrtd5BofQa+v1029zBWKptb9OCrY4pde7zXFRdtlGMwExK3XAif7E+cyP9CzNeCzUQA7roaO4O8teQMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763433895; c=relaxed/simple;
	bh=kO4uO5rKYzmktEvgPCxS6t7gFyz2+dfW/ohN6aIrEvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FzS0oA14OKiHLfyDsVJtI4WDBCw8islLXUC5EB3uzA6mWLLdg6V73ehvy/s5wDmkuyt7kB+BuMqAS1JcbRdv26FhFeCjck/ieG0WHE0f/64Qiw9tYWM3bTYPEXUyXOKBsCunj/73qLlwoNNdKcygRFZvLhcYrEb9ItsHNu7T63E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=ALOsH9gM; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1763433888;
	bh=dP5nERSLDsvafAGEv8/ChwbCUjC6o+78kWqbhyISSmU=;
	h=Date:From:To:Cc:Subject:From;
	b=ALOsH9gMOdI2FDy11o/p3vK6Z3w16rJQJMePPNdmxYAWAr5rkSRVR6AbYzvmMmuns
	 Nuimpm6l7e0a28nqRfTFbz2GH64GjI4V3TXLbEJK8hsSf0tRYaQh6QVz1UgSTlzhtL
	 EkXi4u+DfEZD46pNa5DbKVvOfp6fgA0bKtiI/pCDo+GwI+ZrjdrgbM06PaDDNdC4rT
	 FUhr0vqQ1rvV1M2QTf4dfIb3fTpOW0nLIQsN2ncX6od6WoiyS/1HcjU41u762QIDJg
	 rI5VP53B56qfk0RStRDVP6by1mZzqGb2VRynP9wfH43zKjbEWr3CsKNgfD5o0eargV
	 KrBGEwx3yxjLA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4d9TV76MLqz4wD7;
	Tue, 18 Nov 2025 13:44:47 +1100 (AEDT)
Date: Tue, 18 Nov 2025 13:44:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: James Calligeros <jcalligeros99@gmail.com>, Janne Grunau <j@jannau.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20251118134446.52d90706@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fNyeW9sOVGrDX0VwR7qsJlY";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/fNyeW9sOVGrDX0VwR7qsJlY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the hwmon-staging tree, today's linux-next build (htmldocs)
produced this warning:

Documentation/hwmon/macsmc-hwmon.rst: WARNING: document isn't included in a=
ny toctree [toc.not_included]

Introduced by commit

  a5f6ffe5fced ("hwmon: Add Apple Silicon SMC hwmon driver")

--=20
Cheers,
Stephen Rothwell

--Sig_/fNyeW9sOVGrDX0VwR7qsJlY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkb3Z4ACgkQAVBC80lX
0GwgXAgAndlLs8b3nWmTgrsppBpw0HPfj71x2U9x6iMPn4WiDbcumXJk0q5oad6+
6bXc0fiS4Rlt3s74R/jjRUlPyjBlOSpEa+QMz+OEQl4pnd45Cq/7w8R8IMPcrcy+
PxIpI7MZHc/DF67UokcN3RF4eWQ85NSkeUOeE+qgH669W13mEBEwlllTyVDBaPWL
7SLPrbhy6pau4/I65X8PvLJvGIgr5C1h4xmlQ2chy7KW3D/Ec4PnPxXoMwRxYOm7
VHM9xrjyKXqCk7Qvj8/amKAyRbgNyx/8MXAyc8HXUAEMkPXE4Et42Py7euqas/kE
W4WEpUzb2vUwJgFDWguJ0IUFiToTnw==
=9JTm
-----END PGP SIGNATURE-----

--Sig_/fNyeW9sOVGrDX0VwR7qsJlY--

