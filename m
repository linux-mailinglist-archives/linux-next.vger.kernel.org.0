Return-Path: <linux-next+bounces-3855-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 476CA978C87
	for <lists+linux-next@lfdr.de>; Sat, 14 Sep 2024 04:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C383A1F239D5
	for <lists+linux-next@lfdr.de>; Sat, 14 Sep 2024 02:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0518F5E;
	Sat, 14 Sep 2024 02:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="DH0dsbxR"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DCD33E8;
	Sat, 14 Sep 2024 02:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726279338; cv=none; b=AbfkPgjaRN+newIb0rtaTZwdoW0a30RtBfThcs6Dhv5GHj+UiGaHb2wyxOh0MO6PMx7muQtJLdLnrnlojX7aA9b1VKxW8i6E361gdzdFajNlFaO+Ip0aOhWa0VKp4iyMjvA1ebN/zF0b98ntieEFFGm6CQjz/z51niragC6wOQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726279338; c=relaxed/simple;
	bh=KVQI4gRkAKlBL/HZnc2Jyu/Q+cbFZDKCOE64jrTo+js=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=trrMSUyg/k1ZDjupmM7Tda3v4yYSSyHEEe6jsIWuOrcuwy8k7nFE/vai4bt9NmLhby7/y+Xih0R+MT3B4VWvsfykQeBq7ebSRS1mGopNLTf0BvF8sfgp0q2im71mUSnqKM/5C5H0fzxTEo/Bfa2+rWOApXPuvXkCZkB8x7IUg8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=DH0dsbxR; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726279332;
	bh=/wsM4f9mZobOe68S738M7h2FcsJwRNVl7jUmuHE5wmY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DH0dsbxRzHaIGZKdW/VAzQa6uKPKiQwb8xCnbJaXLX9IAec2jz1b/fzg6cAhA8ErS
	 pB/HLkT+Chh7obMNzCGZjoOWTe/vD0JNDCM4Bk1nb264MmakqUKTgdIBJ2vYKocfIX
	 TQFU167XMfXx/BQsIbkQmum5VaXobPpVYwGgo1VhMa4CtzPmjmlEkxQ80fw3po0b0D
	 HtJ6eUTWVbxOb+AYQWVe+VAvYPaM3Togzjtar6Bx3JrukSCSxH/pAfJbln0hO7udza
	 MN7MYow2a+b425Pd8snDmc6s2XJ5BK0WWvGoVetzAKhaADtomefCQYQLBwDN6OI2zp
	 D2h9711DyUhjg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X5DvR1TfQz4xD3;
	Sat, 14 Sep 2024 12:02:11 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux
 Next Mailing List <linux-next@vger.kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
In-Reply-To: <20240913213351.3537411-1-almasrymina@google.com>
References: <20240913213351.3537411-1-almasrymina@google.com>
Date: Sat, 14 Sep 2024 12:02:09 +1000
Message-ID: <87jzffq9ge.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mina Almasry <almasrymina@google.com> writes:
> Building net-next with powerpc with GCC 14 compiler results in this
> build error:
>
> /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
> /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
> not a multiple of 4)
> make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
> net/core/page_pool.o] Error 1
>
> Root caused in this thread:
> https://lore.kernel.org/netdev/913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com/

Sorry I'm late to this, the original report wasn't Cc'ed to linuxppc-dev :D

I think this is a bug in the arch/powerpc inline asm constraints.

Can you try the patch below, it fixes the build error for me.

I'll run it through some boot tests and turn it into a proper patch over
the weekend.

cheers


diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
index 5bf6a4d49268..0e41c1da82dd 100644
--- a/arch/powerpc/include/asm/atomic.h
+++ b/arch/powerpc/include/asm/atomic.h
@@ -23,6 +23,12 @@
 #define __atomic_release_fence()					\
 	__asm__ __volatile__(PPC_RELEASE_BARRIER "" : : : "memory")
 
+#ifdef CONFIG_CC_IS_CLANG
+#define DS_FORM_CONSTRAINT "Z<>"
+#else
+#define DS_FORM_CONSTRAINT "YZ<>"
+#endif
+
 static __inline__ int arch_atomic_read(const atomic_t *v)
 {
 	int t;
@@ -197,7 +203,7 @@ static __inline__ s64 arch_atomic64_read(const atomic64_t *v)
 	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
 		__asm__ __volatile__("ld %0,0(%1)" : "=r"(t) : "b"(&v->counter));
 	else
-		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
+		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : DS_FORM_CONSTRAINT (v->counter));
 
 	return t;
 }
@@ -208,7 +214,7 @@ static __inline__ void arch_atomic64_set(atomic64_t *v, s64 i)
 	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
 		__asm__ __volatile__("std %1,0(%2)" : "=m"(v->counter) : "r"(i), "b"(&v->counter));
 	else
-		__asm__ __volatile__("std%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
+		__asm__ __volatile__("std%U0%X0 %1,%0" : "=" DS_FORM_CONSTRAINT (v->counter) : "r"(i));
 }
 
 #define ATOMIC64_OP(op, asm_op)						\

