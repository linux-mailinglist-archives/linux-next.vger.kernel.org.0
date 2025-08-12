Return-Path: <linux-next+bounces-7907-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943D5B21B65
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 05:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE8283B11F1
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 03:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC6626529E;
	Tue, 12 Aug 2025 03:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qReQtZv0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3532D9EE1;
	Tue, 12 Aug 2025 03:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754968230; cv=none; b=B+FGCyYny8DXRIE/bkQXyEx93//+sM5BcOEwONgGlkNBRjY4+Q5Sd8vmP/V2IAf5dPjnqhzZSxA6PZ067T3R5Anb3M1SZ33BaLv5j/GNMXZmlYGKmGfwOGSdJAj3+XNs1NMzZAQHs0vAF1y8vPm/TzPzIgaF7vAe7w5sYnp13kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754968230; c=relaxed/simple;
	bh=uCzb8kwAgH49gwxC/mQBrfjRJdkSNorM5rsO1dmnWRs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OOjAQmqPD0trEoB86O2xIZWN4b/7aSJ0TfEXjr7Ufi5wpGOCbm9Aj0mjIRd7PkdlJ0v7xvDfF2OJOBeBvv13dQxePd+hbpAgWmEGXz51rjgFmZBNrzee+x1f10z5DjJ10kZXZlPHQK73eZSj2wnmItYBTbAYaAV7LCM/jdhgf6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qReQtZv0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1754968225;
	bh=vMNmzonxsB8Gvf2Yi9uKhjeVXOh4rfCdWKNyJyjnkq0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qReQtZv0bHyzZTb9AV7fe67IfeJ1V5RVsl0pfG2LwK81k0cK3CY1rHbVPQtA7RuZZ
	 xwBZZ37IR3B7ett/71v4z/yXjbQeED7nTKcX2/yy4p/3wTJB4WLLYnjIIJZgqM1c1L
	 exEsWCOQbd0xgG4W3WN3/JVTeCHsGbXklTCPtX76J1DgapI8e0/y+W1DMs+oTBXTl6
	 /xykfBSiQpUqw/D4dn3Ro7yexeMCEsgB0SryccHl2T8Dg21bwzYA6zY4tFgTEmeq7m
	 M5muCyTjg9MaHe+filL+xJube68lHD+zATRK2ybIyOXlXtaz4G9i9+M/THGlI/MNAG
	 uqdUCocxVnE5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4c1Ghx2MxLz4x6n;
	Tue, 12 Aug 2025 13:10:25 +1000 (AEST)
Date: Tue, 12 Aug 2025 13:10:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Len Brown <lenb@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the turbostat tree
Message-ID: <20250812131024.2b83c815@canb.auug.org.au>
In-Reply-To: <20250610141414.205a3b82@canb.auug.org.au>
References: <20250407065923.47f0049c@canb.auug.org.au>
	<20250610141414.205a3b82@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/B9HFmJwO=RLM2=9czl1rspB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/B9HFmJwO=RLM2=9czl1rspB
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Len,

On Tue, 10 Jun 2025 14:14:14 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Mon, 7 Apr 2025 06:59:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > The following commit is also in Linus Torvalds' tree as a different com=
mit
> > (but the same patch):
> >=20
> >   447c98c1ca4a ("tools/power turbostat: Add idle governor statistics re=
porting")
> >=20
> > This is commit
> >=20
> >   ed625c61b85c ("tools/power turbostat: Add idle governor statistics re=
porting")
> >=20
> > in Linus' tree. =20
>=20
> Due to more changes in Linus' tree, this is now causing a conflict.
> Since this former commit si the only commit in the turbostat tree
> (git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git#next),
> maybe it could be dropped.

And another unnecessary conflict today :-(  You should just reset the
turbostat tree to v6.17-rc1.

--=20
Cheers,
Stephen Rothwell

--Sig_/B9HFmJwO=RLM2=9czl1rspB
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmiasKAACgkQAVBC80lX
0Gw0Uwf+JACsXbgc/BVsQ1IZr2q4r8EPcIyj5MxCtyIkFP1++eg4VRtrPQxKuJRq
C0EcLxFFmSMb4NhUPJD5FXc5Ziv21iXgjSmvdPw5mnYNG2H+5q6pYk10vYoNYMJd
P8broddDW2gxhFCRCKL60+YkkYCwnHDaRr7pMfIVRV4OA8cLerEezr6cW/9chIbg
zEUPeLDYQ1vHSEJGoKIn8L6+IVTj9d8yrXreoYG1Xl267kgN2x5ywTMGpsmD2LAp
q+w/7CH/BACpOpj5M4OmUfKYtqShWtYnnWqPItHr7D96shlmn5u0M3L9jDHAEKJ+
4RXvAcXjDESu9koYHkX6YYOPHHBxmg==
=pWP9
-----END PGP SIGNATURE-----

--Sig_/B9HFmJwO=RLM2=9czl1rspB--

