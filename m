Return-Path: <linux-next+bounces-6977-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C6AC7723
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 06:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E58AFA27077
	for <lists+linux-next@lfdr.de>; Thu, 29 May 2025 04:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABEED2512EE;
	Thu, 29 May 2025 04:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="oDDga9Z7"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6202517A5;
	Thu, 29 May 2025 04:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748492879; cv=none; b=sSArLBPG3f3eyZZY+qcM5DFOf0xPvQb1pnkhj5yDi44b3eOYxW2pDB0nKdBFnJrs012xKr6KjFT+YxMCJOmZ/LA6mdmw++1XUZWRndTM77Ekwnx3MdYyLsc58kNO2EzBt5fUoYc20QzfwlEOm7VymCtzhMzv5tRW47r5NBNEXnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748492879; c=relaxed/simple;
	bh=XD2T8VHei2RQ2fjKdW1rvkRU7kCeHcCu4eGrMkTFQAo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rDafayBALeYPpl+DxYMw8OxcS2R8EFbzPEibDjjq/paciikyPOhkTXejDZeCOGSSqktVXR1zH9CFm4D2VROaj2XbXhQt8NbWm73JTc0DE32ifgkn1OkApt0AaAgtZj/j69lhxzf5MWeQB4c98WjleGsFcR/IUN0lwcKygxRzQKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=oDDga9Z7; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748492870;
	bh=OZde2YheZuP78/gmt1PHhzNKP/wDfoP6NqScxXKB6k8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oDDga9Z7462s+tV1z3FhxlIdbkoDP79wmuV3lcpzVkRvP8yX47z6bIvgqFjZhjV3Z
	 i6mirlTWErzLPSjCY9EFIh2yJTNGxFau45G5aTgSBah8xOzWP+f+UHcpHBUckYHSkG
	 hXOdt787pvAgTRiIHHliqscMzH/fcnhjY7Eay92CG99+JKSOO7kSMjDug/DcqUAx0b
	 ko7IZeW+9RsQo52Hy33m0D3KhRMGUZ1jO2xc9ZI6pJlDeM04tVB9GU6canNywiYvqK
	 txCXTCQM1/x29ItuyWtC1pLh01oCBM8jHRYhOtWt+92muvzAl3Zd94znXD1suQhggj
	 qoz4HujeIntZA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b7Cys5nHzz4wcg;
	Thu, 29 May 2025 14:27:49 +1000 (AEST)
Date: Thu, 29 May 2025 14:27:48 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mimi Zohar <zohar@linux.vnet.ibm.com>, Dmitry Kasatkin
 <dmitry.kasatkin@gmail.com>, Eric Biggers <ebiggers@google.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, Steven Chen
 <chenste@linux.microsoft.com>, Tushar Sugandhi
 <tusharsu@linux.microsoft.com>
Subject: Re: linux-next: manual merge of the integrity tree with the
 mm-nonmm-unstable tree
Message-ID: <20250529142748.052c3d2b@canb.auug.org.au>
In-Reply-To: <20250430142331.468074f1@canb.auug.org.au>
References: <20250430142331.468074f1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/IU0SUp3IlnQIxdfVdqQQL5m";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/IU0SUp3IlnQIxdfVdqQQL5m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 30 Apr 2025 14:23:31 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the integrity tree got a conflict in:
>=20
>   kernel/kexec_file.c
>=20
> between commit:
>=20
>   912e32afb858 ("kexec_file: use SHA-256 library API instead of crypto_sh=
ash API")
>=20
> from the mm-nonmm-unstable tree and commit:
>=20
>   9ee8888a80fe ("ima: kexec: skip IMA segment validation after kexec soft=
 reboot")
>=20
> from the integrity tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc kernel/kexec_file.c
> index ac915eabb901,0adb645072aa..000000000000
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
> @@@ -762,7 -800,17 +786,14 @@@ static int kexec_calculate_store_digest
>   		if (ksegment->kbuf =3D=3D pi->purgatory_buf)
>   			continue;
>  =20
> + 		/*
> + 		 * Skip the segment if ima_segment_index is set and matches
> + 		 * the current index
> + 		 */
> + 		if (check_ima_segment_index(image, i))
> + 			continue;
> +=20
>  -		ret =3D crypto_shash_update(desc, ksegment->kbuf,
>  -					  ksegment->bufsz);
>  -		if (ret)
>  -			break;
>  +		sha256_update(&state, ksegment->kbuf, ksegment->bufsz);
>  =20
>   		/*
>   		 * Assume rest of the buffer is filled with zero and

This is now a conflict between the mm-nonmm-stable tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/IU0SUp3IlnQIxdfVdqQQL5m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg34kQACgkQAVBC80lX
0Gy7Ggf9GQVPyXeSX+PfTi0IRd7jQxwhxe20dEmBvDZq1co0rpjk2AjvZvypkcKd
ylQm8NQUaMmhCJncwjBn9fU5UJNYeIaqP7JJ7jsbWB4wolmgfibUfcbx1BxieHC/
j2EY/qN1KAqOtkzGkxP+Vu2Fc8fxtEOcxBE8jqHRNZUboxmeoxszvdbaaTJp9l52
SisqbM8e5yyT7L4U7F8Y9AJIcOMxtb0UG3yH9wj7h6BRuTqH6X/PRUYy3vZfIEh7
qljEPEe600spQ+kTafx2tpCsriuQlpOhliROum/KqY6hvWZPusQZuvqLCwO+Ymr9
XgOsa5HFMFdcolOEz6Jrk+2Y6IK+Ig==
=2flr
-----END PGP SIGNATURE-----

--Sig_/IU0SUp3IlnQIxdfVdqQQL5m--

