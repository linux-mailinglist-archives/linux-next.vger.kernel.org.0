Return-Path: <linux-next+bounces-8017-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3698FB2C66F
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 16:01:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4295E1893D7E
	for <lists+linux-next@lfdr.de>; Tue, 19 Aug 2025 13:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F0B3431F2;
	Tue, 19 Aug 2025 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ObxBfEsF"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9966633CE90;
	Tue, 19 Aug 2025 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755611915; cv=none; b=L2LLvxd6Qgckl1gMbx+molU6/ZAsNEJfgWt3eOEsRagmnFThmKTN+gDdEAaB31qp2vpWshTaCjw6ZT1Sc4mhwjvNzo2vTptfdS0XL3lRqX4MpMN7WcXpESytXX1I7URz6beF/1ose/KvoY1kgVr1oHBpFK0HuU25n3at91OMX2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755611915; c=relaxed/simple;
	bh=4dItgwa1YS8ulkeOOZQgdQJhwmbVdtQ1PYab2cpPn08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YUBzWHXqLtmEOYf1nGjRgNa1CgLJaAj+iUwH1GnawpiahEqtvT0fOI14XA9zNRyBYTFY2f25Mw4MUh2Gd6YkQSWAqoq/MY/t9D0snpTvDJ2Ay7DGzPplbiw4zcWAoBE8sDnIsO0tqcDn5Q6+zQNFospG+iQX7H6toUhbBZ5OHug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ObxBfEsF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 602B9C113D0;
	Tue, 19 Aug 2025 13:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755611915;
	bh=4dItgwa1YS8ulkeOOZQgdQJhwmbVdtQ1PYab2cpPn08=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ObxBfEsFs36h1jBDe8dzr/P4kMm49Jstpnt7VgyPcJOmv0rX7XlcOu+i+17VJh6az
	 9TSMYkK2DVwctOvikIK1jn9DlLycpI5lopAlLBQkXsU3vxir3LN2H0YdYnW7RcnTl6
	 j72cSyHUxeLOhfUQ5r8gFOFjbrR4t2KpCphDl1LPORZO//pw3xubYbgVYe7XyRpriW
	 wiCRtZSPGNkGcltM0SPfSF54lRCSA8kEwESNyyYioJto/G0WZj5duT45zFFMASCaSV
	 MtUhrqtlhwo3Gco1tGH5YtsJjUY/E43LAC+wEtjmsaubYPfpALft2Cu5ZU+i8SMOfR
	 bacAvGc53/3XA==
Message-ID: <20be4ac4-42c0-422c-bcd4-8d49527f217f@kernel.org>
Date: Tue, 19 Aug 2025 14:58:32 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the nvmem tree
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Srinivas Kandagatla <srini@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Lee Jones <lee@kernel.org>
References: <20250819134039.5742c60e@canb.auug.org.au>
 <3861530.VQhiAETyHQ@diego> <5c527946-31c4-45a9-a804-f873ce0db4a4@kernel.org>
 <10708013.qUNvkh4Gvn@diego>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <10708013.qUNvkh4Gvn@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/19/25 2:54 PM, Heiko Stübner wrote:
> Am Dienstag, 19. August 2025, 13:22:04 Mitteleuropäische Sommerzeit schrieb Srinivas Kandagatla:
>> On 8/19/25 12:14 PM, Heiko Stübner wrote:
>>> Hi,
>>>
>>> Am Dienstag, 19. August 2025, 05:40:39 Mitteleuropäische Sommerzeit schrieb Stephen Rothwell:
>>>> After merging the nvmem tree, today's linux-next build (x86_64
>>>> allmodconfig) failed like this:
>>>>
>>>> In file included from drivers/nvmem/qnap-mcu-eeprom.c:12:
>>>> include/linux/mfd/qnap-mcu.h:13:9: error: unknown type name 'u32'
>>>>    13 |         u32 baud_rate;
>>>>       |         ^~~
>>>
>>> [...]
>>>
>>>>
>>>> Caused by commit
>>>>
>>>>   117c3f3014a9 ("nvmem: add driver for the eeprom in qnap-mcu controllers")
>>>>
>>>> I have used the nvmem tree from next-20250818 for today.
>>>
>>> bah, sorry about messing this up.
>>>
>>> While I encountered this, and fixed that with the pending
>>>   https://lore.kernel.org/all/20250804130726.3180806-2-heiko@sntech.de/
>>>
>>> I completely missed that the nvmem driver applied alone would break
>>> without that change :-( .
>>
>> I have now reverted this change, @Heiko Please let me know if you want
>> to take this to mfd tree or vice-versa.
> 
> ok, no worries :-) .
> 
> I guess for now, I'll just make sure the header patch gets somewhere.
> And I guess I'll re-try the nvmem driver once that has happened,
> probably for the next cycle.

I don't think we need to wait till next cycle, Lee can pick up this
patch via mfd tree if header change is going via mfd tree.


--srini

> 
> Creating dependencies between trees somehow does sound like
> more hassle so I'll just wait for a stable base, to not cause more
> breakage :-)
> 
> 
> Heiko
> 
> 


