Return-Path: <linux-next+bounces-8771-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C41DEC241C2
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 10:22:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB683562D90
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 09:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5AC832D0C8;
	Fri, 31 Oct 2025 09:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="kis94X00"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DAF32ED5A;
	Fri, 31 Oct 2025 09:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761901654; cv=none; b=s+AVNt8y2ofg/JC6xnG28+oVfz49u3wv87bl/8l+fjyhoEhWAXGRpcgLXPW/1+txIa1+SIrD9QtucBzBVLAZjn4v8IZbo20Y7gjv/HZOZkeDbWu3U+eatBEQ3HBTx42DCGXScnJ2fcJbyeO5SDikT840by+RqpHAq0U010YiLyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761901654; c=relaxed/simple;
	bh=31re5kylSUgrK13tyybH72QcZb32oGU/PyNPIpQm1sA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ui6iMSV/T9EdfOydFht6TouGTGisrm7bsZpJfeZiPylefb6+op8WMo3TqbCynaN5Uqv4sHT7CH5zwa7wHEEsxCjmFA6+SGhJAJegfcDZRRwORNCv/nSZx6BSij/P+QAbR0mCc9+KCSzS46ECrdnTaSWYht0a8aX8Y6gqJhMn8Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=kis94X00; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1761901647;
	bh=qNpvLF7LOXzi/VFDii0L6C2xXSbUdQzQXVouTw7pdOs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kis94X00dHxldlq3Qd70CBKVz0rI/NZhOASWGX0/efVodcWPHgha48kXV8roW3Dii
	 sDbvxma9vbfTNbSgriRnDLb/tnS8xVq15xIaYkGaRiEyK6QLdL40pBQI69TpGbklk0
	 iLtQFFDltaXP/9pN2fZlzNGeyRJ0YH04aR63C8HYcYoP3AbkWqlP6QAissWDEPderh
	 sDs7QLSq87Bf8w2z0cfKDoU1I0Jlm+aF4AkYdZoav5flDQZbQbC06C/5KH908oETFj
	 d+zO2iG+r8tLx04qH68FuT2QLkZILe62SzhLAlsNZSHx7i0v2cdYfT9MzyewvpriVL
	 Ya9PeQF35AnBw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cyZqy17LKz4w93;
	Fri, 31 Oct 2025 20:07:26 +1100 (AEDT)
Date: Fri, 31 Oct 2025 20:07:24 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251031200724.210a4f0d@canb.auug.org.au>
In-Reply-To: <20251031123833.1dbd0130@canb.auug.org.au>
References: <20251031120243.4394e6a8@canb.auug.org.au>
 <20251031121812.1db72425@canb.auug.org.au>
 <20251031123833.1dbd0130@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xyz5DaHN=dI2hk0/fj5UY/b";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Xyz5DaHN=dI2hk0/fj5UY/b
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 31 Oct 2025 12:38:33 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Fri, 31 Oct 2025 12:18:12 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Fri, 31 Oct 2025 12:02:43 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > After merging the tip tree, today's linux-next build (arm64 defconfig)
> > > failed like this:
> > >=20
> > > arch/arm64/kernel/entry-common.c: In function 'arm64_exit_to_user_mod=
e':
> > > arch/arm64/kernel/entry-common.c:103:9: error: implicit declaration o=
f function 'exit_to_user_mode_prepare'; did you mean 'arch_exit_to_user_mod=
e_prepare'? [-Wimplicit-function-declaration]
> > >   103 |         exit_to_user_mode_prepare(regs);
> > >       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> > >       |         arch_exit_to_user_mode_prepare
> > > In file included from arch/arm64/include/asm/current.h:5,
> > >                  from include/linux/sched.h:12,
> > >                  from include/linux/context_tracking.h:5,
> > >                  from include/linux/irq-entry-common.h:5,
> > >                  from kernel/entry/common.c:3:
> > > kernel/entry/common.c: In function 'exit_to_user_mode_loop':
> > > kernel/entry/common.c:77:29: error: implicit declaration of function =
'rseq_exit_to_user_mode_restart'; did you mean 'arch_exit_to_user_mode_prep=
are'? [-Wimplicit-function-declaration]
> > >    77 |                 if (likely(!rseq_exit_to_user_mode_restart(re=
gs, ti_work)))
> > >       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > include/linux/compiler.h:76:45: note: in definition of macro 'likely'
> > >    76 | # define likely(x)      __builtin_expect(!!(x), 1)
> > >       |                                             ^
> > >=20
> > > Caused by commit
> > >=20
> > >   d58930640310 ("entry: Split up exit_to_user_mode_prepare()")
> > >=20
> > > and maybe following ones.
> > >=20
> > > I have reverted these commits for today:
> > >=20
> > >   69c8e3d16105 ("rseq: Switch to TIF_RSEQ if supported")
> > >   1b3dd1c538a8 ("rseq: Split up rseq_exit_to_user_mode()")
> > >   d58930640310 ("entry: Split up exit_to_user_mode_prepare()")   =20
> >=20
> > I also had to revert
> >=20
> >   84eeeb002035 ("rseq: Switch to fast path processing on exit to user")=
 =20
>=20
> And then the sparc64 defconfig build failed like this:
>=20
> In file included from io_uring/io_uring.h:6,
>                  from io_uring/notif.c:8:
> include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
> include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rse=
q_handle_notify_resume' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
>    62 |         rseq_handle_notify_resume(regs);
>       |                                   ^~~~
>       |                                   |
>       |                                   struct pt_regs *
> In file included from include/linux/resume_user_mode.h:9,
>                  from io_uring/io_uring.h:6,
>                  from io_uring/notif.c:8:
> include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argume=
nt is of type 'struct pt_regs *'
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                                              ~~~~~~~~~~~~~~~~^~~~
> In file included from io_uring/io_uring.h:6,
>                  from io_uring/notif.c:8:
> include/linux/resume_user_mode.h:62:9: error: too few arguments to functi=
on 'rseq_handle_notify_resume'
>    62 |         rseq_handle_notify_resume(regs);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from include/linux/resume_user_mode.h:9,
>                  from io_uring/io_uring.h:6,
>                  from io_uring/notif.c:8:
> include/linux/rseq.h:155:20: note: declared here
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:287: io_uring/notif.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> In file included from io_uring/io_uring.h:6,
>                  from io_uring/opdef.c:12:
> include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
> include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rse=
q_handle_notify_resume' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
>    62 |         rseq_handle_notify_resume(regs);
>       |                                   ^~~~
>       |                                   |
>       |                                   struct pt_regs *
> In file included from include/linux/resume_user_mode.h:9,
>                  from io_uring/io_uring.h:6,
>                  from io_uring/opdef.c:12:
> include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argume=
nt is of type 'struct pt_regs *'
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                                              ~~~~~~~~~~~~~~~~^~~~
> In file included from io_uring/io_uring.h:6,
>                  from io_uring/opdef.c:12:
> include/linux/resume_user_mode.h:62:9: error: too few arguments to functi=
on 'rseq_handle_notify_resume'
>    62 |         rseq_handle_notify_resume(regs);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from include/linux/resume_user_mode.h:9,
>                  from io_uring/io_uring.h:6,
>                  from io_uring/opdef.c:12:
> include/linux/rseq.h:155:20: note: declared here
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:287: io_uring/opdef.o] Error 1
> In file included from io_uring/io_uring.h:6,
>                  from io_uring/filetable.c:12:
> include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
> include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rse=
q_handle_notify_resume' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
>    62 |         rseq_handle_notify_resume(regs);
>       |                                   ^~~~
>       |                                   |
>       |                                   struct pt_regs *
> In file included from include/linux/resume_user_mode.h:9,
>                  from io_uring/io_uring.h:6,
>                  from io_uring/filetable.c:12:
> include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argume=
nt is of type 'struct pt_regs *'
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                                              ~~~~~~~~~~~~~~~~^~~~
> In file included from io_uring/io_uring.h:6,
>                  from io_uring/filetable.c:12:
> include/linux/resume_user_mode.h:62:9: error: too few arguments to functi=
on 'rseq_handle_notify_resume'
>    62 |         rseq_handle_notify_resume(regs);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from include/linux/resume_user_mode.h:9,
>                  from io_uring/io_uring.h:6,
>                  from io_uring/filetable.c:12:
> include/linux/rseq.h:155:20: note: declared here
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:287: io_uring/filetable.o] Error 1
> arch/sparc/vdso/vclock_gettime.c:274:1: warning: no previous prototype fo=
r '__vdso_clock_gettime' [-Wmissing-prototypes]
>   274 | __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespe=
c *ts)
>       | ^~~~~~~~~~~~~~~~~~~~
> arch/sparc/vdso/vclock_gettime.c:302:1: warning: no previous prototype fo=
r '__vdso_clock_gettime_stick' [-Wmissing-prototypes]
>   302 | __vdso_clock_gettime_stick(clockid_t clock, struct __kernel_old_t=
imespec *ts)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/sparc/vdso/vclock_gettime.c:327:1: warning: no previous prototype fo=
r '__vdso_gettimeofday' [-Wmissing-prototypes]
>   327 | __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timez=
one *tz)
>       | ^~~~~~~~~~~~~~~~~~~
> arch/sparc/vdso/vclock_gettime.c:363:1: warning: no previous prototype fo=
r '__vdso_gettimeofday_stick' [-Wmissing-prototypes]
>   363 | __vdso_gettimeofday_stick(struct __kernel_old_timeval *tv, struct=
 timezone *tz)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from io_uring/io_uring.h:6,
>                  from io_uring/tctx.c:12:
> include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
> include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rse=
q_handle_notify_resume' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
>    62 |         rseq_handle_notify_resume(regs);
>       |                                   ^~~~
>       |                                   |
>       |                                   struct pt_regs *
> In file included from include/linux/resume_user_mode.h:9,
>                  from io_uring/io_uring.h:6,
>                  from io_uring/tctx.c:12:
> include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argume=
nt is of type 'struct pt_regs *'
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                                              ~~~~~~~~~~~~~~~~^~~~
> In file included from io_uring/io_uring.h:6,
>                  from io_uring/tctx.c:12:
> include/linux/resume_user_mode.h:62:9: error: too few arguments to functi=
on 'rseq_handle_notify_resume'
>    62 |         rseq_handle_notify_resume(regs);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from include/linux/resume_user_mode.h:9,
>                  from io_uring/io_uring.h:6,
>                  from io_uring/tctx.c:12:
> include/linux/rseq.h:155:20: note: declared here
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:287: io_uring/tctx.o] Error 1
> In file included from io_uring/io_uring.h:6,
>                  from io_uring/kbuf.c:15:
> include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
> include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rse=
q_handle_notify_resume' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
>    62 |         rseq_handle_notify_resume(regs);
>       |                                   ^~~~
>       |                                   |
>       |                                   struct pt_regs *
> In file included from include/linux/resume_user_mode.h:9,
>                  from io_uring/io_uring.h:6,
>                  from io_uring/kbuf.c:15:
> include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argume=
nt is of type 'struct pt_regs *'
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                                              ~~~~~~~~~~~~~~~~^~~~
> In file included from io_uring/io_uring.h:6,
>                  from io_uring/kbuf.c:15:
> include/linux/resume_user_mode.h:62:9: error: too few arguments to functi=
on 'rseq_handle_notify_resume'
>    62 |         rseq_handle_notify_resume(regs);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from include/linux/resume_user_mode.h:9,
>                  from io_uring/io_uring.h:6,
>                  from io_uring/kbuf.c:15:
> include/linux/rseq.h:155:20: note: declared here
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:287: io_uring/kbuf.o] Error 1
> In file included from io_uring/io_uring.h:6,
>                  from io_uring/rw.c:19:
> include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
> include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rse=
q_handle_notify_resume' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
>    62 |         rseq_handle_notify_resume(regs);
>       |                                   ^~~~
>       |                                   |
>       |                                   struct pt_regs *
> In file included from include/linux/resume_user_mode.h:9,
>                  from io_uring/io_uring.h:6,
>                  from io_uring/rw.c:19:
> include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argume=
nt is of type 'struct pt_regs *'
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                                              ~~~~~~~~~~~~~~~~^~~~
> In file included from io_uring/io_uring.h:6,
>                  from io_uring/rw.c:19:
> include/linux/resume_user_mode.h:62:9: error: too few arguments to functi=
on 'rseq_handle_notify_resume'
>    62 |         rseq_handle_notify_resume(regs);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from include/linux/resume_user_mode.h:9,
>                  from io_uring/io_uring.h:6,
>                  from io_uring/rw.c:19:
> include/linux/rseq.h:155:20: note: declared here
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:287: io_uring/rw.o] Error 1
> In file included from io_uring/io_uring.h:6,
>                  from io_uring/rsrc.c:17:
> include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
> include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rse=
q_handle_notify_resume' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
>    62 |         rseq_handle_notify_resume(regs);
>       |                                   ^~~~
>       |                                   |
>       |                                   struct pt_regs *
> In file included from include/linux/resume_user_mode.h:9,
>                  from io_uring/io_uring.h:6,
>                  from io_uring/rsrc.c:17:
> include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argume=
nt is of type 'struct pt_regs *'
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                                              ~~~~~~~~~~~~~~~~^~~~
> In file included from io_uring/io_uring.h:6,
>                  from io_uring/rsrc.c:17:
> include/linux/resume_user_mode.h:62:9: error: too few arguments to functi=
on 'rseq_handle_notify_resume'
>    62 |         rseq_handle_notify_resume(regs);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from include/linux/resume_user_mode.h:9,
>                  from io_uring/io_uring.h:6,
>                  from io_uring/rsrc.c:17:
> include/linux/rseq.h:155:20: note: declared here
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:287: io_uring/rsrc.o] Error 1
> In file included from arch/sparc/vdso/vdso32/vclock_gettime.c:22:
> arch/sparc/vdso/vdso32/../vclock_gettime.c:274:1: warning: no previous pr=
ototype for '__vdso_clock_gettime' [-Wmissing-prototypes]
>   274 | __vdso_clock_gettime(clockid_t clock, struct __kernel_old_timespe=
c *ts)
>       | ^~~~~~~~~~~~~~~~~~~~
> arch/sparc/vdso/vdso32/../vclock_gettime.c:302:1: warning: no previous pr=
ototype for '__vdso_clock_gettime_stick' [-Wmissing-prototypes]
>   302 | __vdso_clock_gettime_stick(clockid_t clock, struct __kernel_old_t=
imespec *ts)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/sparc/vdso/vdso32/../vclock_gettime.c:327:1: warning: no previous pr=
ototype for '__vdso_gettimeofday' [-Wmissing-prototypes]
>   327 | __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timez=
one *tz)
>       | ^~~~~~~~~~~~~~~~~~~
> arch/sparc/vdso/vdso32/../vclock_gettime.c:363:1: warning: no previous pr=
ototype for '__vdso_gettimeofday_stick' [-Wmissing-prototypes]
>   363 | __vdso_gettimeofday_stick(struct __kernel_old_timeval *tv, struct=
 timezone *tz)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from io_uring/io_uring.h:6,
>                  from io_uring/io_uring.c:83:
> include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
> include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rse=
q_handle_notify_resume' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
>    62 |         rseq_handle_notify_resume(regs);
>       |                                   ^~~~
>       |                                   |
>       |                                   struct pt_regs *
> In file included from include/linux/resume_user_mode.h:9,
>                  from io_uring/io_uring.h:6,
>                  from io_uring/io_uring.c:83:
> include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argume=
nt is of type 'struct pt_regs *'
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                                              ~~~~~~~~~~~~~~~~^~~~
> In file included from io_uring/io_uring.h:6,
>                  from io_uring/io_uring.c:83:
> include/linux/resume_user_mode.h:62:9: error: too few arguments to functi=
on 'rseq_handle_notify_resume'
>    62 |         rseq_handle_notify_resume(regs);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from include/linux/resume_user_mode.h:9,
>                  from io_uring/io_uring.h:6,
>                  from io_uring/io_uring.c:83:
> include/linux/rseq.h:155:20: note: declared here
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[4]: *** [scripts/Makefile.build:287: io_uring/io_uring.o] Error 1
> make[3]: *** [scripts/Makefile.build:556: io_uring] Error 2
> make[3]: *** Waiting for unfinished jobs....
> In file included from arch/sparc/kernel/signal_64.c:18:
> include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
> include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rse=
q_handle_notify_resume' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
>    62 |         rseq_handle_notify_resume(regs);
>       |                                   ^~~~
>       |                                   |
>       |                                   struct pt_regs *
> In file included from include/linux/resume_user_mode.h:9,
>                  from arch/sparc/kernel/signal_64.c:18:
> include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argume=
nt is of type 'struct pt_regs *'
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                                              ~~~~~~~~~~~~~~~~^~~~
> In file included from arch/sparc/kernel/signal_64.c:18:
> include/linux/resume_user_mode.h:62:9: error: too few arguments to functi=
on 'rseq_handle_notify_resume'
>    62 |         rseq_handle_notify_resume(regs);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from include/linux/resume_user_mode.h:9,
>                  from arch/sparc/kernel/signal_64.c:18:
> include/linux/rseq.h:155:20: note: declared here
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> make[5]: *** [scripts/Makefile.build:287: arch/sparc/kernel/signal_64.o] =
Error 1
> make[5]: *** Waiting for unfinished jobs....
> make[4]: *** [scripts/Makefile.build:556: arch/sparc/kernel] Error 2
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [scripts/Makefile.build:556: arch/sparc] Error 2
> kernel/fork.c: In function '__do_sys_clone3':
> kernel/fork.c:2898:2: warning: #warning clone3() entry point is missing, =
please fix [-Wcpp]
>  2898 | #warning clone3() entry point is missing, please fix
>       |  ^~~~~~~
> kernel/fork.c:2898:2: warning: #warning clone3() entry point is missing, =
please fix [-Wcpp]
>  2898 | #warning clone3() entry point is missing, please fix
>       |  ^~~~~~~
> In file included from kernel/task_work.c:5:
> include/linux/resume_user_mode.h: In function 'resume_user_mode_work':
> include/linux/resume_user_mode.h:62:35: error: passing argument 1 of 'rse=
q_handle_notify_resume' from incompatible pointer type [-Werror=3Dincompati=
ble-pointer-types]
>    62 |         rseq_handle_notify_resume(regs);
>       |                                   ^~~~
>       |                                   |
>       |                                   struct pt_regs *
> In file included from include/linux/resume_user_mode.h:9,
>                  from kernel/task_work.c:5:
> include/linux/rseq.h:155:62: note: expected 'struct ksignal *' but argume=
nt is of type 'struct pt_regs *'
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                                              ~~~~~~~~~~~~~~~~^~~~
> In file included from kernel/task_work.c:5:
> include/linux/resume_user_mode.h:62:9: error: too few arguments to functi=
on 'rseq_handle_notify_resume'
>    62 |         rseq_handle_notify_resume(regs);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from include/linux/resume_user_mode.h:9,
>                  from kernel/task_work.c:5:
> include/linux/rseq.h:155:20: note: declared here
>   155 | static inline void rseq_handle_notify_resume(struct ksignal *ksig=
, struct pt_regs *regs) { }
>       |                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>=20
> I will come back to this later today.

I have decided to use the tip tree from next-20251030 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/Xyz5DaHN=dI2hk0/fj5UY/b
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmkEfEwACgkQAVBC80lX
0GzFdQf+I6S1X+p9bOWK5UL+WoksNgMZwkP8SYmXwA8ajiucw/kZiyeBvK5NVFMB
Mo3HBoYlipBqmOb8lOfs0jBNXg1OcblmRPjSupTCCYcajqVL9jYnMySuIbMKQyjC
i5gz8lBuGIv07yztCBDb1sfSuRGNrjEWCRETgafpHomRC+f77M4wxB9hTWhJrwX1
MR6eJ+dEoPN96H0Rn0DLzUxUpxoKOAYEEJAd+9WDNJkiwq9QBrtbo7qYSZUvOi/V
eNPMX9OLaiJXdT2pUWUqYj5T0LmvmtwQL0ErYwn2SfSxJhc7kHVHMrKvEKauzmFy
ga9h+GaCYOkX/YibwOZn8ylXfrkdAw==
=gvlp
-----END PGP SIGNATURE-----

--Sig_/Xyz5DaHN=dI2hk0/fj5UY/b--

