Return-Path: <linux-next+bounces-4668-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC73F9C06E7
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 14:09:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33225B21A27
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 13:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F0F212D38;
	Thu,  7 Nov 2024 13:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="TNMLiVrI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49CC21217B;
	Thu,  7 Nov 2024 13:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730984680; cv=none; b=kFHZPEGNhPYnerVWE67QA07T/O8vqF0wHyMaR4UwKaGmdZnzRvnUFEn6RByyDqqicsogiDyM09AIOFgmFu9GuaudmWamwEOAn/7/Uct10SQ17fy+9VdLqgowqdvRnmb1zlbm9kwxYm6Zh1D1srZZxTiBd8kZqnWDi4JmdKiPeEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730984680; c=relaxed/simple;
	bh=alJhYjUGmAHiDkzk0RdRNv7iWlA7faKZ06xLb+2wABU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mz3igvrU2pfOEnGzYbz+oVfk9oCWxZDPZkzTYY/Q3rp1CJxLWkiQZRPRNC4FWr4eRAWln7xfm5+Nz98dZGsg6hO9PaFUgM1sIki9LKWSNd1DWj89Zd5ypsn2RDJW+Oq3kLskN1KvRHHdmGAYUCMfN5H7iXu0q9ll6u7nZKwX/gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=TNMLiVrI; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1730984672;
	bh=WHaVBwuwn8YA/BqwcIrDoO8GovcenlT0q9KCEoQJ1E4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TNMLiVrIj+l8iRCkn083Am6kV7TgibeQrvlHJA8TxN+gjAc5LkwfIxaEO/HSWcAvh
	 vvND20njLdikIGnl84TCoTNV7kPtAwMUO+kKaOUW4Bj6I9Mg11M3uZadJz8TFXXDOf
	 hgkEbvParfeA65XGtTzxXh5bCX+bmFNFgl7OGVKSAgtWWVxnFWWhLT203oEDBMrnEn
	 MhLFdHyP0OLnZZmzP/Sxd8cEbsOa4eY17wOdHycERGRgHpDK6Ib4aDfPJ/ejNSiEvV
	 j3p+iuH+N/0x66QUKdbwnp/cz9deXfJHwNzE5ea5wNY1RD27Tfsg2NLOw4jAjx/UaL
	 dQO9HqMSBezQw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xkj2l2yX1z4wcl;
	Fri,  8 Nov 2024 00:04:31 +1100 (AEDT)
Date: Fri, 8 Nov 2024 00:04:32 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, bigeasy@linutronix.de, boqun.feng@gmail.com
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20241108000432.335ec09a@canb.auug.org.au>
In-Reply-To: <20241107103414.GT10375@noisy.programming.kicks-ass.net>
References: <20241107182411.57e2b418@canb.auug.org.au>
	<20241107103414.GT10375@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GuOa5y9PukXOSTbXNSWK=T4";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/GuOa5y9PukXOSTbXNSWK=T4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Thu, 7 Nov 2024 11:34:14 +0100 Peter Zijlstra <peterz@infradead.org> wro=
te:
>
> On Thu, Nov 07, 2024 at 06:24:11PM +1100, Stephen Rothwell wrote:
> So I can't get RUST=3Dy, even though make rustavailable is happy.
>=20
> make LLVM=3D-19 allmodconfig does not get me RUST=3Dy
>=20
> I started out with tip/master, tried adding rust-next, then kbuild-next
> gave up and tried next/master. Nada.

Just on Linus' tree allmodconfig gives me:

$ grep RUST .config
CONFIG_RUSTC_VERSION=3D108100
CONFIG_RUST_IS_AVAILABLE=3Dy
CONFIG_RUSTC_LLVM_VERSION=3D180108
CONFIG_RUST=3Dy
CONFIG_RUSTC_VERSION_TEXT=3D"rustc 1.81.0"
CONFIG_HAVE_RUST=3Dy
CONFIG_RUST_FW_LOADER_ABSTRACTIONS=3Dy
CONFIG_BLK_DEV_RUST_NULL=3Dm
CONFIG_RADIO_TRUST=3Dm
CONFIG_HID_THRUSTMASTER=3Dm
CONFIG_THRUSTMASTER_FF=3Dy
CONFIG_TRUSTED_KEYS=3Dm
CONFIG_HAVE_TRUSTED_KEYS=3Dy
CONFIG_TRUSTED_KEYS_TPM=3Dy
CONFIG_TRUSTED_KEYS_TEE=3Dy
CONFIG_TRUSTED_KEYS_CAAM=3Dy
CONFIG_INTEGRITY_TRUSTED_KEYRING=3Dy
CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=3Dy
CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
CONFIG_SYSTEM_TRUSTED_KEYS=3D""
CONFIG_SECONDARY_TRUSTED_KEYRING=3Dy
CONFIG_SECONDARY_TRUSTED_KEYRING_SIGNED_BY_BUILTIN=3Dy
CONFIG_SAMPLES_RUST=3Dy
CONFIG_SAMPLE_RUST_MINIMAL=3Dm
CONFIG_SAMPLE_RUST_PRINT=3Dm
CONFIG_SAMPLE_RUST_HOSTPROGS=3Dy
CONFIG_RUST_DEBUG_ASSERTIONS=3Dy
CONFIG_RUST_OVERFLOW_CHECKS=3Dy
CONFIG_RUST_BUILD_ASSERT_ALLOW=3Dy

$ rustc --version
rustc 1.81.0

> Anyway, I think the above needs something like this:
>=20
> ---
> diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
> index b7b0945e8b3c..5804a6062eb1 100644
> --- a/rust/helpers/spinlock.c
> +++ b/rust/helpers/spinlock.c
> @@ -5,11 +5,16 @@
>  void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
>  				  struct lock_class_key *key)
>  {
> +#ifndef CONFIG_PREEMPT_RT
>  #ifdef CONFIG_DEBUG_SPINLOCK
>  	__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
>  #else
>  	spin_lock_init(lock);
>  #endif
> +#else
> +	rt_mutex_base_init(&lock->lock);
> +	__rt_spin_lock_init(lock, name, key, false);
> +#endif
>  }
> =20
>  void rust_helper_spin_lock(spinlock_t *lock)

I will try to remember to add that to the tip tree merge tomorrow.

> > Without the revert CONFIG_PREEMPT_RT=3Dy, after the revert it is not set
> > and spinlock_check is only defined for !defined(CONFIG_PREEMPT_RT). =20
>=20
> Right, that moved PREEMPT_RT out of the preemption choice. Now I'm not
> sure we want it =3Dy for all{yes,mod}config. Is the below the right
> incantation to avoid this?
>=20
> ---
> diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
> index 7c1b29a3a491..54ea59ff8fbe 100644
> --- a/kernel/Kconfig.preempt
> +++ b/kernel/Kconfig.preempt
> @@ -88,7 +88,7 @@ endchoice
> =20
>  config PREEMPT_RT
>  	bool "Fully Preemptible Kernel (Real-Time)"
> -	depends on EXPERT && ARCH_SUPPORTS_RT
> +	depends on EXPERT && ARCH_SUPPORTS_RT && !COMPILE_TEST
>  	select PREEMPTION
>  	help
>  	  This option turns the kernel into a real-time kernel by replacing

Yeah, that will do it.

--=20
Cheers,
Stephen Rothwell

--Sig_/GuOa5y9PukXOSTbXNSWK=T4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcsuuAACgkQAVBC80lX
0GwFRQgAiJthyCT5arGjsZIuXNRLlrmpjEVKqKamnlkxHwFt2Oz8D78hbkkL2TWQ
8ad3gAtRFoQ53mnYabRlKM4ZvPQbsFFl8jVNHJG856Q6UvCBGj7Oi4rtNv8qDuVM
8dJFibFQjBd9aU9xmc4cD7n/SeIQZ480aCzgcXhGYBFdOWuNxLEzVp8WA2UAHA1c
wzazATVHHlpEF2ZIpLzbYG0fW9L/t/QKuEHc7iazFWPRrkfGi9EiT02QgojI855W
WNIgYgVNbtLhFkdCjYYqdwdk76U+tARRLHXcBhv3jvyc8WPgrFy98e6+ew9njg1g
UI2kcZNNXqY+6alhEPPqWQy+XfCswA==
=Yhzi
-----END PGP SIGNATURE-----

--Sig_/GuOa5y9PukXOSTbXNSWK=T4--

