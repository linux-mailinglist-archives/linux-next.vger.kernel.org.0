Return-Path: <linux-next+bounces-8769-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F376DC22E47
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 02:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78A2734D157
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 01:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B3324728F;
	Fri, 31 Oct 2025 01:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="mjOL9NBy"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2526C1A0BD6;
	Fri, 31 Oct 2025 01:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761874720; cv=none; b=Y3raC8i9WDVspdQ/Lt9NKVKngaTN+BpMleimkZwjDxaz00a54lV88UZrihOeaMy+QczFANeJMu/wl2XB5qKsI/TeX5300cM5mi4delNIiswHWwrDt/9iYApD0zf8351c474gRET6T2LQx+uIauNrfz7um2tnEUjpVu4M1iJ4dMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761874720; c=relaxed/simple;
	bh=BHiiT5Bfg+sFqya7R0d8CbR5Mfy6EzHMQ6z4HvKGY0w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LuE3KtHi7tmcO3feMirBNiK78JKiHbjEn9HyNVqAVKh0BHGw79FlYxisG8Gnvbz7MYpUH/A2K67F1HDB1/6rvFrzHdMMonJPmr6KBuUuPYhbFgqhSbI1hiVqwpKOnM79gwFJqtPzJ5smfPQQGtEA8SQzfLnDIkOrzsZynv6KvUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=mjOL9NBy; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761874714;
	bh=PYUiL+0V/cAR3Reu0+ixQuOq/kSh5SzuNdMBa0Obe3U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mjOL9NByobrA9rW4IdexS3RXI0PXddIhq9nMk49FugrhdSxNFchk7bz/JsiRbhtOg
	 drWMXJpy2jh5RbLm+HULU0/+2MBX1vKXXQLmmuHRv8fwwuKg6T6IK+enDHLJ5A9mpP
	 bYsTuSOmKauyUhGzjTDQTo/xRZSZSkFIeGGusB06U1R4DrHispQf8GirRMFAfSc/Ps
	 6PUgE6DYL5C7vs0ru2ZCrvYX99rOONxSTRFK/MD4VLCoPum9+AI2auXyrjIbEcoIkV
	 bZjgurgoF/Pilfkbk8Gw6EBQwSd3FkR1xf/qXgRA2EFu0MKv/Ud5fey8lXXDNfM9MD
	 AhUNhjp1zQNhg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cyNt20dMtz4wc4;
	Fri, 31 Oct 2025 12:38:34 +1100 (AEDT)
Date: Fri, 31 Oct 2025 12:38:33 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251031123833.1dbd0130@canb.auug.org.au>
In-Reply-To: <20251031121812.1db72425@canb.auug.org.au>
References: <20251031120243.4394e6a8@canb.auug.org.au>
	<20251031121812.1db72425@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/LcOTsX+LdJosb8gjuj83z+O";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/LcOTsX+LdJosb8gjuj83z+O
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 31 Oct 2025 12:18:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 31 Oct 2025 12:02:43 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > After merging the tip tree, today's linux-next build (arm64 defconfig)
> > failed like this:
> >=20
> > arch/arm64/kernel/entry-common.c: In function 'arm64_exit_to_user_mode':
> > arch/arm64/kernel/entry-common.c:103:9: error: implicit declaration of =
function 'exit_to_user_mode_prepare'; did you mean 'arch_exit_to_user_mode_=
prepare'? [-Wimplicit-function-declaration]
> >   103 |         exit_to_user_mode_prepare(regs);
> >       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> >       |         arch_exit_to_user_mode_prepare
> > In file included from arch/arm64/include/asm/current.h:5,
> >                  from include/linux/sched.h:12,
> >                  from include/linux/context_tracking.h:5,
> >                  from include/linux/irq-entry-common.h:5,
> >                  from kernel/entry/common.c:3:
> > kernel/entry/common.c: In function 'exit_to_user_mode_loop':
> > kernel/entry/common.c:77:29: error: implicit declaration of function 'r=
seq_exit_to_user_mode_restart'; did you mean 'arch_exit_to_user_mode_prepar=
e'? [-Wimplicit-function-declaration]
> >    77 |                 if (likely(!rseq_exit_to_user_mode_restart(regs=
, ti_work)))
> >       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > include/linux/compiler.h:76:45: note: in definition of macro 'likely'
> >    76 | # define likely(x)      __builtin_expect(!!(x), 1)
> >       |                                             ^
> >=20
> > Caused by commit
> >=20
> >   d58930640310 ("entry: Split up exit_to_user_mode_prepare()")
> >=20
> > and maybe following ones.
> >=20
> > I have reverted these commits for today:
> >=20
> >   69c8e3d16105 ("rseq: Switch to TIF_RSEQ if supported")
> >   1b3dd1c538a8 ("rseq: Split up rseq_exit_to_user_mode()")
> >   d58930640310 ("entry: Split up exit_to_user_mode_prepare()") =20
>=20
> I also had to revert
>=20
>   84eeeb002035 ("rseq: Switch to fast path processing on exit to user")

And then the sparc64 defconfig build failed like this:

In file included from io_uring/io_uring.h:6,
                 from io_uring/notif.c:8:
include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rseq_=
handle_notify_resume' from incompatible pointer type [-Werror=3Dincompatibl=
e-pointer-types]
   62 |         rseq_handle_notify_resume(regs);
      |                                   ^~~~
      |                                   |
      |                                   struct pt_regs *
In file included from include/linux/resume_user_mode.h:9,
                 from io_uring/io_uring.h:6,
                 from io_uring/notif.c:8:
include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argument=
 is of type 'struct pt_regs *'
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                                              ~~~~~~~~~~~~~~~~^~~~
In file included from io_uring/io_uring.h:6,
                 from io_uring/notif.c:8:
include/linux/resume_user_mode.h:62:9: error: too few arguments to function=
 'rseq_handle_notify_resume'
   62 |         rseq_handle_notify_resume(regs);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/resume_user_mode.h:9,
                 from io_uring/io_uring.h:6,
                 from io_uring/notif.c:8:
include/linux/rseq.h:155:20: note: declared here
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:287: io_uring/notif.o] Error 1
make[4]: *** Waiting for unfinished jobs....
In file included from io_uring/io_uring.h:6,
                 from io_uring/opdef.c:12:
include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rseq_=
handle_notify_resume' from incompatible pointer type [-Werror=3Dincompatibl=
e-pointer-types]
   62 |         rseq_handle_notify_resume(regs);
      |                                   ^~~~
      |                                   |
      |                                   struct pt_regs *
In file included from include/linux/resume_user_mode.h:9,
                 from io_uring/io_uring.h:6,
                 from io_uring/opdef.c:12:
include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argument=
 is of type 'struct pt_regs *'
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                                              ~~~~~~~~~~~~~~~~^~~~
In file included from io_uring/io_uring.h:6,
                 from io_uring/opdef.c:12:
include/linux/resume_user_mode.h:62:9: error: too few arguments to function=
 'rseq_handle_notify_resume'
   62 |         rseq_handle_notify_resume(regs);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/resume_user_mode.h:9,
                 from io_uring/io_uring.h:6,
                 from io_uring/opdef.c:12:
include/linux/rseq.h:155:20: note: declared here
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:287: io_uring/opdef.o] Error 1
In file included from io_uring/io_uring.h:6,
                 from io_uring/filetable.c:12:
include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rseq_=
handle_notify_resume' from incompatible pointer type [-Werror=3Dincompatibl=
e-pointer-types]
   62 |         rseq_handle_notify_resume(regs);
      |                                   ^~~~
      |                                   |
      |                                   struct pt_regs *
In file included from include/linux/resume_user_mode.h:9,
                 from io_uring/io_uring.h:6,
                 from io_uring/filetable.c:12:
include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argument=
 is of type 'struct pt_regs *'
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                                              ~~~~~~~~~~~~~~~~^~~~
In file included from io_uring/io_uring.h:6,
                 from io_uring/filetable.c:12:
include/linux/resume_user_mode.h:62:9: error: too few arguments to function=
 'rseq_handle_notify_resume'
   62 |         rseq_handle_notify_resume(regs);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/resume_user_mode.h:9,
                 from io_uring/io_uring.h:6,
                 from io_uring/filetable.c:12:
include/linux/rseq.h:155:20: note: declared here
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:287: io_uring/filetable.o] Error 1
arch/sparc/vdso/vclock_gettime.c:274:1: warning: no previous prototype for =
'__vdso_clock_gettime' [-Wmissing-prototypes]
  274 | __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec =
*ts)
      | ^~~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vclock_gettime.c:302:1: warning: no previous prototype for =
'__vdso_clock_gettime_stick' [-Wmissing-prototypes]
  302 | __vdso_clock_gettime_stick(clockid_t clock, struct __kernel_old_tim=
espec *ts)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vclock_gettime.c:327:1: warning: no previous prototype for =
'__vdso_gettimeofday' [-Wmissing-prototypes]
  327 | __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezon=
e *tz)
      | ^~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vclock_gettime.c:363:1: warning: no previous prototype for =
'__vdso_gettimeofday_stick' [-Wmissing-prototypes]
  363 | __vdso_gettimeofday_stick(struct __kernel_old_timeval *tv, struct t=
imezone *tz)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from io_uring/io_uring.h:6,
                 from io_uring/tctx.c:12:
include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rseq_=
handle_notify_resume' from incompatible pointer type [-Werror=3Dincompatibl=
e-pointer-types]
   62 |         rseq_handle_notify_resume(regs);
      |                                   ^~~~
      |                                   |
      |                                   struct pt_regs *
In file included from include/linux/resume_user_mode.h:9,
                 from io_uring/io_uring.h:6,
                 from io_uring/tctx.c:12:
include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argument=
 is of type 'struct pt_regs *'
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                                              ~~~~~~~~~~~~~~~~^~~~
In file included from io_uring/io_uring.h:6,
                 from io_uring/tctx.c:12:
include/linux/resume_user_mode.h:62:9: error: too few arguments to function=
 'rseq_handle_notify_resume'
   62 |         rseq_handle_notify_resume(regs);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/resume_user_mode.h:9,
                 from io_uring/io_uring.h:6,
                 from io_uring/tctx.c:12:
include/linux/rseq.h:155:20: note: declared here
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:287: io_uring/tctx.o] Error 1
In file included from io_uring/io_uring.h:6,
                 from io_uring/kbuf.c:15:
include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rseq_=
handle_notify_resume' from incompatible pointer type [-Werror=3Dincompatibl=
e-pointer-types]
   62 |         rseq_handle_notify_resume(regs);
      |                                   ^~~~
      |                                   |
      |                                   struct pt_regs *
In file included from include/linux/resume_user_mode.h:9,
                 from io_uring/io_uring.h:6,
                 from io_uring/kbuf.c:15:
include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argument=
 is of type 'struct pt_regs *'
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                                              ~~~~~~~~~~~~~~~~^~~~
In file included from io_uring/io_uring.h:6,
                 from io_uring/kbuf.c:15:
include/linux/resume_user_mode.h:62:9: error: too few arguments to function=
 'rseq_handle_notify_resume'
   62 |         rseq_handle_notify_resume(regs);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/resume_user_mode.h:9,
                 from io_uring/io_uring.h:6,
                 from io_uring/kbuf.c:15:
include/linux/rseq.h:155:20: note: declared here
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:287: io_uring/kbuf.o] Error 1
In file included from io_uring/io_uring.h:6,
                 from io_uring/rw.c:19:
include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rseq_=
handle_notify_resume' from incompatible pointer type [-Werror=3Dincompatibl=
e-pointer-types]
   62 |         rseq_handle_notify_resume(regs);
      |                                   ^~~~
      |                                   |
      |                                   struct pt_regs *
In file included from include/linux/resume_user_mode.h:9,
                 from io_uring/io_uring.h:6,
                 from io_uring/rw.c:19:
include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argument=
 is of type 'struct pt_regs *'
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                                              ~~~~~~~~~~~~~~~~^~~~
In file included from io_uring/io_uring.h:6,
                 from io_uring/rw.c:19:
include/linux/resume_user_mode.h:62:9: error: too few arguments to function=
 'rseq_handle_notify_resume'
   62 |         rseq_handle_notify_resume(regs);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/resume_user_mode.h:9,
                 from io_uring/io_uring.h:6,
                 from io_uring/rw.c:19:
include/linux/rseq.h:155:20: note: declared here
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:287: io_uring/rw.o] Error 1
In file included from io_uring/io_uring.h:6,
                 from io_uring/rsrc.c:17:
include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rseq_=
handle_notify_resume' from incompatible pointer type [-Werror=3Dincompatibl=
e-pointer-types]
   62 |         rseq_handle_notify_resume(regs);
      |                                   ^~~~
      |                                   |
      |                                   struct pt_regs *
In file included from include/linux/resume_user_mode.h:9,
                 from io_uring/io_uring.h:6,
                 from io_uring/rsrc.c:17:
include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argument=
 is of type 'struct pt_regs *'
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                                              ~~~~~~~~~~~~~~~~^~~~
In file included from io_uring/io_uring.h:6,
                 from io_uring/rsrc.c:17:
include/linux/resume_user_mode.h:62:9: error: too few arguments to function=
 'rseq_handle_notify_resume'
   62 |         rseq_handle_notify_resume(regs);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/resume_user_mode.h:9,
                 from io_uring/io_uring.h:6,
                 from io_uring/rsrc.c:17:
include/linux/rseq.h:155:20: note: declared here
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:287: io_uring/rsrc.o] Error 1
In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
arch/sparc/vdso/vdso32/../vclock_gettime.c:274:1: warning: no previous prot=
otype for '__vdso_clock_gettime' [-Wmissing-prototypes]
  274 | __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespec =
*ts)
      | ^~~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vdso32/../vclock_gettime.c:302:1: warning: no previous prot=
otype for '__vdso_clock_gettime_stick' [-Wmissing-prototypes]
  302 | __vdso_clock_gettime_stick(clockid_t clock, struct __kernel_old_tim=
espec *ts)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vdso32/../vclock_gettime.c:327:1: warning: no previous prot=
otype for '__vdso_gettimeofday' [-Wmissing-prototypes]
  327 | __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezon=
e *tz)
      | ^~~~~~~~~~~~~~~~~~~
arch/sparc/vdso/vdso32/../vclock_gettime.c:363:1: warning: no previous prot=
otype for '__vdso_gettimeofday_stick' [-Wmissing-prototypes]
  363 | __vdso_gettimeofday_stick(struct __kernel_old_timeval *tv, struct t=
imezone *tz)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from io_uring/io_uring.h:6,
                 from io_uring/io_uring.c:83:
include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rseq_=
handle_notify_resume' from incompatible pointer type [-Werror=3Dincompatibl=
e-pointer-types]
   62 |         rseq_handle_notify_resume(regs);
      |                                   ^~~~
      |                                   |
      |                                   struct pt_regs *
In file included from include/linux/resume_user_mode.h:9,
                 from io_uring/io_uring.h:6,
                 from io_uring/io_uring.c:83:
include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argument=
 is of type 'struct pt_regs *'
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                                              ~~~~~~~~~~~~~~~~^~~~
In file included from io_uring/io_uring.h:6,
                 from io_uring/io_uring.c:83:
include/linux/resume_user_mode.h:62:9: error: too few arguments to function=
 'rseq_handle_notify_resume'
   62 |         rseq_handle_notify_resume(regs);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/resume_user_mode.h:9,
                 from io_uring/io_uring.h:6,
                 from io_uring/io_uring.c:83:
include/linux/rseq.h:155:20: note: declared here
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:287: io_uring/io_uring.o] Error 1
make[3]: *** [scripts/Makefile.build:556: io_uring] Error 2
make[3]: *** Waiting for unfinished jobs....
In file included from arch/sparc/kernel/signal_64.c:18:
include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rseq_=
handle_notify_resume' from incompatible pointer type [-Werror=3Dincompatibl=
e-pointer-types]
   62 |         rseq_handle_notify_resume(regs);
      |                                   ^~~~
      |                                   |
      |                                   struct pt_regs *
In file included from include/linux/resume_user_mode.h:9,
                 from arch/sparc/kernel/signal_64.c:18:
include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argument=
 is of type 'struct pt_regs *'
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                                              ~~~~~~~~~~~~~~~~^~~~
In file included from arch/sparc/kernel/signal_64.c:18:
include/linux/resume_user_mode.h:62:9: error: too few arguments to function=
 'rseq_handle_notify_resume'
   62 |         rseq_handle_notify_resume(regs);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/resume_user_mode.h:9,
                 from arch/sparc/kernel/signal_64.c:18:
include/linux/rseq.h:155:20: note: declared here
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[5]: *** [scripts/Makefile.build:287: arch/sparc/kernel/signal_64.o] Er=
ror 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [scripts/Makefile.build:556: arch/sparc/kernel] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [scripts/Makefile.build:556: arch/sparc] Error 2
kernel/fork.c: In function '__do_sys_clone3':
kernel/fork.c:2898:2: warning: #warning clone3() entry point is missing, pl=
ease fix [-Wcpp]
 2898 | #warning clone3() entry point is missing, please fix
      |  ^~~~~~~
kernel/fork.c:2898:2: warning: #warning clone3() entry point is missing, pl=
ease fix [-Wcpp]
 2898 | #warning clone3() entry point is missing, please fix
      |  ^~~~~~~
In file included from kernel/task_work.c:5:
include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rseq_=
handle_notify_resume' from incompatible pointer type [-Werror=3Dincompatibl=
e-pointer-types]
   62 |         rseq_handle_notify_resume(regs);
      |                                   ^~~~
      |                                   |
      |                                   struct pt_regs *
In file included from include/linux/resume_user_mode.h:9,
                 from kernel/task_work.c:5:
include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argument=
 is of type 'struct pt_regs *'
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                                              ~~~~~~~~~~~~~~~~^~~~
In file included from kernel/task_work.c:5:
include/linux/resume_user_mode.h:62:9: error: too few arguments to function=
 'rseq_handle_notify_resume'
   62 |         rseq_handle_notify_resume(regs);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from include/linux/resume_user_mode.h:9,
                 from kernel/task_work.c:5:
include/linux/rseq.h:155:20: note: declared here
  155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig, =
struct pt_regs *regs) { }
      |                    ^~~~~~~~~~~~~~~~~~~~~~~~~

I will come back to this later today.

--=20
Cheers,
Stephen Rothwell

--Sig_/LcOTsX+LdJosb8gjuj83z+O
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkEExkACgkQAVBC80lX
0Gxozgf/aPkRoi/CeUF9RBPKGG2zalrrnDcD0vPKvnVrLdN1xvE76Izq0f1cp2Yo
/2eDp4sXztlgTUCsX/BxpkIhaUPQUR9V33vvCY8gr3PUYYAKWym/ZLbkndpk0oIV
NsvhTKJmPSO4nhLPLcP0xGSJYdfFhZ9A71Cpy84DH+8nd7jFjxbXLO6LFWdP5nii
MNG3WVYhCDhPaRqv9L1rmG7V27gHg9E4nCIezpjyQzy1PtHPhcICG1txDAQymDhC
4MmoaM17PNCVSF3Za1V0LMu0xL+VrafMVU3rKpUm8fR1Klpqjl5eMNPyME9YzLyf
gH1gC1BKDtMHumwBPqeO0RQjhXojgw==
=N/K0
-----END PGP SIGNATURE-----

--Sig_/LcOTsX+LdJosb8gjuj83z+O--

