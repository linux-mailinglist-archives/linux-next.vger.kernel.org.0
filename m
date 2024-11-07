Return-Path: <linux-next+bounces-4657-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9428D9C0277
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 11:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53D772838D1
	for <lists+linux-next@lfdr.de>; Thu,  7 Nov 2024 10:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A021F4276;
	Thu,  7 Nov 2024 10:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UlTBs7Vj"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1A31EF957;
	Thu,  7 Nov 2024 10:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730975662; cv=none; b=trgGa6kdJxFtcanmD1xHp1W8cSHaGB0T5VYqTPfupIgCidT8SI5aAUTmMSoGz+kYXiJKu69VRrWbgigig5HkrgOZvC7/6KL14piLh7eB7iAodFM8PA4M5muupFxtPXkk6DhGmlszLHYm/H7RauYfjU7Th1jatUcE8c4ZJkU7qEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730975662; c=relaxed/simple;
	bh=GdPkNij5uRuIRcfdX8ROhlbpgpqbYAwDU62bGqcUMTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mzoiy156tOVhrjdHqjUK8GuQB7kdEL/5Yf4oIO5frXS8vOu6dBc55wYbV06VlGdveYeZXPMLSBnYv0OLEX8wc3CxgDQxg35Aneor4gbcoSVHuFDTzqPSCeeyiqHLowVsJL3ZC02UVO7Ju0ngx5HiGhBrC3THIpedXsVsp4myclQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UlTBs7Vj; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZEhrxBfkl+ezMdMe20vSmeDJt/NhTYOrtbjHQ9AC7FA=; b=UlTBs7Vjp0KH+BCSFFR9u+cPiE
	mer0FUSbint5J3zARZtrxwyor7kaXbdNjxK+Hwgzij5ousLDzwx8jWyi4jfHth64kRgLFCWg0sBt3
	GEM4eAXMjMO0hHcr9eBs+hCrnIYKow63cLiN6rP9RtARRTEIM/HQTyn/lEeAKvQFxZhIvWvegscD2
	3vvUpKsrY+aof+cSgHSg14W5Ab4CPIk2WP9RXB3ITajswJXJiba8xqWLXAin1nbXGb0mzXGEzdZJu
	8A92CvGy/IwiOXETq2aev4Ve5KeEFFmrMfqDlIwHY++fpGOePhDs/dRr4peItDPkZMkND+TYbCGi4
	Y601PvFA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t8zqA-00000006SoD-3A9n;
	Thu, 07 Nov 2024 10:34:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8AB6E300446; Thu,  7 Nov 2024 11:34:14 +0100 (CET)
Date: Thu, 7 Nov 2024 11:34:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	bigeasy@linutronix.de, boqun.feng@gmail.com
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20241107103414.GT10375@noisy.programming.kicks-ass.net>
References: <20241107182411.57e2b418@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tr0K/SScsBSn7Puz"
Content-Disposition: inline
In-Reply-To: <20241107182411.57e2b418@canb.auug.org.au>


--tr0K/SScsBSn7Puz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2024 at 06:24:11PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (x86_64 allmodconfig)
> failed like this:
>=20
> In file included from rust/helpers/helpers.c:26:
> rust/helpers/spinlock.c: In function 'rust_helper___spin_lock_init':
> rust/helpers/spinlock.c:10:30: error: implicit declaration of function 's=
pinlock_check'; did you mean 'spin_lock_bh'? [-Wimplicit-function-declarati=
on]
>    10 |         __raw_spin_lock_init(spinlock_check(lock), name, key, LD_=
WAIT_CONFIG);
>       |                              ^~~~~~~~~~~~~~
>       |                              spin_lock_bh
> rust/helpers/spinlock.c:10:30: error: passing argument 1 of '__raw_spin_l=
ock_init' makes pointer from integer without a cast [-Wint-conversion]
>    10 |         __raw_spin_lock_init(spinlock_check(lock), name, key, LD_=
WAIT_CONFIG);
>       |                              ^~~~~~~~~~~~~~~~~~~~
>       |                              |
>       |                              int
> In file included from include/linux/wait.h:9,
>                  from include/linux/wait_bit.h:8,
>                  from include/linux/fs.h:6,
>                  from include/linux/highmem.h:5,
>                  from include/linux/bvec.h:10,
>                  from include/linux/blk_types.h:10,
>                  from include/linux/blkdev.h:9,
>                  from include/linux/blk-mq.h:5,
>                  from rust/helpers/blk.c:3,
>                  from rust/helpers/helpers.c:10:
> include/linux/spinlock.h:101:52: note: expected 'raw_spinlock_t *' {aka '=
struct raw_spinlock *'} but argument is of type 'int'
>   101 |   extern void __raw_spin_lock_init(raw_spinlock_t *lock, const ch=
ar *name,
>       |                                    ~~~~~~~~~~~~~~~~^~~~
>=20

So I can't get RUST=3Dy, even though make rustavailable is happy.

make LLVM=3D-19 allmodconfig does not get me RUST=3Dy

I started out with tip/master, tried adding rust-next, then kbuild-next
gave up and tried next/master. Nada.

Anyway, I think the above needs something like this:

---
diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
index b7b0945e8b3c..5804a6062eb1 100644
--- a/rust/helpers/spinlock.c
+++ b/rust/helpers/spinlock.c
@@ -5,11 +5,16 @@
 void rust_helper___spin_lock_init(spinlock_t *lock, const char *name,
 				  struct lock_class_key *key)
 {
+#ifndef CONFIG_PREEMPT_RT
 #ifdef CONFIG_DEBUG_SPINLOCK
 	__raw_spin_lock_init(spinlock_check(lock), name, key, LD_WAIT_CONFIG);
 #else
 	spin_lock_init(lock);
 #endif
+#else
+	rt_mutex_base_init(&lock->lock);
+	__rt_spin_lock_init(lock, name, key, false);
+#endif
 }
=20
 void rust_helper_spin_lock(spinlock_t *lock)


> Probably caused by commit
>=20
>   35772d627b55 ("sched: Enable PREEMPT_DYNAMIC for PREEMPT_RT")
>=20
> at least reverting commit
>=20
>   dafc2d42c0a6 ("Merge branch into tip/master: 'sched/core'")
>=20
> makes the build work again for me - so I have done that for today.
>=20
> Without the revert CONFIG_PREEMPT_RT=3Dy, after the revert it is not set
> and spinlock_check is only defined for !defined(CONFIG_PREEMPT_RT).

Right, that moved PREEMPT_RT out of the preemption choice. Now I'm not
sure we want it =3Dy for all{yes,mod}config. Is the below the right
incantation to avoid this?

---
diff --git a/kernel/Kconfig.preempt b/kernel/Kconfig.preempt
index 7c1b29a3a491..54ea59ff8fbe 100644
--- a/kernel/Kconfig.preempt
+++ b/kernel/Kconfig.preempt
@@ -88,7 +88,7 @@ endchoice
=20
 config PREEMPT_RT
 	bool "Fully Preemptible Kernel (Real-Time)"
-	depends on EXPERT && ARCH_SUPPORTS_RT
+	depends on EXPERT && ARCH_SUPPORTS_RT && !COMPILE_TEST
 	select PREEMPTION
 	help
 	  This option turns the kernel into a real-time kernel by replacing



--tr0K/SScsBSn7Puz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEv3OU3/byMaA0LqWJdkfhpEvA5LoFAmcsl5sACgkQdkfhpEvA
5LrfsxAAprHnpBRHIVyYBtU7438EY7YMn8aFaYmGQRYM7WwCmE6gfsTbItUhRuaz
UYI2mT6IWp/Nl9ghUifI+rXTHTOjFlONRCJG+HAiOR+7IjDrjQ1cEA46/LqUgezL
dZYfe/mX/JwORUO+AhrfTpqYPeKMmAvPTsKsxBFam81ogi+hpHTRs/wPKAGhl0fZ
jxRwwe0AodEVIqsBuJR+x6/0XmyGPYiKuG+eS2FUWwLLcp8gtF16OMuVNOGI5MnR
wDSF8FduP9Le5T5WPGkdKndtzpaUXXL7BVtY+5waRXNzEz0vrcBHMBaSgkgLwr0f
jZmOnhsV/IkgCuEGF0/t0OE0XfHJbhlRewkG5Uub9L5vaU+yOBLcSZ7WqYzF0b5S
ZymqW9FTBxol9wDu+loKP4gJ+xg19z/oPsynJHBzuvBH7XnaqeCvkZG6qgPUj1Fx
4YntvQmIUlzNvNpxQb3Qb0HDOMm1JWn3QQLHgzq2tq6XiCjizLvdJdQRzhWvyV4Q
L20oUWvQzH3Qat9vZTZ3yRmn1hjf1zfUSpVJfrZ4crxNK7WjhyzDCMbKaIjSPd1y
AVJ7f6uPS7bTZODBVcu7HTj3XBNecktrjrYmwDLlLfMkcrjt7UbkBTNTToqZJzmc
a/RK/SGtiN95JR3syh7HBKTStLilaYlayKWHEPFSKnSF5M2ro8c=
=+ov9
-----END PGP SIGNATURE-----

--tr0K/SScsBSn7Puz--

