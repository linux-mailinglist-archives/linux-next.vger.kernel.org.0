Return-Path: <linux-next+bounces-3775-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D99CE975FC1
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 05:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B844B22E1D
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2024 03:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D39278289;
	Thu, 12 Sep 2024 03:33:35 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1A41EB2A;
	Thu, 12 Sep 2024 03:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726112015; cv=none; b=cTxpt0uIoONHbklG4MlEuBg0a3Tt921nXTbGip6E6VyYSd8Ek1tNvovV+thZqjbbz9ciTaEj39E/V484FLLHxXfCoRUiClBocO5AZQH5nnxfbA9r2Np4xUX7GPMjd5lReepjGLT1hAXJoTt6Y8A1VUUb0vftZ9Z5C+GL2IYalzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726112015; c=relaxed/simple;
	bh=Z3vHAc4F2fbIJ0Nt6QKTsCS9Fx7XHjZCbCFKb9GFxcU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=linos1whhcqiWWvD03JBQ4654TDXEX3J8RRsYuuSGE+DUcEhKQx5vafkInp9a6EmBaU5KKtSg3BO6HARtRWqKi9jLOKL0K+dJ9KAOw1RlYA/OMStxSLJuuluN3RFedGpI8nxDynH5RD9kk8/IQJLg7e0gEbNGAZ6AQex1S3fLW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.184])
	by gateway (Coremail) with SMTP id _____8DxTusKYeJmCG4FAA--.13286S3;
	Thu, 12 Sep 2024 11:33:30 +0800 (CST)
Received: from [10.20.42.184] (unknown [10.20.42.184])
	by front1 (Coremail) with SMTP id qMiowMCxLeQIYeJmy2QEAA--.25330S3;
	Thu, 12 Sep 2024 11:33:29 +0800 (CST)
Subject: Re: linux-next: build failure after merge of the loongarch tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Tianrui Zhao <zhaotianrui@loongson.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240912103524.62ac1dae@canb.auug.org.au>
From: lixianglai <lixianglai@loongson.cn>
Message-ID: <a512ecc8-2fd8-71aa-1a93-1809d6af033f@loongson.cn>
Date: Thu, 12 Sep 2024 11:33:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240912103524.62ac1dae@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMCxLeQIYeJmy2QEAA--.25330S3
X-CM-SenderInfo: 5ol0xt5qjotxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9fXoW3Cry5Cr1UAF4DArWDKF43CFX_yoW8Wr15Xo
	ZrA3WUt3yrGr18Cay7GFy5K34UArn8tFZ8t3Z0qrWDuF4fJw1fXr1Fy3y8taykZF1kCwsI
	vw4DA3WaqFs5Jr93l-sFpf9Il3svdjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8wcxFpf
	9Il3svdxBIdaVrn0xqx4xG64xvF2IEw4CE5I8CrVC2j2Jv73VFW2AGmfu7bjvjm3AaLaJ3
	UjIYCTnIWjp_UUUYc7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI
	8IcIk0rVWrJVCq3wAFIxvE14AKwVWUGVWUXwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xG
	Y2AK021l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14
	v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU25Ef
	UUUUU

Hi Stephen Rothwell:

Thank you very much for your feedback.
I think the following modification can solve the compilation problem of 
ppc64.
I have verified it on the x86 cross environment,
and I will incorporate the modification into the next version of patch.

  #define kvm_trace_symbol_iocsr \
-       ({ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
+       { KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
         { KVM_TRACE_IOCSR_READ, "read" }, \
-       { KVM_TRACE_IOCSR_WRITE, "write" })
+       { KVM_TRACE_IOCSR_WRITE, "write" }

Thanks,
Xianglai.

> Hi all,
>
> After merging the loongarch tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> In file included from include/trace/define_trace.h:102,
>                   from include/trace/events/kvm.h:530,
>                   from arch/powerpc/kvm/../../../virt/kvm/kvm_main.c:65:
> include/trace/events/kvm.h: In function 'trace_raw_output_kvm_iocsr':
> include/trace/events/kvm.h:244:44: error: left-hand operand of comma expression has no effect [-Werror=unused-value]
>    244 |         ({ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
>        |                                            ^
> include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
>    203 |         trace_event_printf(iter, print);                                \
>        |                                  ^~~~~
> include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
>     45 |                              PARAMS(print));                   \
>        |                              ^~~~~~
> include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
>    248 | TRACE_EVENT(kvm_iocsr,
>        | ^~~~~~~~~~~
> include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
>    269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
>        |         ^~~~~~~~~
> include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_symbolic'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                   ^~~~~~~~~~~~~~~~
> include/trace/events/kvm.h:270:51: note: in expansion of macro 'kvm_trace_symbol_iocsr'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                                                   ^~~~~~~~~~~~~~~~~~~~~~
> include/trace/events/kvm.h:244:65: error: expected ';' before '}' token
>    244 |         ({ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
>        |                                                                 ^
> include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
>    203 |         trace_event_printf(iter, print);                                \
>        |                                  ^~~~~
> include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
>     45 |                              PARAMS(print));                   \
>        |                              ^~~~~~
> include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
>    248 | TRACE_EVENT(kvm_iocsr,
>        | ^~~~~~~~~~~
> include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
>    269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
>        |         ^~~~~~~~~
> include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_symbolic'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                   ^~~~~~~~~~~~~~~~
> include/trace/events/kvm.h:270:51: note: in expansion of macro 'kvm_trace_symbol_iocsr'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                                                   ^~~~~~~~~~~~~~~~~~~~~~
> include/trace/events/kvm.h:244:66: error: expected ')' before ',' token
>    244 |         ({ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
>        |                                                                  ^
> include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
>    203 |         trace_event_printf(iter, print);                                \
>        |                                  ^~~~~
> include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
>     45 |                              PARAMS(print));                   \
>        |                              ^~~~~~
> include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
>    248 | TRACE_EVENT(kvm_iocsr,
>        | ^~~~~~~~~~~
> include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
>    269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
>        |         ^~~~~~~~~
> include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_symbolic'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                   ^~~~~~~~~~~~~~~~
> include/trace/events/kvm.h:270:51: note: in expansion of macro 'kvm_trace_symbol_iocsr'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                                                   ^~~~~~~~~~~~~~~~~~~~~~
> include/trace/events/kvm.h:244:9: error: initialization of 'long unsigned int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
>    244 |         ({ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
>        |         ^
> include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
>    203 |         trace_event_printf(iter, print);                                \
>        |                                  ^~~~~
> include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
>     45 |                              PARAMS(print));                   \
>        |                              ^~~~~~
> include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
>    248 | TRACE_EVENT(kvm_iocsr,
>        | ^~~~~~~~~~~
> include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
>    269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
>        |         ^~~~~~~~~
> include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_symbolic'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                   ^~~~~~~~~~~~~~~~
> include/trace/events/kvm.h:270:51: note: in expansion of macro 'kvm_trace_symbol_iocsr'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                                                   ^~~~~~~~~~~~~~~~~~~~~~
> include/trace/events/kvm.h:244:9: note: (near initialization for 'symbols[0].mask')
>    244 |         ({ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
>        |         ^
> include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
>    203 |         trace_event_printf(iter, print);                                \
>        |                                  ^~~~~
> include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
>     45 |                              PARAMS(print));                   \
>        |                              ^~~~~~
> include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
>    248 | TRACE_EVENT(kvm_iocsr,
>        | ^~~~~~~~~~~
> include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
>    269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
>        |         ^~~~~~~~~
> include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_symbolic'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                   ^~~~~~~~~~~~~~~~
> include/trace/events/kvm.h:270:51: note: in expansion of macro 'kvm_trace_symbol_iocsr'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                                                   ^~~~~~~~~~~~~~~~~~~~~~
> include/trace/events/kvm.h:244:9: error: initializer element is not constant
>    244 |         ({ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
>        |         ^
> include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
>    203 |         trace_event_printf(iter, print);                                \
>        |                                  ^~~~~
> include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
>     45 |                              PARAMS(print));                   \
>        |                              ^~~~~~
> include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
>    248 | TRACE_EVENT(kvm_iocsr,
>        | ^~~~~~~~~~~
> include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
>    269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
>        |         ^~~~~~~~~
> include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_symbolic'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                   ^~~~~~~~~~~~~~~~
> include/trace/events/kvm.h:270:51: note: in expansion of macro 'kvm_trace_symbol_iocsr'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                                                   ^~~~~~~~~~~~~~~~~~~~~~
> include/trace/events/kvm.h:244:9: note: (near initialization for 'symbols[0].mask')
>    244 |         ({ KVM_TRACE_IOCSR_READ_UNSATISFIED, "unsatisfied-read" }, \
>        |         ^
> include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
>    203 |         trace_event_printf(iter, print);                                \
>        |                                  ^~~~~
> include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
>     45 |                              PARAMS(print));                   \
>        |                              ^~~~~~
> include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
>    248 | TRACE_EVENT(kvm_iocsr,
>        | ^~~~~~~~~~~
> include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
>    269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
>        |         ^~~~~~~~~
> include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_symbolic'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                   ^~~~~~~~~~~~~~~~
> include/trace/events/kvm.h:270:51: note: in expansion of macro 'kvm_trace_symbol_iocsr'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                                                   ^~~~~~~~~~~~~~~~~~~~~~
> include/trace/stages/stage3_trace_output.h:77:37: error: braces around scalar initializer [-Werror]
>     77 |                 static const struct trace_print_flags symbols[] =       \
>        |                                     ^~~~~~~~~~~~~~~~~
> include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
>    203 |         trace_event_printf(iter, print);                                \
>        |                                  ^~~~~
> include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
>     45 |                              PARAMS(print));                   \
>        |                              ^~~~~~
> include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
>    248 | TRACE_EVENT(kvm_iocsr,
>        | ^~~~~~~~~~~
> include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
>    269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
>        |         ^~~~~~~~~
> include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_symbolic'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                   ^~~~~~~~~~~~~~~~
> include/trace/stages/stage3_trace_output.h:77:37: note: (near initialization for 'symbols[0].name')
>     77 |                 static const struct trace_print_flags symbols[] =       \
>        |                                     ^~~~~~~~~~~~~~~~~
> include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
>    203 |         trace_event_printf(iter, print);                                \
>        |                                  ^~~~~
> include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
>     45 |                              PARAMS(print));                   \
>        |                              ^~~~~~
> include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
>    248 | TRACE_EVENT(kvm_iocsr,
>        | ^~~~~~~~~~~
> include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
>    269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
>        |         ^~~~~~~~~
> include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_symbolic'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                   ^~~~~~~~~~~~~~~~
> include/trace/stages/stage3_trace_output.h:78:43: error: initialization of 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>     78 |                         { symbol_array, { -1, NULL }};                  \
>        |                                           ^
> include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
>    203 |         trace_event_printf(iter, print);                                \
>        |                                  ^~~~~
> include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
>     45 |                              PARAMS(print));                   \
>        |                              ^~~~~~
> include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
>    248 | TRACE_EVENT(kvm_iocsr,
>        | ^~~~~~~~~~~
> include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
>    269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
>        |         ^~~~~~~~~
> include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_symbolic'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                   ^~~~~~~~~~~~~~~~
> include/trace/stages/stage3_trace_output.h:78:43: note: (near initialization for 'symbols[0].name')
>     78 |                         { symbol_array, { -1, NULL }};                  \
>        |                                           ^
> include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
>    203 |         trace_event_printf(iter, print);                                \
>        |                                  ^~~~~
> include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
>     45 |                              PARAMS(print));                   \
>        |                              ^~~~~~
> include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
>    248 | TRACE_EVENT(kvm_iocsr,
>        | ^~~~~~~~~~~
> include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
>    269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
>        |         ^~~~~~~~~
> include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_symbolic'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                   ^~~~~~~~~~~~~~~~
> include/linux/stddef.h:8:14: error: excess elements in scalar initializer [-Werror]
>      8 | #define NULL ((void *)0)
>        |              ^
> include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
>    203 |         trace_event_printf(iter, print);                                \
>        |                                  ^~~~~
> include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
>     45 |                              PARAMS(print));                   \
>        |                              ^~~~~~
> include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
>    248 | TRACE_EVENT(kvm_iocsr,
>        | ^~~~~~~~~~~
> include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
>    269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
>        |         ^~~~~~~~~
> include/trace/stages/stage3_trace_output.h:78:47: note: in expansion of macro 'NULL'
>     78 |                         { symbol_array, { -1, NULL }};                  \
>        |                                               ^~~~
> include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_symbolic'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                   ^~~~~~~~~~~~~~~~
> include/linux/stddef.h:8:14: note: (near initialization for 'symbols[0].name')
>      8 | #define NULL ((void *)0)
>        |              ^
> include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
>    203 |         trace_event_printf(iter, print);                                \
>        |                                  ^~~~~
> include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
>     45 |                              PARAMS(print));                   \
>        |                              ^~~~~~
> include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
>    248 | TRACE_EVENT(kvm_iocsr,
>        | ^~~~~~~~~~~
> include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
>    269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
>        |         ^~~~~~~~~
> include/trace/stages/stage3_trace_output.h:78:47: note: in expansion of macro 'NULL'
>     78 |                         { symbol_array, { -1, NULL }};                  \
>        |                                               ^~~~
> include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_symbolic'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                   ^~~~~~~~~~~~~~~~
> include/trace/stages/stage3_trace_output.h:78:25: error: missing braces around initializer [-Werror=missing-braces]
>     78 |                         { symbol_array, { -1, NULL }};                  \
>        |                         ^
> include/trace/trace_events.h:203:34: note: in definition of macro 'DECLARE_EVENT_CLASS'
>    203 |         trace_event_printf(iter, print);                                \
>        |                                  ^~~~~
> include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
>     45 |                              PARAMS(print));                   \
>        |                              ^~~~~~
> include/trace/events/kvm.h:248:1: note: in expansion of macro 'TRACE_EVENT'
>    248 | TRACE_EVENT(kvm_iocsr,
>        | ^~~~~~~~~~~
> include/trace/events/kvm.h:269:9: note: in expansion of macro 'TP_printk'
>    269 |         TP_printk("iocsr %s len %u gpa 0x%llx val 0x%llx",
>        |         ^~~~~~~~~
> include/trace/events/kvm.h:270:19: note: in expansion of macro '__print_symbolic'
>    270 |                   __print_symbolic(__entry->type, kvm_trace_symbol_iocsr),
>        |                   ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>    a7e93cf65d8a ("LoongArch: KVM: Add iocsr and mmio bus simulation in kernel")
>
> I have used the loongarch tree from next-20240911 for today.
>


