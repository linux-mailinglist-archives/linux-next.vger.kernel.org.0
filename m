Return-Path: <linux-next+bounces-8180-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDF6B42EDB
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 03:34:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD34B1896499
	for <lists+linux-next@lfdr.de>; Thu,  4 Sep 2025 01:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87AA445C14;
	Thu,  4 Sep 2025 01:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="JuTnpxeg"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D791DFCB;
	Thu,  4 Sep 2025 01:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949636; cv=none; b=sAAHNsvwMqeA2/JIxHotabfzGjYSQKshBrE6PWiPUvRENEdGHg2DLpJFI/TuwrrZSrADmY7mRMLuu2GhIateGLQXVZxW1N2SKcHX/EV6w2PZz6Ia/pxFLdbDjNwHu+ZdMi/VNjQiWVOb3866BwgHhahrUWe/xA4/NEUYNpEkDBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949636; c=relaxed/simple;
	bh=DtkvrNP7w08gM9yU3FrMmrzllWzkaC9Cm5WXraBpWZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=U85N7/wP9LSXChITQefxCC5vq7hI9hg7U2J3MlGtsEvlTFrVA7c/ScGQczH/V4pV1dN2ogJNoiSqz8E+RY9ltAwuKG02Pi4lw15CJL2vwaRaG4xKGGd5KJxUnPPo2QDrNIldyClOFI2N6Bc2e8yXuacG1NF0ujBTkWakZNN1hEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=JuTnpxeg; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1756949629;
	bh=8IgRurJM6lT+ULAr0UR24U7GUYvZyB2KalpNkdU3bM4=;
	h=Date:From:To:Cc:Subject:From;
	b=JuTnpxegPKZrIT62V9MbnCxd1pDlqh+t+VuZ0lDdZZV+pqlLC6tmRZlNVYjDpAuDQ
	 x4RNRKHQutS3wGdDXDIVdFV9mSZSAlW0++AX+8iiThNaJnQnDFoQF6291/07WsI7mM
	 HauqgMpfFhPZZUr3bFwAt9Trq9X2vmIGmnjsd1gfY+cAf0yyNfn0BscOoBoKx+z/B7
	 pllVMmqef4gGqeYuDogSEz0KjEuYkDHuSr947P9aB5o9dSzPo4UB4S+MJI7BESGQoq
	 QRw0AEH5o4sHc6KkXfgqOVWVsMRXzTvT2Gw8NqXpccX9IhOT5wpjt/5QgETzaPlMl6
	 LUS0iepSlnyAQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cHMSr5V7gz4w23;
	Thu,  4 Sep 2025 11:33:48 +1000 (AEST)
Date: Thu, 4 Sep 2025 11:33:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Christian Brauner <brauner@kernel.org>
Cc: Simon Schuster <schuster.simon@siemens-energy.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <20250904113334.18822d43@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1j3F=qdA2YqPgldUugDQd_F";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/1j3F=qdA2YqPgldUugDQd_F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the vfs-brauner tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/rv/ltl_monitor.h:11,
                 from kernel/trace/rv/monitors/sleep/sleep.c:23:
include/rv/ltl_monitor.h: In function 'ltl_monitor_init':
include/rv/ltl_monitor.h:75:51: error: passing argument 1 of 'check_trace_c=
allback_type_task_newtask' from incompatible pointer type [-Wincompatible-p=
ointer-types]
   75 |         rv_attach_trace_probe(name, task_newtask, handle_task_newta=
sk);
      |                                                   ^~~~~~~~~~~~~~~~~=
~~
      |                                                   |
      |                                                   void (*)(void *, =
struct task_struct *, long unsigned int)
include/rv/instrumentation.h:18:48: note: in definition of macro 'rv_attach=
_trace_probe'
   18 |                 check_trace_callback_type_##tp(rv_handler);        =
                     \
      |                                                ^~~~~~~~~~
In file included from kernel/trace/rv/monitors/sleep/sleep.c:3:
include/linux/tracepoint.h:260:49: note: expected 'void (*)(void *, struct =
task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long long=
 unsigned int)'} but argument is of type 'void (*)(void *, struct task_stru=
ct *, long unsigned int)'
  260 |         check_trace_callback_type_##name(void (*cb)(data_proto))   =
     \
      |                                          ~~~~~~~^~~~~~~~~~~~~~~
include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TR=
ACE_COMMON'
  270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), P=
ARAMS(data_proto)) \
      |         ^~~~~~~~~~~~~~~~~~~~~~
include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TR=
ACE'
  481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),         =
     \
      |         ^~~~~~~~~~~~~~~
include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_TRAC=
E_EVENT'
  619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
      |         ^~~~~~~~~~~~~~~~~~~
include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVENT'
    9 | TRACE_EVENT(task_newtask,
      | ^~~~~~~~~~~
In file included from include/asm-generic/bug.h:7,
                 from arch/x86/include/asm/bug.h:103,
                 from arch/x86/include/asm/alternative.h:9,
                 from arch/x86/include/asm/barrier.h:5,
                 from include/asm-generic/bitops/generic-non-atomic.h:7,
                 from include/linux/bitops.h:28,
                 from include/linux/kernel.h:23,
                 from include/linux/interrupt.h:6,
                 from include/linux/trace_recursion.h:5,
                 from include/linux/ftrace.h:10,
                 from kernel/trace/rv/monitors/sleep/sleep.c:2:
include/rv/ltl_monitor.h:75:51: error: passing argument 1 of 'register_trac=
e_task_newtask' from incompatible pointer type [-Wincompatible-pointer-type=
s]
   75 |         rv_attach_trace_probe(name, task_newtask, handle_task_newta=
sk);
      |                                                   ^~~~~~~~~~~~~~~~~=
~~
      |                                                   |
      |                                                   void (*)(void *, =
struct task_struct *, long unsigned int)
include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE=
_IF'
   28 |                 bool __ret_do_once =3D !!(condition);              =
       \
      |                                         ^~~~~~~~~
include/rv/instrumentation.h:19:17: note: in expansion of macro 'WARN_ONCE'
   19 |                 WARN_ONCE(register_trace_##tp(rv_handler, NULL),   =
                     \
      |                 ^~~~~~~~~
include/rv/ltl_monitor.h:75:9: note: in expansion of macro 'rv_attach_trace=
_probe'
   75 |         rv_attach_trace_probe(name, task_newtask, handle_task_newta=
sk);
      |         ^~~~~~~~~~~~~~~~~~~~~
include/linux/tracepoint.h:241:38: note: expected 'void (*)(void *, struct =
task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long long=
 unsigned int)'} but argument is of type 'void (*)(void *, struct task_stru=
ct *, long unsigned int)'
  241 |         register_trace_##name(void (*probe)(data_proto), void *data=
)    \
      |                               ~~~~~~~^~~~~~~~~~~~~~~~~~
include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TR=
ACE_COMMON'
  270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), P=
ARAMS(data_proto)) \
      |         ^~~~~~~~~~~~~~~~~~~~~~
include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TR=
ACE'
  481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),         =
     \
      |         ^~~~~~~~~~~~~~~
include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_TRAC=
E_EVENT'
  619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
      |         ^~~~~~~~~~~~~~~~~~~
include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVENT'
    9 | TRACE_EVENT(task_newtask,
      | ^~~~~~~~~~~
include/rv/ltl_monitor.h: In function 'ltl_monitor_destroy':
include/rv/ltl_monitor.h:92:51: error: passing argument 1 of 'unregister_tr=
ace_task_newtask' from incompatible pointer type [-Wincompatible-pointer-ty=
pes]
   92 |         rv_detach_trace_probe(name, task_newtask, handle_task_newta=
sk);
      |                                                   ^~~~~~~~~~~~~~~~~=
~~
      |                                                   |
      |                                                   void (*)(void *, =
struct task_struct *, long unsigned int)
include/rv/instrumentation.h:28:39: note: in definition of macro 'rv_detach=
_trace_probe'
   28 |                 unregister_trace_##tp(rv_handler, NULL);           =
                     \
      |                                       ^~~~~~~~~~
include/linux/tracepoint.h:254:40: note: expected 'void (*)(void *, struct =
task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long long=
 unsigned int)'} but argument is of type 'void (*)(void *, struct task_stru=
ct *, long unsigned int)'
  254 |         unregister_trace_##name(void (*probe)(data_proto), void *da=
ta)  \
      |                                 ~~~~~~~^~~~~~~~~~~~~~~~~~
include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TR=
ACE_COMMON'
  270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), P=
ARAMS(data_proto)) \
      |         ^~~~~~~~~~~~~~~~~~~~~~
include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TR=
ACE'
  481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),         =
     \
      |         ^~~~~~~~~~~~~~~
include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_TRAC=
E_EVENT'
  619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
      |         ^~~~~~~~~~~~~~~~~~~
include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVENT'
    9 | TRACE_EVENT(task_newtask,
      | ^~~~~~~~~~~
In file included from include/rv/ltl_monitor.h:11,
                 from kernel/trace/rv/monitors/pagefault/pagefault.c:19:
include/rv/ltl_monitor.h: In function 'ltl_monitor_init':
include/rv/ltl_monitor.h:75:51: error: passing argument 1 of 'check_trace_c=
allback_type_task_newtask' from incompatible pointer type [-Wincompatible-p=
ointer-types]
   75 |         rv_attach_trace_probe(name, task_newtask, handle_task_newta=
sk);
      |                                                   ^~~~~~~~~~~~~~~~~=
~~
      |                                                   |
      |                                                   void (*)(void *, =
struct task_struct *, long unsigned int)
include/rv/instrumentation.h:18:48: note: in definition of macro 'rv_attach=
_trace_probe'
   18 |                 check_trace_callback_type_##tp(rv_handler);        =
                     \
      |                                                ^~~~~~~~~~
In file included from kernel/trace/rv/monitors/pagefault/pagefault.c:9:
include/linux/tracepoint.h:260:49: note: expected 'void (*)(void *, struct =
task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long long=
 unsigned int)'} but argument is of type 'void (*)(void *, struct task_stru=
ct *, long unsigned int)'
  260 |         check_trace_callback_type_##name(void (*cb)(data_proto))   =
     \
      |                                          ~~~~~~~^~~~~~~~~~~~~~~
include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TR=
ACE_COMMON'
  270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), P=
ARAMS(data_proto)) \
      |         ^~~~~~~~~~~~~~~~~~~~~~
include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TR=
ACE'
  481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),         =
     \
      |         ^~~~~~~~~~~~~~~
include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_TRAC=
E_EVENT'
  619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
      |         ^~~~~~~~~~~~~~~~~~~
include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVENT'
    9 | TRACE_EVENT(task_newtask,
      | ^~~~~~~~~~~
In file included from include/asm-generic/bug.h:7,
                 from arch/x86/include/asm/bug.h:103,
                 from arch/x86/include/asm/alternative.h:9,
                 from arch/x86/include/asm/barrier.h:5,
                 from include/asm-generic/bitops/generic-non-atomic.h:7,
                 from include/linux/bitops.h:28,
                 from include/linux/kernel.h:23,
                 from include/linux/interrupt.h:6,
                 from include/linux/trace_recursion.h:5,
                 from include/linux/ftrace.h:10,
                 from kernel/trace/rv/monitors/pagefault/pagefault.c:2:
include/rv/ltl_monitor.h:75:51: error: passing argument 1 of 'register_trac=
e_task_newtask' from incompatible pointer type [-Wincompatible-pointer-type=
s]
   75 |         rv_attach_trace_probe(name, task_newtask, handle_task_newta=
sk);
      |                                                   ^~~~~~~~~~~~~~~~~=
~~
      |                                                   |
      |                                                   void (*)(void *, =
struct task_struct *, long unsigned int)
include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE=
_IF'
   28 |                 bool __ret_do_once =3D !!(condition);              =
       \
      |                                         ^~~~~~~~~
include/rv/instrumentation.h:19:17: note: in expansion of macro 'WARN_ONCE'
   19 |                 WARN_ONCE(register_trace_##tp(rv_handler, NULL),   =
                     \
      |                 ^~~~~~~~~
include/rv/ltl_monitor.h:75:9: note: in expansion of macro 'rv_attach_trace=
_probe'
   75 |         rv_attach_trace_probe(name, task_newtask, handle_task_newta=
sk);
      |         ^~~~~~~~~~~~~~~~~~~~~
include/linux/tracepoint.h:241:38: note: expected 'void (*)(void *, struct =
task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long long=
 unsigned int)'} but argument is of type 'void (*)(void *, struct task_stru=
ct *, long unsigned int)'
  241 |         register_trace_##name(void (*probe)(data_proto), void *data=
)    \
      |                               ~~~~~~~^~~~~~~~~~~~~~~~~~
include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TR=
ACE_COMMON'
  270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), P=
ARAMS(data_proto)) \
      |         ^~~~~~~~~~~~~~~~~~~~~~
include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TR=
ACE'
  481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),         =
     \
      |         ^~~~~~~~~~~~~~~
include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_TRAC=
E_EVENT'
  619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
      |         ^~~~~~~~~~~~~~~~~~~
include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVENT'
    9 | TRACE_EVENT(task_newtask,
      | ^~~~~~~~~~~
include/rv/ltl_monitor.h: In function 'ltl_monitor_destroy':
include/rv/ltl_monitor.h:92:51: error: passing argument 1 of 'unregister_tr=
ace_task_newtask' from incompatible pointer type [-Wincompatible-pointer-ty=
pes]
   92 |         rv_detach_trace_probe(name, task_newtask, handle_task_newta=
sk);
      |                                                   ^~~~~~~~~~~~~~~~~=
~~
      |                                                   |
      |                                                   void (*)(void *, =
struct task_struct *, long unsigned int)
include/rv/instrumentation.h:28:39: note: in definition of macro 'rv_detach=
_trace_probe'
   28 |                 unregister_trace_##tp(rv_handler, NULL);           =
                     \
      |                                       ^~~~~~~~~~
include/linux/tracepoint.h:254:40: note: expected 'void (*)(void *, struct =
task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long long=
 unsigned int)'} but argument is of type 'void (*)(void *, struct task_stru=
ct *, long unsigned int)'
  254 |         unregister_trace_##name(void (*probe)(data_proto), void *da=
ta)  \
      |                                 ~~~~~~~^~~~~~~~~~~~~~~~~~
include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TR=
ACE_COMMON'
  270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), P=
ARAMS(data_proto)) \
      |         ^~~~~~~~~~~~~~~~~~~~~~
include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TR=
ACE'
  481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),         =
     \
      |         ^~~~~~~~~~~~~~~
include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_TRAC=
E_EVENT'
  619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
      |         ^~~~~~~~~~~~~~~~~~~
include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVENT'
    9 | TRACE_EVENT(task_newtask,
      | ^~~~~~~~~~~

Presumably caused by commit

  edd3cb05c00a ("copy_process: pass clone_flags as u64 across calltree")

I have used the vfs-brauner tree from next-20250829 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/1j3F=qdA2YqPgldUugDQd_F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmi47G4ACgkQAVBC80lX
0Gw9bwf/XndwVSOeOYJftDsrbDxUn02nu87xJt11AOgJGJ/+K6AUlS3VcfBx3Zbg
BOXf5HWcWA0REUKQPP3SWq4UNUxYLUprMMeAGHqC3EaEfr3Dz5Gf106+e1gnCXI1
5q5ezP1QoNsb7a0IdnxegSzwt65uxb/esw7WFgHsoBXQ+DLC5tEa8Eit+ATBAEU2
F5ddjnLxcdI9u6KPfxlpTzm1S3o1OXN6dLAzsUqNDa6UOrGSj9oDqELFPv20gbRs
2iVXin+9jMT5mHHZ9BlxO5dXAcpBw7VLTlcTTCnMeqRBL4y21hTJXSRuxlSrd+QF
XYFuUF/Hxp9lLV2vDyDC06P2oQ+xSw==
=kH6c
-----END PGP SIGNATURE-----

--Sig_/1j3F=qdA2YqPgldUugDQd_F--

