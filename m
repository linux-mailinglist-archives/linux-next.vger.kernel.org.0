Return-Path: <linux-next+bounces-3427-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E8695F86E
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 19:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6ADB283171
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 17:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7F4198E90;
	Mon, 26 Aug 2024 17:43:25 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EC610E9;
	Mon, 26 Aug 2024 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724694205; cv=none; b=WNZtM9Oy99DWGFay2CAF+K/jMKYe+SIhVQwHOxeixBWXrJwjITF23BcGLEF3Ti0RhKneW8DhaJvn4AcUiS1ESMqdUSU9IaOOTloYbXWsGMKmAksmggAikrmwYlJYdxZFjhAD5J47z0y39xr17dj8YrdzIxgqbsjzma3HKmwVpgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724694205; c=relaxed/simple;
	bh=A8eNY16K/NSgNAbWAwsP3VuuSvMTk7DqEMkxYcW5jOM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zjz+zXWnXBTnrI71dtlFAvCblCd92R7QY9Sb3eeN6Oj2qof4Jp+Qy36khAuf5IIr8KIMYhQ50+cjQ/hb4Ffm+jnFlSyPUY/qA/Vht8lmF1DIRG4+6cvFSEq3gH0CqWvT2/eWGVTtmuu5la4YjPGNKBLyN5so3hPO61ms4yVQ4I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wsyh94Vn5z9sPd;
	Mon, 26 Aug 2024 19:43:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jHAjDb9YYVls; Mon, 26 Aug 2024 19:43:21 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wsyh93Lnbz9rvV;
	Mon, 26 Aug 2024 19:43:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D7778B77B;
	Mon, 26 Aug 2024 19:43:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id mU-Q-zwNOehp; Mon, 26 Aug 2024 19:43:21 +0200 (CEST)
Received: from [192.168.233.119] (unknown [192.168.233.119])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D456C8B763;
	Mon, 26 Aug 2024 19:43:20 +0200 (CEST)
Message-ID: <b0fe75b4-c1bb-47f7-a7c3-2534b31c1780@csgroup.eu>
Date: Mon, 26 Aug 2024 19:43:20 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: boot warning after merge of the vfs-brauner tree
To: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Pankaj Raghav <p.raghav@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, djwong@kernel.org,
 ritesh.list@gmail.com, linuxppc-dev@lists.ozlabs.org
References: <20240826175931.1989f99e@canb.auug.org.au>
 <20240826154818.hzqnvofdmaxvuwrh@quentin>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240826154818.hzqnvofdmaxvuwrh@quentin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 26/08/2024 à 17:48, Pankaj Raghav (Samsung) a écrit :
> On Mon, Aug 26, 2024 at 05:59:31PM +1000, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the vfs-brauner tree, today's linux-next boot test (powerpc
>> pseries_le_defconfig) produced this warning:
> 
> iomap dio calls set_memory_ro() on the page that is used for sub block
> zeroing.
> 
> But looking at powerpc code, they don't support set_memory_ro() for
> memory region that belongs to the kernel(LINEAR_MAP_REGION_ID).
> 
> /*
>   * On hash, the linear mapping is not in the Linux page table so
>   * apply_to_existing_page_range() will have no effect. If in the future
>   * the set_memory_* functions are used on the linear map this will need
>   * to be updated.
>   */
> if (!radix_enabled()) {
>          int region = get_region_id(addr);
> 
>          if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
>                  return -EINVAL;
> }
> 
> We call set_memory_ro() on the zero page as a extra security measure.
> I don't know much about powerpc, but looking at the comment, is it just
> adding the following to support it in powerpc:
> 
> diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
> index ac22bf28086fa..e6e0b40ba6db4 100644
> --- a/arch/powerpc/mm/pageattr.c
> +++ b/arch/powerpc/mm/pageattr.c
> @@ -94,7 +94,9 @@ int change_memory_attr(unsigned long addr, int numpages, long action)
>          if (!radix_enabled()) {
>                  int region = get_region_id(addr);
>   
> -               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID && region != IO_REGION_ID))
> +               if (WARN_ON_ONCE(region != VMALLOC_REGION_ID &&
> +                                region != IO_REGION_ID &&
> +                                region != LINEAR_MAP_REGION_ID))
>                          return -EINVAL;
>          }
>   #endif

By doing this you will just hide the fact that it didn't work.

See commit 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines") 
for details. The linear memory region is not mapped using page tables so 
set_memory_ro() will have no effect on it.

You can either use vmalloc'ed pages, or do a const static allocation at 
buildtime so that it will be allocated in the kernel static rodata area.

By the way, your code should check the value returned by 
set_memory_ro(), there is some work in progress to make it mandatory, 
see https://github.com/KSPP/linux/issues/7

Christophe

> 
>   If it involves changing more things and this feature will be added to
>   powerpc in the future, we could drop the set_memory_ro() call from
>   iomap.
> 
>   CC: Darrick(as he suggested set_memory_ro() on zero page), Leroy,
>   Ritesh, ppc list
> 

