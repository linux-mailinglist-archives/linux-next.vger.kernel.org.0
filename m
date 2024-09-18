Return-Path: <linux-next+bounces-3906-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 813BD97B76B
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 07:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2868F281EEE
	for <lists+linux-next@lfdr.de>; Wed, 18 Sep 2024 05:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77E3013A3EC;
	Wed, 18 Sep 2024 05:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iQSYXFIU"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F62136327;
	Wed, 18 Sep 2024 05:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726637328; cv=none; b=dBLxvl4R/yc7I/38acZqqqOs4T1A1rPWhuQ/VNSZBki/Qvv4218kwKWyhvXWXv601YiNiQE8AYwm6wvxooXXc+eCL2IS9x4rvm9e6HVgyuclzF5sCw0dQtPjy4iHUu7fXYvKfrxHyVUkmloZVjEDAYPzGK9vKJKUrlblRXrsdXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726637328; c=relaxed/simple;
	bh=lB7LzObot2q4wNKcLyFswn2RrK7FM7PDG1XP+iYKBNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HtABNWg0gjCqoc5MDWTY4yJsj4Ot58zjrakE1mTFZnGn4312XGQFiVAILAz9auPKI0o4TyDH184u0dvq6Uex2GbqN8tAS+kTdm6RRPy7QsnnVJ+qGhErfEBQ2x4IpsGwy4PT3JoK/rPx5guZPo3AU9VAC7FbVbWp4vKUs3FvDuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iQSYXFIU; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726637323;
	bh=5dBCc3C7Ind895xw3CX9V3i5yWmEQas6TuK9vhCZqgU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iQSYXFIUCzo/EIWJciTepmLMSWdDRAWIOLUVK+KXjJYfk/4xeoAyekgJjtjiEa5xw
	 SZoef4VJ7WxTQZ1RqYyrfrneYpnH3TFc3YBPAyoMbP6QQ7T2uceh4Nb51enArA+gZG
	 ElqYa46CKIx3AqvmHeWbUsIdMgVd9BeRpg+mTHWufH6SznrsqmS5eLw7wpFT3wa9Zg
	 jD2083dy45EM4pgX0vHC3hjqst6QIkB+85eY2H2NZ6VRjYqY9fweo0Jg5RZG+iIAln
	 nwe65hI/iLuNc/SU9KkkqIYDj0eNTBurvriVDCoOg8LIK43KUWuhXY2FEz6dyPwzgU
	 UvK2GrVVcupwA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X7nHt4Yqpz4xKW;
	Wed, 18 Sep 2024 15:28:42 +1000 (AEST)
Date: Wed, 18 Sep 2024 15:28:42 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
Cc: Andrew Davis <afd@ti.com>, Hari Nagalla <hnagalla@ti.com>, Martyn Welch
 <martyn.welch@collabora.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rpmsg tree
Message-ID: <20240918152842.06806381@canb.auug.org.au>
In-Reply-To: <20240828150900.7ffd7588@canb.auug.org.au>
References: <20240822142603.3608a26d@canb.auug.org.au>
	<20240828150900.7ffd7588@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LrgYLQ.hDLWyNjpUQVOyQk.";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LrgYLQ.hDLWyNjpUQVOyQk.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 28 Aug 2024 15:09:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 22 Aug 2024 14:26:03 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the rpmsg tree, today's linux-next build (x86_64
> > allmodconfig) produced this warning:
> >=20
> > WARNING: unmet direct dependencies detected for OMAP2PLUS_MBOX
> >   Depends on [n]: MAILBOX [=3Dy] && (ARCH_OMAP2PLUS || ARCH_K3)
> >   Selected by [m]:
> >   - TI_K3_M4_REMOTEPROC [=3Dm] && REMOTEPROC [=3Dy] && (ARCH_K3 || COMP=
ILE_TEST [=3Dy])
> >=20
> > Probably introduced by commit
> >=20
> >   ebcf9008a895 ("remoteproc: k3-m4: Add a remoteproc driver for M4F sub=
system") =20
>=20
> I am still seeing this warning.

I am still seeing this warning.

--=20
Cheers,
Stephen Rothwell

--Sig_/LrgYLQ.hDLWyNjpUQVOyQk.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbqZQoACgkQAVBC80lX
0Gw65Qf/VDxpvIZiPLiwJbo/6Xr+lzSlBFQyVLIKqignP+wMIzKodaNMwMtkNus8
lOlp//iS5ySUZep34ejEOg9Xy0hKNdgryZcb7cH4rdF5paZzd6TnuOBb8ZR63tkG
oo88zAqgb3+rFMU1yWD7SfQXPbZp5X4RYXJGAAWajkexHM6yu+1hyuRSRfopMy/4
+WTLGIKjyV7Vd9596NY5xgiwTYCF7KU8yXeEvufFsLVcfsrFPFYtkYiEjlRo67ay
+/iXwJpGOGlkwoHVctT8lQ8SgTtPjGO/i4c/18vddRQnPqgM8v8a99be3itT6R4Y
tboU7BduQ5vpBjFyTVaQT9amd2QUfA==
=a/QJ
-----END PGP SIGNATURE-----

--Sig_/LrgYLQ.hDLWyNjpUQVOyQk.--

