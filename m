Return-Path: <linux-next+bounces-8900-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F5DC42592
	for <lists+linux-next@lfdr.de>; Sat, 08 Nov 2025 04:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C34D53A07B0
	for <lists+linux-next@lfdr.de>; Sat,  8 Nov 2025 03:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97FF27B353;
	Sat,  8 Nov 2025 03:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Fgeyepys"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A008B2D061D;
	Sat,  8 Nov 2025 03:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762571515; cv=none; b=odtQpMYN4bfaDf9YdFJQAPWLP2hsJgazHcKcsc+xEvdiz1ekOx1xZ/F30kTFW/YULv70GF8PyMTxnit0zH5yIRcySw5KvmZeeckM1z94f8mB1IbMypzqbqjM2500kzjl8boNVEBwKVo87rsZPEeSALV0Txt9gNTLuXN/xUZLr0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762571515; c=relaxed/simple;
	bh=KwBm3CuWFonyxdteWe4qUpDdFRGos477BmUdFE8Sqa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvsdAhVf2PKr2RC7FIktDAzjFTeW2wmoHT59L6VExW5IJwG/cVQNgOdhjEIfIC/tYJfsy7jGv68gOx60DSbFvK7H3u8IPvz/GStjrhwK42B2LUNsIrEUDPhXZpFOllklEzFrFb92HsZikmDIdU5SUauOy8PSv3eaBTdlrD6FVmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Fgeyepys; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=AUhKXEzeGCikYXmExWl1kA2dGxV0NSVJEQeamA4bzzI=; b=FgeyepysRo2+ivQN6pbAOkkyLB
	55OcFUQizzTJb41eysAF8l7hdmplgV7cz1+OfD4+V546hgTQqQvFbDPRtSpjyAY+NOmx19OYpT5yD
	Ifc4YNyvoUaa1UuFXFbfeDwHHgKH/5km5RXaOAAR/170uJx3kZ8qsmPeBEdyqPr7ZsGQf3clkF8y2
	v4pbI7rlJeshXdEd7GeAkE09eieLd5UFrOr1heEP6TeaUNruvg1ahPI5YXnDjV4ucfSJcmd2ts4lD
	wRhfV2bC+mPS812WMUN2igMzhUb2uReGvsmWkWgu6i5J/qf8pcqtpSb3ereZ4SzCoduZIArPeGkG+
	oPmlykdA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHZMk-00000002GYP-3Jce;
	Sat, 08 Nov 2025 03:11:50 +0000
Message-ID: <c13574f7-b13c-42e0-9b35-a2acb594af33@infradead.org>
Date: Fri, 7 Nov 2025 19:11:49 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BREGRESSION=5D_next/master=3A_=28build=29_implici?=
 =?UTF-8?Q?t_declaration_of_function_=E2=80=98topology=5Fcore=5Fhas=5Fsmt?=
 =?UTF-8?B?4oCZOyBkaWQgeW91IC4uLg==?=
To: kernelci@lists.linux.dev, kernelci-results@groups.io,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-perf-users@vger.kernel.org, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
References: <176225394342.3644.6412596085150396269@efdf33580483>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <176225394342.3644.6412596085150396269@efdf33580483>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

[verified still present in linux-next 20251107]
[adding CCs]


On 11/4/25 2:59 AM, KernelCI bot wrote:
> 
> 
> 
> 
> Hello,
> 
> New build issue found on next/master:
> 
> ---
>  implicit declaration of function ‘topology_core_has_smt’; did you mean ‘topology_core_cpumask’? [-Werror=implicit-function-declaration] in drivers/perf/arm_pmu.o (drivers/perf/arm_pmu.c) [logspec:kbuild,kbuild.compiler.error]
> ---
> 
> - dashboard: https://d.kernelci.org/i/maestro:b25c03bf6acc100aaa7e71de7eb2cb32868b54f5
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> - commit HEAD:  17490bd0527f59d841168457b245581f314b5fa0
> - tags: next-20251104
> 
> 
> Log excerpt:
> =====================================================
> drivers/perf/arm_pmu.c:935:24: error: implicit declaration of function ‘topology_core_has_smt’; did you mean ‘topology_core_cpumask’? [-Werror=implicit-function-declaration]
>   935 |         pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
>       |                        ^~~~~~~~~~~~~~~~~~~~~
>       |                        topology_core_cpumask
>   CC      drivers/iio/adc/bcm_iproc_adc.o
>   CC      drivers/devfreq/governor_simpleondemand.o
>   CC      drivers/memory/tegra/tegra124.o
>   CC      drivers/memory/brcmstb_dpfe.o
> cc1: some warnings being treated as errors
>   CC      drivers/memory/tegra/tegra20-emc.o
> 
> =====================================================
> 
> 
> # Builds where the incident occurred:
> 
> ## multi_v7_defconfig+CONFIG_SMP=n on (arm):
> - compiler: gcc-12
> - config: https://files.kernelci.org/kbuild-gcc-12-arm-SMP-6909cb01f21f07610dca0839/.config
> - dashboard: https://d.kernelci.org/build/maestro:6909cb01f21f07610dca0839
> 
> 
> #kernelci issue maestro:b25c03bf6acc100aaa7e71de7eb2cb32868b54f5
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


