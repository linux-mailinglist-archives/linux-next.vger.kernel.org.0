Return-Path: <linux-next+bounces-912-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D96DF842E9B
	for <lists+linux-next@lfdr.de>; Tue, 30 Jan 2024 22:22:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 973A4288673
	for <lists+linux-next@lfdr.de>; Tue, 30 Jan 2024 21:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B893762EE;
	Tue, 30 Jan 2024 21:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Ebipwz2w"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EE278B64
	for <linux-next@vger.kernel.org>; Tue, 30 Jan 2024 21:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706649760; cv=none; b=aF9b2/62rbBnk/OMyrDdNXSyC9yx7SkQJEMCTnLQb1BsRsoVGfIQkswss5lQ9RzC4x2SxTclNUaKOd/mhO1o5lqIYzcIv5lVlMJ/+qAl3LEoT4x16cV50b4pqRHY39OkcMqMmM317jman0N8MXPlM5uuIOm4ikiHsbcJqq9rMSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706649760; c=relaxed/simple;
	bh=dSEeLsJD99qZmjSirH1KeJv0xTvN91vmhBbr2d4vxIY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XFoDEhm8/2+n/gnfcoDiTZ52DQfEke0aZfp5/qwPKBHCsDGRD4om0NBiMhqe5mxKfw14wU2ZHEnAg9iTZzAi1hYJJzs4tj42A/+17JZtTrubMwNPfsmCJ+jIEo5CQ+HTpBZUuo2sJeJrapq+jl6xJ6iqkp302x5G8wnNGV996mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Ebipwz2w; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1706649749;
	bh=6gWy8mjOvkWMwblgvWqPh06I1kZHTJJSrl9mU/cTlbU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ebipwz2wKbQb7UCNrAB8/r91V2C+BG7PkaPjQa5D4rplkebp0tpuz/tVGcvYr5asa
	 WeCjMVcjQIneUO4DOaAfb18jLZ2x66q8wQCmohbZ+M7FJUGOu4FblBFlT01pe3Fyde
	 VHtnNkc+Fkf4YAOgZt6k3+JD14BZ+0tyGqEKhI/bO8i6c1NApUlm4Z9HhmNQsk4F+z
	 e9WODuXDDfXBvNIDLDGrJ5umG/Ln1BfQdGAtbbkDP8vML+EirIYc3MxwJJmedjkVVp
	 hJSPbVAcWJQB1gvKUTlGJ6pqaPxre3rB0jZnK8Ahe+M+XY0J5t8iWZNLYzC0swjP8p
	 veaeINuqkHwLw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TPdRS2Kngz4wxv;
	Wed, 31 Jan 2024 08:22:28 +1100 (AEDT)
Date: Wed, 31 Jan 2024 08:22:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: linux-next@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>, Conor
 Dooley <conor@kernel.org>, Chao Wei <chao.wei@sophgo.com>, Xiaoguang Xing
 <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com
Subject: Re: Include in next: sophgo/linux.git
Message-ID: <20240131082226.3eb882ac@canb.auug.org.au>
In-Reply-To: <MA0P287MB2822E0B2A8CCC033CC5AB2CDFE7D2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
References: <MA0P287MB2822E0B2A8CCC033CC5AB2CDFE7D2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ljVxLNs/9UJXS+MKfLfllYh";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ljVxLNs/9UJXS+MKfLfllYh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Chen,

On Tue, 30 Jan 2024 16:02:01 +0800 Chen Wang <unicorn_wang@outlook.com> wro=
te:
>
> Please kindly include in the linux-next my new tree:
>=20
> https://github.com/sophgo/linux.git
>=20
> branch for master: for-next
>=20
> branch for pending-fixes: fixes
>=20
> Repo will be collecting patches for Sophgo SoC which recently we (both In=
ochi and I) took over:
>=20
> https://lore.kernel.org/linux-riscv/IA1PR20MB4953B158F6F575840F3D4267BB7D=
2@IA1PR20MB4953.namprd20.prod.outlook.com/
>=20
> The patches in the tree will be sent to Arnd Bergmann and soc@kernel.org.

Added from today.

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

--Sig_/ljVxLNs/9UJXS+MKfLfllYh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmW5aJIACgkQAVBC80lX
0Gz+8QgAjPiydWIkltpjhweudaGKoHr0iB3AaA25CGGZc5B9b8TVoHksyB5bkO/n
gek29wV5pONuGYN16ePuNz+UaCVDoGeF1vpZ8VsugkyDbAO2/Cxag0Vdkel9H2mg
ALMVmSpp6Vw8Q32p3uEbLHGEWstHeiEgD4BBci2Zi04CYP7i1YNs9gxr+rHd1INx
7YkY8Zt8s4uAvHAoC+bSne2ytH36XpXhCJG8fhnkhU2Y+qnWX2MSBm2qaJF6zuBP
p3pogIiDkZNBfLCUKAvhAyKvjhUoJX0EG/R5N1iZJzS3Qd6uSFnY9T9dEtdHXRmZ
uWgwIjzo2CIXhWhKir9M+PcCHsr1mw==
=5LTW
-----END PGP SIGNATURE-----

--Sig_/ljVxLNs/9UJXS+MKfLfllYh--

