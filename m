Return-Path: <linux-next+bounces-8914-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7E6C470E9
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 14:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 07F0D4E5787
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 13:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCCF30100C;
	Mon, 10 Nov 2025 13:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbJyYTWS"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DCF21257A;
	Mon, 10 Nov 2025 13:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762783160; cv=none; b=RAapr5n/gthtHavG/bWhXZKIbsQUD4/rZuuBxuaz5+C1vtqnad6GWmXQxnULg5rCcCaJArbpBjurhoLDs4FrP70unT7AVWE2lC7O44q5GwcUj5o9cTAeThq0iuiCfWzpzT4ZSEe8Ia4jOWNQ8Hv6yQ6hBm8bvMgPdBJr1BlI4Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762783160; c=relaxed/simple;
	bh=YlbYnOaz4G5OnQsryk5g9FuJmLX+H5BN9DgNc0Jc/nY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d9yrod6voaRclTQD6IMuB+e4CKmYL86tLuI6JOPTM1c91h10LZ9w1KcY8vJM9WWFIQvJoqhZczZZod9dswLBhlRDVIQRuK30nIpodFf0xS+t5530nmIyCfDAuD1QrvBFX301xSRZTLyFLRFHammwaEJcU1tdgtWubkBIMXUzZ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbJyYTWS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24A13C4CEFB;
	Mon, 10 Nov 2025 13:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762783160;
	bh=YlbYnOaz4G5OnQsryk5g9FuJmLX+H5BN9DgNc0Jc/nY=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hbJyYTWSls6hHIQtLsyzk3MAv0GnCeOFkYilzEgA9E0q+gtL7FZGq5F+AU5v95VUK
	 yn83aWsAoYQWNlGeRlDAnCnyZJPiWGfhfGMCLMwXsy7RpBbX5k2XDrn0m8mlpO2MXv
	 43gi6QKsDKps/VradbwCNXC2GOL9/ZyGMkp+PsNG7Xlj+oBV30v8bRpe9a4N6WhBzo
	 BByCWExPnnpjMeXDly6lrx96/ebVKAHXhwHRwCrQpTk9J8ljMpUy4wald3PPYJp0fK
	 jBb1U4kLL95hDDyfeCLuJkx/y9ZFdpV+sWlUAbo3Oi1NXSsaAfVvHMEHoK8B7s8Rcb
	 crqN3h9mUSvgw==
Message-ID: <ad9c5b79-8a33-4183-a048-48ba516e6aaf@kernel.org>
Date: Mon, 10 Nov 2025 14:59:15 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: linux-next: manual merge of the pwm tree with the modules tree
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Daniel Gomez <da.gomez@samsung.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Sami Tolvanen <samitolvanen@google.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>
References: <20251104104827.1de36ea0@canb.auug.org.au>
 <20251104105415.68bfb090@canb.auug.org.au>
 <f374sh5rsbxvboowft6xpiimxlzw264i32txgiok53on2vxxu7@lpetaklaofzb>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <f374sh5rsbxvboowft6xpiimxlzw264i32txgiok53on2vxxu7@lpetaklaofzb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 07/11/2025 17.44, Uwe Kleine-König wrote:
> Hi Daniel,
> 
> On Tue, Nov 04, 2025 at 10:54:15AM +1100, Stephen Rothwell wrote:
>> [adding the modules tree contacts]
>>
>> On Tue, 4 Nov 2025 10:48:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>
>>> Today's linux-next merge of the pwm tree got a conflict in:
>>>
>>>   rust/macros/module.rs
>>>
>>> between commits:
>>>
>>>   3809d7a89fe5 ("rust: module: use a reference in macros::module::module")
>>>   0b24f9740f26 ("rust: module: update the module macro with module parameter support")
>>>
>>> from the modules tree and commit:
>>>
>>>   927687809649 ("rust: macros: Add support for 'imports_ns' to module!")
> 
> I reshuffled my tree such that the import_ns commit sits directly on top
> of 6.18-rc1. The new commit-id is 739ad9be61e5.
> 
>>> from the pwm tree.
>>> [...]
>>>  -    if let Some(imports) = info.imports_ns {
>>> ++    if let Some(imports) = &info.imports_ns {
>>> +         for ns in imports {
>>> +             modinfo.emit("import_ns", &ns);
>>> +         }
>>> +     }
> 
> Given that the conflict resolution is non-trivial and we already know
> what to do, I suggest you merge my commit into the modules tree.

Do you mean creating a separate branch that includes the conflict resolution, to
be used as an example when sending the PR?

