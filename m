Return-Path: <linux-next+bounces-188-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC5E8013C0
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 20:53:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE0A01F20F97
	for <lists+linux-next@lfdr.de>; Fri,  1 Dec 2023 19:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04AEE30FB2;
	Fri,  1 Dec 2023 19:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3NU6U5fu"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E77DED54;
	Fri,  1 Dec 2023 11:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=XPWnaxPrm0f6elHZEHty0Q05hMlpsHFhw/SaklHOpvc=; b=3NU6U5fuCupHMo/sgD44cUrAFA
	/nLb7DQAPa+1nxFgma0kLThjAWE+5Q8mjoKT5jcarJU8KGYsWlqJC/udu4zxEXPqra1sb74XdZpoX
	1dRkdOHl5JddfH1nJ+swu9LbzodqcjqCAdMdqlqJxgyZMZk1qdU2hDNBKbjzDvySpwzMhTMAM3wTs
	+EjhiyVpGNZDKtSdtr8GtoOaTtFCm/Utu5HkKWazHOiJdQosQxmmBrzDtTFbIFXf/nAeD+WUD70sT
	Mi4KeFjralDl1TGfMuLlIpekKzpUrWGn+QtNoit5AcvMxJRcGvn597ndncNUfEdezZssuwoUPCkik
	+hDrF4NQ==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r99a0-00EXox-2x;
	Fri, 01 Dec 2023 19:53:40 +0000
Message-ID: <bbd1bbfb-c482-433d-bce9-2b591b8e855e@infradead.org>
Date: Fri, 1 Dec 2023 11:53:37 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Dec 1 (riscv, crash_core)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 kexec <kexec@lists.infradead.org>, Baoquan He <bhe@redhat.com>
References: <20231201133726.4a4413dd@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231201133726.4a4413dd@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/30/23 18:37, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20231130:
> 

on riscv 32-bit or 64-bit, with
# CONFIG_MMU is not set

In file included from ../arch/riscv/kernel/crash_core.c:3:
../arch/riscv/kernel/crash_core.c: In function 'arch_crash_save_vmcoreinfo':
../arch/riscv/kernel/crash_core.c:8:27: error: 'VA_BITS' undeclared (first use in this function)
    8 |         VMCOREINFO_NUMBER(VA_BITS);
      |                           ^~~~~~~
../include/linux/crash_core.h:78:64: note: in definition of macro 'VMCOREINFO_NUMBER'
   78 |         vmcoreinfo_append_str("NUMBER(%s)=%ld\n", #name, (long)name)
      |                                                                ^~~~
../arch/riscv/kernel/crash_core.c:8:27: note: each undeclared identifier is reported only once for each function it appears in
    8 |         VMCOREINFO_NUMBER(VA_BITS);
      |                           ^~~~~~~
../include/linux/crash_core.h:78:64: note: in definition of macro 'VMCOREINFO_NUMBER'
   78 |         vmcoreinfo_append_str("NUMBER(%s)=%ld\n", #name, (long)name)
      |                                                                ^~~~
../arch/riscv/kernel/crash_core.c:12:58: warning: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'int' [-Wformat=]
   12 |         vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
      |                                                        ~~^
      |                                                          |
      |                                                          long unsigned int
      |                                                        %x
../arch/riscv/kernel/crash_core.c:14:64: error: 'VMEMMAP_START' undeclared (first use in this function)
   14 |         vmcoreinfo_append_str("NUMBER(VMEMMAP_START)=0x%lx\n", VMEMMAP_START);
      |                                                                ^~~~~~~~~~~~~
../arch/riscv/kernel/crash_core.c:15:62: error: 'VMEMMAP_END' undeclared (first use in this function); did you mean 'MEMREMAP_ENC'?
   15 |         vmcoreinfo_append_str("NUMBER(VMEMMAP_END)=0x%lx\n", VMEMMAP_END);
      |                                                              ^~~~~~~~~~~
      |                                                              MEMREMAP_ENC

64-bit only: 

../arch/riscv/kernel/crash_core.c:17:64: error: 'MODULES_VADDR' undeclared (first use in this function)
   17 |         vmcoreinfo_append_str("NUMBER(MODULES_VADDR)=0x%lx\n", MODULES_VADDR);
      |                                                                ^~~~~~~~~~~~~
../arch/riscv/kernel/crash_core.c:18:62: error: 'MODULES_END' undeclared (first use in this function)
   18 |         vmcoreinfo_append_str("NUMBER(MODULES_END)=0x%lx\n", MODULES_END);
      |                                                              ^~~~~~~~~~~



-- 
~Randy

