Return-Path: <linux-next+bounces-6485-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4FEAA5C26
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 10:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8419E1B650AF
	for <lists+linux-next@lfdr.de>; Thu,  1 May 2025 08:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9CA61DE3A5;
	Thu,  1 May 2025 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kxH5wg7Z"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B74B1411DE;
	Thu,  1 May 2025 08:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746088335; cv=none; b=iMUDyKdi24p6upI653Mau2E45TXeVxfoKtaxqVHktvwGuezlxKBHHaD44KdozYuDuO4UAmlr20cZ+KZEE7m5IzB18/PAMMk9DHjZOPBZneRPbWissHU+OPViRZQxX+BqFDMpx7H/zuWT3gCXHUq8sDxOVUxWYZukTOy9TsAyjxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746088335; c=relaxed/simple;
	bh=wAH+GD/swgqBgMz4hNB4V9u4CWycVBO2eNNzQwowcng=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FCh9P1FsKrGO7uqHEA3ywGc1RQM9vjK0bfUrJigUkbn9BzbomCwcOiHp61d71bW9QRiBwVABgPtI5U3Rzlx/fHSMvzLaeEsL9F8pmflh/0Ez3C8C65VSrtuBR7LWztb8xw4WLAyo/ds5/zw0Si68SkCh0MRFacvA43xJwYIjtJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kxH5wg7Z; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1746088331;
	bh=4WePGuwQi1sTWSiKaivarIWJT3Pd/qAmO5EFwFWhXpY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kxH5wg7ZrEOH//tO6x7aYiqht2kaJpsuXZtC1eX/Fypsf/tbB0CahYOm6/+kMGwTH
	 QSUpGPx+vLgqVjPJbPqYNdoadVCV7rqrQN5N6sdSe8EvFT+/0NyhdlDM3o29cfznXR
	 i6D1DjV2gbq1bm7fiy5LD2HwKWBUOVGM/srJ861Y0XV9ZwMJY/ciijq+3IcUpMUtHp
	 GS0mRBa1d7MCO4PCN7e3m/+LfxFgzn/dbUbGTx6K/dUY2TAlpcg7U2oDDzFvZeCeWs
	 ZQYP9U2aLjPGvXTLZBj68xQLQcHUqmUPbI6xK5Z2nb3qUAmZqbVxGGklskCGwxBtmT
	 JTCg8dvs9C9sg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zp6jl2X6yz4x07;
	Thu,  1 May 2025 18:32:11 +1000 (AEST)
Date: Thu, 1 May 2025 18:32:10 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Danilo Krummrich <dakr@kernel.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust-xarray tree
Message-ID: <20250501183210.639f9abf@canb.auug.org.au>
In-Reply-To: <CANiq72kSReDcMU=eezmgsREL5+1FSnq9_VuEd-8AtU86W6UoNA@mail.gmail.com>
References: <tAJ0jyptJ0jLaRp9siDw8y2iw3S7GeuC05Uncum-qihlIKfCfEVhQbGNuTengQ0kWpnNp7OoTITxbEdf6nDTCw==@protonmail.internalid>
	<20250428203943.51dd39d5@canb.auug.org.au>
	<877c344gmp.fsf@kernel.org>
	<20250429174451.42a368af@canb.auug.org.au>
	<CANiq72kSReDcMU=eezmgsREL5+1FSnq9_VuEd-8AtU86W6UoNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/HE9EWZrJ7Q4ZMJR=OkxM7c+";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/HE9EWZrJ7Q4ZMJR=OkxM7c+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Tue, 29 Apr 2025 17:33:29 +0200 Miguel Ojeda <miguel.ojeda.sandonis@gmai=
l.com> wrote:
>
> On Tue, Apr 29, 2025 at 9:44=E2=80=AFAM Stephen Rothwell <sfr@canb.auug.o=
rg.au> wrote:
> >
> > I have applied that from today and it all builds fine.  Thanks. =20
>=20
> It seems a couple spaces got removed when applying, so `rustfmtcheck`
> fails in next-20250429.
>=20
> Would it be possible to run `make ..... rustfmt` as a merge/build step?

I will try to remember to run 'make rustfmtcheck' whenever I do a merge
fix up on rust code.

(hmmm, no leading tab characters - who knew :-))
--=20
Cheers,
Stephen Rothwell

--Sig_/HE9EWZrJ7Q4ZMJR=OkxM7c+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgTMYoACgkQAVBC80lX
0Gy6xwgAm8JBkI2eAKcLpAc/hyatkot5sl0StzG3o6h8Jeem/ECBp1VLg6Xj7Mz4
uaE4AtvAEGYJAXbWDb3Kovitei5GmE57Y09oOKifTqkfKYpRn88CaJbettPLqfyN
LyZdqreZ6IcJHmsO3+2SUVo7tGmDDyMPPaI7yHcBSI2oZfgUPjvDg7JEJ10g2L0f
gjJwZes9igiRMi2c1IWv0w7akhgjw2gUt8B1HbgUV5dTG7n3T0SjSSMAIkeiH5X9
8Aj5cCUoAWNbEsC7K2GgURpWDWTTc0E886/S/WhNxDo9AaTQA0CoKvq1o/DEGU/q
1v0kTYJTjdgjvWBbK/K2QucULe58QA==
=rtm9
-----END PGP SIGNATURE-----

--Sig_/HE9EWZrJ7Q4ZMJR=OkxM7c+--

