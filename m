Return-Path: <linux-next+bounces-2304-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1508C5E03
	for <lists+linux-next@lfdr.de>; Wed, 15 May 2024 01:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAF1F1F21B82
	for <lists+linux-next@lfdr.de>; Tue, 14 May 2024 23:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB048182C8F;
	Tue, 14 May 2024 23:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="NsyRQaSi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A146181D1B;
	Tue, 14 May 2024 23:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715727926; cv=none; b=PJ/h/+TezuiUtrA2R89ZA9eEOxHWe5ulKkruyxlKMl80Tn//oYI8+8DnkWcM5xuhzpDuSO7AKqH+Xz0Ghj8HEafLYynN0RJkoCyEf83DRHlU0QlQtTZtdL4FKCrrhFUWifk06yCnQyTlCIHCxha3VHbdwJacu6Xp5ZlokVKo+FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715727926; c=relaxed/simple;
	bh=SbLU81ORL7YzL3SUprjij+0aQnGZI8VWXXT68rQXY24=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C+HelsmES35K+GOTnI13RJqI0lpP6cNJ5Ks53qpfcrHhHAutWcpbEEuJwi146YYnYFy/JvrOUIOtetzicjuha69kqJ2fzPXk4fvILjXsZ/2dClboJ0JfeKM0IhxJc0hoWnhoWArpnrlRxZ4AUJADnv9WB/zCSYKeOsZXSXpyVgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=NsyRQaSi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1715727922;
	bh=VpaTSHDEiNrRYywgsRc6OEQ9NT0lMPqheUmE7sxP/5Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NsyRQaSiqbFavwDRHp6BL7PoYiNzsBc/e7jeYxg6K4MwNt17Xo065/Clk2BSczuHA
	 WgwpTg9qVgR697AuD+0ktbCbfIkJinKe8hWA6XpVXnbyJSv9GcjOlZhhH29jhkltZc
	 zXigvIU+EZf1ItOMoIatKlJBd+KECBsLXJcY1MRc20EscchIYrLuLVSWKEJ99gBQsC
	 wmL1VYYrl+l7pbgCmMUvGMThIZWNTnGwR82mtojAa0XPPpvJtfucAFi4VFiyAY9O3P
	 E0VWvB+aPtM27/AwRv1Pi4RDhTK5P2pI8GqnP/RHE06Db+L0/gp7M1wMz8OAcGjqMd
	 C7Vk+Hey4Lkmw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VfBlj2LgGz4wc1;
	Wed, 15 May 2024 09:05:21 +1000 (AEST)
Date: Wed, 15 May 2024 09:05:20 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shuah Khan <shuah@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, Ryan
 Roberts <ryan.roberts@arm.com>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: linux-next: manual merge of the kselftest tree with the mm tree
Message-ID: <20240515090520.64d10d05@canb.auug.org.au>
In-Reply-To: <20240426154414.4d408fd7@canb.auug.org.au>
References: <20240426154414.4d408fd7@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7niloPDGA7G/gbEQ2VHM=ef";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7niloPDGA7G/gbEQ2VHM=ef
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 26 Apr 2024 15:44:14 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the kselftest tree got a conflict in:
>=20
>   tools/testing/selftests/mm/soft-dirty.c
>=20
> between commit:
>=20
>   258ff696db6b ("selftests/mm: soft-dirty should fail if a testcase fails=
")
>=20
> from the mm-unstable branch of the mm tree and commit:
>=20
>   e6162a96c81d ("selftests/mm: ksft_exit functions do not return")
>=20
> from the kselftest tree.
>=20
> I fixed it up (I used the former) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

This is now a conflict between the mm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/7niloPDGA7G/gbEQ2VHM=ef
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZD7jAACgkQAVBC80lX
0GyiAgf+OCW31GgkHwyWhLANshWwa6jnhh80C9HWB5v+2bXxyXfUbgPEf7ksaWE5
aqBGFMGttHNiDPlRczBwBoMpznFLYerxNSf1fTP/IZEeJ+2ujyVXKnh40wwPd0QV
hkO+dfyrLL7+ruafeo9juv+xT41nGyx1FXpxLCm02rn4aRBYiqpeW9GQhOjpuEoN
vfX4G2L0Sop8o9sjax/hqagNPDP/1W4yKQZwph/UcU55t6Uh+qQpzuh22WX7Acwh
sDv7i09FodUwFVdaHZ4wHLKASyUh0pS3V9UIgHMzJrQZY5uuoChu+X26cstj32Xp
qKTd9AAVG2dZnlNTQJpfe81yROGzPA==
=Ijr+
-----END PGP SIGNATURE-----

--Sig_/7niloPDGA7G/gbEQ2VHM=ef--

