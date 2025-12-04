Return-Path: <linux-next+bounces-9323-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79840CA240C
	for <lists+linux-next@lfdr.de>; Thu, 04 Dec 2025 04:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD405303BE10
	for <lists+linux-next@lfdr.de>; Thu,  4 Dec 2025 03:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C4A2550D4;
	Thu,  4 Dec 2025 03:26:02 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1B0145B16;
	Thu,  4 Dec 2025 03:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764818762; cv=none; b=BYpCMB5UB1xuSfgauP8AL/ShFDwlkXUrLr8bNFOewT1KrIM+B1mImHP2Fs34LxOm6TYb5fz7eQngrP7eCBLI4tiOat9bwHZIcPPDhDjOKo3QtvjC9ZOiTSt1HgK+C8iHoqUbnZaPTeV1kXGRcL/b+iq8FIMnkq7i1S8Ti7MwTc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764818762; c=relaxed/simple;
	bh=9eyvSf8orufgCR6SqERFdmiWiag0nSAM0VBJHEqL5jA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ojtoA2ru5P/BAuNmfdRGSKPA4h6GvnnOcnw2tifclNcLiDdaiZliTZQ0PJv+bFAsTHgS1qNvCyUZ1R/7Z2WYDe51eLaKs2mEWHz/ZG5pW+xFpri3KmAdm/x1VxmkhGRSk8sjHw0XNMxErUqzz77Wd8KnNnENgMEcUZTjIbE8i0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A584339;
	Wed,  3 Dec 2025 19:25:52 -0800 (PST)
Received: from [10.164.18.78] (unknown [10.164.18.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33B753F59E;
	Wed,  3 Dec 2025 19:25:56 -0800 (PST)
Message-ID: <90164a38-2aa5-4d3d-85b3-29a9a8b6d9b7@arm.com>
Date: Thu, 4 Dec 2025 08:55:54 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the arm64 tree with the mm-unstable
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Cc: Andrew Morton" <akpm@linux-foundation.org>
Cc: Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251114112144.366698c7@canb.auug.org.au>
 <20251204130051.30f0604b@canb.auug.org.au>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251204130051.30f0604b@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 04/12/25 7:30 AM, Stephen Rothwell wrote:
> Hi all,
> 
> On Fri, 14 Nov 2025 11:21:44 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the arm64 tree got a conflict in:
>>
>>   arch/arm64/mm/mmu.c
>>
>> between commit:
>>
>>   2b9cdb805fcd ("mm: make INVALID_PHYS_ADDR a generic macro")
>>
>> from the mm-unstable tree and commit:
>>
>>   bfc184cb1ba7 ("arm64/mm: Allow __create_pgd_mapping() to propagate pgtable_alloc() errors")
>>
>> from the arm64 tree.
>>
>> I fixed it up (the latter moved the INVALID_PHYS_ADDR define so I removed
>> it from its new place, and there was no conflict left) and can carry the
>> fix as necessary. This is now fixed as far as linux-next is concerned,
>> but any non trivial conflicts should be mentioned to your upstream
>> maintainer when your tree is submitted for merging.  You may also want
>> to consider cooperating with the maintainer of the conflicting tree to
>> minimise any particularly complex conflicts.
> 
> This is now a conflict between the mm-stable tree and Linus' tree.

Should this be rebased against Linus's tree in mm-stable first before the pull request ?


