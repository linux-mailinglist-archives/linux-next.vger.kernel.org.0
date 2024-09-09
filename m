Return-Path: <linux-next+bounces-3709-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A06971C62
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 16:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60BFF1C227C6
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2024 14:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8761BA262;
	Mon,  9 Sep 2024 14:22:37 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5A1176AAD;
	Mon,  9 Sep 2024 14:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725891757; cv=none; b=plwCVutIfokqY/nbDFzmDUVbEdTWfzaSO7cvmF4bIsd9RlaH6AP3/T1lYPxdGde4VzZnHSf+sIttLUFtQ7911wi1B1P+APzU522Poi0O7AORFv5C5SYXPTwBikQ47iKaTkQXvgGJRRgCsaok4Y05FtQQwSKN6us/9whXcoztK6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725891757; c=relaxed/simple;
	bh=yJ9MEz/PfYNz+AVkadZOxalLAPNx+Fn0gqmau1nLfyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFwsmoN7f6rsTn5zyBg+XSC0A07X0xR2pe1YpA149Ww9ODzZ48mnTkrXBI4JrX/HyCUZ/PJj+kAvXfJQquDv4y+dM1U7cJD/JqFuEg/YIWYqQhblVgv0N4jxCzBzGOFxsp+ur8ThbYpXf90+dUqLnJ9XpAQCRLVFV/T/qCVe2yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X2TYt61ytz9sPd;
	Mon,  9 Sep 2024 16:22:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DBxw1cb5WhtA; Mon,  9 Sep 2024 16:22:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X2TYt5JYvz9rvV;
	Mon,  9 Sep 2024 16:22:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A64368B770;
	Mon,  9 Sep 2024 16:22:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4Dyb09wuLbf3; Mon,  9 Sep 2024 16:22:26 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C3AB8B76E;
	Mon,  9 Sep 2024 16:22:26 +0200 (CEST)
Message-ID: <afa6f06a-8d92-4ac1-b5fe-d5b6ade3f740@csgroup.eu>
Date: Mon, 9 Sep 2024 16:22:26 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the powerpc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada
 <masahiroy@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240909200948.70087f49@canb.auug.org.au>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240909200948.70087f49@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/09/2024 à 12:09, Stephen Rothwell a écrit :
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (powerpc
> ppc44x_defconfig) failed like this:
> 
> make[3]: *** No rule to make target 'arch/powerpc/boot/treeImage.ebony', needed by 'arch/powerpc/boot/zImage'.  Stop.
> make[2]: *** [/home/sfr/next/next/arch/powerpc/Makefile:236: zImage] Error 2
> make[1]: *** [/home/sfr/next/next/Makefile:224: __sub-make] Error 2
> make: *** [Makefile:224: __sub-make] Error 2
> 
> It is not obvious to me what change caused this, so I have just left
> the build  broken for today.
> 

Bisected to commit e6abfb536d16 ("kbuild: split device tree build rules 
into scripts/Makefile.dtbs")

Christophe

