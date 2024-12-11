Return-Path: <linux-next+bounces-4940-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1021A9EC87C
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2024 10:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49EAA286C41
	for <lists+linux-next@lfdr.de>; Wed, 11 Dec 2024 09:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC222210E4;
	Wed, 11 Dec 2024 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="O6BQweN1"
X-Original-To: linux-next@vger.kernel.org
Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD232210DF;
	Wed, 11 Dec 2024 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733908182; cv=none; b=pESoQ1NGvTS36dnEKA2sTu+U15A4VabxsKFqrhygU4BfUmBKpAgIPw6Ybh3Zcu8E6o9O191It645X9NI1NkS/Zm9q7eJnlxllXry9roWuKQGqZ5bRcWnyc1r7xkkW4LfibyNEJBYrCgcDY6Fg1KozxGdkECQJJnzn1rHxow5JrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733908182; c=relaxed/simple;
	bh=GrcM3ijr1YJaugRX/YZaBRAi26Voavni1D6ZneGWyD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=g3xUQNwbAeuPElOjb9Ge1bnAGNl0wiSLPsyIrMJYmr/H9DrpzloHYKVfqOiK9trs8lPTYmRd9CwAWZDibS1yjmS2At3vhO54RYDogEomfGzw4O98ceqDnF5nSoWJx860M9SSD+9CMJE9gchUOtv5CbCINnZwDV6kkLyARrWahKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=O6BQweN1; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 6278CA0788;
	Wed, 11 Dec 2024 10:09:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=sj38z4dgdwT7fdiU77z2
	qi8dSAhvaQf6WJZny2MW7JQ=; b=O6BQweN1RzG6r8MkluDgmqYa/yhXD/6Dh74T
	/or7DLn3zkX4RzppNexBRAkqQQ3P0Fzew/odqHsGOgtiF3yX+FMIXASCG8bt1oKg
	zqXs9dSBABLtgLDtbla2AAxF1Jp15ZYhBFY2r7pUZpaIvmVoKKxUWH0g98bY/Pyr
	BzOobus+ct3KhP5dlhzBKxGrxWaxFALBq0WU++S0X8qWntCmn90IaFEqhcU7eUNe
	1AV8b3+lOUvsn5JLqgtt22YrTGlq5KaNe2HI0hjkBh/wgcZ5Yoc2Zy7YUl7QQi0+
	Xr4ERADZeou6XlCFy0a3+8marZOL0UwXa0UIWas3J5OWmzFYEKMsQzxEff+hQANs
	WviVzEyAfhmihX9G7Y4f1UJUvUgsrXeHTfZdQT6M9uMKiEf5qDdpyDHoul3k8MpP
	GoPHrblNQtI3NTMvWubEex0iExmTu4x6iijCfN3ENs+nR07Qa2I6QILw4kMCPkqY
	ldPGpfPAxFvSu+GHEHscB2nyRwpNEmh7KcpUVgUqbRAjOmWa1Bhyrr62f/2HzeLl
	IV9FnHNqVMOe3RshrpyEatU3FAicyDfE198N8lOGw9FmTKOam8fNuYyg5TsKQXHt
	TvJuX/R5VPjsQYL7ougaf4vBDH5/sUDbpFGXwii3o+v+GcCEV+2J6C/kBthioAKI
	Yb9tbRc=
Message-ID: <2e61add7-8e72-4ef4-b696-8bb5c0e83d01@prolan.hu>
Date: Wed, 11 Dec 2024 10:09:28 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Signed-off-by missing for commit in the dmaengine
 tree
To: Vinod Koul <vkoul@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Linux Next
 Mailing List" <linux-next@vger.kernel.org>
References: <20241209075036.055e0729@canb.auug.org.au>
 <Z1hzMRuORVOQvKLW@vaman>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <Z1hzMRuORVOQvKLW@vaman>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855627263

Hi,

On 2024. 12. 10. 17:58, Vinod Koul wrote:
> On 09-12-24, 07:50, Stephen Rothwell wrote:
>> Hi all,
>>
>> Commit
>>
>>    1ad2ebf3be83 ("dt-bindings: dmaengine: Add Allwinner suniv F1C100s DMA")
>>
>> is missing a Signed-off-by from its author.
>>
>> Scripting confused by the comma in the origin SoB line?
> 
> Yes I guess so, checked again yes b4 seems to eat it up
> 
>>
>> Also, please keep all the commit message tags together at the end of
>> the commit message.
> 
> Again scripting is going bonkers here
> 
> I have fixed it up now
> 

Still broken in these:

commit eeca1b601381 ("dma-engine: sun4i: Add a quirk to support 
different chips")
commit 1f738d0c2f67 ("dma-engine: sun4i: Add has_reset option to quirk")

Bence


