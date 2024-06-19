Return-Path: <linux-next+bounces-2597-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A60A90E4BA
	for <lists+linux-next@lfdr.de>; Wed, 19 Jun 2024 09:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E3591C21DF8
	for <lists+linux-next@lfdr.de>; Wed, 19 Jun 2024 07:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA0B770E8;
	Wed, 19 Jun 2024 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqCGOksC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B92770E7;
	Wed, 19 Jun 2024 07:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718782831; cv=none; b=JoCnCUf9ntmbakCbmmKGNR271PiM4+3wWQerl8TBt+OpQ2WOwtWYCnZeoNZLhmauGgCyNUwSKGORWI8YHYo1GTILnsVhUs6FwRL6nfmliqLdMNWaSJ2YmpYCZfDqY8hhRVi7tpe6FZouV0UrIo2LxFPKJzDvtQzRESX33d8aFFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718782831; c=relaxed/simple;
	bh=aWm2Zn/yfgkVk8K8GvJUjzKZiA6iKLuYwUOr0Zn0WXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axCOHomRyY+11Hur0QaCH7eHNn/xiJgyj4rk1W6i/Ld1efcQ6xpY8ylT7pC9AI4Xd1YxMAbkr7qUSiBxgYMAhV7IttTjivRWicH9DOnQ7Iw9cmSI38uHWK7U7/uBqtKAGirkGkf71SUG19fCd5zE+5CkDIEClHjuOoO0iMC4G8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqCGOksC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9A8C32786;
	Wed, 19 Jun 2024 07:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718782831;
	bh=aWm2Zn/yfgkVk8K8GvJUjzKZiA6iKLuYwUOr0Zn0WXM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YqCGOksCjbMPmB8GsElxBtcwcCQPRiW3iRocOO2ivqrwETXd4j7td50Xq9yl5+uKD
	 4PilYSrUTRTeArfaeo3HYH/1DGA0VgFqB7GgRRxwevYo+hx6p9mYVDrL49eD/W7uyw
	 MfPXti8HPqVwm+QSFG6gHtLBYBwQHBJynHMzMVF7FzMy0Zebv9xSLfSkFRrGaCOvBn
	 Fcm/fJ0Z1k+9eDg/F/tsbMOuBAJ+07N6Pr+aq69P/GL/NUrjGmvCB/UTaGJc1YUqxH
	 18Fqno+pDWH2xIYja1AlcQRsov7t0Es8nYxBW+wjLhQA96+n3iMC2w9VI7DHhtRZRi
	 q0eC6U4aExtUQ==
Message-ID: <ebd65254-c0bb-4c07-810a-e46ba7e0b929@kernel.org>
Date: Wed, 19 Jun 2024 09:40:27 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the mediatek tree
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Julien Panis <jpanis@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Nicolas Pitre <npitre@baylibre.com>
References: <ZnBn-vSj-ssrJFr2@sirena.org.uk>
 <01f2ee94-f8b0-449c-aa19-3ee38a2e36a1@baylibre.com>
 <d87b7376-5ba2-4810-90cb-76648d4a8080@kernel.org>
 <be5a8b12-b042-48cc-9508-759a2a285a8b@kernel.org>
 <99b7f55f-2909-450f-88ce-8cbe8f41c7f8@baylibre.com>
 <9674d79f-83c0-44bf-bcf0-e78f8bdbfbd3@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
Content-Language: en-US
In-Reply-To: <9674d79f-83c0-44bf-bcf0-e78f8bdbfbd3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 18/06/24 20:03, Daniel Lezcano ha scritto:
> On 18/06/2024 18:45, Julien Panis wrote:
>> On 6/18/24 12:20, AngeloGioacchino Del Regno wrote:
>>> Il 18/06/24 12:03, AngeloGioacchino Del Regno ha scritto:
>>>> Il 18/06/24 09:49, Julien Panis ha scritto:
>>>>> On 6/17/24 18:44, Mark Brown wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> After merging the mediatek tree, today's linux-next build (arm64
>>>>>> defconfig) failed like this:
>>>>>>
>>>>>> /tmp/next/build/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-display.dtsi:113.6-121.3: Warning (graph_port): /fragment@4/__overlay__: graph port node name should be 'port'
>>>>>> Error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8186.dtsi:2399.29-30 
>>>>>> syntax error
>>>>>> FATAL ERROR: Unable to parse input tree
>>>>>> make[4]: *** [/tmp/next/build/scripts/Makefile.lib:431: 
>>>>>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb] Error 1
>>>>>>
>>>>>> Caused by commit
>>>>>>
>>>>>>    d7c1bde38bf37a5 ("arm64: dts: mediatek: mt8186: add default thermal zones")
>>>>>>
>>>>>> I have used the last version of the mediatek tree from 20240613 instead.
>>>>>
>>>>> Hello Mark,
>>>>>
>>>>> Here is the explanation:
>>>>> https://lore.kernel.org/all/71d53ff6-fdae-440d-b60d-3ae6f0c881d9@baylibre.com/
>>>>> https://lore.kernel.org/all/6d9e0f19-9851-4f23-a8b8-6acc82ae7a3d@baylibre.com/
>>>>>
>>>>> For some reason, the 2 first commits of the series were not applied
>>>>> with the dts. These commits are needed because they contain some
>>>>> definitions used by the dts.
>>>>>
>>>>> Julien
>>>>
>>>> I'm not sure how should I proceed here.
>>>>
>>>
>>> Reiterating, I'm sure how should I proceed.
>>>
>>> I'm removing those patches from mediatek for-next until further notice.
>>>
>>> Regards,
>>> Angelo
>>
>> Just for my information: Should we just wait for another maintainer
>> to pick the 2 missing patches ? Who is in charge of doing it ?
> 
> I've picked the 2 first patches but they are going through the validation process 
> through our CI. They will be available in a couple of days in linux-next.
> 
> If you want me to drop them and let them go through the Mediatek tree, just let me 
> know.
> 

Thanks but no, thanks :-)

Please, keep them in the thermal trees where they belong.
I will adjust accordingly.

Cheers,
Angelo

