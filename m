Return-Path: <linux-next+bounces-5805-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F020FA63F1D
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 06:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 276147A481D
	for <lists+linux-next@lfdr.de>; Mon, 17 Mar 2025 05:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639E822F01;
	Mon, 17 Mar 2025 05:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="lwtWyVX6"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E94A59;
	Mon, 17 Mar 2025 05:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742187951; cv=none; b=n6lP5gKfvdRJxGv9BzHpWem7vN9OTyvCj2DGl42blfskM4utM4pS9tXSBdYAwF/n0f0I0OoREpHDecT3Dn93rxB2YubMCjgoU1RDdp14Qpwm6HiPlESbn2Xl+KN3D8i9L2JGvT+nBwXoRtKs4Y+sn5Iw6bO8nhb0Cjs13caXKj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742187951; c=relaxed/simple;
	bh=Yx8hA5o3SoSHlUdz3SM2LvdTtkROyxkqOk1dvR+hJZA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=McgRcbOGsViuqj+K8XJymUVTVRZV3uEpcIpWjPqDeOW6Mjd/MXuby/z6GC/IunEeCwdc0BeoVBMCrQtbz7rDqb4Y84b5pW+mScoZgvbReOGPxDR2hmYFIEbdlN47BlnPn/BqaxZy0DwEVZ1NBKyYcM6rjTSskd7f2hZBedHSFbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=lwtWyVX6; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1742187942;
	bh=oO90iJBmEYFzHyd2ZTs8x7gFQx2bb/HtnHvLad5EuAY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lwtWyVX6BoQey99eQkdLxog2E6hplf/zbb9zohe+FDgn3mbSm3hCVub01XFSaL5QG
	 XhxDOpB+q/vlu2jIqMoIYrJDkaf6K3u/bTCzaqI/as4yKzFtaWtViu78GxHKpfOiFw
	 3QFtGfLzxx1oLhQ+usWr4bxoC2SakGPLmPVMVu3OiftYAT70ygng+2awXmXg+/KJ3P
	 tfOnt3ZifXWYfbNDE3nLirGcw8iyehlDkgIIWsY9cpBEbxyf7M6vq4mN4u2jjOXgJj
	 L+FIm75BpWmlFY60/gmVfyMPUl/x+7vXLemWwmeKct+uVFBR7wZx0DqC8tfGSnfxs+
	 46yX/ajyCIafA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZGNGF2JKpz4wcZ;
	Mon, 17 Mar 2025 16:05:41 +1100 (AEDT)
Date: Mon, 17 Mar 2025 16:05:40 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20250317160540.096f16a4@canb.auug.org.au>
In-Reply-To: <20250311152429.32d9f824@canb.auug.org.au>
References: <20250304162402.475eb3bc@canb.auug.org.au>
	<20250306152516.32df7764@canb.auug.org.au>
	<20250311152429.32d9f824@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/45fpgOInwCYqQ+RDA_HKZ2a";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/45fpgOInwCYqQ+RDA_HKZ2a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 11 Mar 2025 15:24:29 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 6 Mar 2025 15:25:16 +1100 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > On Tue, 4 Mar 2025 16:25:31 +1100 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote: =20
> > >
> > > After merging the tip tree, today's linux-next build (x86_64 allmodco=
nfig)
> > > failed like this:
> > >=20
> > > In file included from include/asm-generic/percpu.h:7,
> > >                  from arch/x86/include/asm/percpu.h:597,
> > >                  from arch/x86/include/asm/preempt.h:6,
> > >                  from include/linux/preempt.h:79,
> > >                  from include/linux/spinlock.h:56,
> > >                  from include/linux/wait.h:9,
> > >                  from include/linux/wait_bit.h:8,
> > >                  from include/linux/fs.h:7,
> > >                  from kernel/events/core.c:11:
> > > kernel/events/core.c: In function 'this_cpc':
> > > include/linux/percpu-defs.h:220:45: error: initialization from pointe=
r to non-enclosed address space
> > >   220 |         const void __percpu *__vpp_verify =3D (typeof((ptr) +=
 0))NULL;    \
> > >       |                                             ^
> > > include/linux/percpu-defs.h:251:9: note: in expansion of macro '__ver=
ify_pcpu_ptr'
> > >   251 |         __verify_pcpu_ptr(ptr);                              =
           \
> > >       |         ^~~~~~~~~~~~~~~~~
> > > kernel/events/core.c:1222:17: note: in expansion of macro 'this_cpu_p=
tr'
> > >  1222 |         return *this_cpu_ptr(pmu->cpu_pmu_context);
> > >       |                 ^~~~~~~~~~~~
> > >=20
> > > (and many more similar)
> > >=20
> > > Presumably caused by commit
> > >=20
> > >   f67d1ffd841f ("perf/core: Detach 'struct perf_cpu_pmu_context' and =
'struct pmu' lifetimes")
> > >=20
> > > I have used the tip tree from next-20250303 for today.   =20
> >=20
> > I am still seeing this build failure. =20
>=20
> Ditto.  Anything happening with this?
>=20
> I am still using the tip tree from next-20250303.

So am I missing something here?  I am still seeing this build failure.

That commit is now

  4eabf533fb18 ("perf/core: Detach 'struct perf_cpu_pmu_context' and 'struc=
t pmu' lifetimes")

Is there something in my toolchain?   Or some other difference in our
build environments?

--=20
Cheers,
Stephen Rothwell

--Sig_/45fpgOInwCYqQ+RDA_HKZ2a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmfXraQACgkQAVBC80lX
0Gxkmwf/Q61UEUeglj9W4quE3qcjIK+X8aEkhypRfWWqWG/Au3J4VGGUWK69h3nI
BVN9AXJMyCrJhzNLpdOWr1fMY15KHVwI/8YtQEgCuan10BXSMeG/3d2xUX3unJ+M
VR/YDQ4V3cOYP4o2oMMdgF4Jhk8wMY8zhnkOYFfnyL7h8LkhKsyUuLpza5DLVa58
/pHsN5yD+71HyKqEovgBpgct5QaOLevc7egdgP4O3xmUjwScFPg5HhosasjQv9C9
CP7dAg/mRUPTnlCuEU+94jDuP5yHCa2oc95Q6KjZopowwN6Yo6MGUiZw2tnNowTY
jSbuEXEBLyHP+NzZS+gyYtqOK4kdvQ==
=KSB2
-----END PGP SIGNATURE-----

--Sig_/45fpgOInwCYqQ+RDA_HKZ2a--

