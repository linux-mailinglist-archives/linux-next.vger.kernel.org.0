Return-Path: <linux-next+bounces-2829-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E53925FF6
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 14:16:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B536E28C031
	for <lists+linux-next@lfdr.de>; Wed,  3 Jul 2024 12:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA4813247D;
	Wed,  3 Jul 2024 12:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="sD3GuhqY"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EE61DA32E;
	Wed,  3 Jul 2024 12:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008909; cv=none; b=jEBXEwreCb//coyqujc8S94G1H/q4k0w1sruRAu59/jv7u/SFn2tjnw3BBOM+Zv4lZAXldMzATG8uzgOyvttumyr21iy1GWG6Ebx7+cC5Ng22hvHirYN8xu8/meq1bvkqr+25/Bv7opGM7lJXtMpRABIpkSsh82b2aviLn2jMOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008909; c=relaxed/simple;
	bh=9y7cwowHLygrGBe1nFJ6kb52Yo9EeIOUZEp1lNBX5k4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VhmjGXUL8Jz7qmL+c7Ofjd4gH4GW6kxDfVf+4nSAqi1ONHxTPv0tLyTFVrQBzJ8sO0MhMBSY70LZErbl2BNCo011QnXleM6ri6Y8Jf2dJZ1QJRz2byNnpJsJGR8cqOUk60rleMFbPIzHG+0Pv2nrjB+L1TrLxcZqw+pMvssCxkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=sD3GuhqY; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720008905;
	bh=UxJxwgl5X9xFRRy727u0o88lwP6DZx5C/R3IDsogaPQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sD3GuhqYaStocDQF9XC/h/JF8I8fEfGUPye1q2o6ONwncol7PYAQP84mm7e+D2iWX
	 3DBH4gywHI7nZ2bHBrpxQHEdgVmo6P0lCi2jsjpg/2FwV/LnrBfkx6dGzhRFZgQ35e
	 2WgxxuQtIxEdY1KNqBJoMFuInL2GwAM7pEfKHMYmptNV0WHhJ7YlGnC9TEAKDjFsPk
	 3wlyCiIt3pKGb8zdSYrBp8vtUMDgmbvMGsH5vaiShLGDmYvztE5VM6p+noSd3nd88P
	 ZP5/E/of1VOOMWxd5xhG4rmLgJ+L3nfZ/blIxJmX09euQ2o+tPkl3RUBFRhfsgcrGN
	 myKpyZJVVEl0Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WDdyK0qQFz4w2Q;
	Wed,  3 Jul 2024 22:15:05 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the powerpc tree with the mm tree
In-Reply-To: <20240703094857.3f489d4f@canb.auug.org.au>
References: <20240703094857.3f489d4f@canb.auug.org.au>
Date: Wed, 03 Jul 2024 22:15:04 +1000
Message-ID: <87cynuk6yf.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the powerpc tree got a conflict in:
>
>   arch/powerpc/mm/nohash/Makefile
>
...
> diff --cc arch/powerpc/mm/nohash/Makefile
> index 90e846f0c46c,86d0fe434824..000000000000
> --- a/arch/powerpc/mm/nohash/Makefile
> +++ b/arch/powerpc/mm/nohash/Makefile
> @@@ -1,8 -1,7 +1,7 @@@
>   # SPDX-License-Identifier: GPL-2.0
>   
>   obj-y				+= mmu_context.o tlb.o tlb_low.o kup.o
>  -obj-$(CONFIG_PPC_BOOK3E_64)  	+= tlb_low_64e.o book3e_pgtable.o
>  +obj-$(CONFIG_PPC_BOOK3E_64)  	+= tlb_64e.o tlb_low_64e.o book3e_pgtable.o
> - obj-$(CONFIG_40x)		+= 40x.o
>   obj-$(CONFIG_44x)		+= 44x.o
>   obj-$(CONFIG_PPC_8xx)		+= 8xx.o
>   obj-$(CONFIG_PPC_E500)		+= e500.o

Thanks, looks right.

cheers

