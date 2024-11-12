Return-Path: <linux-next+bounces-4756-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 286E69C4EC6
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 07:30:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA2DBB2573E
	for <lists+linux-next@lfdr.de>; Tue, 12 Nov 2024 06:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78636208203;
	Tue, 12 Nov 2024 06:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="VIAME+0S"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886F45234;
	Tue, 12 Nov 2024 06:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731393038; cv=none; b=fUarVSd7nZdyy/09ist1uUmITglg6nEf2piOTQhCioLroqzuVyApJ7tSJl6f7sMxpcorN2Aea2/Hv0YphLgVzzySq7t7j9TmLvfJaLMEyQ0skncY8OnLij6ZpwLrJfbXP64U3Eo+q/h8KP+AucaDfsyj2hmvEME548LyBCoASZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731393038; c=relaxed/simple;
	bh=ZamXW1gOCoJT7299mt7TjY0oZlhR+DtytP5GXkfobT4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=swA6B85brmavrlxMqMniM937qLJ4dfzBt/ccqtC1UkQKLCUIOB5SDgPmjJEmPk2uyBzmvOvJRAOrp75+r1Or7hXMWkNmqumkGT9P/VtM0b6uyqfeVYeLbngprCPnC4M1ZnKKWEbpJVEMCbciieLlNnfBh1D+1W0qeAEOKb6PThs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=VIAME+0S; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731393029;
	bh=ZamXW1gOCoJT7299mt7TjY0oZlhR+DtytP5GXkfobT4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VIAME+0SFPNmDw6F3RWVElW2DTXlkvpPJ1l5NdmewntS4Mgbim0aZS/seNnFpsUAD
	 DI2FQLS5BTs3p4T97/ScZwZjlBBAtGQkJIdSym/3Oq+wq8gtkvFy7fsUUllTe/yKHd
	 3ohh0Fl412lzjWRA/oCG3WLTxsyBLoDGeWHQgTpWxO72cWtTAt5Dj+us5sMd5tKhvn
	 jPD3WgfnpK1a4OnYQCwghb4Et6wrFukywwgH/7he0irh2Y+UbOSu3XnStrIxgMD0mk
	 mtNsN9/XysoguTVa5/RPLEi4+QgIe65NyfzLwEExzuTcQpP6+lR+ycOGstLa5w3mME
	 ns4U/7vNdCoog==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xnc3n3Gpqz4x2J;
	Tue, 12 Nov 2024 17:30:29 +1100 (AEDT)
Date: Tue, 12 Nov 2024 17:30:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rust tree
Message-ID: <20241112172920.6aedc927@canb.auug.org.au>
In-Reply-To: <CANiq72mYq-53xB9WFTH3H78WLrQuJze-nEybjwyLqnrSbv8UqA@mail.gmail.com>
References: <20241111175842.550fc29d@canb.auug.org.au>
	<CANiq72=JhmDJJCgcG5ex2A1gvBxCg3wzzutUc3L1HLPrPsHeyA@mail.gmail.com>
	<CANiq72nyWAhyORsDij6P6U7Ww=eCp6S=LzPWZN4wxGD8JiK+RQ@mail.gmail.com>
	<CANiq72mYq-53xB9WFTH3H78WLrQuJze-nEybjwyLqnrSbv8UqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=99vlNttIZwjw_HnFWa+GvR";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/=99vlNttIZwjw_HnFWa+GvR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Miguel,

On Tue, 12 Nov 2024 00:58:47 +0100 Miguel Ojeda <miguel.ojeda.sandonis@gmai=
l.com> wrote:
>
> Stephen: I went with this, since unless I did something wrong, you
> should see those build failures are gone, i.e. your build resolutions
> were fine.
>=20
> The hashes didn't change, I just dropped the top two commits.
>=20
> You should be able to reuse the resolutions from yesterday.
>=20
> If needed, we may simplify further, but let's see if this way works.

Its all good, no build failures and conflicts still there (but rerere
took care of those).

--=20
Cheers,
Stephen Rothwell

--Sig_/=99vlNttIZwjw_HnFWa+GvR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcy9gIACgkQAVBC80lX
0GxL7AgApNQT+WgM6k+ao3utScRunxuPJjtYCCw3xoH1nCEXIfWhdtmJWeOs2Fa2
fjL4W0hG18jIgKuMxZ6fT/zXIEdCHBL5pEQWNMNLyK/HIsSkvPNkLUQAs9Ulamgs
BLp5DcMpvLKvNf/jZIHY76Iqf7Nkwpiix0OB2QXyP6oyJkuArnLucAg9ymkARbJZ
dHetLqWMKR7xF3PsssWaNIdzMFW6SWmfdw1Gi3yZeykOaqQp7q1CzDEOU+eT93zM
tBV6rl1eT07ob95TD2YzWQOTXVQhK/hGQiBqEALByrXyfqCje+mAmXXw8ENzvDRV
5KT3/ryk7FfNZQ7OiYrhkY0eY5LUNg==
=Ug1Y
-----END PGP SIGNATURE-----

--Sig_/=99vlNttIZwjw_HnFWa+GvR--

