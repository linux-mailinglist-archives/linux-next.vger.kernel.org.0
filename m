Return-Path: <linux-next+bounces-8971-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F65C5AB87
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 01:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B452D4E3C66
	for <lists+linux-next@lfdr.de>; Fri, 14 Nov 2025 00:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5891E5B7A;
	Fri, 14 Nov 2025 00:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5yE5jwO"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026DC1DE4EF;
	Fri, 14 Nov 2025 00:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763079172; cv=none; b=dGVo17rJRhEHZ5oPkolA9x0C4OYuWvraM+lXHrA+ltT+faxOnWhx2BsUXsAIsjBLy+lCluzhHlLFaRFfm/OUHX1wwZ+RvMk5hd9fOwuELvJzMeKH62hNZ/tyCtArKWpKdjOJ366CHbyr3w19ZMMHkGqgtIteIbWIsTt06XkoTgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763079172; c=relaxed/simple;
	bh=lz2H2uxaN/2xQFGGhBVPTIkF6raAxUfwPqGNyrUvyzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YcTFaEIsBD2TM0+0KzAZGM3wTOZDjsG39TQVuKahZyFI2TeTEvhQVK8ofDQXUYO6aSXthldj+ri1/igxDpcWl4WkV2/S5vXEOD61gLngw2oEAvixIUD4SANG9jaV8koT5WWN9qxJu5p4gzXJZr1xr5lM3H4VHqPZYAXcNEZHsI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5yE5jwO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA27C4CEF5;
	Fri, 14 Nov 2025 00:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763079171;
	bh=lz2H2uxaN/2xQFGGhBVPTIkF6raAxUfwPqGNyrUvyzQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=S5yE5jwO1s6ZezthCS5g/HXS5m+wHa5LPHjOG5OozPYuuWAJ6bXRdYQCyzoEmYEs6
	 1CzuslQtbN2yjChINu8RS6pb8NKQ0m7NXmeuzMP+h2Kjx6F1qs4DbyDd6rPlcdHWtj
	 8JXBfJYIzCpjjFpqj6+VAFilDlq3GD5TAFX2AhEoTnPfPTTDXvun98hQJsOhIXyw/p
	 DhLQTcEqa7Y2RmsbmYkL3ctCz7pdc0VpMFJ1p9s2b/tvxlxpyUvTepSE8KNxnBpTLb
	 Hq9tKyS/7920Usgs55ZJqHbsW8t/0TebOdFop1X3Pm69HjrzDRWUGVrMJXLIO8FS9T
	 GLmhXj141IKZQ==
Message-ID: <3af78904-98ac-4058-9476-2340dbd23708@kernel.org>
Date: Fri, 14 Nov 2025 09:08:53 +0900
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
 <3459d7a5-f49c-4c5e-b010-a3732c3b0e00@kernel.org>
 <9c2267cc-6b5a-40ce-b428-05d6ace6f2c9@kernel.dk>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <9c2267cc-6b5a-40ce-b428-05d6ace6f2c9@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/14/25 8:45 AM, Jens Axboe wrote:
> On 11/13/25 4:38 PM, Damien Le Moal wrote:
>> On 11/14/25 8:07 AM, Jens Axboe wrote:
>>> On 11/13/25 3:04 PM, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> In commit
>>>>
>>>>   7b2038b1b1d4 ("dm: fix zone reset all operation processing")
>>>>
>>>> Fixes tag
>>>>
>>>>   Fixes: db9aed869f34 ("block: introduce disk_report_zone()").
>>>>
>>>> has these problem(s):
>>>>
>>>>   - Target SHA1 does not exist
>>>>
>>>> Maybe you meant
>>>>
>>>> Fixes: fdb9aed869f3 ("block: introduce disk_report_zone()")
>>>
>>> Guys, that's now three funky shas that have never existed in my tree.
>>> Can we please exercise a bit more diligence in actually tagging patches
>>> correctly?
>>
>> My apologies about this. I was careful to take these from a fresh pull of
>> block/for-next but I obviously screwed-up the copy paste, missing the first
>> character.
> 
> Just add something like this to your git config:
> 
> [core]
> 	abbrev = 12
> [pretty] 
> 	fixes = Fixes: %h (\"%s\")
> [alias]
> 	fixes = log -1 --format=fixes
> 
> and then you just do:
> 
> axboe@m2max ~/gi/linux (for-next)> git fixes fdb9aed869f34d776298b3a8197909eb820e4d0d
> Fixes: fdb9aed869f3 ("block: introduce disk_report_zone()")
> 
> and then you're just copying that entire line, making an error much less
> likely. Still won't catch someone using the wrong SHA, but it would've
> prevented your issue at least.

Will do. Thanks.


-- 
Damien Le Moal
Western Digital Research

