Return-Path: <linux-next+bounces-4675-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B31229C0892
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 15:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6C981C232FF
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 14:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9C3212647;
	Thu,  7 Nov 2024 14:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oHUiLIx3"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E076D28F1;
	Thu,  7 Nov 2024 14:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730988738; cv=none; b=O4N3D92QALfwIIG6mYojg5Sbbd16YM1mCw2bSC1qOBJRfu5e96n2FdULsAnk9opICY7Z4G9hkL6d1TR+rZ6RlRsv2zd2DYQfUiPGwV+WJDSiXdPe4mM2uv6OsiziXV7ak/4Pynj+4HHXyiOCNyxqKhVWTlP4sa6IvRLRUSmqVAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730988738; c=relaxed/simple;
	bh=2wcCc6Xti/KhTWb0bMmK3g+FxFRCPbDyP6uPDksPAu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p6IymxTo4pX6Z7S8B9D1n0bBg87DL1eaJ51XcdB1SU7eOYtiyi+23iL54aZSFsGTRCG/6FtSMFiFPES5g8IMIwrZkECta/6QN7NTrvGq3VUbyXHNBcsnXRkNTo8zXIcw3dzJRhG1thlV2Zjb/hz5LuZ90fQN21rTw9p+n/NsSTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oHUiLIx3; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a0L5TP8VHkT/SCXs9iavhK3s9CtL7Vkw+p8sqahkp+g=; b=oHUiLIx3GRRDlstVP3pPAT9eG8
	oZehaL6Ug6frPIIsZZ+YSlEnS6tEdMcFXWwJLO9fQjj3qpTCXGayHRGxmJkdHpGolv696o4T32Yr7
	inqdJTRV0JSlHJ0wtjxmwWBmnSxZ9T8AbKnt7iL0i89mbsjuKU0Zrwa1XLBJ8NN/vRFR0xwmOZWvA
	hy9m5RUe5WrpJ1yUebpaRapDdUPmfw5NXhiJhMzlR2sg8TWNvSffWI2miBMWLi2N+C/x/2Uee8M8N
	sy8P168OQaVHr1ik3jiolFqs82M8uZSyseSWt+caig7ipSEv0EYnYmuNpsSjOcJ5gKZFNiGFuSyUs
	IivfyEPg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t93F6-0000000C8kH-1xFb;
	Thu, 07 Nov 2024 14:12:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 1B71A30078C; Thu,  7 Nov 2024 15:12:12 +0100 (CET)
Date: Thu, 7 Nov 2024 15:12:12 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	bigeasy@linutronix.de, boqun.feng@gmail.com
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20241107141212.GB34695@noisy.programming.kicks-ass.net>
References: <20241107182411.57e2b418@canb.auug.org.au>
 <20241107103414.GT10375@noisy.programming.kicks-ass.net>
 <20241108000432.335ec09a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="068i1ftiWJ33qMIW"
Content-Disposition: inline
In-Reply-To: <20241108000432.335ec09a@canb.auug.org.au>


--068i1ftiWJ33qMIW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 08, 2024 at 12:04:32AM +1100, Stephen Rothwell wrote:
> Hi Peter,
>=20
> On Thu, 7 Nov 2024 11:34:14 +0100 Peter Zijlstra <peterz@infradead.org> w=
rote:
> >
> > On Thu, Nov 07, 2024 at 06:24:11PM +1100, Stephen Rothwell wrote:
> > So I can't get RUST=3Dy, even though make rustavailable is happy.
> >=20
> > make LLVM=3D-19 allmodconfig does not get me RUST=3Dy
> >=20
> > I started out with tip/master, tried adding rust-next, then kbuild-next
> > gave up and tried next/master. Nada.
>=20
> Just on Linus' tree allmodconfig gives me:
>=20
> $ grep RUST .config
> CONFIG_RUSTC_VERSION=3D108100
> CONFIG_RUST_IS_AVAILABLE=3Dy
> CONFIG_RUSTC_LLVM_VERSION=3D180108
> CONFIG_RUST=3Dy
> CONFIG_RUSTC_VERSION_TEXT=3D"rustc 1.81.0"
> CONFIG_HAVE_RUST=3Dy
> CONFIG_RUST_FW_LOADER_ABSTRACTIONS=3Dy
> CONFIG_BLK_DEV_RUST_NULL=3Dm
> CONFIG_RADIO_TRUST=3Dm
> CONFIG_HID_THRUSTMASTER=3Dm
> CONFIG_THRUSTMASTER_FF=3Dy
> CONFIG_TRUSTED_KEYS=3Dm
> CONFIG_HAVE_TRUSTED_KEYS=3Dy
> CONFIG_TRUSTED_KEYS_TPM=3Dy
> CONFIG_TRUSTED_KEYS_TEE=3Dy
> CONFIG_TRUSTED_KEYS_CAAM=3Dy
> CONFIG_INTEGRITY_TRUSTED_KEYRING=3Dy
> CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT=3Dy
> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> CONFIG_SECONDARY_TRUSTED_KEYRING=3Dy
> CONFIG_SECONDARY_TRUSTED_KEYRING_SIGNED_BY_BUILTIN=3Dy
> CONFIG_SAMPLES_RUST=3Dy
> CONFIG_SAMPLE_RUST_MINIMAL=3Dm
> CONFIG_SAMPLE_RUST_PRINT=3Dm
> CONFIG_SAMPLE_RUST_HOSTPROGS=3Dy
> CONFIG_RUST_DEBUG_ASSERTIONS=3Dy
> CONFIG_RUST_OVERFLOW_CHECKS=3Dy
> CONFIG_RUST_BUILD_ASSERT_ALLOW=3Dy
>=20
> $ rustc --version
> rustc 1.81.0

Yeah, I'm not sure what's going on. I occasionally get rust stuff, but
mostly when I try allyesconfig. Weirdness.

> > Anyway, I think the above needs something like this:
> >=20
> > ---
> > diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
> > index b7b0945e8b3c..5804a6062eb1 100644
> > --- a/rust/helpers/spinlock.c
> > +++ b/rust/helpers/spinlock.c
> > @@ -5,11 +5,16 @@
> >  void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
> >  				  struct lock_class_key *key)
> >  {
> > +#ifndef CONFIG_PREEMPT_RT
> >  #ifdef CONFIG_DEBUG_SPINLOCK
> >  	__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
> >  #else
> >  	spin_lock_init(lock);
> >  #endif
> > +#else
> > +	rt_mutex_base_init(&lock->lock);
> > +	__rt_spin_lock_init(lock, name, key, false);
> > +#endif
> >  }
> > =20
> >  void rust_helper_spin_lock(spinlock_t *lock)
>=20
> I will try to remember to add that to the tip tree merge tomorrow.

Boqun, could you test the above and make it happen?

> > > Without the revert CONFIG_PREEMPT_RT=3Dy, after the revert it is not =
set
> > > and spinlock_check is only defined for !defined(CONFIG_PREEMPT_RT). =
=20
> >=20
> > Right, that moved PREEMPT_RT out of the preemption choice. Now I'm not
> > sure we want it =3Dy for all{yes,mod}config. Is the below the right
> > incantation to avoid this?
> >=20
> > ---
> > diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
> > index 7c1b29a3a491..54ea59ff8fbe 100644
> > --- a/kernel/Kconfig.preempt
> > +++ b/kernel/Kconfig.preempt
> > @@ -88,7 +88,7 @@ endchoice
> > =20
> >  config PREEMPT_RT
> >  	bool "Fully Preemptible Kernel (Real-Time)"
> > -	depends on EXPERT && ARCH_SUPPORTS_RT
> > +	depends on EXPERT && ARCH_SUPPORTS_RT && !COMPILE_TEST
> >  	select PREEMPTION
> >  	help
> >  	  This option turns the kernel into a real-time kernel by replacing
>=20
> Yeah, that will do it.

OK, I'll write it up and stick that in tip/sched/core along with them
patches that's causing the grief :-)

--068i1ftiWJ33qMIW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEv3OU3/byMaA0LqWJdkfhpEvA5LoFAmcsyrMACgkQdkfhpEvA
5LrXzQ//eWsdIudUYWZW709q2oyhYDiCfOis2ioIwmf0N8RPKwXXPPx97SHm6Yio
VqBptjOCuYmZeP6+A1j9cm+rh3DS54aP+uccxjiucbZ2VJJX39Unt6ZRCLW1Nw09
r8tt4SOnr23eeX+AaSJSl7dCJa77aG5gIHkICnVoZgvFItdSeObQKir59dyiqwJg
lt+Dzz5eBczMuSKepkRhFGA/lPb6yXEW0EE8BtPQMuXoHZzjlktraamq6Mc62XGa
wcb5C8ocIKoQzi/19d5Kou3UfNAg9knwpwsaDqYbL/PwwETDoLkuKB0eShz04IUB
g6IjyUlmcz3OtUVHBV7EdQ3rFgsadNty2C5c9/v7RzYiCEhX+xK8z/TiH5IcOObi
/+yDdhPbqs1TZkXUIRyC4tNig85K0+X77ONhpDaRn/zUvMAnPgns7bzqPuRMhVDn
jtge/25a/Sv2On4QtcdLlTTFp2NRwNsq5VVfNxH7n48FVEVVEk/N4xbjaoONW5qr
6fTKKAjXE57tUy4ZQnqtMJm72V8ED6y3izYRXAr4T2fVncs339gUn1rgVbLF6ShV
dv+B/uojhAirOhpda+WafoE8y9/JPSrlWGvvc7soxzCMohmntIJy+NmSYaqY38+A
0Lol8vhtGx6cdQckHuqWM16j1Mqyl1ijTHH0Ni1xfb4nnyQts+4=
=uWKk
-----END PGP SIGNATURE-----

--068i1ftiWJ33qMIW--

