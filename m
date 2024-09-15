Return-Path: <linux-next+bounces-3860-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B68B2979693
	for <lists+linux-next@lfdr.de>; Sun, 15 Sep 2024 14:20:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CDCFB21CDD
	for <lists+linux-next@lfdr.de>; Sun, 15 Sep 2024 12:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAF91C57B6;
	Sun, 15 Sep 2024 12:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="I6iTjJPi"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1063A1C3F38;
	Sun, 15 Sep 2024 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726402815; cv=none; b=DRzGF7hnVbqxVDooO51BolwtNBXfbEKI0wHbSijprcn7mqG6JfmPLmzc0QuEyRIQ5HFb9JmrUhg62S0m/grwxWi1pwerd4qebptCuBgAforo+nDkXQYwKZVoNaej2qe0oNKF3vH96O+n5iY3g9nJrbhUHf037YXD97WfmA/9nAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726402815; c=relaxed/simple;
	bh=Y9rDxiF0UiBCeEPN8lLxrJAUzoHXuLv/CJEpCJjpLvk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BE85gFYO0hgS2fw42ifpFFrUrzm3q+tvLUDRvHMaV+2+t24P5wUkSAjX48vUxfrr9kIUGasxOqKuON6wvSxSwo3OF+xY+W1oNbO9Xb34S847tRCK6aSrhQpZlrFG6+3Mot2PZVwn58dUx/ur9tX1wzT7axlm7Z/KfV3Amsuqh8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=I6iTjJPi; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726402803;
	bh=LcqIBVzHw0KnwXTko6FqDEVdGVv2zi2crglHm27G4d8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=I6iTjJPikupA477s76MI4hBQ6xsZn3ga+yalo4/iLaFuUS78Rj0BUT9N6AswrEcWT
	 CDwMCJmusbYk6Ig8YpaBv5TvStzLHfR0phcE51BneSptcxhQVb8bv3K6hPrOBKlptG
	 1UfGTiGjWzZFUZZLYMqNQW57tplBHAbAViNUfDkTIvlrnptU7I4eocj2KnCziNk0e7
	 6IfgkTQIVGMzjExC5wmO7ZxNz3Y36+2ol2ZFq7bJg+HsE1vi4LhkzrdtnUbCjgOnuQ
	 Nd3s3BtWeeQhGquc1UcaXLNsa+vwi8oiCdfS2d8yLNZue6Pfj0dUlHhqAsIDqnkza6
	 L3vPXeZU7yhqQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X66Ys6GwTz4x8H;
	Sun, 15 Sep 2024 22:20:00 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Mina Almasry
 <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Stephen
 Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Matthew
 Wilcox <willy@infradead.org>
Subject: Re: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
In-Reply-To: <498e7990-2c81-4779-83e6-1ff072796dbd@csgroup.eu>
References: <20240913213351.3537411-1-almasrymina@google.com>
 <87jzffq9ge.fsf@mail.lhotse>
 <498e7990-2c81-4779-83e6-1ff072796dbd@csgroup.eu>
Date: Sun, 15 Sep 2024 22:19:58 +1000
Message-ID: <87h6ahqfbl.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 14/09/2024 =C3=A0 04:02, Michael Ellerman a =C3=A9crit=C2=A0:
...
>>=20
>> diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/as=
m/atomic.h
>> index 5bf6a4d49268..0e41c1da82dd 100644
>> --- a/arch/powerpc/include/asm/atomic.h
>> +++ b/arch/powerpc/include/asm/atomic.h
>> @@ -23,6 +23,12 @@
>>   #define __atomic_release_fence()					\
>>   	__asm__ __volatile__(PPC_RELEASE_BARRIER "" : : : "memory")
>>=20=20=20
>> +#ifdef CONFIG_CC_IS_CLANG
>> +#define DS_FORM_CONSTRAINT "Z<>"
>> +#else
>> +#define DS_FORM_CONSTRAINT "YZ<>"
>> +#endif
>
> I see we have the same in uaccess.h, added by commit 2d43cc701b96=20
> ("powerpc/uaccess: Fix build errors seen with GCC 13/14")

Yep.

> Should that go in a common header, maybe ppc_asm.h ?

That would be the obvious place, but unfortunately including ppc_asm.h
in atomic.h breaks the build due to header spaghetti.

For now I've put the defines in asm-compat.h, which is not ideal but
seems to work.

cheers

