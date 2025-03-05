Return-Path: <linux-next+bounces-5664-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2292EA50E1F
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 22:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69FCC1888665
	for <lists+linux-next@lfdr.de>; Wed,  5 Mar 2025 21:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08512620F2;
	Wed,  5 Mar 2025 21:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="AkvesDsj"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5301946C3;
	Wed,  5 Mar 2025 21:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741211287; cv=none; b=dt8Bbn9UT/b07pALLC/4KO+bQxIb62zYsMUDunoc6Zk3Iuwg6acWRnwcwL/br/0HzxYV7s/sSFu8AHoZ0b+hWUwhMBeQNbqPCOFoZio+Xln/1D2WnhsRmx7FjZBJaDfBFI/I8ClRH2H4mHesucJa2F9ia/GR1lonhaqcUk1tFIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741211287; c=relaxed/simple;
	bh=l9uGMy5yhsM3dqVmi3StfipCL9plQNJzEDtt5SdwX8w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fw1J4OYxqoOzP5/TFGgpt4vQSEylwGdoTJ3adqDKX0XBGuh+lAfHVxR4Dg5loXz5KXgH0HFjSVbXUWdoOKq3m9bNz3jYGfHIaBhn30Vvfi8vuYHLriXZbdL1ELsTWBf2p04f7y35uzcgYxDIbsshDKjoqFFADBD50fbIMaXW4SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=AkvesDsj; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1741211280;
	bh=KJtqzzEJTjFsQ4HJ/aBZxyfHoN440kgtHZ9VevPoWyU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AkvesDsjXkiPptA6Py9wu+H0Pra6QB2PK80pI97MdMxkebqapeF1yfGHrGW9h2/zS
	 p48vF8EZFAL9JNa1Sm1P3FjHbSib5sltbiGglyTV0+K17+yosTD0C/kN4JfTE6sDx3
	 jruBRXg4LDinwwqL33GN29w8L3L347f/Mm9XiIy3pHGE5ZxXb+vFf9JiX9kl2nAE/A
	 PfX58YpQvSLsidWh/6tl+jeUj1x7XbMxYgBkWX0Ct4uXoPqfFcKaJ/iSNWv+42QlJr
	 JfngU+k1dUb1b9Knn0lIJUq8FFvybBkLOxS6SCJLASAFTwQKpyzRCmY7DKCWzbBgYT
	 WqLD4TQKzNxLA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Z7R4H4PKPz4wcT;
	Thu,  6 Mar 2025 08:47:59 +1100 (AEDT)
Date: Thu, 6 Mar 2025 08:47:58 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Nick Terrell <terrelln@meta.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Dan Williams
 <dan.j.williams@intel.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jeff Layton <jlayton@kernel.org>, Jeremy Kerr <jk@ozlabs.org>, Joel Stanley
 <joel@jms.id.au>, Kent Overstreet <kent.overstreet@linux.dev>, Linus
 Walleij <linus.walleij@linaro.org>, Vineet Gupta <vgupta@kernel.org>, David
 Sterba <dsterba@suse.com>
Subject: Re: linux-next: trees being removed
Message-ID: <20250306084758.12c73d0c@canb.auug.org.au>
In-Reply-To: <0765D5CA-A67C-42F0-AFFC-9E9A3B3D0804@meta.com>
References: <20250212095632.6bdd50d7@canb.auug.org.au>
	<20250216224200.50b9dd6a@canb.auug.org.au>
	<0765D5CA-A67C-42F0-AFFC-9E9A3B3D0804@meta.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0AVouGLIbRP+I_3LulPuutp";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/0AVouGLIbRP+I_3LulPuutp
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Nick,

On Wed, 5 Mar 2025 21:34:18 +0000 Nick Terrell <terrelln@meta.com> wrote:
>
> > On Wed, 12 Feb 2025 09:56:32 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> >>=20
> >> Tree Last commit date
> >>  URL
> >>  comits (if any)
> >> ---- ----------------
> >> zstd 2023-11-20 14:49:34 -0800
> >>  https://github.com/terrelln/linux.git#zstd-next =20
>=20
> Could I get the (`zstd`, `https://github.com/terrelln/linux.git#zstd-next=
`) tree back please?
>=20
> We just released zstd-1.5.7 upstream, and I'm working on updating the ker=
nel to this
> version. David Sterba alerted me to this [1].
>=20
> Thanks & sorry for the churn,

No worries, it is back from today.

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

--Sig_/0AVouGLIbRP+I_3LulPuutp
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfIxo4ACgkQAVBC80lX
0GzApAf6AnfME6c8Qcay4vfh8xrlvJn0eQ1k9cQmtEptTd6bVYHIazJ9vcRp4YSw
zJRxRKuWTy9elTeFmX3xak3twqt2Kn+i3tU60BTvEdwEi19oGuLPLMvwNDxE/SVH
lp36aRfijPI5hBJYEpIO8u9XylOQsGo1l6xRDODdy3G8X1nMaTakkh/yyK9WJdP4
2wqMZtKbgtGOU1S9u2g0EhpUUiyS5pZRoML5AIjBMzAGGfGyy6FA76ccjVNBoASO
w+cQXTaax8A2/4gZuDIGAQ8MbyVaIznSIBzqnECrJR1WVkGM091XJ6NjySRPqa11
gPIhMWqMl9nqMecMlFVaorsooGPpyg==
=DLk/
-----END PGP SIGNATURE-----

--Sig_/0AVouGLIbRP+I_3LulPuutp--

