Return-Path: <linux-next+bounces-3975-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF34B986E92
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 10:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 029BF1C20A78
	for <lists+linux-next@lfdr.de>; Thu, 26 Sep 2024 08:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E151A3BAD;
	Thu, 26 Sep 2024 08:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Pi4Y0Ho0"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E009F1A08BB;
	Thu, 26 Sep 2024 08:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727338436; cv=none; b=BKR62H9hAFQmNfypj9ISwlbx0HWUHISzQi3YseaNV5+2MjecAxX9MduOAhe4NRyQTnE3qhz2jibbF60E5i3bbX0L5w9Qgi9H8w+hJliv2HksgoH4hdTcG72HpZ3gKVBwDE0kr51qEfJCaDzcvnTOlwaULSAMfRKWTeh9W5ELW6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727338436; c=relaxed/simple;
	bh=gtfhf8OezGsXsNL+7JC62abo2IXzA5iCeRDFTRqvKE8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ni+WgRPECfpCo/4jFAL+GCfXVFC/TDMEhxxdQVHfyeQ/K8mSSXpBuRiPrSU68kPxEUxs51N8IRBxngLsRHz8QtzRFWQAagJYkT7OSRAs4hdv85P6GocNHfZ0SrYKQ42dkKb6GBDrdmcwIWMApgwmICDM2laUFna76d8M/1kgaD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Pi4Y0Ho0; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727338430;
	bh=PEnf7XQ3pwhmzyYD2FyKOM1aDZEWGYfAC5GE1QdrxBI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Pi4Y0Ho0/8V7vhQBlVixJx3z186hIAbJPyANIVocU9e926ZdF8m0B4IHakCE00S50
	 Zos9wa4N2MG+MIvhIpUH5T2PYvqqnUggt3HuCdidtItu4WN6CTTlhbdcjZeTyDQoP5
	 ZFMbq2XiKLXMb816lBlQnlsvZPyxuw95ngdoxGsA3QCdZjbOzW1JkUeI9Gs2ppPcAe
	 QjoGcxTsm/ssCXP1/RD5Szz7UN2paAzJXPZI6YbDIELccpYukgtysDKxwEZLs473jC
	 sBQyCaB8k42hfo/LyBuvSxS+i0sBbn3In7TySuYh3vMrtqUlkBrmIoXxAicfMfRK5s
	 T2Nhu0Ue9OZsA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XDmZj5FsQz4xKl;
	Thu, 26 Sep 2024 18:13:49 +1000 (AEST)
Date: Thu, 26 Sep 2024 18:13:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Matthew Maurer
 <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>, Gatlin
 Newhouse <gatlin.newhouse@gmail.com>, Kees Cook <kees@kernel.org>, "Peter
 Zijlstra (Intel)" <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
 Andrey Konovalov <andreyknvl@gmail.com>, Marco Elver <elver@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of Linus' tree
Message-ID: <20240926181348.3965b040@canb.auug.org.au>
In-Reply-To: <CAH5fLgjRVZA3Gmb7Ogs+Y65T38EpNVeVEqmg93ZB4dn0Y7J3aA@mail.gmail.com>
References: <20240926100434.45d58861@canb.auug.org.au>
	<CAH5fLgjRVZA3Gmb7Ogs+Y65T38EpNVeVEqmg93ZB4dn0Y7J3aA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pN1NbLx4JOEoDEryvbIQbMg";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pN1NbLx4JOEoDEryvbIQbMg
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Alice,

On Thu, 26 Sep 2024 09:36:56 +0200 Alice Ryhl <aliceryhl@google.com> wrote:
>
> Sorry about that! The fix is here:
> https://lore.kernel.org/all/20240925141944.277936-1-ojeda@kernel.org/

Thanks.  I will replace the reverts in my fixes tree with that until it
is applied to Linus' tree.
--=20
Cheers,
Stephen Rothwell

--Sig_/pN1NbLx4JOEoDEryvbIQbMg
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb1F7wACgkQAVBC80lX
0Gz6Tgf/WBZ7AJXYAwSd8rfWq7qev4kEyLz4CoY2Xh/ii7xWucmrUKVjDDJshsVT
WKbxLxqY1GpWbwD7h4MIMlyVy1lgmFPoyuvxEU6py+TsWL4cW0BKYY27LDgDMuTe
7Vj7elkvYhnRtO3qSzqO5uwOL1mLxUwkPo5697UTj7GNq1ZKBCKux9CuHanAtOir
FOHWzPev9P8lNRX9eHp/Jl+crPPGffhBRgHUL49E6dXYECkoqBCExZc2+oSM+sIP
JMe28A/Cyy3i8DR5ghc19rkfAC8Owbi50NLj/YAEa8FSWu+9JYMZnNOB1uFhPEFK
8AfQK68ozOVVPnNYdgF6J7Bvrp4alg==
=Xx9a
-----END PGP SIGNATURE-----

--Sig_/pN1NbLx4JOEoDEryvbIQbMg--

