Return-Path: <linux-next+bounces-8158-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6276CB3F224
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 04:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E98D71A85541
	for <lists+linux-next@lfdr.de>; Tue,  2 Sep 2025 02:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55412E0925;
	Tue,  2 Sep 2025 02:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="UCegrn+A"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730B9198A11;
	Tue,  2 Sep 2025 02:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756778939; cv=none; b=IjMt4DjI5G6gznZFvy9gLWiskZpIl+KgTb7xPg4r/TyryOGHy/KrbTBLOqBRFgYbDxaOGhGj1q5QGUNw0uCWhHuRkp55o9VYEuxsPQQIlEuGqSiZk12lttWtJXMtx7z1l50wkVvTLPMsndxqhNqqghWyH7rxQUx5T6dX+pafato=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756778939; c=relaxed/simple;
	bh=uB6QWnbZDiWCmK5+f+kyoVPLiAnPPv+9PKaHvdKeH7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CAIJYCT+auGLqxGyGJSHUaalljtSujJ2NWKPr7kTUAxrG2NrJOXay9Ge5KgO9LBVP+ISfgNqvWl2eVvPazcufr74E7kuaxrWVgqZ6UFtzdRJIxn0V4KFdG3S1RTupLCa4JdgIUiySK3Iwq47QxUTJAW7Ck08Q+cZrG9WpHRDCuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=UCegrn+A; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756778933;
	bh=4Rarl1F3/8TR2preCPM5ogTCDnbr0sAt2z/2yt4/sR4=;
	h=Date:From:To:Cc:Subject:From;
	b=UCegrn+ANLqUrx8gLu12BVSCpiGjv2q1sssbKLSIVwwvo0x/gRX6E1BIoEr+WdjL/
	 qXx8N+bGUpyyfr2kQZOgEZwTDSrTm1U2H4WcQAzYKR/k4OH2W5t0sriYFYPrBhNH7F
	 RESxeJJ1ugliT1lMq33NgzJFvrpNHBVZfubCbBjOfNtRGlqYgIv+LNxauqVuMbaWtM
	 dCZiZfeRY9SrZfT3b2oK6Vt0lrpLmSrPHxCNlkFdDBeR3SbPn6yt+lCMkm1vQg5HJd
	 7NVh2t8+ZjzYoxJuuVKvesJUJaegg61Rxl83vTJzYXZtlprMUTIFFBPPZj3jR9wyaa
	 d1nlwOk7kJ63A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cG8LF2MV7z4w9w;
	Tue,  2 Sep 2025 12:08:53 +1000 (AEST)
Date: Tue, 2 Sep 2025 12:08:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the mtd tree
Message-ID: <20250902120852.3dd6f0d6@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x91p5svg/H6TK2mHY7Z0u4/";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/x91p5svg/H6TK2mHY7Z0u4/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the mtd tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

ERROR: modpost: "mtd_virt_concat_node_create" [drivers/mtd/mtd.ko] undefine=
d!
ERROR: modpost: "mtd_virt_concat_add" [drivers/mtd/mtd.ko] undefined!
ERROR: modpost: "mtd_virt_concat_create_join" [drivers/mtd/mtd.ko] undefine=
d!
ERROR: modpost: "mtd_virt_concat_destroy" [drivers/mtd/mtd.ko] undefined!

Caused by commit

  fa47dc829519 ("mtd: Add driver for concatenating devices")

I have used the mtd tree from next-20250901 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/x91p5svg/H6TK2mHY7Z0u4/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi2UbQACgkQAVBC80lX
0Gw9VAgAjptlvO46FIAEuhWI+onB6powKrpFRfxO9UfrNCAH3+U/jCFs7OF77Fav
RWuHw8uZz1MNQnzp3KOcOjnTscnohZFah5F/WJq+TlD+XVIRlVSyDLA6/6TbR9Wc
VuOdf6+m3KpZJl9vx5yZUPOfAtRGqSUvPGUAwRTElOEL1BlwyGyAR0JCQOyCXJG9
DfxZDZYcbd01PKhiy7Cq3Mo2WRbL7ajIWWYWJz9UV6FmsTL1vRHxQIYkK+7wjk44
CYI0awJWFl2b0ZpO+fsgeVbdUyqt0cLz1KjK7GpJzZEAonthfRzSWJ1XHauZCAYA
rl7BvQDz9qfFUYdNwOIYesXp5G7YVg==
=m7Gk
-----END PGP SIGNATURE-----

--Sig_/x91p5svg/H6TK2mHY7Z0u4/--

