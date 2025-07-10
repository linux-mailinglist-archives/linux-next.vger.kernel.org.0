Return-Path: <linux-next+bounces-7457-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CDCAFFCAC
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 10:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 256051683AC
	for <lists+linux-next@lfdr.de>; Thu, 10 Jul 2025 08:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27F528BA86;
	Thu, 10 Jul 2025 08:44:14 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A94D86FC3;
	Thu, 10 Jul 2025 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752137054; cv=none; b=h4fsQJaPIlFxzKHYCUHqQHUNbNjE8VEMIrDvWcJTCF7Y8TzqajPoEzwWXIDXbWNtXJYW9GmXUsDTC3EBIzShawDCgZUDNjbPSTJlsExkYjfY2eXQR/fW8N/Lql8ujqk70+kaZlZgUh7neabmd7VVlDz7r0GzEo4Eno+1KMq88zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752137054; c=relaxed/simple;
	bh=YhSRhuxKLROI2NTRCx6TpQscIMdYxuJr5ktJPi+O3pI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d1CxnZyj/ThflBtmhXdLq0PfPpqbLh3U7JvfmWJVCz3wYM8LTPwi/0V1U4wvxNHg3xYJstuV1rV/4slYRQud2Q46P9lmnYUBQ7TGcQ+YQilV5g1V+RPnONq+t30HwxayYV7h3BdDYv1pFP/9ekb+Qop7TRytKxTitd/66orFVDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A24511EA6;
	Thu, 10 Jul 2025 01:44:00 -0700 (PDT)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2159A3F738;
	Thu, 10 Jul 2025 01:44:10 -0700 (PDT)
Message-ID: <c8c94357-8367-42b9-a817-f4ae3feacdf2@arm.com>
Date: Thu, 10 Jul 2025 09:44:09 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the bitmap tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Yury Norov <yury.norov@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250710183449.20e255b4@canb.auug.org.au>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250710183449.20e255b4@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stephen,

On 7/10/25 09:34, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the bitmap tree, today's linux-next build (arm64 defconfig)
> produced this warning:
> 
> arch/arm64/kvm/sys_regs.c: In function 'access_mdcr':
> arch/arm64/kvm/sys_regs.c:2654:17: warning: ignoring return value of 'u64_replace_bits' declared with attribute 'warn_unused_result' [-Wunused-result]
>   2654 |                 u64_replace_bits(val, hpmn, MDCR_EL2_HPMN);
>        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>    f66f9c3d09c1 ("bitfield: Ensure the return values of helper functions are checked")
> 

Sorry to have broken your tree. However, this is a valid warning and 
this misuse of u64_replace_bits() was the motivation for the commit.

The fix can be found here 
https://lore.kernel.org/kvmarm/20250709093808.920284-1-ben.horgan@arm.com/T/#mc9e47859302654d84b4f2b3d9032d2b595d5df49

Thanks,

Ben


