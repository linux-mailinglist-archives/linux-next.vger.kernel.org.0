Return-Path: <linux-next+bounces-224-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFE5803E2E
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 20:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C72842810A1
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 19:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5B131595;
	Mon,  4 Dec 2023 19:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fr99GW5c"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958A1187;
	Mon,  4 Dec 2023 11:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=avd9kpVhWVz2B8M8Ybf0Aja5DrFeuHw1R35QMA4ZI+c=; b=fr99GW5caHfSxsY/5+j9x6lnD0
	l/95EYHH/31qeCFDn35JABWm/dAXSF0CNShkcWkyDCkYGAFRUmR+y84+2r1y4bw8lkUNYlL+Mzjqs
	qYzB0IAWXTNSmaEbHmjrcwZQiwoOOObUmEfzfRNvd4DQu2LqpAHlZ7FWjfEa8Lj5O5YJz9BnMr+p2
	IO0egqlQgdGtdgK8c6kiCRBj+jd/6duuU9aojp7Nkq5SQed9xM+z4XPSViC7w9YIOyYsyxXfjKJw0
	oanG7uyO9tlhDS8lvMuZ/NDhrD19v0pMGU22BOyHIHjOaO5cy9bgG3o5CNcCgGQLu9iE2Ghtyjb+I
	tR0c9H0g==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAEOo-005QO4-2M;
	Mon, 04 Dec 2023 19:14:34 +0000
Message-ID: <17633619-fde3-4f36-b047-413e79c8116f@infradead.org>
Date: Mon, 4 Dec 2023 11:14:34 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv, kexec: fix dependency of two items
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, akpm@linux-foundation.org,
 ignat@cloudflare.com, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org, eric_devolder@yahoo.com
References: <ZW00/Cfk47Cc3kGo@MiWiFi-R3L-srv>
 <ZW04G/SKnhbE5mnX@MiWiFi-R3L-srv>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZW04G/SKnhbE5mnX@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/3/23 18:23, Baoquan He wrote:
> Drop the dependency on MMU from ARCH_SUPPORTS_KEXEC and
> ARCH_SUPPORTS_KEXEC_FILE because CONFIG_MMU could be disabled while
> people may still want to have KEXEC/KEXEC_FILE functionality.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  arch/riscv/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 95a2a06acc6a..24c1799e2ec4 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -685,7 +685,7 @@ config RISCV_BOOT_SPINWAIT
>  	  If unsure what to do here, say N.
>  
>  config ARCH_SUPPORTS_KEXEC
> -	def_bool MMU
> +	def_bool y
>  
>  config ARCH_SELECTS_KEXEC
>  	def_bool y
> @@ -693,7 +693,7 @@ config ARCH_SELECTS_KEXEC
>  	select HOTPLUG_CPU if SMP
>  
>  config ARCH_SUPPORTS_KEXEC_FILE
> -	def_bool 64BIT && MMU
> +	def_bool 64BIT
>  
>  config ARCH_SELECTS_KEXEC_FILE
>  	def_bool y

-- 
~Randy

