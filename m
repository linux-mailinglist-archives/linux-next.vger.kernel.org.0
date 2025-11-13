Return-Path: <linux-next+bounces-8969-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F004DC5AA77
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 00:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id A5D9A2412C
	for <lists+linux-next@lfdr.de>; Thu, 13 Nov 2025 23:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92B2328B49;
	Thu, 13 Nov 2025 23:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVdsHT7r"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABCB326D62;
	Thu, 13 Nov 2025 23:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763077322; cv=none; b=faNXY3aO/+1eRi/N9ynNtucV4Png0WCdLf1m/wLDkrJBVHyAOwHwik/m6cOgu0K82XrI4nf4GfKbaYd+KFlCIeyzZOwK4TMmVw1IxQx1CaChAOKXEhqQz1Lqtav05HXKv4NqNJJKPfVqm8DXGZLtP7kOdhmfJxChwZPo8vNYS0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763077322; c=relaxed/simple;
	bh=gVv7QKZlYCPf8oOwUFLQxNejYeusMKPWqUnF7sD/q7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DT04m4HA9+7cYfIDZyEz4k9aAGQawLSQZIBjcZ8mBtPvfGo17wQwFbHvxxeKAwW96TGxqspGeQCmmsEEJ+3mZyMeeqsIvsuWR5lt7ThArGEYyQ8p4Mf+aw02opbJPeHG79Tq15Lcali2V6ZyH5rJjbXFxBRiMY9vt4Eorj7IZmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVdsHT7r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442FCC4AF11;
	Thu, 13 Nov 2025 23:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763077322;
	bh=gVv7QKZlYCPf8oOwUFLQxNejYeusMKPWqUnF7sD/q7c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CVdsHT7rueqzfK4SFFYSr+eHaYYvFpsPA4IhzD1CqVB6Gf9yCfeCfwdzagJEebyI3
	 z9RQEPy2rLyCdjUFPp1ZHGcyIABt9S6NLSm2R5ZEylYvzkKu846+WReWK6EEfrQWZv
	 TjJ66+iTHacgaw36mqAPoCK8i7kXoy7WgsmbIbJb3UD+eSVTJ/zljglZ4deOmCB1yy
	 AeaZXtrY639wYwBeNDoZNR08ITiAHs/IJQdvIRl62S6GBKsSVjwDgDGt0hNQWPXX9V
	 LfT4MbfKEo2L6hiuV6zN7+WSmlm1W7h4jBivrt0raNaTfaHTRmI2c1X5dRt8A8uTxC
	 sIeLzr5vL9KQw==
Message-ID: <3459d7a5-f49c-4c5e-b010-a3732c3b0e00@kernel.org>
Date: Fri, 14 Nov 2025 08:38:04 +0900
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Fixes tag needs some work in the block tree
To: Jens Axboe <axboe@kernel.dk>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251114090436.2811f38e@canb.auug.org.au>
 <48eff55b-f100-4057-8ff3-1d4b2089533d@kernel.dk>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <48eff55b-f100-4057-8ff3-1d4b2089533d@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/14/25 8:07 AM, Jens Axboe wrote:
> On 11/13/25 3:04 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> In commit
>>
>>   7b2038b1b1d4 ("dm: fix zone reset all operation processing")
>>
>> Fixes tag
>>
>>   Fixes: db9aed869f34 ("block: introduce disk_report_zone()").
>>
>> has these problem(s):
>>
>>   - Target SHA1 does not exist
>>
>> Maybe you meant
>>
>> Fixes: fdb9aed869f3 ("block: introduce disk_report_zone()")
> 
> Guys, that's now three funky shas that have never existed in my tree.
> Can we please exercise a bit more diligence in actually tagging patches
> correctly?

My apologies about this. I was careful to take these from a fresh pull of
block/for-next but I obviously screwed-up the copy paste, missing the first
character.

> Stephen, can't sort them out now, as they are deeper in the stack. So I
> guess we'll have to live with these two as well... And I guess I really
> need to get my scripts setup to catch these kinds of errors, sadly.

Stephen,

My apologies for the overhead.


-- 
Damien Le Moal
Western Digital Research

