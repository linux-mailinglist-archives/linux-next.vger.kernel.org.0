Return-Path: <linux-next+bounces-4033-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B14E398B398
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 07:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62367281A21
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 05:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E989189918;
	Tue,  1 Oct 2024 05:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="A9qNSxK1"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB73319307D
	for <linux-next@vger.kernel.org>; Tue,  1 Oct 2024 05:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727760286; cv=none; b=eDLv9Xywx4K58jSMfH51pgVd265949FGfyoMyzZrCU3OYyeCby87APGsJTpx3XwEi8kgItIBxtVjbM6VTD49RyJrw6U4mJxdeNurm4ocSv4H21umCa2asCHHLNLRPudlXERJp/NPESRDxgcZY3UBCTnmEJb3UuqrJwzVoFEqZdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727760286; c=relaxed/simple;
	bh=1vuEPCfKLqBtDwDiLY9RuzXLuvOscTF4zNlhl2cuDxc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kLYgA0G0LSaHE3ri0yq/hnyCoLNoKs7PEEcyNi5/gQU7asB5Xo6yaBorYaEKsSErvflIzY09Awmuy5gy/cSsyW2o9DSsBxOfgul5ao9ymg8HD9dn6gQG1iglO74ow1UpVisFSWuNFfyqGEM31JM7WOCDZn+8Vr5FTJGKi8UUews=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=A9qNSxK1; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727760280;
	bh=T/leazdU10DJWKFuz13T9nd6gjHGiFni5sU1rBcUTeo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A9qNSxK1NKWSOFeVD0wZx3u9NsYpT08CWRRIAdlv+HJH0yNfbXLglUSvd610HIcFL
	 kBpObRXpaHzkt6Y2xRbhRlK0GzOg9OdJmbN4nQwZTic1X7ngaZkgNmN8uzlknhvA41
	 NZQZu0f51bkgCij1d+cc0hQqk2oVd+HHqXIPdshyX0qYjN+Bvd9lpVwUJt7bhVoJYv
	 +dHNOa/cRfpWI9GNrchw9+1GCNUY0spzsKfq79s29HjAXmZzIAMxU8Rdim5fBSgrfN
	 Wr2bEnG4IypPCHab6HVHowNp501RKzUZ5ARcp3nA9vXRYGOLq5ZmHyKgdv/aSRnRwq
	 /h3vuvrbsy23Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHmbD48tLz4x04;
	Tue,  1 Oct 2024 15:24:40 +1000 (AEST)
Date: Tue, 1 Oct 2024 15:24:40 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Serge Hallyn <sergeh@kernel.org>
Cc: linux-next@vger.kernel.org
Subject: Re: Please include capabilities tree for testing
Message-ID: <20241001152440.3656d7ca@canb.auug.org.au>
In-Reply-To: <Zvtvg1SqyMOsgfD3@honeybadger>
References: <Zvtvg1SqyMOsgfD3@honeybadger>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/j9wy0OubjK_l2a/.9XszcQa";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/j9wy0OubjK_l2a/.9XszcQa
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Serge,

On Mon, 30 Sep 2024 22:41:55 -0500 Serge Hallyn <sergeh@kernel.org> wrote:
>=20
> please add the capabilities-next tree,
>=20
> git://git.kernel.org/pub/scm/linux/kernel/git/sergeh/linux.git  #caps-next
>=20
> to linux-next.  There's just one patch in there right now, and I don't
> expect to ever have much more than that.

Added from tomorrow.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--=20
Cheers,
Stephen Rothwell

--Sig_/j9wy0OubjK_l2a/.9XszcQa
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb7h5gACgkQAVBC80lX
0Gx5Pwf+Pf4HgXXC7x1WcVI6hf4kpVnQvTE2xxKFMvfUgbp2/yKCLvCAMZOWwi52
Gwfws1JkINcMhrQ62fqzz5+208m6FiJ0BXemLQp6qhWF4/+F/Oi7oOz6wPF+Iy75
+QbxtPI4IRJVNOhYsQiCBarleCFkxNtB81bjxv9ANIaZxcU5dXW5VW4mtXMI4oOr
/C6uBha8Y7PTTdEl626R9S5yTao27P+gxcA3NdvH+XQCfTCQ/e7kiDcWnY8FE1gg
PyASXA7+eBQGg41Zg407PPgP6mjFfNpVdXNcsJ3DfGipu8lK/hdNFe8+iDawYURm
8zU2jm6/uhZVkWFBflUZolrfMbVIqw==
=qM8f
-----END PGP SIGNATURE-----

--Sig_/j9wy0OubjK_l2a/.9XszcQa--

