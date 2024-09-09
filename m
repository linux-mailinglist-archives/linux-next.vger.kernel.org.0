Return-Path: <linux-next+bounces-3714-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33258972108
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 19:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5AAF2840D7
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 17:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E229017D340;
	Mon,  9 Sep 2024 17:28:09 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3810F192B74;
	Mon,  9 Sep 2024 17:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725902889; cv=none; b=b5bCfC6tX3fvhq+UU0E55E7D4JOIsAxdzVxDgyy7D++piVy307U5yP7vhi5rSYJmiTGPfxpxNeYJzdruLlDDIM65DcoVfv0Ol47c+fWYOWz2fmoDLEiaHm04P5ts48uaLUcHddKt/QLh766q5qxsWyZnT/9RXZJqWGL9CZraTP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725902889; c=relaxed/simple;
	bh=O4Iz7mP271R9IfVK4+eCyH7d6Ghv9pm1fo9cOAVTweA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ubtk8jNRrfen0afu/aKbFX0BVqcMi8VdsnNHuKRzOGPcXvm8FOV0i3LazQaezu2nqr566CgMUGWhaTpJWdUJuBftoj+097QLlP1D/GkzijoCXCqHlIha/F6D++qlZR7oQmrM6AYxKSyWmz65YHTasDQFzU9SanRTCzLgWe7MrfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X2Yh44JjTz9sPd;
	Mon,  9 Sep 2024 19:28:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QisATpZx7e2u; Mon,  9 Sep 2024 19:28:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X2Yh43NNVz9rvV;
	Mon,  9 Sep 2024 19:28:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5EE818B770;
	Mon,  9 Sep 2024 19:28:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id wkH-WeMfTZ0k; Mon,  9 Sep 2024 19:28:04 +0200 (CEST)
Received: from [192.168.232.154] (PO25124.IDSI0.si.c-s.fr [192.168.232.154])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 03C138B76C;
	Mon,  9 Sep 2024 19:28:03 +0200 (CEST)
Message-ID: <b154ab25-70f6-46cd-99db-ccfbe3e13fb7@csgroup.eu>
Date: Mon, 9 Sep 2024 19:28:03 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the powerpc tree
To: Masahiro Yamada <masahiroy@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Rob Herring (Arm)"
 <robh@kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240909200948.70087f49@canb.auug.org.au>
 <afa6f06a-8d92-4ac1-b5fe-d5b6ade3f740@csgroup.eu>
 <20240910005808.2e355995@canb.auug.org.au>
 <CAK7LNARMD=PR9x-OMN5QJHmeDdAzDM=2F47ccqdLHHGTxVq5Jg@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAK7LNARMD=PR9x-OMN5QJHmeDdAzDM=2F47ccqdLHHGTxVq5Jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/09/2024 à 18:23, Masahiro Yamada a écrit :
> On Mon, Sep 9, 2024 at 11:58 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi Christophe,
>>
>> On Mon, 9 Sep 2024 16:22:26 +0200 Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
>>>
>>> Le 09/09/2024 à 12:09, Stephen Rothwell a écrit :
>>>> Hi all,
>>>>
>>>> After merging the powerpc tree, today's linux-next build (powerpc
>>>> ppc44x_defconfig) failed like this:
>>>>
>>>> make[3]: *** No rule to make target 'arch/powerpc/boot/treeImage.ebony', needed by 'arch/powerpc/boot/zImage'.  Stop.
>>>> make[2]: *** [/home/sfr/next/next/arch/powerpc/Makefile:236: zImage] Error 2
>>>> make[1]: *** [/home/sfr/next/next/Makefile:224: __sub-make] Error 2
>>>> make: *** [Makefile:224: __sub-make] Error 2
>>>>
>>>> It is not obvious to me what change caused this, so I have just left
>>>> the build  broken for today.
>>>>
>>>
>>> Bisected to commit e6abfb536d16 ("kbuild: split device tree build rules into scripts/Makefile.dtbs")
>>
>> Thanks for that.
>>
>> --
>> Cheers,
>> Stephen Rothwell
> 
> 
> I squashed the following fix. Hopefully, it will be ok tomorrow.
> 
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 6385e7aa5dbb..8403eba15457 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -444,7 +444,7 @@ ifneq ($(userprogs),)
>   include $(srctree)/scripts/Makefile.userprogs
>   endif
> 
> -ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb.o %.dtbo.o,$(targets)),)
> +ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o
> %.dtbo.o,$(targets)),)
>   include $(srctree)/scripts/Makefile.dtbs
>   endif
> 

The build of ppc44x_defconfig is ok with this change
on top of next-20240909

