Return-Path: <linux-next+bounces-8515-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF581BA8F1C
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 13:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3644C7AF2C5
	for <lists+linux-next@lfdr.de>; Mon, 29 Sep 2025 10:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49B3F2FF677;
	Mon, 29 Sep 2025 11:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1Gxm7ZM"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2112B2FF66D;
	Mon, 29 Sep 2025 11:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759143680; cv=none; b=PPHTy4LE/h4nqt3c61E3h8LeelYi7g2NSd9zIIgU/95y7tw8Vx+VRk83cJ1TRC04rBVo86ImZMp/8J83smMgbETfUyroxkCNrWivIkaH0br3hRINOlMHYVL+YTKcMzJXoZ1T/eIPHla/4v5MMZnZXrTKdQRnDVCgGb6YweQeZdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759143680; c=relaxed/simple;
	bh=HACZwtgS4NXqTUSazNLqro1BqZ+l7JNxPg5TZijxq5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u6WHogRqEuNm7bulmuEm8s0qwE33OZD4/8xYZQpZOnpzwmq/8+OLYhXCCGg7YYm/H3THfpuIls+VnuR694wwG0c612Hgou8xsAOjRERuvCqr8DYhP+Vk3sGTBmN2lPs8CMRWF9CHj5PEumi1BZCfm+AdrTYHbEag+QapR4X4vRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1Gxm7ZM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C32B6C4CEF5;
	Mon, 29 Sep 2025 11:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759143679;
	bh=HACZwtgS4NXqTUSazNLqro1BqZ+l7JNxPg5TZijxq5o=;
	h=Date:From:To:Cc:Subject:From;
	b=k1Gxm7ZMR/U2vY5FsrKfCL8nIwbD1VBKRjqu1rFo4L7h5TQwZ80DKYwEy+NexRjCo
	 yaTYvHAD/3pzQe4hZY1gao3YUmajBBll4WgKSwRzCZLVclxkZt9vHJA8+QfRlkV0nL
	 XD8w6LSyc1OLOl5u37SQuL+Ma38EMt9D5KBmgK2N+HkHxZso6cXACrWchleQGc1EC1
	 KDrnon/8aZTrwaokGtB7OnlYIYY5kxcQK0YTR321D0/wlI2vy/YJpzpXRDQkGV99Q+
	 DoDoQ4eI1IzO4gBq57Pek1cymnfq5Rcu4+5KMSkhQ+UadMeP5k30jLMozZWoPZLtsI
	 4GPEsTNlq3rdg==
Date: Mon, 29 Sep 2025 12:01:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the vfs tree
Message-ID: <aNpm-6LS0ZHJQMI-@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h0TZPnOca6Oct4Bc"
Content-Disposition: inline


--h0TZPnOca6Oct4Bc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the vfs tree, today's linux-next build (x86 allmodconfig)
failed like this:

In file included from /tmp/next/build/include/rv/ltl_monitor.h:11,
                 from /tmp/next/build/kernel/trace/rv/monitors/pagefault/pagefault.c:19:
/tmp/next/build/include/rv/ltl_monitor.h: In function 'ltl_monitor_init':
/tmp/next/build/include/rv/ltl_monitor.h:75:51: error: passing argument 1 of 'check_trace_callback_type_task_newtask' from incompatible pointer type [-Wincompatible-pointer-types]
   75 |         rv_attach_trace_probe(name, task_newtask, handle_task_newtask);
      |                                                   ^~~~~~~~~~~~~~~~~~~
      |                                                   |
      |                                                   void (*)(void *, struct task_struct *, long unsigned int)
/tmp/next/build/include/rv/instrumentation.h:18:48: note: in definition of macro 'rv_attach_trace_probe'
   18 |                 check_trace_callback_type_##tp(rv_handler);                             \
      |                                                ^~~~~~~~~~
In file included from /tmp/next/build/kernel/trace/rv/monitors/pagefault/pagefault.c:9:
/tmp/next/build/include/linux/tracepoint.h:260:49: note: expected 'void (*)(void *, struct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long long unsigned int)'} but argument is of type 'void (*)(void *, struct task_struct *, long unsigned int)'
  260 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
      |                                          ~~~~~~~^~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
  270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
      |         ^~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
  481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
      |         ^~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
  619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
      |         ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVENT'
    9 | TRACE_EVENT(task_newtask,
      | ^~~~~~~~~~~
In file included from /tmp/next/build/include/asm-generic/bug.h:7,
                 from /tmp/next/build/arch/x86/include/asm/bug.h:103,
                 from /tmp/next/build/arch/x86/include/asm/alternative.h:9,
                 from /tmp/next/build/arch/x86/include/asm/barrier.h:5,
                 from /tmp/next/build/include/asm-generic/bitops/generic-non-atomic.h:7,
                 from /tmp/next/build/include/linux/bitops.h:28,
                 from /tmp/next/build/include/linux/kernel.h:23,
                 from /tmp/next/build/include/linux/interrupt.h:6,
                 from /tmp/next/build/include/linux/trace_recursion.h:5,
                 from /tmp/next/build/include/linux/ftrace.h:10,
                 from /tmp/next/build/kernel/trace/rv/monitors/pagefault/pagefault.c:2:
/tmp/next/build/include/rv/ltl_monitor.h:75:51: error: passing argument 1 of 'register_trace_task_newtask' from incompatible pointer type [-Wincompatible-pointer-types]
   75 |         rv_attach_trace_probe(name, task_newtask, handle_task_newtask);
      |                                                   ^~~~~~~~~~~~~~~~~~~
      |                                                   |
      |                                                   void (*)(void *, struct task_struct *, long unsigned int)
/tmp/next/build/include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
   28 |                 bool __ret_do_once = !!(condition);                     \
      |                                         ^~~~~~~~~
/tmp/next/build/include/rv/instrumentation.h:19:17: note: in expansion of macro 'WARN_ONCE'
   19 |                 WARN_ONCE(register_trace_##tp(rv_handler, NULL),                        \
      |                 ^~~~~~~~~
/tmp/next/build/include/rv/ltl_monitor.h:75:9: note: in expansion of macro 'rv_attach_trace_probe'
   75 |         rv_attach_trace_probe(name, task_newtask, handle_task_newtask);
      |         ^~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:241:38: note: expected 'void (*)(void *, struct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long long unsigned int)'} but argument is of type 'void (*)(void *, struct task_struct *, long unsigned int)'
  241 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
      |                               ~~~~~~~^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
  270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
      |         ^~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
  481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
      |         ^~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
  619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
      |         ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVENT'
    9 | TRACE_EVENT(task_newtask,
      | ^~~~~~~~~~~
/tmp/next/build/include/rv/ltl_monitor.h: In function 'ltl_monitor_destroy':
/tmp/next/build/include/rv/ltl_monitor.h:92:51: error: passing argument 1 of 'unregister_trace_task_newtask' from incompatible pointer type [-Wincompatible-pointer-types]
   92 |         rv_detach_trace_probe(name, task_newtask, handle_task_newtask);
      |                                                   ^~~~~~~~~~~~~~~~~~~
      |                                                   |
      |                                                   void (*)(void *, struct task_struct *, long unsigned int)
/tmp/next/build/include/rv/instrumentation.h:28:39: note: in definition of macro 'rv_detach_trace_probe'
   28 |                 unregister_trace_##tp(rv_handler, NULL);                                \
      |                                       ^~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:254:40: note: expected 'void (*)(void *, struct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long long unsigned int)'} but argument is of type 'void (*)(void *, struct task_struct *, long unsigned int)'
  254 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
      |                                 ~~~~~~~^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
  270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
      |         ^~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
  481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
      |         ^~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
  619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
      |         ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVENT'
    9 | TRACE_EVENT(task_newtask,
      | ^~~~~~~~~~~
make[6]: *** [/tmp/next/build/scripts/Makefile.build:287: kernel/trace/rv/monitors/pagefault/pagefault.o] Error 1
make[6]: *** Waiting for unfinished jobs....
In file included from /tmp/next/build/include/rv/ltl_monitor.h:11,
                 from /tmp/next/build/kernel/trace/rv/monitors/sleep/sleep.c:23:
/tmp/next/build/include/rv/ltl_monitor.h: In function 'ltl_monitor_init':
/tmp/next/build/include/rv/ltl_monitor.h:75:51: error: passing argument 1 of 'check_trace_callback_type_task_newtask' from incompatible pointer type [-Wincompatible-pointer-types]
   75 |         rv_attach_trace_probe(name, task_newtask, handle_task_newtask);
      |                                                   ^~~~~~~~~~~~~~~~~~~
      |                                                   |
      |                                                   void (*)(void *, struct task_struct *, long unsigned int)
/tmp/next/build/include/rv/instrumentation.h:18:48: note: in definition of macro 'rv_attach_trace_probe'
   18 |                 check_trace_callback_type_##tp(rv_handler);                             \
      |                                                ^~~~~~~~~~
In file included from /tmp/next/build/kernel/trace/rv/monitors/sleep/sleep.c:3:
/tmp/next/build/include/linux/tracepoint.h:260:49: note: expected 'void (*)(void *, struct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long long unsigned int)'} but argument is of type 'void (*)(void *, struct task_struct *, long unsigned int)'
  260 |         check_trace_callback_type_##name(void (*cb)(data_proto))        \
      |                                          ~~~~~~~^~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
  270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
      |         ^~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
  481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
      |         ^~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
  619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
      |         ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVENT'
    9 | TRACE_EVENT(task_newtask,
      | ^~~~~~~~~~~
In file included from /tmp/next/build/include/asm-generic/bug.h:7,
                 from /tmp/next/build/arch/x86/include/asm/bug.h:103,
                 from /tmp/next/build/arch/x86/include/asm/alternative.h:9,
                 from /tmp/next/build/arch/x86/include/asm/barrier.h:5,
                 from /tmp/next/build/include/asm-generic/bitops/generic-non-atomic.h:7,
                 from /tmp/next/build/include/linux/bitops.h:28,
                 from /tmp/next/build/include/linux/kernel.h:23,
                 from /tmp/next/build/include/linux/interrupt.h:6,
                 from /tmp/next/build/include/linux/trace_recursion.h:5,
                 from /tmp/next/build/include/linux/ftrace.h:10,
                 from /tmp/next/build/kernel/trace/rv/monitors/sleep/sleep.c:2:
/tmp/next/build/include/rv/ltl_monitor.h:75:51: error: passing argument 1 of 'register_trace_task_newtask' from incompatible pointer type [-Wincompatible-pointer-types]
   75 |         rv_attach_trace_probe(name, task_newtask, handle_task_newtask);
      |                                                   ^~~~~~~~~~~~~~~~~~~
      |                                                   |
      |                                                   void (*)(void *, struct task_struct *, long unsigned int)
/tmp/next/build/include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONCE_LITE_IF'
   28 |                 bool __ret_do_once = !!(condition);                     \
      |                                         ^~~~~~~~~
/tmp/next/build/include/rv/instrumentation.h:19:17: note: in expansion of macro 'WARN_ONCE'
   19 |                 WARN_ONCE(register_trace_##tp(rv_handler, NULL),                        \
      |                 ^~~~~~~~~
/tmp/next/build/include/rv/ltl_monitor.h:75:9: note: in expansion of macro 'rv_attach_trace_probe'
   75 |         rv_attach_trace_probe(name, task_newtask, handle_task_newtask);
      |         ^~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:241:38: note: expected 'void (*)(void *, struct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long long unsigned int)'} but argument is of type 'void (*)(void *, struct task_struct *, long unsigned int)'
  241 |         register_trace_##name(void (*probe)(data_proto), void *data)    \
      |                               ~~~~~~~^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
  270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
      |         ^~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
  481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
      |         ^~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
  619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
      |         ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVENT'
    9 | TRACE_EVENT(task_newtask,
      | ^~~~~~~~~~~
/tmp/next/build/include/rv/ltl_monitor.h: In function 'ltl_monitor_destroy':
/tmp/next/build/include/rv/ltl_monitor.h:92:51: error: passing argument 1 of 'unregister_trace_task_newtask' from incompatible pointer type [-Wincompatible-pointer-types]
   92 |         rv_detach_trace_probe(name, task_newtask, handle_task_newtask);
      |                                                   ^~~~~~~~~~~~~~~~~~~
      |                                                   |
      |                                                   void (*)(void *, struct task_struct *, long unsigned int)
/tmp/next/build/include/rv/instrumentation.h:28:39: note: in definition of macro 'rv_detach_trace_probe'
   28 |                 unregister_trace_##tp(rv_handler, NULL);                                \
      |                                       ^~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:254:40: note: expected 'void (*)(void *, struct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, long long unsigned int)'} but argument is of type 'void (*)(void *, struct task_struct *, long unsigned int)'
  254 |         unregister_trace_##name(void (*probe)(data_proto), void *data)  \
      |                                 ~~~~~~~^~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECLARE_TRACE_COMMON'
  270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(args), PARAMS(data_proto)) \
      |         ^~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECLARE_TRACE'
  481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),              \
      |         ^~~~~~~~~~~~~~~
/tmp/next/build/include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLARE_TRACE_EVENT'
  619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
      |         ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_EVENT'
    9 | TRACE_EVENT(task_newtask,
      | ^~~~~~~~~~~
make[6]: *** [/tmp/next/build/scripts/Makefile.build:287: kernel/trace/rv/monitors/sleep/sleep.o] Error 1
make[5]: *** [/tmp/next/build/scripts/Makefile.build:556: kernel/trace/rv] Error 2
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [/tmp/next/build/scripts/Makefile.build:556: kernel/trace] Error 2
make[4]: *** Waiting for unfinished jobs....
make[3]: *** [/tmp/next/build/scripts/Makefile.build:556: kernel] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [/tmp/next/build/Makefile:2011: .] Error 2
make[1]: *** [/tmp/next/build/Makefile:248: __sub-make] Error 2
make: *** [Makefile:248: __sub-make] Error 2
Command exited with non-zero status 2
17036.15user 1313.54system 1:54.95elapsed 15962%CPU (0avgtext+0avgdata 1394068maxresident)k
0inputs+0outputs (5021major+224011004minor)pagefaults 0swaps

I couldn't figure out exactly which commit was causing this in a timely
fashion (and suspect it may be an interaction with another tree), I've
used the VFS tree from 20250926 instead.

--h0TZPnOca6Oct4Bc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjaZvsACgkQJNaLcl1U
h9C+8Qf9EXGUITIpLvCAhldW9PSNYWRIZ0S1dgk1DSLPd6tPVdPPubFEmvRrb5bb
G/zEO3ceWxg1CbVdaU/VZL7T7hJQJsVNIS1uJFwDlSNxLsj/p2SR/1MVpPH/J5zF
E0VluFc3hlT5+0wKm4euDxx84APiL9nCBDCe+3+LYJn1imWHwtKlArT8s1rSfxmc
WVgJdLz/VMfgjhKQUPdMKYBucNPtSkKOIF+TDWFnULHSQc6G1mgdMlRGQZa4ifC4
DTDU6j2A3rM4PFJYwCRU3t7mn2BGiiOW3FxJ5h7x7drpnsUKaPeIAa4ASs35hAhl
RALerTPgBLZc/c6+7TRlbullTJf8gg==
=DosL
-----END PGP SIGNATURE-----

--h0TZPnOca6Oct4Bc--

