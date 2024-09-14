Return-Path: <linux-next+bounces-3858-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0ADB978F46
	for <lists+linux-next@lfdr.de>; Sat, 14 Sep 2024 10:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5D2B5B246AB
	for <lists+linux-next@lfdr.de>; Sat, 14 Sep 2024 08:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33615146018;
	Sat, 14 Sep 2024 08:55:36 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8FF15D1;
	Sat, 14 Sep 2024 08:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726304136; cv=none; b=BZRwLVXNme9gpiEH1G2UcxvH26YzlLHXX4AXM+soyp7MSDCxc6AGMtC1gb9WsH5YvRYJ3xUzOHozgTdq4GwV604XGvYQ9arlhvokOo/O+lfW+zM8raF5qvbGNCbBslHZkqX3OjObk1Gqjdf1O4WriabatxYt8g/oI+ClZSQbsoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726304136; c=relaxed/simple;
	bh=Je81QQE13ImHj4UvIOgjBS6p40UsioiXIGqNI6j0Urc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g/eyvntLxBF19UH2D6m+++b9RoxWlJoLMbPsul64LjgErhfJ869gNVvzBjnrNftlP+3icSVDcL7tgEGocrQqwC1WXsOrQgU9Q2x1aF3t1oHBkcMCm0OzFHOhVU+MXUuIMwGlilFILjmQlL/nt8iLOENPN0ysxhwmv7orNKcmIBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X5Q4M5yyWz9sxD;
	Sat, 14 Sep 2024 10:55:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j_N8AC9snYEy; Sat, 14 Sep 2024 10:55:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X5Q4M4vznz9sxC;
	Sat, 14 Sep 2024 10:55:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 91D078B764;
	Sat, 14 Sep 2024 10:55:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id tYHQT-gWUP4W; Sat, 14 Sep 2024 10:55:31 +0200 (CEST)
Received: from [192.168.233.150] (PO20379.IDSI0.si.c-s.fr [192.168.233.150])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DF0AB8B763;
	Sat, 14 Sep 2024 10:55:30 +0200 (CEST)
Message-ID: <498e7990-2c81-4779-83e6-1ff072796dbd@csgroup.eu>
Date: Sat, 14 Sep 2024 10:55:30 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
To: Michael Ellerman <mpe@ellerman.id.au>,
 Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Matthew Wilcox <willy@infradead.org>
References: <20240913213351.3537411-1-almasrymina@google.com>
 <87jzffq9ge.fsf@mail.lhotse>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87jzffq9ge.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 14/09/2024 à 04:02, Michael Ellerman a écrit :
> Mina Almasry <almasrymina@google.com> writes:
>> Building net-next with powerpc with GCC 14 compiler results in this
>> build error:
>>
>> /home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
>> /home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
>> not a multiple of 4)
>> make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
>> net/core/page_pool.o] Error 1
>>
>> Root caused in this thread:
>> https://lore.kernel.org/netdev/913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com/
> 
> Sorry I'm late to this, the original report wasn't Cc'ed to linuxppc-dev :D
> 
> I think this is a bug in the arch/powerpc inline asm constraints.
> 
> Can you try the patch below, it fixes the build error for me.
> 
> I'll run it through some boot tests and turn it into a proper patch over
> the weekend.
> 
> cheers
> 
> 
> diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
> index 5bf6a4d49268..0e41c1da82dd 100644
> --- a/arch/powerpc/include/asm/atomic.h
> +++ b/arch/powerpc/include/asm/atomic.h
> @@ -23,6 +23,12 @@
>   #define __atomic_release_fence()					\
>   	__asm__ __volatile__(PPC_RELEASE_BARRIER "" : : : "memory")
>   
> +#ifdef CONFIG_CC_IS_CLANG
> +#define DS_FORM_CONSTRAINT "Z<>"
> +#else
> +#define DS_FORM_CONSTRAINT "YZ<>"
> +#endif

I see we have the same in uaccess.h, added by commit 2d43cc701b96 
("powerpc/uaccess: Fix build errors seen with GCC 13/14")

Should that go in a common header, maybe ppc_asm.h ?

> +
>   static __inline__ int arch_atomic_read(const atomic_t *v)
>   {
>   	int t;
> @@ -197,7 +203,7 @@ static __inline__ s64 arch_atomic64_read(const atomic64_t *v)
>   	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
>   		__asm__ __volatile__("ld %0,0(%1)" : "=r"(t) : "b"(&v->counter));
>   	else
> -		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m<>"(v->counter));
> +		__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : DS_FORM_CONSTRAINT (v->counter));
>   
>   	return t;
>   }
> @@ -208,7 +214,7 @@ static __inline__ void arch_atomic64_set(atomic64_t *v, s64 i)
>   	if (IS_ENABLED(CONFIG_PPC_KERNEL_PREFIXED))
>   		__asm__ __volatile__("std %1,0(%2)" : "=m"(v->counter) : "r"(i), "b"(&v->counter));
>   	else
> -		__asm__ __volatile__("std%U0%X0 %1,%0" : "=m<>"(v->counter) : "r"(i));
> +		__asm__ __volatile__("std%U0%X0 %1,%0" : "=" DS_FORM_CONSTRAINT (v->counter) : "r"(i));
>   }
>   
>   #define ATOMIC64_OP(op, asm_op)						\
> 

