Return-Path: <linux-next+bounces-8462-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0089B98155
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 04:37:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 034C41B20698
	for <lists+linux-next@lfdr.de>; Wed, 24 Sep 2025 02:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB221E5206;
	Wed, 24 Sep 2025 02:37:24 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE65F7A13A;
	Wed, 24 Sep 2025 02:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758681444; cv=none; b=kTRIiVSNBzCh5p4jbQU8sq2OwAthUW3vTFuKF6eA0KnDPy6l5rKqBeyNEUN8oZCXVHTQlFTARD/ik1skgGtE2tjr1ScwUPMcAxIfuPoUR9rbI4KTz/rYpLziNk0YiiVKTxh1RtMKvbK/MezpcktwbMTv+UsovFbLA6Kc7haNc60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758681444; c=relaxed/simple;
	bh=bIQw0nBSsyOMdhh4+Zz9MWL34Yvwhow8hKpQvTpVbpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AA2d+fSB6wST3nugRWOaKHqxk2/+XpDME/ZWXrGc1OkkCeRP8hzbPVlvxoUkVwHyKd5LrDTAEos6NzrNJhSksS8y6SlDmelKmGSfQll2hhAyuaD7v+EmNBdA4166VSWefyN9nE5jDLzHZYo6ozfwHzXEdPHTS+W3Ml7zm0k92W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8911106F;
	Tue, 23 Sep 2025 19:37:12 -0700 (PDT)
Received: from [10.164.18.47] (unknown [10.164.18.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFEAD3F694;
	Tue, 23 Sep 2025 19:37:18 -0700 (PDT)
Message-ID: <d36c9908-f314-414f-99d8-31440696c06b@arm.com>
Date: Wed, 24 Sep 2025 08:07:16 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the kvm-arm tree
To: Will Deacon <will@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <aNK8hSSKKZhEHZbt@finisterre.sirena.org.uk>
 <aNLEem8ryBiqKfDr@willie-the-truck> <aNLOiRB_HeUAnFKI@willie-the-truck>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <aNLOiRB_HeUAnFKI@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 23/09/25 10:14 PM, Will Deacon wrote:
> On Tue, Sep 23, 2025 at 05:02:02PM +0100, Will Deacon wrote:
>> On Tue, Sep 23, 2025 at 05:28:05PM +0200, Mark Brown wrote:
>>> After merging the kvm-arm tree, today's linux-next build (arm64
>>> defconfig) failed like this:
>>>
>>> In file included from <command-line>:
>>> /tmp/next/build/arch/arm64/kvm/at.c: In function 'setup_s1_walk':
>>> /tmp/next/build/arch/arm64/kvm/at.c:229:30: error: 'TCR_SH1_MASK' undeclared (first use in this function); did you mean 'TCR_SH0_MASK'?
>>>   229 |                    FIELD_GET(TCR_SH1_MASK, tcr) :
>>>       |                              ^~~~~~~~~~~~
>>
>> [...]
>>
>>> Caused by commit
>>>
>>>    4f91624778b27 ("arm64/sysreg: Replace TCR_EL1 field macros")
>>>
>>> from the arm64 tree.  I have reverted that commit.
>>
>> Thanks, I'll drop it from arm64 as well.
> 
> (now dropped)

Hello Will/Mark,

The conflict happened as the commit c0cc438046ee (“KVM: arm64: Compute shareability for LPA2”)
which came in via the KVM tree, added a new TCR_SH1_MASK instance. Shall I respin the patches
accommodating the new changes from KVM or just wait for the next merge window ?

- Anshuman



