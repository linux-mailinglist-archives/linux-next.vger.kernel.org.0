Return-Path: <linux-next+bounces-4942-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B9D9ECBBC
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2024 13:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BE91168325
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2024 12:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3B0209660;
	Wed, 11 Dec 2024 12:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p+1j6WHK"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374CC238E2A;
	Wed, 11 Dec 2024 12:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733918797; cv=none; b=gMIyH2SDBMLsDSNzyU/vqlOXbBjGQc8nT88+B1roA1Jstm8uu3GGLpz50rt4SaZvykX4HN+MDwBIoO+R35geOaGL9iTy0Z+ptOLn4rKEFS8Z4/MBb3bt73XIxh91dvdz2X5jQCOh9xBAqigJ2PXmWBPoYrLcq85jGqDkI2k8+Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733918797; c=relaxed/simple;
	bh=URHkU87kc3SnecwGaVrovMnEpPnArukzBkxsCWKks/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBMaSmwCRvDWk9aPq5H7NKFFKcwZvOCQJkzybLtCdOvMKcHvSyCwFnqckEUFdNK64XbfpSMJI+oJNlOsTe0RNF8bfmc6bvOM8KB9vXgSPsa4GANU536RFg6uMmnVYsRyr9iZMZubTjFUD64bBbNTDB7PiaUH4pccXukLWHUoKWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p+1j6WHK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CB3C4CED2;
	Wed, 11 Dec 2024 12:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733918796;
	bh=URHkU87kc3SnecwGaVrovMnEpPnArukzBkxsCWKks/4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p+1j6WHKXt6208ircTn/scVv4le3ox79hEv1y7oSS7A8/3Oq4EUdK+b2EeiiI4Mrh
	 0yeYNmPc0ZLTb/m/vPAf0iYplB3TCUaKfnJELbYfpbCSqRvqPNNnvvOFrZ3WXUZrlP
	 SG/6JRCE0ueMgEW8dvfxByFEsmRknMDXj3ikVSw49uAYZx3rABve1OTsnNvMP3+MJX
	 cHb6W2XtQgVwn29GAULHMyhR3rWdArCRSSArb4TlLbCnV0wpoBUSaNqfTfc8qadwln
	 LebvVMquVkffowk9fP5G4TVq2gIqr3afa4Qws1gvv5yyTfAJpaNLZgNtmKUsc4+65i
	 bmB9FPyjd02aA==
Message-ID: <6aa70be5-59d0-4441-9432-79cb87fdd915@kernel.org>
Date: Wed, 11 Dec 2024 17:36:32 +0530
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the dmaengine
 tree
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>,
 Vinod Koul <vkoul@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241209075036.055e0729@canb.auug.org.au>
 <Z1hzMRuORVOQvKLW@vaman> <2e61add7-8e72-4ef4-b696-8bb5c0e83d01@prolan.hu>
Content-Language: en-US
From: Vinod Koul <vkoul@kernel.org>
In-Reply-To: <2e61add7-8e72-4ef4-b696-8bb5c0e83d01@prolan.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/12/24 14:39, Csókás Bence wrote:
> Hi,
> 
> On 2024. 12. 10. 17:58, Vinod Koul wrote:
>> On 09-12-24, 07:50, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> Commit
>>>
>>>    1ad2ebf3be83 ("dt-bindings: dmaengine: Add Allwinner suniv F1C100s 
>>> DMA")
>>>
>>> is missing a Signed-off-by from its author.
>>>
>>> Scripting confused by the comma in the origin SoB line?
>>
>> Yes I guess so, checked again yes b4 seems to eat it up
>>
>>>
>>> Also, please keep all the commit message tags together at the end of
>>> the commit message.
>>
>> Again scripting is going bonkers here
>>
>> I have fixed it up now
>>
> 
> Still broken in these:
> 
> commit eeca1b601381 ("dma-engine: sun4i: Add a quirk to support 
> different chips")
> commit 1f738d0c2f67 ("dma-engine: sun4i: Add has_reset option to quirk")

Fixed all.. looks like all patches from you have this issue :-(

-- 
~Vinod


