Return-Path: <linux-next+bounces-7204-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B33AE396F
	for <lists+linux-next@lfdr.de>; Mon, 23 Jun 2025 11:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 183C318961D8
	for <lists+linux-next@lfdr.de>; Mon, 23 Jun 2025 09:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8670523183C;
	Mon, 23 Jun 2025 09:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpZvq1Jn"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E73122FDFF;
	Mon, 23 Jun 2025 09:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669603; cv=none; b=IiXvPHKP6U5049d2gfh+fd+rRUv8onchL/s/nNZ55tfTrhEZ5kr/CIaE3ilGBiX68LiMR8q4eavM8H6xQ2JUDpyYYV6zn2op//qCZjQGurwVwdFFjlnl3IhP7ZieCG7xKxdZIvkePBsPDTUqCeEGqxJAwcl8gF06xoAXJ053huU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669603; c=relaxed/simple;
	bh=GVH6c9DZl4pr7m3z15pjRT1YLBqjK4aE5D2BKO766T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BfXlawKin+6mNG5F757owrjI8iY7wjD4syfoyr+Rz4hOJoHIqTVw3nMECYcqKGgI4QodAZbnqXUl9W81I2pzpVsKy0I0Rwto2/lBSs/Z7eTMWd8SzAF0FE+7asi5EImpyWUcGwHuE+RNgBRvUp19SVNro05CSSps4iSrQSrWAt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpZvq1Jn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0C3C4AF09;
	Mon, 23 Jun 2025 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750669601;
	bh=GVH6c9DZl4pr7m3z15pjRT1YLBqjK4aE5D2BKO766T0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IpZvq1JnIygdyuu9JWXXANSByiycdWcpgh14f8+AY/Qwb2gezv4ECRDSLs4qeRAsd
	 ydzO8cUEBjtMUTZtEL0IirTwHlN6n0yQMteh3Fj65vCUbyic692ANtye1sGH/vT07r
	 y4YXgspuHvW99NKcq5UlIR0pJM1wuhbU5S4E9p0lYMdkPeKfB4XNkwiJIts5MDBB19
	 vHFbDoM1K5jeClWOYiuBdn9v5NVm/gocxKil6JihXbTlHa2gw8XC3edLzH+lTnNtZy
	 9MnIV8iYs0rvrM4OtQLME4vVY6Pm8bAZKU+2D7iiE325zOAi315c1YETkGYcWTxdaK
	 T17htAsnjbBAw==
Date: Mon, 23 Jun 2025 09:55:40 +0200
From: Joel Granados <joel.granados@kernel.org>
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, 
	Waiman Long <longman@redhat.com>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>
Subject: Re: register_syctl_init error in linux-next-20250612
Message-ID: <ue32pzorcdfcj4i7xtvq5qcpkw2vcvnnc3dvuovl7t4vuxrkyi@efk3ptq7fy73>
References: <20250612175515.3251-1-spasswolf@web.de>
 <mve232hzw4tqc5rnqlacofzlygqks7uirkumfmibrnmzcmpywh@kpchyerpb4ju>
 <3eec91e437e2b9861e069a6c63e80b2bfd7e9802.camel@web.de>
 <agdzhkcb7f7w7zmcivjx6gnlilwglvd526pp3p5cgkdricwfx4@6iduwkqkerjp>
 <bf583355c889ec19f908b1a95c4d6f73a32fcc8f.camel@web.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3xfavmjctzmlngzr"
Content-Disposition: inline
In-Reply-To: <bf583355c889ec19f908b1a95c4d6f73a32fcc8f.camel@web.de>


--3xfavmjctzmlngzr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 01:17:15PM +0200, Bert Karwatzki wrote:
> Am Freitag, dem 20.06.2025 um 13:11 +0200 schrieb Joel Granados:
> > On Fri, Jun 20, 2025 at 11:37:40AM +0200, Bert Karwatzki wrote:
> > > Am Donnerstag, dem 19.06.2025 um 14:39 +0200 schrieb Joel Granados:
> > > > On Thu, Jun 12, 2025 at 07:55:13PM +0200, Bert Karwatzki wrote:

=2E..

> >=20
> > Did you have the chance to test with the patch that I sent?
> >=20
> > Best
>=20
> I did not test your patch, but it seems I independently came up with the
> same soulution:=20
>=20
> It seems to be a compile/file include issue: kernel/locking/rtmutex.c is =
not compiled
> via a Makefile but it's included in via #include:
>=20
> $ rg "include.*rtmutex.c\>"
> kernel/locking/rwsem.c
> 1405:#include "rtmutex.c"
>=20
> kernel/locking/spinlock_rt.c
> 25:#include "rtmutex.c"
>=20
> kernel/locking/ww_rt_mutex.c
> 10:#include "rtmutex.c"
>=20
> kernel/locking/rtmutex_api.c
> 9:#include "rtmutex.c"
>=20
> which in the case of PREEMPT_RT=3Dy leads to four call to init_rtmutex_sy=
sctl().
>=20
> I solved this by moving the code to kernel/locking/rtmutex_api.c:
>=20
> diff --git a/kernel/locking/rtmutex.c b/kernel/locking/rtmutex.c
> index 705a0e0fd72a..cf24eacef48d 100644
> --- a/kernel/locking/rtmutex.c
> +++ b/kernel/locking/rtmutex.c
> @@ -34,24 +34,6 @@
> */
> static int max_lock_depth =3D 1024;

I think leaving max_lock_depth hear is not a good idea. Every time rtmutex.=
c is
included, it will create a private (inside the scope of the file that is
including rtmutex.c) copy of max_lock_depth. This might not result in
misbehavior at the outset, but it increases the potential for trouble.

For now I'll push my original fix to next. Which leaves the definition
of max_lock_depth in rtmutex_api.c avoiding multiptle definitions when
rtmutex.c is included in other files.

Also: CCing maintainers to see if they have any additional info.

Best

> -static const struct ctl_table rtmutex_sysctl_table[] =3D {
> - {
> - .procname =3D "max_lock_depth",
> - .data =3D &max_lock_depth,
> - .maxlen =3D sizeof(int),
> - .mode =3D 0644,
> - .proc_handler =3D proc_dointvec,
> - },
> -};
> -
> -static int __init init_rtmutex_sysctl(void)
> -{
> - register_sysctl_init("kernel", rtmutex_sysctl_table);
> - return 0;
> -}
> -
> -subsys_initcall(init_rtmutex_sysctl);
> -
> #ifndef WW_RT
> # define build_ww_mutex() (false)
> # define ww_container_of(rtm) NULL
> diff --git a/kernel/locking/rtmutex_api.c b/kernel/locking/rtmutex_api.c
> index 9e00ea0e5cfa..a133870b4519 100644
> --- a/kernel/locking/rtmutex_api.c
> +++ b/kernel/locking/rtmutex_api.c
> @@ -8,6 +8,24 @@
> #define RT_MUTEX_BUILD_MUTEX
> #include "rtmutex.c"
> +static const struct ctl_table rtmutex_sysctl_table[] =3D {
> + {
> + .procname =3D "max_lock_depth",
> + .data =3D &max_lock_depth,
> + .maxlen =3D sizeof(int),
> + .mode =3D 0644,
> + .proc_handler =3D proc_dointvec,
> + },
> +};
> +
> +static int __init init_rtmutex_sysctl(void)
> +{
> + register_sysctl_init("kernel", rtmutex_sysctl_table);
> + return 0;
> +}
> +
> +subsys_initcall(init_rtmutex_sysctl);
> +
> /*
> * Debug aware fast / slowpath lock,trylock,unlock
> *
>=20
> I tested this patch with and without CONFIG_PREEMPT_RT=3Dy and it
> works in both cases.
>=20
> Bert Karwatzki
>=20

--=20

Joel Granados

--3xfavmjctzmlngzr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEErkcJVyXmMSXOyyeQupfNUreWQU8FAmhZCHIACgkQupfNUreW
QU8k8Qv8DmM8lKWCPleNmDcJUZagHsovq49q62CZBsZl6n5r4BI7g9eskeApOEa+
fd4e4O14iIfpKdaVFFxTDwPR0TawnV0cfCqJ2Hi+B6pwLA/AUcG0wSVw8+c4t612
Bu3h4qb/40wQ9SGHkY5USAHeKfc4BPejA5bylkcS40DTzJ6U0/dzgPeomgK7vCLe
RwrtKZePgmhanlXbK2YN3Yagld8FPUEyerDGMRGs2n8MOlgwk4PO9GHmpy14MsvJ
wSSnq5Gg0jC/SYkA1H4tAhDupuHgnysctKJF1rY01PpZDW7nGDzYtHjb41mxh4/L
Aspa3SxGFuMFFgqszunXSpTgT3KEvi8wFhkv5+ot61WbZlE2CwL3v3fxMYhUsYwo
nLQNJPcKR4HnvIt0CJDhtYWJmgWLdPnd4tglVU+iJXt5L2/XdzXJodnzFB8vFtId
IOhEoBjYfN6tNgxnFtFD23dqEsOoc67c364sYl3RER9UrUujicLqwTXGneRrKUQK
wetPs6qL
=+G6L
-----END PGP SIGNATURE-----

--3xfavmjctzmlngzr--

