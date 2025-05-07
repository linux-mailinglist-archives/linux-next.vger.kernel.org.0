Return-Path: <linux-next+bounces-6571-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0861BAADA82
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 10:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40A367B3959
	for <lists+linux-next@lfdr.de>; Wed,  7 May 2025 08:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7C01E3DFD;
	Wed,  7 May 2025 08:50:47 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E8751E3DF4;
	Wed,  7 May 2025 08:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746607847; cv=none; b=aWpFb1AZtQN0DXKYzFrpurzoOGk84BBu7HTP1YMFUp06eKfunZ7jeskqfFN16io/nn2YjziENLnYNsxFH6amEuLQrTxPL+sM+7V5fxI8GUOB8Ozt8dbPZqfyVFkIpgjEi9FpZiC9bZNglP5HLG64enC46chaVagNbWs+nlObPqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746607847; c=relaxed/simple;
	bh=9v35JP5AWFvbqrYHICqK8U4kWbOGSmqao+G2X9obDIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFX6QLiotwpSeTUNJ9G9AARAfS2MsZewDewfgEs6D8Oao7hzLol5xbiXw+/EJBaP8bwvzzDV1v54OcqOwv/fla2MLX2jktTUMsARE14+XeRjML6Qdj5XuquyMAhlLIkAj0Nll3PkPlB8zMKC3foAi4xezqxyyZY4pqW+ppGWavM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D3C92B;
	Wed,  7 May 2025 01:50:34 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBDEF3F5A1;
	Wed,  7 May 2025 01:50:43 -0700 (PDT)
Message-ID: <100b0d95-7f9a-45e6-8cfc-33d9951f954c@arm.com>
Date: Wed, 7 May 2025 09:50:42 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the coresight tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Leo Yan <leo.yan@arm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250507070547.4249c806@canb.auug.org.au>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250507070547.4249c806@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2025 22:05, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>    f42df204b53d ("coresight: replicator: Fix panic for clearing claim tag")
> 
> Fixes tag
> 
>    Fixes: 6f4c6f70575f ("coresight: Clear self hosted claim tag on probe")
> 
> has these problem(s):
> 
>    - Target SHA1 does not exist
> 
> Maybe you meant
> 
> Fixes: 7cd6368657f1 ("coresight: Clear self hosted claim tag on probe")
> 


Indeed, thanks for catching. I have now fixed this up.

https://git.kernel.org/coresight/c/deeeaf6a5221

Suzuki

