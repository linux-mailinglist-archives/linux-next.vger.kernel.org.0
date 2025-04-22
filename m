Return-Path: <linux-next+bounces-6346-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B168A97B66
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 01:55:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E61E17908F
	for <lists+linux-next@lfdr.de>; Tue, 22 Apr 2025 23:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5C621C184;
	Tue, 22 Apr 2025 23:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="B3eSBniX"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D251EDA2A;
	Tue, 22 Apr 2025 23:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745366120; cv=none; b=BPT9Bthgyw4aQwMGirHn1zgaAT1uhHu/MsY4nvExQS2ANm/baZWOfe9xY1jIXGphPQnfxP1hnVErrn3oZ3DkbfjZglRjoIymRa8CbmH9WGXyKXsnW7jBvGO9SGbgxdZWc45w/UJZcNmt2EVh1BsJ/L5YpJJmRDKFOHVrF6du6JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745366120; c=relaxed/simple;
	bh=/xZOT/wI5uKTXB/Q0uxr9OLfSc9UE/L+joozHYy1pNI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HgD7sM7RIZo3/43/xoEes2DWKjYFfFo3WRrKqMESLjM56U3QxsrIzZvDziUBN0njcB3yf7gwzMSxgufp/DMwc6yskQiDYrTMlnm/H7NNKf1yxqaoHb17KZ6nbfG5+D8Xu/HiijtchFdsqZOIgjVmR8r1qDYOyRPXW8Cg0LlRAU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=B3eSBniX; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1745366103;
	bh=Vmc9NHkz4RY/6taVVWGwEa9a1g7KMOwy7Ph0jl6f2lY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=B3eSBniXeCZmpq6ONJXT9RMfNXG5Cr8vbAI3zw6ApI0YUW2yrbUYVz2TeW/ZDIMBD
	 ePl/QHtbraeUFCTu3YSsiRgmhhIC2/HXyBhdAx8sLDAigwIHX5LAOt0bCU7Lo6COdc
	 1LiUGCIv4JXJgDpWjsvz1nv0RhxymvHy7T8PxAoRoKMih9rC7aCNuNyU+r1q2hqXg0
	 YudR3T0O3iwvw/+tpJiGNtlJcVQY8qB2mkD0djn5SlAVZ3BuXmL32nvko6dHSkNpq3
	 brBIXu+Ou/gpBVvRQOK07rqfyDe9PEuyibfmySM/klb6jUGXe7ISXv5WX674+e+ghd
	 ynkUxWb20aP+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Zhzcl5d00z4wcy;
	Wed, 23 Apr 2025 09:55:03 +1000 (AEST)
Date: Wed, 23 Apr 2025 09:55:03 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of Linus' tree
Message-ID: <20250423095503.638eb761@canb.auug.org.au>
In-Reply-To: <CAHk-=wjsMVpEvwq=+wAx20RWe_25LDoiMd34Msd4Mrww_-Z3Fw@mail.gmail.com>
References: <20250422204718.0b4e3f81@canb.auug.org.au>
	<CAHk-=wjsMVpEvwq=+wAx20RWe_25LDoiMd34Msd4Mrww_-Z3Fw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f90U5SWddWLgm2UOu+4dy17";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/f90U5SWddWLgm2UOu+4dy17
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Tue, 22 Apr 2025 08:59:00 -0700 Linus Torvalds <torvalds@linux-foundatio=
n.org> wrote:
>
> On Tue, 22 Apr 2025 at 03:47, Stephen Rothwell <sfr@canb.auug.org.au> wro=
te:
> >
> > These builds were done with a gcc 11.1.0 cross compiler. =20
>=20
> That sounds like there might be some issue with the cross-compiler
> logic somewhere, because the Makefile logic is using the standard
>=20
>     KBUILD_CFLAGS +=3D $(call cc-option, xyzzy)
>=20
> pattern.  We literally have seven other occurrences of that same logic
> just in that same Makefile above it (and many more in other
> makefiles).
>=20
> IOW, it's *supposed* to only actually use the flag if the compiler
> supports it, so having the compiler then say "I don't recognize that
> option" is kind of odd. We've explicitly tested that the compiler
> supports it.

Yeah, I thought it was strange.

> Does the warning happen for all files that get built, or just some
> specific ones? I wonder if we have some issue where we end up using
> two different compilers (I'd assume native and cross-built), and we
> use KBUILD_CFLAGS for the wrong compiler (or we use cc-option with the
> wrong compiler, but I'd expect that to affect *everything* - that
> 'cc-option' thing is not some kind of unusual pattern).

It happens only for a couple of files.  Here is the full sparc64 build
log:

------------------------------------------------------------------------
<stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
cc1: note: unrecognized command-line option '-Wno-unterminated-string-initi=
alization' may have been intended to silence earlier diagnostics
/home/sfr/next/next/arch/sparc/vdso/vclock_gettime.c:274:1: warning: no pre=
vious prototype for '__vdso_clock_gettime' [-Wmissing-prototypes]
  274 | __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec =
*ts)
      | ^~~~~~~~~~~~~~~~~~~~
/home/sfr/next/next/arch/sparc/vdso/vclock_gettime.c:302:1: warning: no pre=
vious prototype for '__vdso_clock_gettime_stick' [-Wmissing-prototypes]
  302 | __vdso_clock_gettime_stick(clockid_t clock, struct __kernel_old_tim=
espec *ts)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/sfr/next/next/arch/sparc/vdso/vclock_gettime.c:327:1: warning: no pre=
vious prototype for '__vdso_gettimeofday' [-Wmissing-prototypes]
  327 | __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezon=
e *tz)
      | ^~~~~~~~~~~~~~~~~~~
/home/sfr/next/next/arch/sparc/vdso/vclock_gettime.c:363:1: warning: no pre=
vious prototype for '__vdso_gettimeofday_stick' [-Wmissing-prototypes]
  363 | __vdso_gettimeofday_stick(struct __kernel_old_timeval *tv, struct t=
imezone *tz)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: note: unrecognized command-line option '-Wno-unterminated-string-initi=
alization' may have been intended to silence earlier diagnostics
In file included from /home/sfr/next/next/arch/sparc/vdso/vdso32/vclock_get=
time.c:22:
/home/sfr/next/next/arch/sparc/vdso/vdso32/../vclock_gettime.c:274:1: warni=
ng: no previous prototype for '__vdso_clock_gettime' [-Wmissing-prototypes]
  274 | __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec =
*ts)
      | ^~~~~~~~~~~~~~~~~~~~
/home/sfr/next/next/arch/sparc/vdso/vdso32/../vclock_gettime.c:302:1: warni=
ng: no previous prototype for '__vdso_clock_gettime_stick' [-Wmissing-proto=
types]
  302 | __vdso_clock_gettime_stick(clockid_t clock, struct __kernel_old_tim=
espec *ts)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
/home/sfr/next/next/arch/sparc/vdso/vdso32/../vclock_gettime.c:327:1: warni=
ng: no previous prototype for '__vdso_gettimeofday' [-Wmissing-prototypes]
  327 | __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezon=
e *tz)
      | ^~~~~~~~~~~~~~~~~~~
/home/sfr/next/next/arch/sparc/vdso/vdso32/../vclock_gettime.c:363:1: warni=
ng: no previous prototype for '__vdso_gettimeofday_stick' [-Wmissing-protot=
ypes]
  363 | __vdso_gettimeofday_stick(struct __kernel_old_timeval *tv, struct t=
imezone *tz)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: note: unrecognized command-line option '-Wno-unterminated-string-initi=
alization' may have been intended to silence earlier diagnostics
/home/sfr/next/next/kernel/fork.c: In function '__do_sys_clone3':
/home/sfr/next/next/kernel/fork.c:3150:2: warning: #warning clone3() entry =
point is missing, please fix [-Wcpp]
 3150 | #warning clone3() entry point is missing, please fix
      |  ^~~~~~~
/home/sfr/next/next/kernel/fork.c: At top level:
cc1: note: unrecognized command-line option '-Wno-unterminated-string-initi=
alization' may have been intended to silence earlier diagnostics
/home/sfr/next/next/kernel/fork.c:3150:2: warning: #warning clone3() entry =
point is missing, please fix [-Wcpp]
 3150 | #warning clone3() entry point is missing, please fix
      |  ^~~~~~~
cc1: note: unrecognized command-line option '-Wno-unterminated-string-initi=
alization' may have been intended to silence earlier diagnostics
WARNING: modpost: EXPORT symbol "_mcount" [vmlinux] version generation fail=
ed, symbol will not be versioned.
Is "_mcount" prototyped in <asm/asm-prototypes.h>?
------------------------------------------------------------------------

However:

$ /opt/cross/gcc-11.1.0-nolibc/sparc64-linux/bin/sparc64-linux-gcc -Werror =
-Wno-unterminated-string-initialization -c -x c /dev/null
$ echo $?
0
$ /opt/cross/gcc-11.1.0-nolibc/sparc64-linux/bin/sparc64-linux-gcc -Werror =
-Wunterminated-string-initialization -c -x c /dev/null
sparc64-linux-gcc: error: unrecognized command-line option '-Wunterminated-=
string-initialization'
$ echo $?
1

--=20
Cheers,
Stephen Rothwell

--Sig_/f90U5SWddWLgm2UOu+4dy17
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgILFcACgkQAVBC80lX
0GzeUwgAldqm2L0CmmCKA1wLqCFGkfnsZKM4pdUqSNlXEJtygGGE+ob/TULT2Az4
dZPX6U2J/E4Js/1hkLFdiHsILwOurAqZKYzRUuX2t3MrorcS7ujUBJDIoBzh+oIa
D12JN0luzalWIVpT07zBmGMklbX0s74n77tpTJP6R0/eyBPLsZExTMTddJO1TQNu
wafOas2ktF9r+7/ZwP1AEDYIH/T+LdwhnMSexrQdh+k8fMXSgIQDdAXUxb6FxEMy
p8398jdkDjaqPvc3DZNpQ+BylML4dB74YhAGEC5/PCA1ziJyCw2fQ/PKFR1R7Iuz
F8mXuH/dKo1GTex+MeNOn3rnn0b0iA==
=TmCE
-----END PGP SIGNATURE-----

--Sig_/f90U5SWddWLgm2UOu+4dy17--

