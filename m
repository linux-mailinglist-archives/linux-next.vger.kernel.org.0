Return-Path: <linux-next+bounces-6947-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08640AC5EC6
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 03:23:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7291165EE1
	for <lists+linux-next@lfdr.de>; Wed, 28 May 2025 01:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D2E716A94A;
	Wed, 28 May 2025 01:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="HRVFZDYi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715C17FD;
	Wed, 28 May 2025 01:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748395408; cv=none; b=u9Rk5P0NmD9yt8qtiw5q0vr4AREG4aJSCNr0YtxpUnb/9TH1MqhJXhKG8rlK2aE5R5xi4BiBMl1eQeUOENV8dD3cm42B+XnjwNYsuYm9VtvHZ1oVD0SwEEAyHWGyQ8E+Fy5zuzIYFHkNBYLEoPdDscZn1PUCFiXXuuDNNoSEsqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748395408; c=relaxed/simple;
	bh=kppKiqGJO9TUnY2FuNsyyELcsxc+RskCGuqdIO8HV1I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kBmgOKs53h7hObPw0Tx2hQ5MmJWDMcgDIQSrmuYzmUd10K0yswflaeQa58y6D16FH9RoqplaSCGB6XGUzjvIVe/kpoyEalqSWawErn0gETWzDuFOgOQP044PYyvUSWAqyU2OJtMpnbfZiJTy9DgstAfDbxB0gs+y73aUhAZRYxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=HRVFZDYi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1748395402;
	bh=B7RNa12U+kYhJAvQ/NQDRsCyreKLCMIQhFYaDVEoNXs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HRVFZDYiuEDYcUVsgZuVwQKPitd9r8ZVo9/szl5Ts3LzbST8qrVgM+9IiyD/ygMz1
	 Wy9CyAv9LSOhiUpTbRQ0b/yNlORm76PRcCn83GOGBQHV6CicPHbdOwK4WhFdE61eCJ
	 AEPeynOFQBrS9MNhytmD5OTWbaPOaduDrOPS50RBiBmr431Mjx6X2MXfpxtgj7cM5n
	 NZxq6r/bn1g6ys6h/Vq++zk0LTN8a+olfYOBAkcF2zxJ4/e4UAZYRsoiJJqyco2FIt
	 LgaWvd8TqcWwC2TjJQdjCgpO/zGW3Nj5I0lT2h0wfu5AVbDFDyXtojrljiNGtQSMO2
	 CCwPPo4g8S9zg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4b6WwS4Zryz4wcT;
	Wed, 28 May 2025 11:23:20 +1000 (AEST)
Date: Wed, 28 May 2025 11:23:19 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Charlie Jenkins <charlie@rivosinc.com>, Huacai Chen
 <chenhuacai@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Youling Tang <tangyouling@kylinos.cn>
Subject: Re: linux-next: manual merge of the tip tree with the loongarch
 tree
Message-ID: <20250528112319.3a7c31c4@canb.auug.org.au>
In-Reply-To: <20250505135658.65332342@canb.auug.org.au>
References: <20250505135658.65332342@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ubt/42YtD60SBg/HK_R86h1";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ubt/42YtD60SBg/HK_R86h1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 5 May 2025 13:56:58 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> Today's linux-next merge of the tip tree got a conflict in:
>=20
>   arch/loongarch/kernel/entry.S
>=20
> between commit:
>=20
>   d62879a8b16c ("LoongArch: Enable HAVE_ARCH_STACKLEAK")
>=20
> from the loongarch tree and commit:
>=20
>   7ace1602abf2 ("LoongArch: entry: Migrate ret_from_fork() to C")
>=20
> from the tip tree.
>=20
> I fixed it up (I think - see below) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
>=20
>=20
> diff --cc arch/loongarch/kernel/entry.S
> index 77f6fb9146a2,2abc29e57381..000000000000
> --- a/arch/loongarch/kernel/entry.S
> +++ b/arch/loongarch/kernel/entry.S
> @@@ -78,25 -77,21 +78,23 @@@ SYM_CODE_START(handle_syscall
>   SYM_CODE_END(handle_syscall)
>   _ASM_NOKPROBE(handle_syscall)
>  =20
> - SYM_CODE_START(ret_from_fork)
> + SYM_CODE_START(ret_from_fork_asm)
>   	UNWIND_HINT_REGS
> - 	bl		schedule_tail		# a0 =3D struct task_struct *prev
> - 	move		a0, sp
> - 	bl 		syscall_exit_to_user_mode
> + 	move		a1, sp
> + 	bl 		ret_from_fork
>  +	STACKLEAK_ERASE
>   	RESTORE_STATIC
>   	RESTORE_SOME
>   	RESTORE_SP_AND_RET
> - SYM_CODE_END(ret_from_fork)
> + SYM_CODE_END(ret_from_fork_asm)
>  =20
> - SYM_CODE_START(ret_from_kernel_thread)
> + SYM_CODE_START(ret_from_kernel_thread_asm)
>   	UNWIND_HINT_REGS
> - 	bl		schedule_tail		# a0 =3D struct task_struct *prev
> - 	move		a0, s1
> - 	jirl		ra, s0, 0
> - 	move		a0, sp
> - 	bl		syscall_exit_to_user_mode
> + 	move		a1, sp
> + 	move		a2, s0
> + 	move		a3, s1
> + 	bl		ret_from_kernel_thread
>  +	STACKLEAK_ERASE
>   	RESTORE_STATIC
>   	RESTORE_SOME
>   	RESTORE_SP_AND_RET

This is now a conflict between the loongarch tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ubt/42YtD60SBg/HK_R86h1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmg2ZYgACgkQAVBC80lX
0GygKAf+K2UgVrOHn7ejOPr51IudDDLbW6Gwp/eQ22Lsin3k8mhjcbP7WGETozS3
Z4rpZoX+YMGVQxU3CEmXkegYR1YJNvvkv7oSVCdYaELNUKUcPxmQ7MuObffrlq41
uG8V6shXbuG62UldqgN8yJhk77k/ms18aehpBv4uyVzFTmYc9JOyohi2Unu609WV
xfmOUsCi2c0qyGlrahG0LQyIKpYiCumZckAflkjPRrwbNyZrRpY1SIV9TrbDKTQX
CRXzWZ525mlpkvI+5VWBet6n/06p7IwrmjCvYiZuVX0NcRKbmr8exZsjRBsQjQdt
h4nMS3jt3CZnkWhjun5D57WnvjmpkQ==
=ipJi
-----END PGP SIGNATURE-----

--Sig_/ubt/42YtD60SBg/HK_R86h1--

