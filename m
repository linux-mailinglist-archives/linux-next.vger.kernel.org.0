Return-Path: <linux-next+bounces-5438-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60998A33D56
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 12:04:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A9CA3A9FFC
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2025 11:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0C0211A2B;
	Thu, 13 Feb 2025 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVe+lCnA"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DE120FA85;
	Thu, 13 Feb 2025 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739444605; cv=none; b=DEmPsZ126+7z00lwHxwBGwC2crKIWrLv67SzCVcaFO+QDYGFkXchMvtl8VBsfiSYoBba9mHEcs2/7eDAfo5fWJrGxNuAr3VM+5fFQU5Ruu//5PJuqRl5hLBqxtCYUAbl79sPo5mlIFehOUY9f/Khjkr+ogLef7oiLq4FmGHTKCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739444605; c=relaxed/simple;
	bh=9s7aSRbGX/70NO5cbe2p9exsZUHFQFdE8sWO+dGzVPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E0dVzatCPKyK17JzNONA7Yjvg2rnEi9sakZdwuBz10HXKCr6MyeG1VFU4dipZBYTOKhxOTqnth4/hKYhs2UHxVKZDBICQAgEHvMdvBvDzTfRPLz7lGDjYZj90UlKUPnvjhZsRnmg+OrlWxINEeQxVqpfD6wCbI9EFMO5sssFaVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVe+lCnA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3BCC4CED1;
	Thu, 13 Feb 2025 11:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739444605;
	bh=9s7aSRbGX/70NO5cbe2p9exsZUHFQFdE8sWO+dGzVPE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OVe+lCnA1SfSfU53WMigFl9qUEavqeoMb0xZ41AVkD8zykVeLwkXTUQJm01tY5RSJ
	 c7k/OA4jADQFGR+4Dh8zM0NuzHSweVXKC31MzIOPvOHaxEu9Oe5v0OOCH/NCkJb//y
	 FfwijvohAYHgg1CXuc0RNsPrMHfQJ8nnTpiLJ2Cuh4QiD7TPF+S6MNI0yn2sAVz0gl
	 lBv5A/riDacbijFFKh7VEi3eISYcJpGWo5eHd46wg6rawJiqXl72LUmMfptqlf9chW
	 GBELApb4A9DQBjRgNxuq9inetKwDDhflRMVITSnZcriRcZg6mFdDZEAvByJe1Tdnjv
	 VJ+FRBUsGYMUQ==
Message-ID: <94700d2b-f796-4a8f-ad87-d75c8eaf1e62@kernel.org>
Date: Thu, 13 Feb 2025 12:03:22 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the mediatek tree
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250213082522.52ca62e0@canb.auug.org.au>
 <9288348b-5792-4122-8705-76c00e463eae@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Content-Language: en-US
In-Reply-To: <9288348b-5792-4122-8705-76c00e463eae@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 13/02/25 09:56, Matthias Brugger ha scritto:
> 
> 
> On 12/02/2025 22:25, Stephen Rothwell wrote:
>> Hi all,
>>
>> In commit
>>
>>    c4d75a56d161 ("arm64: dts: mediatek: mt8188: Assign apll1 clock as parent to 
>> avoid hang")
>>
>> Fixes tag
>>
>>    Fixes: 4dbec3a59a71 ("arm64: dts: mediatek: mt8188: Add audio support")
>>
>> has these problem(s):
>>
>>    - Target SHA1 does not exist
>>
>> Maybe you meant
>>
>> Fixes: bd568ce198b8 ("arm64: dts: mediatek: mt8188: Add audio support")
>>
> 
> Yes, that seems correct.
> Angelo will you update v6.14-next/dts64 ?
> 
> Regards,
> Matthias

I have just fixed the issue and forcepushed both for-next and v6.14-next/dts64.

Many thanks! ...and sorry about the mistake.

Cheers,
Angelo

