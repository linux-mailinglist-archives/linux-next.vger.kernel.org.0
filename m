Return-Path: <linux-next+bounces-5828-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFEBA650C6
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 14:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6681C7A3F49
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 13:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1842C23C8CE;
	Mon, 17 Mar 2025 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="i51ZQllL"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2464238D22
	for <linux-next@vger.kernel.org>; Mon, 17 Mar 2025 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742218009; cv=none; b=i582jkhjFNKy7wJqspIJD1dmUcGaFNLjhnWv0UlGJGj9aW+IDcKgBbWFUg4Z1xIqu4BQJgEDub2WIo8uAYyimXUZAIdBUOmLkssTJqConf7E/b0Sn7h6L2sa6YOMEpZpFkIKilpg17Q5QRU/H22r1prQr/AG+oJuczUhAtM2dVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742218009; c=relaxed/simple;
	bh=9A+UYAcKTh2jrO8mWJ1WdZYuUshtxZIYsSvXqU68wm8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dwal/QDWaY2bgxpxY6zGZwT/smDVk3IW8uLc9/HRixYpQOBT6YTT4kx/Jop3AiMZPzlGa4XEuj0eZwoelgr+yPQwUMwzrIVZ0V8VSzkD8dD9tyDbZ+Lh9bQ1K/d80KksbUmEkvA1f3A3u3p5hFtPcSAFhhdI+/AXRcjTTIAGnQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=i51ZQllL; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742218004;
	bh=JLIHgAMxnwRLZG/obQ6vS4uXsd9KMOYOozy4YCRS9iE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i51ZQllL8WkzUZQrqgD10mrWnp3ZYuN+acasktV6ddtEx793/Mq2rcaCYAB8yrnlP
	 9SdlizXx6LDhkMBq+KPHhe7DQwDp3eR2dn2C+JJ/UjXHFPM+4Uij4HQk6L4xlL/kLy
	 Kew1CGlU04xFVs7ehXV1dwMTeaAuWpBW175EO7u0ZliZSByrvOcYP0pjcurhuLB+b2
	 VOCs3QM9UNVwG9h7CwSWegLLQgoE/X+eHBUzpIpYjgaLHZOQzYf2YoBKY5M4zHWjri
	 heW6wq15RHnfgoN+qBK5xp3bafr2NcOEgY1cwiwCM41Mvx3+WfsNAWB9NEodlPeveM
	 fZi3eNJydq0SQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGbNM5zhgz4wcZ;
	Tue, 18 Mar 2025 00:26:43 +1100 (AEDT)
Date: Tue, 18 Mar 2025 00:26:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, Linux Next Mailing
 List <linux-next@vger.kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: Please add powerpc topic/cxl branch to linux-next
Message-ID: <20250318002643.71ef29f1@canb.auug.org.au>
In-Reply-To: <87y0x3dibs.fsf@mpe.ellerman.id.au>
References: <87y0x3dibs.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O2rrYCitA=n4c8uYnDf2KW9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/O2rrYCitA=n4c8uYnDf2KW9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Mon, 17 Mar 2025 22:09:43 +1100 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> Could you please add the topic/cxl branch of the powerpc tree to
> linux-next for the next few weeks, it's targeted for the next merge
> window.
>=20
>   https://web.git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/l=
og/?h=3Dtopic/cxl

Translated to git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.g=
it#topic/cxl

:-)

> It contains a topic branch of sorts to hold the cxl removal. It has a
> few commits from the SCSI tree, up to and including the cxlflash
> removal, then it merges powerpc/fixes to get a Documentation/ patch that
> touches cxl, and then the cxl removal patch from Andrew.
>=20
> The plan will be to send it to Linus after the powerpc and SCSI trees
> have been merged, during the merge window.

OK, added from later today.  I have added it late in the merges.  Let me
know when you are finished with it.

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

--Sig_/O2rrYCitA=n4c8uYnDf2KW9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfYIxMACgkQAVBC80lX
0GxdGAf+IpjmJzMze0AoOSyixrs+k1fUAntWwPH+G4HCg8TaJUN8UE/x73SnylPE
jueJYBe/I82pIX1GxpTZ2ydIW5pP1VoRERv13tcpkX0Xb52THt7EGNIfCehDjWPo
Ly3i1fXIAjcOPEs1cxy2o+ULZ8cuX9f3+xzRYec9DBdbopCWAc0ot0MDnGxlQn1o
xiVo9OLQkPROzlKriofin1NNnLdy/83IIxzRU1j7fUjRPCTGVIDUyq5UKw8VI2J8
DTiacyVsBC7kw3p2SWFFbZNGR4GpHWx0MM8RfMVO1PDO/X+1ncxprk38BpoSNCNy
wYp/j0R44VIG2SuiGwB83e6+FwacVg==
=d1ND
-----END PGP SIGNATURE-----

--Sig_/O2rrYCitA=n4c8uYnDf2KW9--

