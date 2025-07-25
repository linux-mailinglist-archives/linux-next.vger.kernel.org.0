Return-Path: <linux-next+bounces-7718-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB063B1176C
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 06:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BF06AC6ED3
	for <lists+linux-next@lfdr.de>; Fri, 25 Jul 2025 04:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01F1323505F;
	Fri, 25 Jul 2025 04:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EIMbukyR"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484C94685;
	Fri, 25 Jul 2025 04:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753417693; cv=none; b=T1l9U26Di2cV8bVYBWJOfkHSFGxJIs/mGh7d7lBWDnsLJFrXX52mXwGeDckG/5w+057VFx14rc2pxBOFwylABX/+Y/wpX1cDjeANCAxCLwgWi4Jj6By+YUlp27fSJMMCf453h1THWfui1d1X/SCkMmG/Fo4HgH8boKp3vncMSP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753417693; c=relaxed/simple;
	bh=nViCZVdIhHht4rvexq8fB+IyLWUtriTy6OzTnOIybqE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NWYC85iIrouNN/Y8j1NoUdh8dfpiB4m1sGHmAbb3XLlwI+Gi37u72AzNveSZ6U2/zD2hW1ZEv+ihPhq/PsWJHwmv9NN8uFDwgV5bVoEeKFLYDvgYeLqYbxoeKyjEQ6ut797khSpbTea/kmiI9/kQpF3v54LjcmQocV1aMESWZsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EIMbukyR; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=0/PVh4vnK+7cRx31zEAoBbAbZ5vTsgkuRvc6rDgjdps=; b=EIMbukyRQ+c5hi5N2IXI1jTgp9
	2JiiH5m8k4bQ1woFO7vY8dRuLR5hW6DhMiKsc5dtQox9l/f2uqx3dkzrbnTs1D60IZkce7Kz6z9sG
	tLXbuio6WenoMaYfv9ppQybRfTTV87Z7HkhKfRSaN4idjrhvRlzNf7yHzteN+dMEdlM+VTI47SAKu
	hAtG+U8wyOLC3jTJrb5HbwXU3CMpUdbWHUoLFkF0C6OCHHO9Nu0P0ctWWvoUalSnywkahJpqVqUgJ
	0/aGinLIEzVen4kao2BbZkRR17F3tAOPInaI5WlAaR0HNYltSfCYi9Yo9AFuzbJh7UpIUNwUBDGTE
	h+bsNyPw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufA2U-000000091Y8-1EEn;
	Fri, 25 Jul 2025 04:28:10 +0000
Message-ID: <d2e84599-bf73-44bb-a0f4-a5fe4086978e@infradead.org>
Date: Thu, 24 Jul 2025 21:28:09 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build) variable 'id' is uninitialized
 when used here [-Werror,-Wuninitial...
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com,
 linux-next@vger.kernel.org, Jason Wang <jasowang@redhat.com>
References: <175341594422.117.11494999566960779174@508e4dbc6f9f>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <175341594422.117.11494999566960779174@508e4dbc6f9f>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

due to commit 60c060930f481: 

+cc Jason Wang

On 7/24/25 8:59 PM, KernelCI bot wrote:
> 
> 
> 
> 
> Hello,
> 
> New build issue found on next/master:
> 
> ---
>  variable 'id' is uninitialized when used here [-Werror,-Wuninitialized] in drivers/virtio/virtio_ring.o (drivers/virtio/virtio_ring.c) [logspec:kbuild,kbuild.compiler.error]
> ---
> 
> - dashboard: https://d.kernelci.org/i/maestro:33d32f9f3fc65aa1a71269ee14bd5f37d938b6bc
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> - commit HEAD:  d7af19298454ed155f5cf67201a70f5cf836c842
> - tags: next-20250725
> 
> 
> Log excerpt:
> =====================================================
> drivers/virtio/virtio_ring.c:2113:40: error: variable 'id' is uninitialized when used here [-Werror,-Wuninitialized]
>  2113 |                 BAD_RING(vq, "id %u out of range\n", id);
>       |                                                      ^~
> drivers/virtio/virtio_ring.c:60:32: note: expanded from macro 'BAD_RING'
>    60 |                         "%s:"fmt, (_vq)->vq.name, ##args);      \
>       |                                                     ^~~~
> ./include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
>   154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
>       |                                                                        ^~~~~~~~~~~
> ./include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
>   110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
>       |                                     ^~~~~~~~~~~
> drivers/virtio/virtio_ring.c:2077:19: note: initialize the variable 'id' to silence this warning
>  2077 |         u16 last_used, id, last_used_idx;
>       |                          ^
>       |                           = 0
> 1 error generated.
> 
> =====================================================
> 
> 
> # Builds where the incident occurred:
> 
> ## x86_64_defconfig on (x86_64):
> - compiler: clang-17
> - dashboard: https://d.kernelci.org/build/maestro:6882f2ab2ce2c1874eede7df
> 
> ## x86_64_defconfig+kselftest+x86-board on (x86_64):
> - compiler: clang-17
> - dashboard: https://d.kernelci.org/build/maestro:6882f2b12ce2c1874eede7f3
> 
> 
> #kernelci issue maestro:33d32f9f3fc65aa1a71269ee14bd5f37d938b6bc
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> 
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
> 
> Made with love by the KernelCI team - https://kernelci.org
> 

-- 
~Randy


