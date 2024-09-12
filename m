Return-Path: <linux-next+bounces-3768-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE83975E06
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 02:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1A681C20A8E
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 00:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376468C07;
	Thu, 12 Sep 2024 00:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="iyaH+Ovx"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1986C8BEC;
	Thu, 12 Sep 2024 00:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726101338; cv=none; b=QWoaKyQrBzMbbe1/p6/IoQ61LIkbkj3mEgm76pW/YRmuAHOT7m4LWZQxBrHL2q+oOzatFdWXDA24pbvr6OFolP0yxJC0fpUx34prM6SpGAHWmWfqsapvW2RyArIpKu0K1+Hl5nX9DV0FpxPnLeiBXlBbFekZ/vhkZTrkiMSEdlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726101338; c=relaxed/simple;
	bh=fW9tL4bOGyj5qqJzgBhajXGygfunrljT2TepswUxlrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wh/2fOgRtXeM3wlu3CPSASl3W+WwWwkBsAtB0lcXK7LjBAvrNATxNyFtaecjATTNE6xvYD5eqXanHC4WaNa23tCDzreDbod6oL2ThfgdIY17xvg2L9VdfYQ2vSOV3xw6MC2tz79KvHWeVF0G3szj5iz/owaMVIpbXgXtTHQoAHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=iyaH+Ovx; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1726101325;
	bh=ztURQTU8RzYMozhGR69TIN6scBokvybse0n2Z2DAbK4=;
	h=Date:From:To:Cc:Subject:From;
	b=iyaH+OvxOQXu5KpQfyKIVKgp+q5aY5s3SYpT6QMV5F5yglTrVr6pcX75y2uZI+GLz
	 u7R8/Hv18fEPmUl51g64XrNGK/8Bb48GjBTCojjX+Gp+qAEPve6y5tlTVQkHJOls9c
	 IfjhkwDWipAxMuEY1FnjKdR3SN1VzaHrTSKTWxx9KkEYWniO5kPU1hG47SUAHpJ/+2
	 hQTLfELi3S/jL01gZ7c7FGueVJB520/2h0+WMLgO8DhdRpfxG+NHLCqKOgNMmci0vv
	 EZDPFSqPube+OhRXtJ+VXHXRPn8tXXpt6AMpFCFX3p8VNgwGjs1kE5TQBaK6agY021
	 ZBOwjxMdOEOeg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X3z4F5mwrz4x0K;
	Thu, 12 Sep 2024 10:35:25 +1000 (AEST)
Date: Thu, 12 Sep 2024 10:35:24 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tianrui Zhao
 <zhaotianrui@loongson.cn>, Xianglai Li <lixianglai@loongson.cn>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the loongarch tree
Message-ID: <20240912103524.62ac1dae@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BgoG=2Qwefxr8tuuU6i4Z3o";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/BgoG=2Qwefxr8tuuU6i4Z3o
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the loongarch tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/trace/define_trace.h:102,
                 from include/trace/events/kvm.h:530,
                 from arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:65:
include/trace/events/kvm.h: In function 'trace_raw_output_kvm_iocsr':
include/trace/events/kvm.h:244:44: error: left-hand operand of comma expres=
sion has no effect [-Werror=3Dunused-value]
  244 |         ({ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
      |                                            ^
include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  203 |         trace_event_printf(iter, print);                           =
     \
      |                                  ^~~~~
include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
   45 |                              PARAMS(print));                   \
      |                              ^~~~~~
include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
  248 | TRACE_EVENT(kvm_iocsr,
      | ^~~~~~~~~~~
include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
  269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
      |         ^~~~~~~~~
include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_sym=
bolic'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                   ^~~~~~~~~~~~~~~~
include/trace/events/kvm.h:270:51: note: in expansion of macro 'kvm_trace_s=
ymbol_iocsr'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                                                   ^~~~~~~~~~~~~~~~~=
~~~~~
include/trace/events/kvm.h:244:65: error: expected ';' before '}' token
  244 |         ({ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
      |                                                                 ^
include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  203 |         trace_event_printf(iter, print);                           =
     \
      |                                  ^~~~~
include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
   45 |                              PARAMS(print));                   \
      |                              ^~~~~~
include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
  248 | TRACE_EVENT(kvm_iocsr,
      | ^~~~~~~~~~~
include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
  269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
      |         ^~~~~~~~~
include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_sym=
bolic'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                   ^~~~~~~~~~~~~~~~
include/trace/events/kvm.h:270:51: note: in expansion of macro 'kvm_trace_s=
ymbol_iocsr'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                                                   ^~~~~~~~~~~~~~~~~=
~~~~~
include/trace/events/kvm.h:244:66: error: expected ')' before ',' token
  244 |         ({ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
      |                                                                  ^
include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  203 |         trace_event_printf(iter, print);                           =
     \
      |                                  ^~~~~
include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
   45 |                              PARAMS(print));                   \
      |                              ^~~~~~
include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
  248 | TRACE_EVENT(kvm_iocsr,
      | ^~~~~~~~~~~
include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
  269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
      |         ^~~~~~~~~
include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_sym=
bolic'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                   ^~~~~~~~~~~~~~~~
include/trace/events/kvm.h:270:51: note: in expansion of macro 'kvm_trace_s=
ymbol_iocsr'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                                                   ^~~~~~~~~~~~~~~~~=
~~~~~
include/trace/events/kvm.h:244:9: error: initialization of 'long unsigned i=
nt' from 'char *' makes integer from pointer without a cast [-Wint-conversi=
on]
  244 |         ({ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
      |         ^
include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  203 |         trace_event_printf(iter, print);                           =
     \
      |                                  ^~~~~
include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
   45 |                              PARAMS(print));                   \
      |                              ^~~~~~
include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
  248 | TRACE_EVENT(kvm_iocsr,
      | ^~~~~~~~~~~
include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
  269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
      |         ^~~~~~~~~
include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_sym=
bolic'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                   ^~~~~~~~~~~~~~~~
include/trace/events/kvm.h:270:51: note: in expansion of macro 'kvm_trace_s=
ymbol_iocsr'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                                                   ^~~~~~~~~~~~~~~~~=
~~~~~
include/trace/events/kvm.h:244:9: note: (near initialization for 'symbols[0=
].mask')
  244 |         ({ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
      |         ^
include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  203 |         trace_event_printf(iter, print);                           =
     \
      |                                  ^~~~~
include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
   45 |                              PARAMS(print));                   \
      |                              ^~~~~~
include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
  248 | TRACE_EVENT(kvm_iocsr,
      | ^~~~~~~~~~~
include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
  269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
      |         ^~~~~~~~~
include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_sym=
bolic'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                   ^~~~~~~~~~~~~~~~
include/trace/events/kvm.h:270:51: note: in expansion of macro 'kvm_trace_s=
ymbol_iocsr'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                                                   ^~~~~~~~~~~~~~~~~=
~~~~~
include/trace/events/kvm.h:244:9: error: initializer element is not constant
  244 |         ({ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
      |         ^
include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  203 |         trace_event_printf(iter, print);                           =
     \
      |                                  ^~~~~
include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
   45 |                              PARAMS(print));                   \
      |                              ^~~~~~
include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
  248 | TRACE_EVENT(kvm_iocsr,
      | ^~~~~~~~~~~
include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
  269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
      |         ^~~~~~~~~
include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_sym=
bolic'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                   ^~~~~~~~~~~~~~~~
include/trace/events/kvm.h:270:51: note: in expansion of macro 'kvm_trace_s=
ymbol_iocsr'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                                                   ^~~~~~~~~~~~~~~~~=
~~~~~
include/trace/events/kvm.h:244:9: note: (near initialization for 'symbols[0=
].mask')
  244 |         ({ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
      |         ^
include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  203 |         trace_event_printf(iter, print);                           =
     \
      |                                  ^~~~~
include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
   45 |                              PARAMS(print));                   \
      |                              ^~~~~~
include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
  248 | TRACE_EVENT(kvm_iocsr,
      | ^~~~~~~~~~~
include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
  269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
      |         ^~~~~~~~~
include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_sym=
bolic'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                   ^~~~~~~~~~~~~~~~
include/trace/events/kvm.h:270:51: note: in expansion of macro 'kvm_trace_s=
ymbol_iocsr'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                                                   ^~~~~~~~~~~~~~~~~=
~~~~~
include/trace/stages/stage3_trace_output.h:77:37: error: braces around scal=
ar initializer [-Werror]
   77 |                 static const struct trace_print_flags symbols[] =3D=
       \
      |                                     ^~~~~~~~~~~~~~~~~
include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  203 |         trace_event_printf(iter, print);                           =
     \
      |                                  ^~~~~
include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
   45 |                              PARAMS(print));                   \
      |                              ^~~~~~
include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
  248 | TRACE_EVENT(kvm_iocsr,
      | ^~~~~~~~~~~
include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
  269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
      |         ^~~~~~~~~
include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_sym=
bolic'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                   ^~~~~~~~~~~~~~~~
include/trace/stages/stage3_trace_output.h:77:37: note: (near initializatio=
n for 'symbols[0].name')
   77 |                 static const struct trace_print_flags symbols[] =3D=
       \
      |                                     ^~~~~~~~~~~~~~~~~
include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  203 |         trace_event_printf(iter, print);                           =
     \
      |                                  ^~~~~
include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
   45 |                              PARAMS(print));                   \
      |                              ^~~~~~
include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
  248 | TRACE_EVENT(kvm_iocsr,
      | ^~~~~~~~~~~
include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
  269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
      |         ^~~~~~~~~
include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_sym=
bolic'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                   ^~~~~~~~~~~~~~~~
include/trace/stages/stage3_trace_output.h:78:43: error: initialization of =
'const char *' from 'int' makes pointer from integer without a cast [-Wint-=
conversion]
   78 |                         { symbol_array, { -1, NULL }};             =
     \
      |                                           ^
include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  203 |         trace_event_printf(iter, print);                           =
     \
      |                                  ^~~~~
include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
   45 |                              PARAMS(print));                   \
      |                              ^~~~~~
include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
  248 | TRACE_EVENT(kvm_iocsr,
      | ^~~~~~~~~~~
include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
  269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
      |         ^~~~~~~~~
include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_sym=
bolic'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                   ^~~~~~~~~~~~~~~~
include/trace/stages/stage3_trace_output.h:78:43: note: (near initializatio=
n for 'symbols[0].name')
   78 |                         { symbol_array, { -1, NULL }};             =
     \
      |                                           ^
include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  203 |         trace_event_printf(iter, print);                           =
     \
      |                                  ^~~~~
include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
   45 |                              PARAMS(print));                   \
      |                              ^~~~~~
include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
  248 | TRACE_EVENT(kvm_iocsr,
      | ^~~~~~~~~~~
include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
  269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
      |         ^~~~~~~~~
include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_sym=
bolic'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                   ^~~~~~~~~~~~~~~~
include/linux/stddef.h:8:14: error: excess elements in scalar initializer [=
-Werror]
    8 | #define NULL ((void *)0)
      |              ^
include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  203 |         trace_event_printf(iter, print);                           =
     \
      |                                  ^~~~~
include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
   45 |                              PARAMS(print));                   \
      |                              ^~~~~~
include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
  248 | TRACE_EVENT(kvm_iocsr,
      | ^~~~~~~~~~~
include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
  269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
      |         ^~~~~~~~~
include/trace/stages/stage3_trace_output.h:78:47: note: in expansion of mac=
ro 'NULL'
   78 |                         { symbol_array, { -1, NULL }};             =
     \
      |                                               ^~~~
include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_sym=
bolic'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                   ^~~~~~~~~~~~~~~~
include/linux/stddef.h:8:14: note: (near initialization for 'symbols[0].nam=
e')
    8 | #define NULL ((void *)0)
      |              ^
include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  203 |         trace_event_printf(iter, print);                           =
     \
      |                                  ^~~~~
include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
   45 |                              PARAMS(print));                   \
      |                              ^~~~~~
include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
  248 | TRACE_EVENT(kvm_iocsr,
      | ^~~~~~~~~~~
include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
  269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
      |         ^~~~~~~~~
include/trace/stages/stage3_trace_output.h:78:47: note: in expansion of mac=
ro 'NULL'
   78 |                         { symbol_array, { -1, NULL }};             =
     \
      |                                               ^~~~
include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_sym=
bolic'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                   ^~~~~~~~~~~~~~~~
include/trace/stages/stage3_trace_output.h:78:25: error: missing braces aro=
und initializer [-Werror=3Dmissing-braces]
   78 |                         { symbol_array, { -1, NULL }};             =
     \
      |                         ^
include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_=
EVENT_CLASS'
  203 |         trace_event_printf(iter, print);                           =
     \
      |                                  ^~~~~
include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
   45 |                              PARAMS(print));                   \
      |                              ^~~~~~
include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
  248 | TRACE_EVENT(kvm_iocsr,
      | ^~~~~~~~~~~
include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
  269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
      |         ^~~~~~~~~
include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_sym=
bolic'
  270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_=
iocsr),
      |                   ^~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Caused by commit

  a7e93cf65d8a ("LoongArch: KVM: Add iocsr and mmio bus simulation in kerne=
l")

I have used the loongarch tree from next-20240911 for today.

--=20
Cheers,
Stephen Rothwell

--Sig_/BgoG=2Qwefxr8tuuU6i4Z3o
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmbiN0wACgkQAVBC80lX
0GwSvAf/T3zbHEcH2j9lx4lH2iS0W1DLLLzfxMqQGvdjApgyg8da20xxuNnG0ino
FhaoS9BUjUyajAyQZrICP03NSNSZG7l9e/wyoRJ8qzptlAWWylL6vFUPXYoL0dFw
ePKb2FlqOz8GU2LRIY8jMkVzXX3wa4atSBrzTzjkquZH4aDTnLgypfzifclWO+5k
BUySVgE+aaufzgpSeQpDeZCRnLpdT+jWfS9tAwVAjcopFCNcfYeGacX12AB69WSP
tPPD1hLX/uxvs4ASV40905uexEOn0WDqW8tV4AqAnKcL1lQurEM04Z6IXpqFbn2y
s7opQ7NQHBEcUoac57ZxU8NYu9DM0w==
=xpJl
-----END PGP SIGNATURE-----

--Sig_/BgoG=2Qwefxr8tuuU6i4Z3o--

