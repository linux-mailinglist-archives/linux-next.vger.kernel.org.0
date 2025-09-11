Return-Path: <linux-next+bounces-8264-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C3698B531CE
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 14:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E66031C80FA6
	for <lists+linux-next@lfdr.de>; Thu, 11 Sep 2025 12:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB80D31DDBB;
	Thu, 11 Sep 2025 12:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cCnTjI2D"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C182522B4;
	Thu, 11 Sep 2025 12:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757592813; cv=none; b=UBKWjuYIbVPqrjfQ8HKiNJzxR54hcWfWt+37rKRwLk3LZMtefF7iW2W/qg9pC5LaVDyTnnT4kEoXCg9Qx3ZFy9XFyZnGdziBMeguQRLg8V/itYVWsULkTNXsDWWrWHBM3eP2H35d6VdiE0V4CB+LQtWNHZ7bfB68Hqr2OqwmdYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757592813; c=relaxed/simple;
	bh=2uYswM+1jOQM5cAWKOX/XlNNzu/lE3yQ81nRx9mx7nM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRUXemHrv1PVv6Zz75sMiuJpFfYyWUgbEn2xulNqesHUU5BiOuOpp3X27rkZpe7rbCrkEQ6hFHp8b3AU2F3sU1j45WV1sIsE30mfTlRexTCupgbITOzUYcg3sQbqKaBp4MDyiMMOume6niT9EcoQ7FvnvyB1ml6GAKw4NRj0UhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cCnTjI2D; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-32dd1238843so582489a91.3;
        Thu, 11 Sep 2025 05:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757592809; x=1758197609; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eXZ0xggp2FT+wrAsK84tQSrwXGl2KswIB/w1VgAAZAA=;
        b=cCnTjI2Dlei8FDSd2uC46d67W2xJ743PfuVFnttlhabv4vBEbMMIpBKzzYS1nohvrV
         oscJIWLVvbB+vmUJXy7vrd27oDK7xmWXmOrwe1EaDk/8LQR90TgRxNfiEYyfQC2NKmbs
         sUZ/1YfNRh+8oPhEp+phIh1aziL0RLACEOV/Wb+bByaoW9U1eX9RTV2Bgc8ni01ImyEV
         sHxXwN5g5GPn9xm1WZrx5uYGOMzP8aZ63ut4+hDmu9BRaRk1MEKxCRlyKJ01qmNG2JQo
         3M8KPvdlcx3rWZWky988/lbTns8H8G6U5G5llOJxxQDC/xPcQ53OMYAWb/m3pDY5T+ba
         52Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757592809; x=1758197609;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eXZ0xggp2FT+wrAsK84tQSrwXGl2KswIB/w1VgAAZAA=;
        b=hiLL1hsk+0h3t5p/dUgQnHoQSxdFIrz/ktG4oeXJFMpB8Rh8lbBwfeqqtXqJNthwvq
         sVTEpW2KTokzfkl0wqkH0rQQC4AmvIudw7LP9Vh5aG3nU8CzbtBPJ+/1+k94TMCv7Gon
         Z6LmpRhjGiXE0w9uhSeRyFN5Ga8GJoCy0aKUHWARtWyynOxQh+iqUT8sKZ9OTygkQ4ck
         O2glAf+dt7hUw3WVtMTGkVAqM0zXWChTNhLG39nQr06nI9opsCNzCohwPgpQOLcpG8na
         fZXfo4evUjAGp8lzEMowoBtBLL6+KTOyBz0g6lPetPknWgPC95kHIDt7ET5Ppy666ijY
         GTzA==
X-Forwarded-Encrypted: i=1; AJvYcCUCChCaiqPRGpvLYchdRVOc7szPLf4OqaaxdCK1YjUSOKcd6uw+3Qtl6ZHI+ZsHGOYkIrVKy0/0Ohfw4Ws=@vger.kernel.org, AJvYcCWZsbWh71rvG5qULWOnQ8HYNmq1jdro0LRJbZqajX9igZ7uP0os7oojvqQBisNKLfkQnKbdV0aiFa0zpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEB/CmFbc8QTMTjbIJiZaWzIQYk3Qpaxhac+xE+dFK4+1F/oSW
	k8w7CRiEGQjDfrC2wAkVVTP+ToZme+z/SQ6F1AhwPoctTY6pqHhrS9+kQQHj2w==
X-Gm-Gg: ASbGncvpIiYEUT0GsOdC1OH7JIFJiwhwMe1aarSLrTmpSxPnyPBhUY9HeojBEaCQNnh
	E4SSECHK+wQc352jpv3XERLPhQJDLxPjscE2NgE39LXPTNkKWiGbeUDhrQaIC1iI6eDUtbsZ6CX
	xX3bhdI1NMF/N8UFXmhgOM1PGqSvS7o9yYG2jgGwEAm3bgcsm4jUgYvczJCW82aDETvMAMdQLYc
	CHjN6O0naXMm+ti4bZ6JimU3tvDnMNXTLVmgywVA1Q1gHoowe1ZhiAQGBnt6hODmKU9meYr3LQP
	5725GH+5Bqp5asMARuxTB4Hq7MA0bt6XDRDiKl9v8VWTNUzkKXSIpCEEh0Li7ONkcY1Jv/kPCtT
	jNcjY7ffhHk9C2faqcijzQ0r9RA==
X-Google-Smtp-Source: AGHT+IHI15p/BSRhnfNn15WZGX4hol/fmK9dvgSsWJQzgstI5IPs2mAcKuRKwY7mOpqEm6PL2oPdYg==
X-Received: by 2002:a17:90b:33cf:b0:32b:9774:d33d with SMTP id 98e67ed59e1d1-32d43f6658cmr24778035a91.20.1757592809145;
        Thu, 11 Sep 2025 05:13:29 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dd9809e5asm2006870a91.3.2025.09.11.05.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 05:13:28 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id B5F7C420A6BE; Thu, 11 Sep 2025 19:13:25 +0700 (WIB)
Date: Thu, 11 Sep 2025 19:13:25 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	Christian Brauner <brauner@kernel.org>
Cc: Simon Schuster <schuster.simon@siemens-energy.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
Message-ID: <aMK85cAoXwtta2FR@archie.me>
References: <20250904113334.18822d43@canb.auug.org.au>
 <20250908120229.7a4e6db9@canb.auug.org.au>
 <20250910104944.3e420e96@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MRaT2zXPHw09yZSn"
Content-Disposition: inline
In-Reply-To: <20250910104944.3e420e96@canb.auug.org.au>


--MRaT2zXPHw09yZSn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 10:49:44AM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> On Mon, 8 Sep 2025 12:02:29 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > On Thu, 4 Sep 2025 11:33:34 +1000 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> > >=20
> > > After merging the vfs-brauner tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >=20
> > > In file included from include/rv/ltl_monitor.h:11,
> > >                  from kernel/trace/rv/monitors/sleep/sleep.c:23:
> > > include/rv/ltl_monitor.h: In function 'ltl_monitor_init':
> > > include/rv/ltl_monitor.h:75:51: error: passing argument 1 of 'check_t=
race_callback_type_task_newtask' from incompatible pointer type [-Wincompat=
ible-pointer-types]
> > >    75 |         rv_attach_trace_probe(name, task_newtask, handle_task=
_newtask);
> > >       |                                                   ^~~~~~~~~~~=
~~~~~~~~
> > >       |                                                   |
> > >       |                                                   void (*)(vo=
id *, struct task_struct *, long unsigned int)
> > > include/rv/instrumentation.h:18:48: note: in definition of macro 'rv_=
attach_trace_probe'
> > >    18 |                 check_trace_callback_type_##tp(rv_handler);  =
                           \
> > >       |                                                ^~~~~~~~~~
> > > In file included from kernel/trace/rv/monitors/sleep/sleep.c:3:
> > > include/linux/tracepoint.h:260:49: note: expected 'void (*)(void *, s=
truct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, lon=
g long unsigned int)'} but argument is of type 'void (*)(void *, struct tas=
k_struct *, long unsigned int)'
> > >   260 |         check_trace_callback_type_##name(void (*cb)(data_prot=
o))        \
> > >       |                                          ~~~~~~~^~~~~~~~~~~~~=
~~
> > > include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECL=
ARE_TRACE_COMMON'
> > >   270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(ar=
gs), PARAMS(data_proto)) \
> > >       |         ^~~~~~~~~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECL=
ARE_TRACE'
> > >   481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),   =
           \
> > >       |         ^~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLAR=
E_TRACE_EVENT'
> > >   619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
> > >       |         ^~~~~~~~~~~~~~~~~~~
> > > include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_E=
VENT'
> > >     9 | TRACE_EVENT(task_newtask,
> > >       | ^~~~~~~~~~~
> > > In file included from include/asm-generic/bug.h:7,
> > >                  from arch/x86/include/asm/bug.h:103,
> > >                  from arch/x86/include/asm/alternative.h:9,
> > >                  from arch/x86/include/asm/barrier.h:5,
> > >                  from include/asm-generic/bitops/generic-non-atomic.h=
:7,
> > >                  from include/linux/bitops.h:28,
> > >                  from include/linux/kernel.h:23,
> > >                  from include/linux/interrupt.h:6,
> > >                  from include/linux/trace_recursion.h:5,
> > >                  from include/linux/ftrace.h:10,
> > >                  from kernel/trace/rv/monitors/sleep/sleep.c:2:
> > > include/rv/ltl_monitor.h:75:51: error: passing argument 1 of 'registe=
r_trace_task_newtask' from incompatible pointer type [-Wincompatible-pointe=
r-types]
> > >    75 |         rv_attach_trace_probe(name, task_newtask, handle_task=
_newtask);
> > >       |                                                   ^~~~~~~~~~~=
~~~~~~~~
> > >       |                                                   |
> > >       |                                                   void (*)(vo=
id *, struct task_struct *, long unsigned int)
> > > include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONC=
E_LITE_IF'
> > >    28 |                 bool __ret_do_once =3D !!(condition);        =
             \
> > >       |                                         ^~~~~~~~~
> > > include/rv/instrumentation.h:19:17: note: in expansion of macro 'WARN=
_ONCE'
> > >    19 |                 WARN_ONCE(register_trace_##tp(rv_handler, NUL=
L),                        \
> > >       |                 ^~~~~~~~~
> > > include/rv/ltl_monitor.h:75:9: note: in expansion of macro 'rv_attach=
_trace_probe'
> > >    75 |         rv_attach_trace_probe(name, task_newtask, handle_task=
_newtask);
> > >       |         ^~~~~~~~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:241:38: note: expected 'void (*)(void *, s=
truct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, lon=
g long unsigned int)'} but argument is of type 'void (*)(void *, struct tas=
k_struct *, long unsigned int)'
> > >   241 |         register_trace_##name(void (*probe)(data_proto), void=
 *data)    \
> > >       |                               ~~~~~~~^~~~~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECL=
ARE_TRACE_COMMON'
> > >   270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(ar=
gs), PARAMS(data_proto)) \
> > >       |         ^~~~~~~~~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECL=
ARE_TRACE'
> > >   481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),   =
           \
> > >       |         ^~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLAR=
E_TRACE_EVENT'
> > >   619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
> > >       |         ^~~~~~~~~~~~~~~~~~~
> > > include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_E=
VENT'
> > >     9 | TRACE_EVENT(task_newtask,
> > >       | ^~~~~~~~~~~
> > > include/rv/ltl_monitor.h: In function 'ltl_monitor_destroy':
> > > include/rv/ltl_monitor.h:92:51: error: passing argument 1 of 'unregis=
ter_trace_task_newtask' from incompatible pointer type [-Wincompatible-poin=
ter-types]
> > >    92 |         rv_detach_trace_probe(name, task_newtask, handle_task=
_newtask);
> > >       |                                                   ^~~~~~~~~~~=
~~~~~~~~
> > >       |                                                   |
> > >       |                                                   void (*)(vo=
id *, struct task_struct *, long unsigned int)
> > > include/rv/instrumentation.h:28:39: note: in definition of macro 'rv_=
detach_trace_probe'
> > >    28 |                 unregister_trace_##tp(rv_handler, NULL);     =
                           \
> > >       |                                       ^~~~~~~~~~
> > > include/linux/tracepoint.h:254:40: note: expected 'void (*)(void *, s=
truct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, lon=
g long unsigned int)'} but argument is of type 'void (*)(void *, struct tas=
k_struct *, long unsigned int)'
> > >   254 |         unregister_trace_##name(void (*probe)(data_proto), vo=
id *data)  \
> > >       |                                 ~~~~~~~^~~~~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECL=
ARE_TRACE_COMMON'
> > >   270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(ar=
gs), PARAMS(data_proto)) \
> > >       |         ^~~~~~~~~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECL=
ARE_TRACE'
> > >   481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),   =
           \
> > >       |         ^~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLAR=
E_TRACE_EVENT'
> > >   619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
> > >       |         ^~~~~~~~~~~~~~~~~~~
> > > include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_E=
VENT'
> > >     9 | TRACE_EVENT(task_newtask,
> > >       | ^~~~~~~~~~~
> > > In file included from include/rv/ltl_monitor.h:11,
> > >                  from kernel/trace/rv/monitors/pagefault/pagefault.c:=
19:
> > > include/rv/ltl_monitor.h: In function 'ltl_monitor_init':
> > > include/rv/ltl_monitor.h:75:51: error: passing argument 1 of 'check_t=
race_callback_type_task_newtask' from incompatible pointer type [-Wincompat=
ible-pointer-types]
> > >    75 |         rv_attach_trace_probe(name, task_newtask, handle_task=
_newtask);
> > >       |                                                   ^~~~~~~~~~~=
~~~~~~~~
> > >       |                                                   |
> > >       |                                                   void (*)(vo=
id *, struct task_struct *, long unsigned int)
> > > include/rv/instrumentation.h:18:48: note: in definition of macro 'rv_=
attach_trace_probe'
> > >    18 |                 check_trace_callback_type_##tp(rv_handler);  =
                           \
> > >       |                                                ^~~~~~~~~~
> > > In file included from kernel/trace/rv/monitors/pagefault/pagefault.c:=
9:
> > > include/linux/tracepoint.h:260:49: note: expected 'void (*)(void *, s=
truct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, lon=
g long unsigned int)'} but argument is of type 'void (*)(void *, struct tas=
k_struct *, long unsigned int)'
> > >   260 |         check_trace_callback_type_##name(void (*cb)(data_prot=
o))        \
> > >       |                                          ~~~~~~~^~~~~~~~~~~~~=
~~
> > > include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECL=
ARE_TRACE_COMMON'
> > >   270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(ar=
gs), PARAMS(data_proto)) \
> > >       |         ^~~~~~~~~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECL=
ARE_TRACE'
> > >   481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),   =
           \
> > >       |         ^~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLAR=
E_TRACE_EVENT'
> > >   619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
> > >       |         ^~~~~~~~~~~~~~~~~~~
> > > include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_E=
VENT'
> > >     9 | TRACE_EVENT(task_newtask,
> > >       | ^~~~~~~~~~~
> > > In file included from include/asm-generic/bug.h:7,
> > >                  from arch/x86/include/asm/bug.h:103,
> > >                  from arch/x86/include/asm/alternative.h:9,
> > >                  from arch/x86/include/asm/barrier.h:5,
> > >                  from include/asm-generic/bitops/generic-non-atomic.h=
:7,
> > >                  from include/linux/bitops.h:28,
> > >                  from include/linux/kernel.h:23,
> > >                  from include/linux/interrupt.h:6,
> > >                  from include/linux/trace_recursion.h:5,
> > >                  from include/linux/ftrace.h:10,
> > >                  from kernel/trace/rv/monitors/pagefault/pagefault.c:=
2:
> > > include/rv/ltl_monitor.h:75:51: error: passing argument 1 of 'registe=
r_trace_task_newtask' from incompatible pointer type [-Wincompatible-pointe=
r-types]
> > >    75 |         rv_attach_trace_probe(name, task_newtask, handle_task=
_newtask);
> > >       |                                                   ^~~~~~~~~~~=
~~~~~~~~
> > >       |                                                   |
> > >       |                                                   void (*)(vo=
id *, struct task_struct *, long unsigned int)
> > > include/linux/once_lite.h:28:41: note: in definition of macro 'DO_ONC=
E_LITE_IF'
> > >    28 |                 bool __ret_do_once =3D !!(condition);        =
             \
> > >       |                                         ^~~~~~~~~
> > > include/rv/instrumentation.h:19:17: note: in expansion of macro 'WARN=
_ONCE'
> > >    19 |                 WARN_ONCE(register_trace_##tp(rv_handler, NUL=
L),                        \
> > >       |                 ^~~~~~~~~
> > > include/rv/ltl_monitor.h:75:9: note: in expansion of macro 'rv_attach=
_trace_probe'
> > >    75 |         rv_attach_trace_probe(name, task_newtask, handle_task=
_newtask);
> > >       |         ^~~~~~~~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:241:38: note: expected 'void (*)(void *, s=
truct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, lon=
g long unsigned int)'} but argument is of type 'void (*)(void *, struct tas=
k_struct *, long unsigned int)'
> > >   241 |         register_trace_##name(void (*probe)(data_proto), void=
 *data)    \
> > >       |                               ~~~~~~~^~~~~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECL=
ARE_TRACE_COMMON'
> > >   270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(ar=
gs), PARAMS(data_proto)) \
> > >       |         ^~~~~~~~~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECL=
ARE_TRACE'
> > >   481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),   =
           \
> > >       |         ^~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLAR=
E_TRACE_EVENT'
> > >   619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
> > >       |         ^~~~~~~~~~~~~~~~~~~
> > > include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_E=
VENT'
> > >     9 | TRACE_EVENT(task_newtask,
> > >       | ^~~~~~~~~~~
> > > include/rv/ltl_monitor.h: In function 'ltl_monitor_destroy':
> > > include/rv/ltl_monitor.h:92:51: error: passing argument 1 of 'unregis=
ter_trace_task_newtask' from incompatible pointer type [-Wincompatible-poin=
ter-types]
> > >    92 |         rv_detach_trace_probe(name, task_newtask, handle_task=
_newtask);
> > >       |                                                   ^~~~~~~~~~~=
~~~~~~~~
> > >       |                                                   |
> > >       |                                                   void (*)(vo=
id *, struct task_struct *, long unsigned int)
> > > include/rv/instrumentation.h:28:39: note: in definition of macro 'rv_=
detach_trace_probe'
> > >    28 |                 unregister_trace_##tp(rv_handler, NULL);     =
                           \
> > >       |                                       ^~~~~~~~~~
> > > include/linux/tracepoint.h:254:40: note: expected 'void (*)(void *, s=
truct task_struct *, u64)' {aka 'void (*)(void *, struct task_struct *, lon=
g long unsigned int)'} but argument is of type 'void (*)(void *, struct tas=
k_struct *, long unsigned int)'
> > >   254 |         unregister_trace_##name(void (*probe)(data_proto), vo=
id *data)  \
> > >       |                                 ~~~~~~~^~~~~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:270:9: note: in expansion of macro '__DECL=
ARE_TRACE_COMMON'
> > >   270 |         __DECLARE_TRACE_COMMON(name, PARAMS(proto), PARAMS(ar=
gs), PARAMS(data_proto)) \
> > >       |         ^~~~~~~~~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:481:9: note: in expansion of macro '__DECL=
ARE_TRACE'
> > >   481 |         __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),   =
           \
> > >       |         ^~~~~~~~~~~~~~~
> > > include/linux/tracepoint.h:619:9: note: in expansion of macro 'DECLAR=
E_TRACE_EVENT'
> > >   619 |         DECLARE_TRACE_EVENT(name, PARAMS(proto), PARAMS(args))
> > >       |         ^~~~~~~~~~~~~~~~~~~
> > > include/trace/events/task.h:9:1: note: in expansion of macro 'TRACE_E=
VENT'
> > >     9 | TRACE_EVENT(task_newtask,
> > >       | ^~~~~~~~~~~
> > >=20
> > > Presumably caused by commit
> > >=20
> > >   edd3cb05c00a ("copy_process: pass clone_flags as u64 across calltre=
e")
> > >=20
> > > I have used the vfs-brauner tree from next-20250829 for today. =20
> >=20
> > I am still seeing this failure.
>=20
> From today, I have instead just reverted these three commits:
>=20
>   c6ac444ff20c ("nios2: implement architecture-specific portion of sys_cl=
one3")
>   bbc46b23af5b ("arch: copy_thread: pass clone_flags as u64")
>   edd3cb05c00a ("copy_process: pass clone_flags as u64 across calltree")

I can't help but wondering what Linus would have to react when these commits
made their way to PR to him as-is without any fix...

--=20
An old man doll... just what I always wanted! - Clara

--MRaT2zXPHw09yZSn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaMK84QAKCRD2uYlJVVFO
o/ShAP9xqpaG8v636KcQcr6Ddn21rTqMA0S28OzFjdBF50TJKAD/bxGG3+yRlsvS
YGjXA2ocI3KkLvKNnwD0uLZNJP9nwwA=
=1N7L
-----END PGP SIGNATURE-----

--MRaT2zXPHw09yZSn--

