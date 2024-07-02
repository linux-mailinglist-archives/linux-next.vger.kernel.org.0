Return-Path: <linux-next+bounces-2804-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB41924426
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 19:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E7881F2245A
	for <lists+linux-next@lfdr.de>; Tue,  2 Jul 2024 17:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7D31BE228;
	Tue,  2 Jul 2024 17:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="MjsvDOWh"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1491E178381;
	Tue,  2 Jul 2024 17:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719940022; cv=none; b=s2gm+4PN0za5tqitKojBv4OMcTPPEVKmOjpknb7tdeQnPlu+WtlTPiWXc3yfnvAqua4997+spxCPOUOGwvzk6AkD9doLZONz4MXGB5g1Z+e4E5/1/20VqycZIPMje9qUBXckMhN2DvK1EI13IxrEHcuL9AdQt8VFD/4MLvth7Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719940022; c=relaxed/simple;
	bh=stnT9VHL8D7sKzLq7A6gLELNoVjidpFadno3u6FQKHs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lJrI66xGY9jUH0OQ09YqIKJJYIibcxAG87Ag2PrIdRZfMpy5fBwUyc0xMAWKdjsBfwsIWERzHFKMt6mvXYGKCgKO+QlwnXC3mgfgFmcbhbJ9jHDSetZcpP2sttoljPi/I2evlHo5Ikr/W+MbJ9iHBrW3fO2Z93N5V1uQprDOIT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=MjsvDOWh; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719940015;
	bh=6sLw9MQZhQc+HTNLYMKYnVJTRlC72RBttPky6RnqO2M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MjsvDOWhGlcOnQM7PZZcoZDj6QKMhSTRqQJjwXMx3tnTiposOVi+sbE8pzUJQKnCU
	 yi+jiWjL1X5b1ZjeEtTRkcVcMkNWpB8cVX55Tva2ASYN6onIQvJMyIgEuJ+YtBEbsq
	 921yoMx3rKjB5QlTyk7V4IG5l4MELxSAoszv/EfQB/HO7ZPilKKsRg1MwwaXn7+Hxu
	 xdiogJ7Kp/3Au2CqBMG/2BsnZSdMVe2l1HHWJRufRukm+QDwRzAtKz4qLnhM7nSBwk
	 QU71rtow0C7q4Zdz9SJInQp2EuU91ncYzKVl/MQg+AuqgWMj1OLLOCoO1GN4+QT3ll
	 a/fFIMJjswbIw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WD8TV3vSgz4wx6;
	Wed,  3 Jul 2024 03:06:54 +1000 (AEST)
Date: Wed, 3 Jul 2024 03:06:52 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Jiri Olsa
 <olsajiri@gmail.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: Christian Brauner <brauner@kernel.org>, Christian =?UTF-8?B?R8O2dHRz?=
 =?UTF-8?B?Y2hl?= <cgzones@googlemail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Mark
 Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the ftrace tree with the
 vfs-brauner tree
Message-ID: <20240703030652.1e40e057@canb.auug.org.au>
In-Reply-To: <20240614100748.fcaa7efe6debea3801682ba1@kernel.org>
References: <20240613114243.2a50059b@canb.auug.org.au>
	<ZmqaytbJ0r0EXO8d@krava>
	<20240614090523.246f48e4@canb.auug.org.au>
	<20240614100748.fcaa7efe6debea3801682ba1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/u2Ep.m7UPegn4BAjcOS.3wW";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/u2Ep.m7UPegn4BAjcOS.3wW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 14 Jun 2024 10:07:48 +0900 Masami Hiramatsu (Google) <mhiramat@kern=
el.org> wrote:
>
> On Fri, 14 Jun 2024 09:05:23 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > On Thu, 13 Jun 2024 09:07:54 +0200 Jiri Olsa <olsajiri@gmail.com> wrote=
: =20
> > >
> > > On Thu, Jun 13, 2024 at 11:42:43AM +1000, Stephen Rothwell wrote: =20
> > > >=20
> > > > Today's linux-next merge of the ftrace tree got conflicts in:
> > > >=20
> > > >   arch/x86/entry/syscalls/syscall_64.tbl
> > > >   include/uapi/asm-generic/unistd.h
> > > >=20
> > > > between commit:
> > > >=20
> > > >   e6873349f700 ("fs/xattr: add *at family syscalls")
> > > >=20
> > > > from the vfs-brauner tree and commit:
> > > >=20
> > > >   190fec72df4a ("uprobe: Wire up uretprobe system call")
> > > >=20
> > > > from the ftrace tree.
> > > >=20
> > > > I fixed it up (see below) and can carry the fix as necessary. This
> > > > is now fixed as far as linux-next is concerned, but any non trivial
> > > > conflicts should be mentioned to your upstream maintainer when your=
 tree
> > > > is submitted for merging.  You may also want to consider cooperating
> > > > with the maintainer of the conflicting tree to minimise any particu=
larly
> > > > complex conflicts.
> > > >=20
> > > >=20
> > > > diff --cc arch/x86/entry/syscalls/syscall_64.tbl
> > > > index 26af003921d2,6452c2ec469a..000000000000
> > > > --- a/arch/x86/entry/syscalls/syscall_64.tbl
> > > > +++ b/arch/x86/entry/syscalls/syscall_64.tbl
> > > > @@@ -385,10 -384,7 +385,11 @@@
> > > >   460	common	lsm_set_self_attr	sys_lsm_set_self_attr
> > > >   461	common	lsm_list_modules	sys_lsm_list_modules
> > > >   462 	common  mseal			sys_mseal
> > > >  -463	64	uretprobe		sys_uretprobe
> > > >  +463	common	setxattrat		sys_setxattrat
> > > >  +464	common	getxattrat		sys_getxattrat
> > > >  +465	common	listxattrat		sys_listxattrat
> > > >  +466	common	removexattrat		sys_removexattrat
> > > > ++467	64	uretprobe		sys_uretprobe
> > > >  =20
> > > >   #
> > > >   # Due to a historical design error, certain syscalls are numbered=
 differently
> > > > diff --cc include/uapi/asm-generic/unistd.h
> > > > index 5b8dab0b934e,2378f88d5ad4..000000000000
> > > > --- a/include/uapi/asm-generic/unistd.h
> > > > +++ b/include/uapi/asm-generic/unistd.h
> > > > @@@ -845,17 -845,11 +845,20 @@@ __SYSCALL(__NR_lsm_list_modules, sy=
s_ls
> > > >   #define __NR_mseal 462
> > > >   __SYSCALL(__NR_mseal, sys_mseal)
> > > >  =20
> > > >  -#define __NR_uretprobe 463
> > > >  +#define __NR_setxattrat 463
> > > >  +__SYSCALL(__NR_setxattrat, sys_setxattrat)
> > > >  +#define __NR_getxattrat 464
> > > >  +__SYSCALL(__NR_getxattrat, sys_getxattrat)
> > > >  +#define __NR_listxattrat 465
> > > >  +__SYSCALL(__NR_listxattrat, sys_listxattrat)
> > > >  +#define __NR_removexattrat 466
> > > >  +__SYSCALL(__NR_removexattrat, sys_removexattrat)
> > > >  +
> > > > ++#define __NR_uretprobe 467
> > > > + __SYSCALL(__NR_uretprobe, sys_uretprobe)   =20
> > >=20
> > > we need one more change in tests (below), otherwise lgtm
> > > I can send formal patch for you if needed, plz let me know
> > >=20
> > > ---
> > > diff --git a/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c =
b/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> > > index c8517c8f5313..bd8c75b620c2 100644
> > > --- a/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> > > +++ b/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> > > @@ -216,7 +216,7 @@ static void test_uretprobe_regs_change(void)
> > >  }
> > > =20
> > >  #ifndef __NR_uretprobe
> > > -#define __NR_uretprobe 463
> > > +#define __NR_uretprobe 467
> > >  #endif
> > > =20
> > >  __naked unsigned long uretprobe_syscall_call_1(void) =20
> >=20
> > Or you could change __NR_uretprobe in the patch set to 467, then this
> > will become just a conflict and not a renumbering. =20
>=20
> OK, Jiri, can you send it to me. I will update probes/for-next.

So, is there any chance that the uretprobe syscall can change to 467 in
the ftrace tree, so we have no overlap in syscall numbers for all the
syscalls likely to be merged by Linus?

--=20
Cheers,
Stephen Rothwell

--Sig_/u2Ep.m7UPegn4BAjcOS.3wW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaEM6wACgkQAVBC80lX
0Gx1XwgAjtmiYFDMqsVjZWzerNj+iuHdTn5PhpMTb35jb0/KOCoGD6GMpIIYWsnS
eO+USCjhQMrJZP0okEKpD/g5YFrRQzd0GRK3IpOAq5Auy1NqcfrpX9/UBH3zdghy
2gsFjulU3QYW76H/2Of3NsnIPu3aXoTb/dKohdGXonR+4ALbwTEIvOmCek1JXVq1
mlBpUAm9jINMeE4KNiZ9NQ7rLw7AUXKXLAePlOeH6P66QYhTVppBBEeBl3cxxRHc
Po9LXBBIxynXE7I45lGpl/RWA/w3pyWOmSrWebVjyy1ug6zsDL75S4AfS5rUuSUL
n+Yv2cHpstWplOYfXJAtCEYcbbkhZg==
=xe/t
-----END PGP SIGNATURE-----

--Sig_/u2Ep.m7UPegn4BAjcOS.3wW--

