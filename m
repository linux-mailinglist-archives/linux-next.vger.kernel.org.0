Return-Path: <linux-next+bounces-222-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC37803E1F
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 20:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75A31281050
	for <lists+linux-next@lfdr.de>; Mon,  4 Dec 2023 19:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9EB2E847;
	Mon,  4 Dec 2023 19:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pEy1xj3M"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC56CA;
	Mon,  4 Dec 2023 11:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=OIM7Xj5S64WeeK7uF8Aazyt2chx/qqwU82OmJYmPDHA=; b=pEy1xj3M0D4lSSTMcXt95/Oy2b
	f/5gJ2db6LSThqBzBMXFQWzMsss5xoME5JSkRJAlIdt3zW4Z2OissYm4XYeJqVv4vbkI3EBUNg8Dl
	eYFza/JLc3lFIo7SYeJezPLhqPuv+cu5Od4HLNCZCiQFtJJPHlrtx/G97gB0JYme6FPj7loc7O034
	doKkQlok4allZLljjdNDXbeXfslMUJuWWQaS3spQrEB1SJxm8QRqVa+le7yP31BSk+UE3F9ODJh6J
	uj1nVRRgA3x3uAy51xjdqTGF9QthGpaSLKblI+RgcDhXa9EvI4qx2EvB9sbaPO0AEffPQdUr2LDbZ
	ERoF5R+w==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAEM4-005Q9i-2R;
	Mon, 04 Dec 2023 19:11:44 +0000
Message-ID: <bcb0ec3f-d0ca-48fa-a201-1737ed5ddaec@infradead.org>
Date: Mon, 4 Dec 2023 11:11:44 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Dec 1 (riscv, crash_core)
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, akpm@linux-foundation.org,
 ignat@cloudflare.com, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org, eric_devolder@yahoo.com
References: <ZW00/Cfk47Cc3kGo@MiWiFi-R3L-srv>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZW00/Cfk47Cc3kGo@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/3/23 18:10, Baoquan He wrote:
> eric_devolder@yahoo.com, ignat@cloudflare.com,
> 	Linux Next Mailing List <linux-next@vger.kernel.org>,
> 	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
> 	linux-riscv <linux-riscv@lists.infradead.org>,
> 	kexec <kexec@lists.infradead.org>
> Bcc: bhe@redhat.com
> Subject: Re: linux-next: Tree for Dec 1 (riscv, crash_core)
> Reply-To: 
> In-Reply-To: <bbd1bbfb-c482-433d-bce9-2b591b8e855e@infradead.org>
> 
> On 12/01/23 at 11:53am, Randy Dunlap wrote:
>>
>>
>> On 11/30/23 18:37, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Changes since 20231130:
>>>
>>
>> on riscv 32-bit or 64-bit, with
>> # CONFIG_MMU is not set
> 

[]

> I made two patches to decouple the kexec/crash code with CONFIG_MMU. Not
> sure if risc-v wants that.
> 
> Or we can simply add dependency on MMU for ARCH_SUPPORTS_CRASH_DUMP.
> Then when CONFIG_MMU=n, CONFIG_CRASH_DUMP, CONFIG_KEXEC_CORE,
> CONFIG_CRASH_CORE will be unset too. Please help check which one need be
> taken.
> 
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 24c1799e2ec4..03d290da7262 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -708,6 +708,7 @@ config ARCH_SUPPORTS_KEXEC_PURGATORY
>  
>  config ARCH_SUPPORTS_CRASH_DUMP
>  	def_bool y
> +	depends on MMU=y
>  
>  config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
>  	def_bool CRASH_CORE
> 

That works if the RISC-V folks prefer it.


Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

-- 
~Randy

