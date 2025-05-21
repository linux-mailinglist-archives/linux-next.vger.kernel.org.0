Return-Path: <linux-next+bounces-6874-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 434E5ABEBAA
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 08:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E65F54A5208
	for <lists+linux-next@lfdr.de>; Wed, 21 May 2025 06:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F71231850;
	Wed, 21 May 2025 06:06:09 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3A4635;
	Wed, 21 May 2025 06:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747807569; cv=none; b=LOMb3U0Pj5lG4ScSG/0Ase6MAos1KXT3/cyBmyCyobqvsExMpG3iTMhLkWd1h1vOZWrGwWN0qUNuf5Xi6R67ThMCp834tFbITHvOGC+Y526j0rpMRxsk8dX7JnO+cmdWH/nGS9dlgDCoEt79KbxgOvUPedEEEAxRFgbg1XLcmWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747807569; c=relaxed/simple;
	bh=zDZP7fql9Cjn2XFyjL+oX04PjvDu3cO2MNDmYr4yIR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKHCynM5befPl+5hDRHUqMDJGjUlxEi7o4mHjWPLWu427MYU5ZJCTBw1VigS5GsFKAUQpKjVpZ665ocEar56H1/56LF1Q57D4qIefzwN74/KKaQeQ0XO2pTcTQUfaSYfXE9V6FHq33a5kMbdJQvNGkENV8OnjOu06PJcRpxoApI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.69.3])
	by gateway (Coremail) with SMTP id _____8AxDGtEbS1oF2T0AA--.1782S3;
	Wed, 21 May 2025 14:05:56 +0800 (CST)
Received: from [127.0.0.1] (unknown [223.64.69.3])
	by front1 (Coremail) with SMTP id qMiowMCxbRtAbS1ombPkAA--.23806S2;
	Wed, 21 May 2025 14:05:55 +0800 (CST)
Message-ID: <7fadc893-8d4c-4509-970d-52d4dbe7e51b@loongson.cn>
Date: Wed, 21 May 2025 14:05:52 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the mmc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250521154240.4aacf1b0@canb.auug.org.au>
From: Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <20250521154240.4aacf1b0@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMCxbRtAbS1ombPkAA--.23806S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xry8KF15AF4DJw4fCrWkZrc_yoWfCrg_Xa
	yUtrnrW3W7Ja95Ja42qFZI9ry0ka1UJrn5KrWFqw1YqFyrXa1kWan7XFn2qr1xXa12vrWx
	Gw1xt3Wkury2vosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbz8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_
	Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMx
	C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
	wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
	vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v2
	0xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
	WUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUUU

Hi all:

On 2025/5/21 13:42, Stephen Rothwell wrote:
> Hi all,
>
> After merging the mmc tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/mmc/host/sunxi-mmc.c: In function 'sunxi_mmc_probe':
> drivers/mmc/host/sunxi-mmc.c:1391:38: error: stray '`' in program
>   1391 |                                      `"Failed to allocate DMA descriptor mem\n");
>        |                                      ^
>
> Caused by commit
>
>    15252b7ff0b3 ("mmc: sunxi: Use devm_mmc_alloc_host() helper")

Sorry for my cheap mistake.
I found this compilation error earlier as well. When I submitted the 
patch, it was tested for compilation pass with COMPILE_TEST=y and 
cross-compile, which the driver happened to exclude.

To Ulf:

I'm not sure which way you wish to address this issue.
Did you just modify the patch, or should I resubmit a fix patch?

Once again, I'm sorry.

>
> I have used the mmc tree from next-20250516 for today.
>
Thanks.
Binbin


