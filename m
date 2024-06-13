Return-Path: <linux-next+bounces-2548-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC62907F2D
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 01:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC16A1F239D9
	for <lists+linux-next@lfdr.de>; Thu, 13 Jun 2024 23:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58F213D50F;
	Thu, 13 Jun 2024 23:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="LDtYgCaf"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9934B1369AF;
	Thu, 13 Jun 2024 23:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718319929; cv=none; b=HTfeNLD31SbJDt0KZGUaRTXeVv4SHUSPIaxRD3IbFWw4R2DDrGcXu3pfjMmTg3AnmJ3AUfE/TH9wTgEVYlPBJtj+wMDvlDLo2NAzqwCtrA1Ghtpl0n5XahefXD77fZ/5eq4fb3OPOywGLNGIxgW0ka7jTCIAZuiwGYKQTk50EZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718319929; c=relaxed/simple;
	bh=J2V4BQsgrzwCnPPCNckcZfloaWh80A4wC9VQfx+cwKs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N0jSMoUbcAHRviczC2hB1Mik87Ff3/5FDA87fFH/G2AWrAkBrwaSwKKqnEU16AyNPlx//OzBimwy+a+Ev6rUizg+//1N6IACdmRSiwon6wS3+i905jQ8xduiLvpB+MHF+U/9hyJ6ZUGyt/crUBBjirEfa1PRcFepqOBqCge1Ggc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=LDtYgCaf; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1718319924;
	bh=Q7AAgLnmEYeIARDGD3RrKwEsOEZdNlWKsPjJWgH9uw8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LDtYgCaf0+p/6i0REe6j6O4J7U2GgdgzcswV6v7ZwLS3x7LzrZrE5p8T59XeAhy7t
	 LjsmPVYqI8jGKXwftDJIkFys3uSpyYYmlx3AZI9erlbvmpO2Gy3gW2AkiIzIjElSZK
	 g6Vt2E/rPfTgfposwNmP4/Zz3aCS4o4Be5gvgc6SDNJzAIObemvQnNZ4hzd4/LKRVa
	 vdAVXGPPn2p8bNBQG2OKInkOan6n1iziPZtZe66MpLUugcXWl5BS0e/TnfM0LGsfmN
	 5rr4PnfjrfnR7ZJtK482O8z3MBnbpzz12OCLsviZFHPqjmv8R8wYAISp5sWNPPxO2o
	 MXOVldAk1te+Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W0dKv6FpBz4wcp;
	Fri, 14 Jun 2024 09:05:23 +1000 (AEST)
Date: Fri, 14 Jun 2024 09:05:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Christian Brauner <brauner@kernel.org>, Christian
 =?UTF-8?B?R8O2dHRzY2hl?= <cgzones@googlemail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Mark
 Brown <broonie@kernel.org>
Subject: Re: linux-next: manual merge of the ftrace tree with the
 vfs-brauner tree
Message-ID: <20240614090523.246f48e4@canb.auug.org.au>
In-Reply-To: <ZmqaytbJ0r0EXO8d@krava>
References: <20240613114243.2a50059b@canb.auug.org.au>
	<ZmqaytbJ0r0EXO8d@krava>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pqlA1vpx455Q_K6YVmokT2X";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/pqlA1vpx455Q_K6YVmokT2X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

[Cc'd Mark Brown and Michael Ellerman just in case they decide to do
linux-next releases whil I am away.]

On Thu, 13 Jun 2024 09:07:54 +0200 Jiri Olsa <olsajiri@gmail.com> wrote:
>
> On Thu, Jun 13, 2024 at 11:42:43AM +1000, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > Today's linux-next merge of the ftrace tree got conflicts in:
> >=20
> >   arch/x86/entry/syscalls/syscall_64.tbl
> >   include/uapi/asm-generic/unistd.h
> >=20
> > between commit:
> >=20
> >   e6873349f700 ("fs/xattr: add *at family syscalls")
> >=20
> > from the vfs-brauner tree and commit:
> >=20
> >   190fec72df4a ("uprobe: Wire up uretprobe system call")
> >=20
> > from the ftrace tree.
> >=20
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> >=20
> > --=20
> > Cheers,
> > Stephen Rothwell
> >=20
> > diff --cc arch/x86/entry/syscalls/syscall_64.tbl
> > index 26af003921d2,6452c2ec469a..000000000000
> > --- a/arch/x86/entry/syscalls/syscall_64.tbl
> > +++ b/arch/x86/entry/syscalls/syscall_64.tbl
> > @@@ -385,10 -384,7 +385,11 @@@
> >   460	common	lsm_set_self_attr	sys_lsm_set_self_attr
> >   461	common	lsm_list_modules	sys_lsm_list_modules
> >   462 	common  mseal			sys_mseal
> >  -463	64	uretprobe		sys_uretprobe
> >  +463	common	setxattrat		sys_setxattrat
> >  +464	common	getxattrat		sys_getxattrat
> >  +465	common	listxattrat		sys_listxattrat
> >  +466	common	removexattrat		sys_removexattrat
> > ++467	64	uretprobe		sys_uretprobe
> >  =20
> >   #
> >   # Due to a historical design error, certain syscalls are numbered dif=
ferently
> > diff --cc include/uapi/asm-generic/unistd.h
> > index 5b8dab0b934e,2378f88d5ad4..000000000000
> > --- a/include/uapi/asm-generic/unistd.h
> > +++ b/include/uapi/asm-generic/unistd.h
> > @@@ -845,17 -845,11 +845,20 @@@ __SYSCALL(__NR_lsm_list_modules, sys_ls
> >   #define __NR_mseal 462
> >   __SYSCALL(__NR_mseal, sys_mseal)
> >  =20
> >  -#define __NR_uretprobe 463
> >  +#define __NR_setxattrat 463
> >  +__SYSCALL(__NR_setxattrat, sys_setxattrat)
> >  +#define __NR_getxattrat 464
> >  +__SYSCALL(__NR_getxattrat, sys_getxattrat)
> >  +#define __NR_listxattrat 465
> >  +__SYSCALL(__NR_listxattrat, sys_listxattrat)
> >  +#define __NR_removexattrat 466
> >  +__SYSCALL(__NR_removexattrat, sys_removexattrat)
> >  +
> > ++#define __NR_uretprobe 467
> > + __SYSCALL(__NR_uretprobe, sys_uretprobe) =20
>=20
> hi,
> we need one more change in tests (below), otherwise lgtm
> I can send formal patch for you if needed, plz let me know
>=20
> thanks,
> jirka
>=20
>=20
> ---
> diff --git a/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c b/to=
ols/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> index c8517c8f5313..bd8c75b620c2 100644
> --- a/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> +++ b/tools/testing/selftests/bpf/prog_tests/uprobe_syscall.c
> @@ -216,7 +216,7 @@ static void test_uretprobe_regs_change(void)
>  }
> =20
>  #ifndef __NR_uretprobe
> -#define __NR_uretprobe 463
> +#define __NR_uretprobe 467
>  #endif
> =20
>  __naked unsigned long uretprobe_syscall_call_1(void)

Or you could change __NR_uretprobe in the patch set to 467, then this
will become just a conflict and not a renumbering.

--=20
Cheers,
Stephen Rothwell

--Sig_/pqlA1vpx455Q_K6YVmokT2X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmZrezMACgkQAVBC80lX
0GzrUQgAi6RKxet5+upQje0Zmi+rxYK24YRJoiBJYS4FOhJjmVrfV30PhS4A0iRY
6rJLbmNQDJch+fanjTk9vgBnwWQyF7UM6u0llgJNJG1CIj9B+hzrly8vwlDQVrMb
V9omSFNzdEPuACyBQxesJbT0WSSh7FhADWdgAs0fJbJ4bV+JJrUJjMUUk/gCH9yL
jhT1Edundp6wSc8MMBTDDSh/qEJ7TZ+QaE3qy33hS5xtZ6IbbffTE0jIWmfqXpMM
fy8XmSBqEb7aiODMsOGQQ40bkt445ZD/ov+YkdFmOQ+l17pd4nF8TGgY6homlbzc
02zfq8b8CoN+4Otx2GEyoQwX19fwVw==
=dszQ
-----END PGP SIGNATURE-----

--Sig_/pqlA1vpx455Q_K6YVmokT2X--

