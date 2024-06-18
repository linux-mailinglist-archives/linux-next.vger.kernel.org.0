Return-Path: <linux-next+bounces-2582-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E9690C930
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 13:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7D8E1C22FB4
	for <lists+linux-next@lfdr.de>; Tue, 18 Jun 2024 11:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5323013AD2B;
	Tue, 18 Jun 2024 10:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2s/lF3q"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C7F82D98;
	Tue, 18 Jun 2024 10:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706035; cv=none; b=ukSb6Yz9FQmaVGazjXAN2nyQS+tyZbD71Oqo+fgFiH1VAUdV0npoOVXRh6aXUdfXCQGc53jcS2bTyW0YpXmDjXrA7tfeU2CV0Ua8/PaiSiXZhJ7xqll8FohS15gF250zYOR+0nV88qXRs8PUN7eiCWPX/oK5O8mxJNGKoRAacFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706035; c=relaxed/simple;
	bh=G598/zYgeDb48W3w1AUQWTWeWTcURESV9nojdFo2cpk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SIezneR1FgjjddQxpTstachyYmSu1kqtuEYqy0VPQSIz7HVTU4BK2hPpLmagnvB6SITd38p99yY55w3BHEPsyQ6OEDTOINxcKUvAJ2vaRfhzibmBMwEYxCDVjs4/InuPn5/BfzbnKt29HYD12kTlpMc8/oDaxmQ1jnqGQohsWGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2s/lF3q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 671E7C3277B;
	Tue, 18 Jun 2024 10:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718706034;
	bh=G598/zYgeDb48W3w1AUQWTWeWTcURESV9nojdFo2cpk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=G2s/lF3qQTrgYdK1thaDDe22858xR7wa4zq03K1Etlh9RujRRuPWOv+lqnKF/Chk9
	 aTRoPgvxS2kEjpPUHeyW3FcaWh3s3UobeL/IoDP66WzISlryByEq/c4nSCxGvr4xpx
	 3B6YaP+4+hga3nbX7aM/ZZo7fR66I+ZogI/J4soApcXdhHJ/O8c5F8Mu7fCOmjY6E6
	 2u04lVuYDxHQWzz/Wu/RsFOFgV4Y0ZAD71PPr2MIknP4Ln7xdY+QVUlbydft6niIJk
	 iHqwSqO9zqW5yx5CC1N6HZdiokAOWwPj6FXKAlrfQjq6S/T0KbD93DAWXTTct75PH1
	 Nb6gsWDc7pAVA==
Message-ID: <be5a8b12-b042-48cc-9508-759a2a285a8b@kernel.org>
Date: Tue, 18 Jun 2024 12:20:31 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the mediatek tree
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@kernel.org>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Julien Panis <jpanis@baylibre.com>, Nicolas Pitre <npitre@baylibre.com>
References: <ZnBn-vSj-ssrJFr2@sirena.org.uk>
 <01f2ee94-f8b0-449c-aa19-3ee38a2e36a1@baylibre.com>
 <d87b7376-5ba2-4810-90cb-76648d4a8080@kernel.org>
Content-Language: en-US
In-Reply-To: <d87b7376-5ba2-4810-90cb-76648d4a8080@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 18/06/24 12:03, AngeloGioacchino Del Regno ha scritto:
> Il 18/06/24 09:49, Julien Panis ha scritto:
>> On 6/17/24 18:44, Mark Brown wrote:
>>> Hi all,
>>>
>>> After merging the mediatek tree, today's linux-next build (arm64
>>> defconfig) failed like this:
>>>
>>> /tmp/next/build/arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-display.dtsi:113.6-121.3: Warning (graph_port): /fragment@4/__overlay__: graph port node name should be 'port'
>>> Error: /tmp/next/build/arch/arm64/boot/dts/mediatek/mt8186.dtsi:2399.29-30 
>>> syntax error
>>> FATAL ERROR: Unable to parse input tree
>>> make[4]: *** [/tmp/next/build/scripts/Makefile.lib:431: 
>>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393216.dtb] Error 1
>>>
>>> Caused by commit
>>>
>>>    d7c1bde38bf37a5 ("arm64: dts: mediatek: mt8186: add default thermal zones")
>>>
>>> I have used the last version of the mediatek tree from 20240613 instead.
>>
>> Hello Mark,
>>
>> Here is the explanation:
>> https://lore.kernel.org/all/71d53ff6-fdae-440d-b60d-3ae6f0c881d9@baylibre.com/
>> https://lore.kernel.org/all/6d9e0f19-9851-4f23-a8b8-6acc82ae7a3d@baylibre.com/
>>
>> For some reason, the 2 first commits of the series were not applied
>> with the dts. These commits are needed because they contain some
>> definitions used by the dts.
>>
>> Julien
> 
> I'm not sure how should I proceed here.
> 

Reiterating, I'm sure how should I proceed.

I'm removing those patches from mediatek for-next until further notice.

Regards,
Angelo

> Only the mediatek tree is broken, linux-next is ok... should I pick the
> commits from next or should I remove the dts commits from the mediatek trees?
> 
> First time happening.... :-)
> 
> Regards,
> Angelo


