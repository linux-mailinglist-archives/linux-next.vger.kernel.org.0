Return-Path: <linux-next+bounces-5743-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E86E5A5C3AF
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 15:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C4713B2628
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 14:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C42C25B688;
	Tue, 11 Mar 2025 14:21:53 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8053C25B68F;
	Tue, 11 Mar 2025 14:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741702913; cv=none; b=PNwc09HE7PhsbJMJX9hi1Km42zPBeOZJfhxnbI7kMxFokcUpRxY5t7pFEujwpl+3gwA3ofgCvlSDWu4VFXt4rBHAH1B9F0yIZRT0ONXfkHsXMW/tBB7L3WElZXJVd3Uu4bjJpjS3dwKgsqkpITn5LYFyVBvDkS5Kxp0oRKkR/s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741702913; c=relaxed/simple;
	bh=gnnxfXrI/j17ReBUFkKwGmj3BFF/0mbRExyDYdjISKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnBuYaB3o45xT7XiUrEZ/1QnRCr4nPKm1+M7OyfDmFvvldD2+R+NfLy4J4LNaqE8X/aGTosP9v4u9ULHY26oiNkVucH57ptEb+9vtW0Onq7Mj7QmxVYD6uORzzB7ba1r/f1hUWsY++4JyeUrGrb+tv9laBbCnsPLs5A0C4FT/BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C43DF1516;
	Tue, 11 Mar 2025 07:22:01 -0700 (PDT)
Received: from [10.119.37.172] (unknown [10.119.37.172])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 725473F694;
	Tue, 11 Mar 2025 07:21:50 -0700 (PDT)
Message-ID: <affd759b-d84a-4aaa-8de2-812558f1ff49@arm.com>
Date: Tue, 11 Mar 2025 09:21:49 -0500
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the tpmdd tree
To: Jarkko Sakkinen <jarkko@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250311210011.18b7ab80@canb.auug.org.au>
 <Z9AMEZw1dm80mwx0@kernel.org>
Content-Language: en-US
From: Stuart Yoder <stuart.yoder@arm.com>
In-Reply-To: <Z9AMEZw1dm80mwx0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/11/25 5:10 AM, Jarkko Sakkinen wrote:
> On Tue, Mar 11, 2025 at 09:00:11PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the tpmdd tree, today's linux-next build (htmldocs)
>> produced this warning:
>>
>> Documentation/security/tpm/tpm_ffa_crb.rst: WARNING: document isn't included in any toctree
>>
>> Introduced by commit
>>
>>    115be78c0bfe ("Documentation: tpm: add documentation for the CRB FF-A interface")
>>
>> -- 
>> Cheers,
>> Stephen Rothwell
> 
> Stuart, could you send a replacement patch and I'll repeal and replace?

Replacement patch is set.  I just sent v7 patch 5/5.  If you need me to
resend the entire series as v7 I'll do that.

Thanks!
Stuart

