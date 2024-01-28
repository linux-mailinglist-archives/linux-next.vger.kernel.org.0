Return-Path: <linux-next+bounces-877-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB8D83F39E
	for <lists+linux-next@lfdr.de>; Sun, 28 Jan 2024 04:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A57DB227E7
	for <lists+linux-next@lfdr.de>; Sun, 28 Jan 2024 03:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE280ECF;
	Sun, 28 Jan 2024 03:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="qN1eIaQu"
X-Original-To: linux-next@vger.kernel.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31021C06
	for <linux-next@vger.kernel.org>; Sun, 28 Jan 2024 03:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706412496; cv=none; b=kDO53dZ1drQ7Tqeq0+jPbPrFYaWb+Kt2nEO2IFQ1yVPgL/Uol+DGwvpdUxQihh6mlqqOInrnrKShGov/OQc2qpoTqEDH9avVi5DtJ5Fb71Qv2k90/ktly22dVOWCjl6MtHvRT/RdgbHX5+HEkv/9yJF4kXXeCr/FwIuMW49E+HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706412496; c=relaxed/simple;
	bh=jfQa7ZelUy6o+fp0n5geb9M7JjAOVeGEJq9p6CQLGiY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MlNjbbls3Zco3UFTJ9cQsmBzyb0X7slZFt8AHOu75p8bZzRH9NJeW8qUxmY1W/9L817CV+izJvbCbh/Y/EwtBOfHxbacXqYXiI00PqpM7Y7Xe3VGf8GHMRSp+lQGFr5niRxFIBN3TLDtw4yUdrG5EzqGIafPeq4i2U4mwjwvHwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=qN1eIaQu; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1706412486;
	bh=2lUjTwLeblIfXrXs14Wg7mKw5DgwDwCRc1zn9WqPyck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qN1eIaQufdFAinQ1FiST8mM570x8KvtlQ3hV6f12D4O8S211xhZfhnkd2Vl5oHt/k
	 EGziF4Fj9ZVsHhvCu3Up5WFJOZPWBIAIV3o6rBDk1puiNTfdVjGUowl8Tv+dY/Tmwa
	 jyucG1smaF7BA3JhB4h2XmAYM11pMgZ5GPQnv2ids8VIPFUIUCynFKv7+nsnhK+9az
	 lqOVbF1YU+K/FvcyJ6McfA7fEfeFxalIQPZjP8FpEFRflJMXN4hCEdh0iYREfX4Tn9
	 ajJv0d1fI1TpjXu/l2+XJs2BHgo4i5OSDUqQZuh445KmypBKjJEUhHu/PU6Tcd375p
	 KdktB5l19CO7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TMxhj6GFyz4wx6;
	Sun, 28 Jan 2024 14:28:05 +1100 (AEDT)
Date: Sun, 28 Jan 2024 14:28:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Wolfram Sang <wsa@kernel.org>,
 linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c re-inclusion in linux-next
Message-ID: <20240128142804.21d49045@canb.auug.org.au>
In-Reply-To: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
References: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.I4DII4qNuzPnjM34Rf/qab";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/.I4DII4qNuzPnjM34Rf/qab
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andi,

On Thu, 25 Jan 2024 21:28:09 +0100 Andi Shyti <andi.shyti@kernel.org> wrote:
>
> could you please include in the linux-next i2c related branches
> from my repository:
>=20
> https://kernel.googlesource.com/pub/scm/linux/kernel/git/andi.shyti/linux=
.git
>=20
> the following branches:
>=20
> for next:       i2c/for-next
> fixes:          i2c/for-current
>=20
> I have requested this branch to be the main repository for
> collecting i2c host patches[*].

I have added the 2 i2c-host trees using

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

i2c/for-current branch is known as i2c-host-fixes
i2c/for-next branch is know as i2c-host

both are useful as Mark Brown pointed out.

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

--Sig_/.I4DII4qNuzPnjM34Rf/qab
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmW1ycQACgkQAVBC80lX
0GxvjAf/SRR58Kd7HJ6tcbqI35enJnubFyrIbGRBcwBhY3jbj6ckvv8jx9DITAMl
US0XX3YatiJQUyw/beQTGO+Ll4XGUhyMBbuW3BK5qeFV3CSdmjPChTyOimROzRVF
4hBJCdgATjcA8cto42ag+NJXF/x8HWKjHvVcdk1SSAmlBKmz8gPHr5dMc857Nipi
EixQNEnKfsdYdwoZFIwrEj8NIWsO0YaAM1hf4+mOgP5+AyZFa/q1utKnga+2v1MW
fZ1JBgQDhz+25YXIrqc+EpRNZfvKQ8c1OzCkSNTtsJB3/3caZJpDuqr5enVJzyfj
q9hpv0N4on5f4AkEJZHdbNWkHLD1aA==
=pDs3
-----END PGP SIGNATURE-----

--Sig_/.I4DII4qNuzPnjM34Rf/qab--

