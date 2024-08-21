Return-Path: <linux-next+bounces-3377-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0DC959354
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 05:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 594AE282487
	for <lists+linux-next@lfdr.de>; Wed, 21 Aug 2024 03:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1035214C587;
	Wed, 21 Aug 2024 03:28:03 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4763FD4;
	Wed, 21 Aug 2024 03:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724210883; cv=none; b=bMZyVmEpH+c1KaoDW5ufiNf6ymzCQ3cVEhBrjIlKdQTm3J+wYeVJT50CRQFDMuFMW13tEQW/h9ppW/f3OElN0tLISzj7TlwIuLexbM2wxbulpopoy7uYrYhIH8b8GgUFW6xIfgx/kksqA1dEgyxiywfa0yRjAuvZ24vgUlx7VlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724210883; c=relaxed/simple;
	bh=mPbh7uvNfwYVv80IHNN+Lu4uMCiJTIi/Nbx9mSwKh44=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bFg6CpWOAzg+tURYx9AN2Ct7aACqxij0+ZZoxOM0ipPYs+8k8nwDZP6qF1HCiLftdXtaKV3Tx6I/j0RP6b/LA0Weg3Rvyq7MSLBzoxTNuVMVWCvF8Qpr+RCjOdbfe4gO7nnhv1oRk0MfCAvaB3gKFAYnBLQ5Yyba2g0mnNPiWHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WpWqy01wRz20l3K;
	Wed, 21 Aug 2024 11:23:10 +0800 (CST)
Received: from kwepemg500010.china.huawei.com (unknown [7.202.181.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 519781A016C;
	Wed, 21 Aug 2024 11:27:51 +0800 (CST)
Received: from [10.67.109.211] (10.67.109.211) by
 kwepemg500010.china.huawei.com (7.202.181.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 21 Aug 2024 11:27:50 +0800
Message-ID: <368ca167-5f57-4fb4-9208-0016e7e7a6d5@huawei.com>
Date: Wed, 21 Aug 2024 11:27:50 +0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the arm tree
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>, Russell King
	<linux@armlinux.org.uk>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
References: <20240821093623.5928f361@canb.auug.org.au>
From: "liuyuntao (F)" <liuyuntao12@huawei.com>
In-Reply-To: <20240821093623.5928f361@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg500010.china.huawei.com (7.202.181.71)

After removing the '(' and  ')', kernel builds well.
The website(https://www.armlinux.org.uk/) is currently inaccessible,
i will submit new patch to Russell's patch tracker when it is ok.

> +#ifdef CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION
> +#define RELOC_TEXT_NONE (.reloc  .text, R_ARM_NONE, .)
> +#else
> +#define RELOC_TEXT_NONE
> +#endif
> +



On 2024/8/21 7:36, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the arm tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> arch/arm/kernel/entry-armv.S: Assembler messages:
> arch/arm/kernel/entry-armv.S:1074: Error: junk at end of line, first unrecognized character is `('
> arch/arm/kernel/entry-armv.S:1088: Error: junk at end of line, first unrecognized character is `('
> arch/arm/kernel/entry-armv.S:1101: Error: junk at end of line, first unrecognized character is `('
> 
> Caused by commit
> 
>    471fc0d32ab5 ("ARM: 9413/1: Fix build issue with LD_DEAD_CODE_DATA_ELIMINATION")
> 
> I have used the arm tree from next-20240820 for today.
> 

