Return-Path: <linux-next+bounces-8248-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A094B509FB
	for <lists+linux-next@lfdr.de>; Wed, 10 Sep 2025 02:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FC094E789D
	for <lists+linux-next@lfdr.de>; Wed, 10 Sep 2025 00:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C028F1BCA1C;
	Wed, 10 Sep 2025 00:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="BglanSwp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD04C1B4223;
	Wed, 10 Sep 2025 00:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757465393; cv=none; b=PuKCGeirOdV5Ol4xABmajtQvuiOvJrXwXe/XTS8lUDoLibA2TzPAiqlcOpJJXwxuNMmlnIg0lqdrTDePqouswspa2UAWv1iGMqlPQ4+oMbWq4zrSz3EPeuZz04iifhI25aXwh+mXjBQrr+qg9/V/pnpJ76X3uPzfG+dLWCWmdFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757465393; c=relaxed/simple;
	bh=WoGTwnxvANUHzj43k3fELoy/+Yl3sMcGZW3xIZ3luIY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V2Y0BJ5njU/HjaqecwfMKPxw2Od1xmZbBY278JmQSlVSnXQSu/th8GloP2b6J+CMfSdFj/CqAGDmI81nvQqBUk3MrOoa/qTbeHhT8jLkRtnxMh0cnWgH7Ef1jkMS2nKAvKc8dYc56MV/EUnLSM07hCoUjSoqay0fif0axiTAlyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=BglanSwp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1757465385;
	bh=O8TKau/iCZoV+eLLA3QuF9gX6gvY8VCbb4xV/TWte6s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BglanSwp2A2oRgSmsAAVJhNpYBKt1FozWS1FgRoFb5tBkGluAs1rD7v+37xCVvYwb
	 A5XkUqJ5afTxf063HPV7Y4BjnyYUzptji6Co4c+sqyBMou3huiZ3jYnpy+yHQRa1h3
	 s8vtlPLu5NOnOyxWdnOKNETbBl4Ulai4LyCnum1X6lUZlozetwfmKO+ib9rf7p5lHx
	 BEmcMdRjjYBRP1KUihppUVI8rd3ZKweYL+Yz+2yjco2JsUMn1RD0yPtGoWhJR70WMF
	 usj+pXaxzYwYM/Ax58LEGtAWtyNfCyg5H3XDEZ1QZSiPii7E7qCeN1Izci0NRvet9p
	 FUph2eMahmOcg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cM2CF1ktRz4wBC;
	Wed, 10 Sep 2025 10:49:45 +1000 (AEST)
Date: Wed, 10 Sep 2025 10:49:44 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Simon Schuster <schuster.simon@siemens-energy.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20250910104944.3e420e96@canb.auug.org.au>
In-Reply-To: <20250908120229.7a4e6db9@canb.auug.org.au>
References: <20250904113334.18822d43@canb.auug.org.au>
	<20250908120229.7a4e6db9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7TrbQ+1nz8oRSCEzfrxRQyt";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/7TrbQ+1nz8oRSCEzfrxRQyt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 8 Sep 2025 12:02:29 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Thu, 4 Sep 2025 11:33:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >=20
> > After merging the vfs-brauner tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > In file included from include/rv/ltl_monitor.h:11,
> >                  from kernel/trace/rv/monitors/sleep/sleep.c:23:
> > include/rv/ltl_monitor.h: In function 'ltl_monitor_init':
> > include/rv/ltl_monitor.h:75:51: error: passing argument 1 of 'check_tra=
ce_callback_type_task_newtask' from incompatible pointer type [-Wincompatib=
le-pointer-types]
> >    75 |         rv_attach_trace_probe(name, task_newtask, handle_task_n=
ewtask);
> >       |                                                   ^~~~~~~~~~~~~=
~~~~~~
> >       |                                                   |
> >       |                                                   void (*)(void=
 *, struct task_struct *, long unsigned int)
> > include/rv/instrumentation.h:18:48: note: in definition of macro 'rv_at=
tach_trace_probe'
> >    18 |                 check_trace_callback_type_##tp(rv_handler);    =
                         \
> >       |                                                ^~~~~~~~~~
> > In file included from kernel/trace/rv/monitors/sleep/sleep.c:3:
> > include/linux/tracepoint.h:260:49: note: expected 'void (*)(void *, str=
uct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long =
long unsigned int)'} but argument is of type 'void (*)(void *, struct task_=
struct *, long unsigned int)'
> >   260 |         check_trace_callback_type_##name(void (*cb)(data_proto)=
)        \
> >       |                                          ~~~~~~~^~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLAR=
E_TRACE_COMMON'
> >   270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args=
), PARAMS(data_proto)) \
> >       |         ^~~~~~~~~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLAR=
E_TRACE'
> >   481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),     =
         \
> >       |         ^~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_=
TRACE_EVENT'
> >   619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
> >       |         ^~~~~~~~~~~~~~~~~~~
> > include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVE=
NT'
> >     9 | TRACE_EVENT(task_newtask,
> >       | ^~~~~~~~~~~
> > In file included from include/asm-generic/bug.h:7,
> >                  from arch/x86/include/asm/bug.h:103,
> >                  from arch/x86/include/asm/alternative.h:9,
> >                  from arch/x86/include/asm/barrier.h:5,
> >                  from include/asm-generic/bitops/generic-non-atomic.h:7,
> >                  from include/linux/bitops.h:28,
> >                  from include/linux/kernel.h:23,
> >                  from include/linux/interrupt.h:6,
> >                  from include/linux/trace_recursion.h:5,
> >                  from include/linux/ftrace.h:10,
> >                  from kernel/trace/rv/monitors/sleep/sleep.c:2:
> > include/rv/ltl_monitor.h:75:51: error: passing argument 1 of 'register_=
trace_task_newtask' from incompatible pointer type [-Wincompatible-pointer-=
types]
> >    75 |         rv_attach_trace_probe(name, task_newtask, handle_task_n=
ewtask);
> >       |                                                   ^~~~~~~~~~~~~=
~~~~~~
> >       |                                                   |
> >       |                                                   void (*)(void=
 *, struct task_struct *, long unsigned int)
> > include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_=
LITE_IF'
> >    28 |                 bool __ret_do_once =3D !!(condition);          =
           \
> >       |                                         ^~~~~~~~~
> > include/rv/instrumentation.h:19:17: note: in expansion of macro 'WARN_O=
NCE'
> >    19 |                 WARN_ONCE(register_trace_##tp(rv_handler, NULL)=
,                        \
> >       |                 ^~~~~~~~~
> > include/rv/ltl_monitor.h:75:9: note: in expansion of macro 'rv_attach_t=
race_probe'
> >    75 |         rv_attach_trace_probe(name, task_newtask, handle_task_n=
ewtask);
> >       |         ^~~~~~~~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:241:38: note: expected 'void (*)(void *, str=
uct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long =
long unsigned int)'} but argument is of type 'void (*)(void *, struct task_=
struct *, long unsigned int)'
> >   241 |         register_trace_##name(void (*probe)(data_proto), void *=
data)    \
> >       |                               ~~~~~~~^~~~~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLAR=
E_TRACE_COMMON'
> >   270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args=
), PARAMS(data_proto)) \
> >       |         ^~~~~~~~~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLAR=
E_TRACE'
> >   481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),     =
         \
> >       |         ^~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_=
TRACE_EVENT'
> >   619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
> >       |         ^~~~~~~~~~~~~~~~~~~
> > include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVE=
NT'
> >     9 | TRACE_EVENT(task_newtask,
> >       | ^~~~~~~~~~~
> > include/rv/ltl_monitor.h: In function 'ltl_monitor_destroy':
> > include/rv/ltl_monitor.h:92:51: error: passing argument 1 of 'unregiste=
r_trace_task_newtask' from incompatible pointer type [-Wincompatible-pointe=
r-types]
> >    92 |         rv_detach_trace_probe(name, task_newtask, handle_task_n=
ewtask);
> >       |                                                   ^~~~~~~~~~~~~=
~~~~~~
> >       |                                                   |
> >       |                                                   void (*)(void=
 *, struct task_struct *, long unsigned int)
> > include/rv/instrumentation.h:28:39: note: in definition of macro 'rv_de=
tach_trace_probe'
> >    28 |                 unregister_trace_##tp(rv_handler, NULL);       =
                         \
> >       |                                       ^~~~~~~~~~
> > include/linux/tracepoint.h:254:40: note: expected 'void (*)(void *, str=
uct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long =
long unsigned int)'} but argument is of type 'void (*)(void *, struct task_=
struct *, long unsigned int)'
> >   254 |         unregister_trace_##name(void (*probe)(data_proto), void=
 *data)  \
> >       |                                 ~~~~~~~^~~~~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLAR=
E_TRACE_COMMON'
> >   270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args=
), PARAMS(data_proto)) \
> >       |         ^~~~~~~~~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLAR=
E_TRACE'
> >   481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),     =
         \
> >       |         ^~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_=
TRACE_EVENT'
> >   619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
> >       |         ^~~~~~~~~~~~~~~~~~~
> > include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVE=
NT'
> >     9 | TRACE_EVENT(task_newtask,
> >       | ^~~~~~~~~~~
> > In file included from include/rv/ltl_monitor.h:11,
> >                  from kernel/trace/rv/monitors/pagefault/pagefault.c:19:
> > include/rv/ltl_monitor.h: In function 'ltl_monitor_init':
> > include/rv/ltl_monitor.h:75:51: error: passing argument 1 of 'check_tra=
ce_callback_type_task_newtask' from incompatible pointer type [-Wincompatib=
le-pointer-types]
> >    75 |         rv_attach_trace_probe(name, task_newtask, handle_task_n=
ewtask);
> >       |                                                   ^~~~~~~~~~~~~=
~~~~~~
> >       |                                                   |
> >       |                                                   void (*)(void=
 *, struct task_struct *, long unsigned int)
> > include/rv/instrumentation.h:18:48: note: in definition of macro 'rv_at=
tach_trace_probe'
> >    18 |                 check_trace_callback_type_##tp(rv_handler);    =
                         \
> >       |                                                ^~~~~~~~~~
> > In file included from kernel/trace/rv/monitors/pagefault/pagefault.c:9:
> > include/linux/tracepoint.h:260:49: note: expected 'void (*)(void *, str=
uct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long =
long unsigned int)'} but argument is of type 'void (*)(void *, struct task_=
struct *, long unsigned int)'
> >   260 |         check_trace_callback_type_##name(void (*cb)(data_proto)=
)        \
> >       |                                          ~~~~~~~^~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLAR=
E_TRACE_COMMON'
> >   270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args=
), PARAMS(data_proto)) \
> >       |         ^~~~~~~~~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLAR=
E_TRACE'
> >   481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),     =
         \
> >       |         ^~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_=
TRACE_EVENT'
> >   619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
> >       |         ^~~~~~~~~~~~~~~~~~~
> > include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVE=
NT'
> >     9 | TRACE_EVENT(task_newtask,
> >       | ^~~~~~~~~~~
> > In file included from include/asm-generic/bug.h:7,
> >                  from arch/x86/include/asm/bug.h:103,
> >                  from arch/x86/include/asm/alternative.h:9,
> >                  from arch/x86/include/asm/barrier.h:5,
> >                  from include/asm-generic/bitops/generic-non-atomic.h:7,
> >                  from include/linux/bitops.h:28,
> >                  from include/linux/kernel.h:23,
> >                  from include/linux/interrupt.h:6,
> >                  from include/linux/trace_recursion.h:5,
> >                  from include/linux/ftrace.h:10,
> >                  from kernel/trace/rv/monitors/pagefault/pagefault.c:2:
> > include/rv/ltl_monitor.h:75:51: error: passing argument 1 of 'register_=
trace_task_newtask' from incompatible pointer type [-Wincompatible-pointer-=
types]
> >    75 |         rv_attach_trace_probe(name, task_newtask, handle_task_n=
ewtask);
> >       |                                                   ^~~~~~~~~~~~~=
~~~~~~
> >       |                                                   |
> >       |                                                   void (*)(void=
 *, struct task_struct *, long unsigned int)
> > include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_=
LITE_IF'
> >    28 |                 bool __ret_do_once =3D !!(condition);          =
           \
> >       |                                         ^~~~~~~~~
> > include/rv/instrumentation.h:19:17: note: in expansion of macro 'WARN_O=
NCE'
> >    19 |                 WARN_ONCE(register_trace_##tp(rv_handler, NULL)=
,                        \
> >       |                 ^~~~~~~~~
> > include/rv/ltl_monitor.h:75:9: note: in expansion of macro 'rv_attach_t=
race_probe'
> >    75 |         rv_attach_trace_probe(name, task_newtask, handle_task_n=
ewtask);
> >       |         ^~~~~~~~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:241:38: note: expected 'void (*)(void *, str=
uct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long =
long unsigned int)'} but argument is of type 'void (*)(void *, struct task_=
struct *, long unsigned int)'
> >   241 |         register_trace_##name(void (*probe)(data_proto), void *=
data)    \
> >       |                               ~~~~~~~^~~~~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLAR=
E_TRACE_COMMON'
> >   270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args=
), PARAMS(data_proto)) \
> >       |         ^~~~~~~~~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLAR=
E_TRACE'
> >   481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),     =
         \
> >       |         ^~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_=
TRACE_EVENT'
> >   619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
> >       |         ^~~~~~~~~~~~~~~~~~~
> > include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVE=
NT'
> >     9 | TRACE_EVENT(task_newtask,
> >       | ^~~~~~~~~~~
> > include/rv/ltl_monitor.h: In function 'ltl_monitor_destroy':
> > include/rv/ltl_monitor.h:92:51: error: passing argument 1 of 'unregiste=
r_trace_task_newtask' from incompatible pointer type [-Wincompatible-pointe=
r-types]
> >    92 |         rv_detach_trace_probe(name, task_newtask, handle_task_n=
ewtask);
> >       |                                                   ^~~~~~~~~~~~~=
~~~~~~
> >       |                                                   |
> >       |                                                   void (*)(void=
 *, struct task_struct *, long unsigned int)
> > include/rv/instrumentation.h:28:39: note: in definition of macro 'rv_de=
tach_trace_probe'
> >    28 |                 unregister_trace_##tp(rv_handler, NULL);       =
                         \
> >       |                                       ^~~~~~~~~~
> > include/linux/tracepoint.h:254:40: note: expected 'void (*)(void *, str=
uct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long =
long unsigned int)'} but argument is of type 'void (*)(void *, struct task_=
struct *, long unsigned int)'
> >   254 |         unregister_trace_##name(void (*probe)(data_proto), void=
 *data)  \
> >       |                                 ~~~~~~~^~~~~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLAR=
E_TRACE_COMMON'
> >   270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args=
), PARAMS(data_proto)) \
> >       |         ^~~~~~~~~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLAR=
E_TRACE'
> >   481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),     =
         \
> >       |         ^~~~~~~~~~~~~~~
> > include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_=
TRACE_EVENT'
> >   619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
> >       |         ^~~~~~~~~~~~~~~~~~~
> > include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVE=
NT'
> >     9 | TRACE_EVENT(task_newtask,
> >       | ^~~~~~~~~~~
> >=20
> > Presumably caused by commit
> >=20
> >   edd3cb05c00a ("copy_process: pass clone_flags as u64 across calltree")
> >=20
> > I have used the vfs-brauner tree from next-20250829 for today. =20
>=20
> I am still seeing this failure.

=46rom today, I have instead just reverted these three commits:

  c6ac444ff20c ("nios2: implement architecture-specific portion of sys_clon=
e3")
  bbc46b23af5b ("arch: copy_thread: pass clone_flags as u64")
  edd3cb05c00a ("copy_process: pass clone_flags as u64 across calltree")

--=20
Cheers,
Stephen Rothwell

--Sig_/7TrbQ+1nz8oRSCEzfrxRQyt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmjAyygACgkQAVBC80lX
0Gzocwf9EiKLA91QWCbfq9fmBKtinGGCinp6ORtbT3Y+0l1YADwkArKlNo6YlqYU
pCcuReB1SNoYK91etkvJnJnunVYYlWwZ/TxfgX+rpJUy6/Vzcf2A9mXoaVzpext3
QDI/Rm/sgelFZYFu7BibPlDT3hWocCCZDidOjh1KbjQY6TMwhvBW+SKL9Oz1y6DO
u2zd8z5t4jiOO2X3BOw3Al9ld0nvhmPlu+D5al5LycbG9KTVOHsuIq2iJARs3HUK
bhN8W4Zov1RrSsTuu1ym33lJO4zr4nlJnI4kr8GdqiQFHQQLuMFQjcuBXZD4VM69
9xUsp9ZODF/ZtnCBtOuMusGPRbRS4Q==
=Pkgu
-----END PGP SIGNATURE-----

--Sig_/7TrbQ+1nz8oRSCEzfrxRQyt--

