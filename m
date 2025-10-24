Return-Path: <linux-next+bounces-8706-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A98CC07EFE
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 21:40:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6489403A08
	for <lists+linux-next@lfdr.de>; Fri, 24 Oct 2025 19:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468302C0295;
	Fri, 24 Oct 2025 19:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="04vqXd1Y"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D522BEFF2;
	Fri, 24 Oct 2025 19:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761334814; cv=none; b=behdY0tndfZEnAek9VlXsvHKdaeGxh1al67wvpsGtbZVVgqlVzxcnfo1YbUzD80zOqzaQwK1az/7/luHq6II3CrQISBqccpEtwiueIOBoPyJQYcyMt1+1lqJtv9BIc2NwkRBC9LOd/H+BOx5D1OUKew7Vb7lDszT4zE8RAILnkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761334814; c=relaxed/simple;
	bh=KqG7p7t8pC5fYI9Ufj2DR+0Pm2mjEirzVOVyi6V86PA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mYfFbJt9T9L0qrHstKd0dVxS+AWGT2LmQkHGikEop+DlHm24sSnNYITBUv+uq62BYPXbB+hMhJzLxmbaQaZgTlyx8PWE6pJ4JSSA+g6n8CH9gKzdNQeyNR2RTq/zIFy0VId3nc/jc6ffcrnta4nDm1ZRe3iPxBRcghFT3PgJG9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=04vqXd1Y; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=uLk8bdtMqsV7oWpqvE9Mv8uHkZynst+/Fi2JnIEmRq0=; b=04vqXd1YmTt4ZD8SAU0zdrLFn2
	rnH5Qp6ajmvxGwbxwen/x4vj2smm10ZGnOwGQRVy2/U47S3bSg5dABNKbrXl9gvftOxbSLf6UQz3V
	6mAMtvGJVLIOnZ2WWCj/lXPePUeAbUu8vufWphYtRRkcp0TpEcK0s+x/sO/48jtmJlN6FoTXRRw5G
	/aww4PKWsxtXilJWi+DXxxGAiGETy3rqxaD22DtaMqV7Ws9d5vf0sN3Y9Ue9/RKL8QCGGsEeYAaf4
	AJh75v4LSH0jVG+dsp2uIdhYnKvL6WzD1w2PxjBRuMMjmfKJ6BD8Ojoy6ZFOVLfT016M5ssOfrTtg
	mbq8UB8A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNdw-0000000AOHR-2hNl;
	Fri, 24 Oct 2025 19:40:08 +0000
Message-ID: <b436e795-188a-4b62-95f5-1b11d2d10c77@infradead.org>
Date: Fri, 24 Oct 2025 12:40:07 -0700
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warning after merge of the sound-asoc tree
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: Jinmei Wei <weijinmei@linux.spacemit.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251022141705.714b19b5@canb.auug.org.au>
 <D5657B8E8DB8995E+aPt-p1EXhoFLm9aW@troy-wujie14pro-arch>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <D5657B8E8DB8995E+aPt-p1EXhoFLm9aW@troy-wujie14pro-arch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/24/25 6:27 AM, Troy Mitchell wrote:
> On Wed, Oct 22, 2025 at 02:17:05PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the sound-asoc tree, today's linux-next build (powercp
>> allyesconfig) produced this warning:
>>
>> WARNING: unmet direct dependencies detected for DMA_CMA
>>   Depends on [n]: HAVE_DMA_CONTIGUOUS [=n] && CMA [=y]
>>   Selected by [y]:
>>   - SND_SOC_K1_I2S [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (COMPILE_TEST [=y] || ARCH_SPACEMIT) && HAVE_CLK [=y]
>>
>> Probably introduced by commit
>>
>>   fce217449075 ("ASoC: spacemit: add i2s support for K1 SoC")
> Sorry, I didn't realize that this email ended up in my spam folder,
> and I just saw it today.
> 
> I am considering directly selecting `HAVE_DMA_CONTIGUOUS`,
> but another possibility is to make it depend on `DMA_CMA`.
> Can anyone advise which approach would be better?
> If there are no objections, I plan to send a patch on Monday:
> select `HAVE_DMA_CONTIGUOUS`

Hi,

My read of how HAVE_DMA_CONTIGUOUS is used is that an arch or
platform selects it to show that it has this capability.
Drivers don't do that.

Possibly ARCH_SPACEMIT should select HAVE_CONTIGUOUS_DMA but that
wouldn't help here since this is COMPILE_TEST=y, which did
its job here.

I think this driver should
	depend on DMA_CMA
That will take care of being dependent on both CMA and
HAVE_CONTIGUOUS_DMA.

Or IF the driver can operate without DMA_CMA being enabled,
the driver Kconfig could do
	select DMA_CMA if HAVE_DMA_CONTIGUOUS && CMA
and then have alternate code paths for whatever is
enabled.

This driver could
	select CMA if MMU

or it could do
	depends on MMU
	depends on HAVE_CONTIGUOUS_DMA
	select CMA

but
	depends on DMA_CMA
wraps all of driver dependencies into one statement.
But no, not
	select HAVE_CONTIGUOUS_DMA

-- 
~Randy


