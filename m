Return-Path: <linux-next+bounces-9310-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BD774C9D652
	for <lists+linux-next@lfdr.de>; Wed, 03 Dec 2025 01:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B0FC14E12B9
	for <lists+linux-next@lfdr.de>; Wed,  3 Dec 2025 00:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 624F412D1F1;
	Wed,  3 Dec 2025 00:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kylLCQkw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E25C1B425C;
	Wed,  3 Dec 2025 00:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764721875; cv=none; b=f26JljHk+wTSfXgsFfHU930gJScd1WTzEugt5jy3W8wFPQgjiPv9ilraMJSbKxDjylUI8ibXv/EFMXI0+nb36CVMPo/P9D33BEB5nSV0lNJ7A5rCrEkkks1J483+xexc67LgylNLE9vkmxcxnM6nJWZxjU7rTk06yUT+rZzBjro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764721875; c=relaxed/simple;
	bh=Vt63jtMYKTujKQjNVZUuPIpufWnWC+AjI98oUB/Oc1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eOaU29cpksFlGqcs8Qpd8CVwzc6wE30/yS5gieqWO8mPjBZyWoRGeHZmN23LJ+G20ewtnR6zXBzLP+qXj+BtXtO4HrtFG4gMg9N9nVyYPU33Zqw0mTNIWFQZRXnJ9/8lHQpwYgzsGOyH3eKfP+kDu9HzYmARud9bErzDG9V0hmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kylLCQkw; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1764721865;
	bh=f2f+aGBX9NGMG9B9AGmfW4JrZhLrFW2Q240YIhLbv3w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kylLCQkwMTu2YRsbozZIzLZjt8+Sx5a64rdBGlGsZGsYY87yTDZiEy9J4Zo+ggTMr
	 BjqBtpS/Fbl+LpWDoR0bdVeCx6chsNM+CI1v6oXeimqO9a5V5GuQXLqxy8mTgptS56
	 D8YaKnSUKUpGE08fnwEZY/XyNaHNo8zvjMHFAKk2Rln7uLsZwblq2vq+3MtylTrO1X
	 HJV9jc5GlrH+ATP0q6NfexrSWz/EKrld+7u4vExxxXBbcQBPHkGts6eugyNJVuwp2g
	 lQmtLWUkB9oYBnp7P/mRc8xnZNpB1bAfJRevW365SiYQEu55UmDPaAPLrpWAkhztKT
	 Hp6WvylIsn/3g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dLdpw5HTzz4wCy;
	Wed, 03 Dec 2025 11:31:04 +1100 (AEDT)
Date: Wed, 3 Dec 2025 11:31:04 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the tip tree with the arm64 tree
Message-ID: <20251203113104.38f2267b@canb.auug.org.au>
In-Reply-To: <20251121130736.465b826d@canb.auug.org.au>
References: <20251121130736.465b826d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/e7dyJLizO81g8/8gOmByZLr";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/e7dyJLizO81g8/8gOmByZLr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 21 Nov 2025 13:07:36 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> After merging the tip tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>=20
> drivers/firmware/efi/efi.c:78:10: error: 'struct mm_struct' has no member=
 named 'cpus_allowed_lock'
>    78 |         .cpus_allowed_lock      =3D __RAW_SPIN_LOCK_UNLOCKED(efi_=
mm.cpus_allowed_lock),
>       |          ^~~~~~~~~~~~~~~~~
> In file included from include/linux/spinlock_types.h:12,
>                  from include/linux/mutex.h:16,
>                  from include/linux/kernfs.h:11,
>                  from include/linux/sysfs.h:16,
>                  from include/linux/kobject.h:20,
>                  from drivers/firmware/efi/efi.c:17:
> include/linux/spinlock_types_raw.h:69:9: warning: excess elements in stru=
ct initializer
>    69 |         (raw_spinlock_t) __RAW_SPIN_LOCK_INITIALIZER(lockname)
>       |         ^
> drivers/firmware/efi/efi.c:78:35: note: in expansion of macro '__RAW_SPIN=
_LOCK_UNLOCKED'
>    78 |         .cpus_allowed_lock      =3D __RAW_SPIN_LOCK_UNLOCKED(efi_=
mm.cpus_allowed_lock),
>       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/spinlock_types_raw.h:69:9: note: (near initialization for '=
efi_mm')
>    69 |         (raw_spinlock_t) __RAW_SPIN_LOCK_INITIALIZER(lockname)
>       |         ^
> drivers/firmware/efi/efi.c:78:35: note: in expansion of macro '__RAW_SPIN=
_LOCK_UNLOCKED'
>    78 |         .cpus_allowed_lock      =3D __RAW_SPIN_LOCK_UNLOCKED(efi_=
mm.cpus_allowed_lock),
>       |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Caused by commit
>=20
>   8cea569ca785 ("sched/mmcid: Use proper data structures")
>=20
> interatcing with commit
>=20
>   40374d308e4e ("efi: Add missing static initializer for efi_mm::cpus_all=
owed_lock")
>=20
> from the arm64 tree.
>=20
> I have applied the following merge resolution patch.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Fri, 21 Nov 2025 12:57:10 +1100
> Subject: [PATCH] fix up for "sched/mmcid: Use proper data structures"
>=20
> interacting with commit
>=20
>   40374d308e4e ("efi: Add missing static initializer for efi_mm::cpus_all=
owed_lock")
>=20
> from the arm64 tree.
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/firmware/efi/efi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
> index fc407d891348..a9070d00b833 100644
> --- a/drivers/firmware/efi/efi.c
> +++ b/drivers/firmware/efi/efi.c
> @@ -75,7 +75,7 @@ struct mm_struct efi_mm =3D {
>  	.mmlist			=3D LIST_HEAD_INIT(efi_mm.mmlist),
>  	.cpu_bitmap		=3D { [BITS_TO_LONGS(NR_CPUS)] =3D 0},
>  #ifdef CONFIG_SCHED_MM_CID
> -	.cpus_allowed_lock	=3D __RAW_SPIN_LOCK_UNLOCKED(efi_mm.cpus_allowed_loc=
k),
> +	.mm_cid.lock		=3D __RAW_SPIN_LOCK_UNLOCKED(efi_mm.mm_cid.lock),
>  #endif
>  };
> =20
> --=20
> 2.51.1

This is now a conflict between the arm64 tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/e7dyJLizO81g8/8gOmByZLr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkvhMgACgkQAVBC80lX
0Gx3GQf+JTQvPjCn+1S7fxQFXM9Ene1ALHqm4yHuzFEEVS5Ms52wEFzN0S/Gd/aC
ZMWxTben+e0yaVT4z7NggkiPhFnwQIVDHccHT9D0HsSpLKAKJfNHiYDdNk25jPzU
cFk3PBJ4YZko7CtrhY0rrU+k0Tt1+LQ1UNq25ofkNllaMfRvxRpM1B2tnVUmoBbk
A3u91ju940RWlmSYUoTxnmRqvDCHZWfoSUdqhf9sFTInvzOOn6kqMTc1GqYgUOSb
MavRUBBfEyj2a2+b6KGXvTnQtLr30ux3NY18YLjoLUHq7pl/ldOj0I6Vv0Z5JooO
QmvRbE9YyT57OuDlt3H7pER4FumWPg==
=HNqA
-----END PGP SIGNATURE-----

--Sig_/e7dyJLizO81g8/8gOmByZLr--

