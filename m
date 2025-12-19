Return-Path: <linux-next+bounces-9484-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4A6CCFB3A
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 13:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8541130C3B88
	for <lists+linux-next@lfdr.de>; Fri, 19 Dec 2025 12:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12880324B1B;
	Fri, 19 Dec 2025 12:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6ae90Q4"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA01333065E;
	Fri, 19 Dec 2025 12:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766145701; cv=none; b=gxqmXrhVP17XDYwWkjeQ0DJkhePoI0D/0XPUDWLO4GBkXYM0wCMKMzjF7EbIOSTsdinUkr/VHMDkl/DR+nQw4HCRulBK45WhFaEmxTphV8H43vJSdw+EsaRfyf7HtK3785wJKTog0VIGfHlBbAa+JpA91SNwK2fQuyZqfuIogtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766145701; c=relaxed/simple;
	bh=3cFhrUXDRu5VGh/RtGvrfASXI4/QGZTDrcyQQgTatT0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=obE9RJA+kKtvo033Z0EnvpvqzPkkArtMOhK3WDFHuzYjVVgFxG+5qXbyhG/OHRkVy8tOdcjIOkpAnFq5izU5lBAKDqzSm3CFa++D3Trw1+WRaH9Lr2gFVQ6R2/4a02DuRLPgPBRUXklGmUDb2oD1syol/VkvZZkek16+MrQjYk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6ae90Q4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77BDCC113D0;
	Fri, 19 Dec 2025 12:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766145701;
	bh=3cFhrUXDRu5VGh/RtGvrfASXI4/QGZTDrcyQQgTatT0=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=C6ae90Q44mepeDvBKzvFQ9mQM04ogHze8jXTnP8G/FQ34ifTELFr0IHYICmbUjM6C
	 Swb0277Z8iPEd/X0psILSbeopBYiDq3mgFp8uotl9DBT3OjpqP7k6H7RQhgwI/nCGi
	 Lrb9yjgtzhYAx+oULfmpqqfxDAGkBVz3LY+s9N2iSREXuXuQbSDaRQH1dW5pc/nsEU
	 k2L+f1so9vtl3WZFX5ZywU96ETu63TNp9TGt3KgH2OhFNrK3Q1NGdApIdRlY12Pq3B
	 hYycpBMPOGWQvIyY9acJ2roidoZ0krsPpHXo17EsUxYlj7WhB/Wpq1K2esOqGFVYLE
	 l2G5Z9KFBzqxg==
Message-ID: <484f43b8-aefd-467b-8cc1-a3505a29cf2c@kernel.org>
Date: Fri, 19 Dec 2025 13:01:31 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: trees being removed
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Larsson <andreas@gaisler.com>,
 Christoph Lameter <cl@linux-foundation.org>,
 Chuck Lever <chuck.lever@oracle.com>, Dennis Zhou <dennis@kernel.org>,
 Dipen Patel <dipenp@nvidia.com>,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Ingo Molnar <mingo@kernel.org>, Jean Delvare <jdelvare@suse.de>,
 Lee Jones <lee@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Tejun Heo <tj@kernel.org>,
 Tyler Hicks <code@tyhicks.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>
References: <20251215184126.39dae2c7@canb.auug.org.au>
 <5f50d00f-faa1-4035-82c6-921147d3a08a@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <5f50d00f-faa1-4035-82c6-921147d3a08a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/12/2025 12:53, Krzysztof Kozlowski wrote:
> On 15/12/2025 08:41, Stephen Rothwell wrote:
>> Hi all,
>>
>> The following trees are going to be removed from linux-next because they
>> have not been updated in more than a year.  If you want a tree kept,
>> please just reply and let me know (and update its branch).  If you want
>> a tree restored after it has been removed, just let me know (and update
>> its branch).
>>
>> Tree			Last commit date
>>   URL
>>   comits (if any)
>> ----			----------------
>> accel			2024-05-03 11:00:53 +1000
>>   https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/linux.git#habanalabs-next
> 
> +Cc few DRM addresses,
> 
> Shall we make DRM accel subsystem orphaned in this case? This tree is
> still mentioned in "DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK"
> maintainers entry, but if no work is happening, no updates to Git repo,
> then does that mean project is effectively dead now?
> 
> To be fair, the patches are still posted [1] but if nothing is picked up
> to the repo then maybe new maintainers are needed? Or repo did move to
> other place silently?
> 
> [1] https://lore.kernel.org/all/?q=dfn%3Adrivers%2Faccel%2F
> 

I dig a bit more and individual drivers are still picked up via
drm-misc, but I guess Oded has much less time now [1] and even recent
changes to drivers/accel/drm_accel.c went via other person. With tree
being dropped from the next, it should probably be removed from the
MAINTAINERS. I'll just send a patch, easier to comment there.

[1] https://lore.kernel.org/all/?q=f%3A%22Oded+Gabbay%22


Best regards,
Krzysztof

