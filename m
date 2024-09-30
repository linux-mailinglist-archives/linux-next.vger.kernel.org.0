Return-Path: <linux-next+bounces-4014-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C0C98A00A
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 13:00:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B60F2864A3
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2024 11:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4779617BED0;
	Mon, 30 Sep 2024 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JgiJvnwb"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C86E13D52E;
	Mon, 30 Sep 2024 11:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727694027; cv=none; b=a/EFOQtGo3zKEaflqmEHBuLS+RG8jXvDXNlKUpFubyh1MBG+TlntGk6776ffdo2e1GK0N3+1q7qklf2FR9CGrL9aM1SATaQXrnIzs4qBd2xnZmcT0avPrR4p5Ng3nojYaJMHr8Wtt0nP6tLTNdtBW++1r2Ua72LpkDF0o+Dumfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727694027; c=relaxed/simple;
	bh=g3OUq+o1eRwEasYpaeVKm6GezHRdApJXSLY6K1BiVwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/SREPNUlbyrnNsqdSfhkVpnonG9afrD4jlyqdW5xZ4TJUUzro10pFyJNTLlSiHV3882BsIcYFCj2RQXouL23U8pL/jgfH6Mi38U1uT34z5ar6yuVmxrOXlbh2BCjTRaXgpP741WZ2csmCL+ytIV5QxoNsAy3pKLQJQb4Dm6DGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JgiJvnwb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3040BC4CEC7;
	Mon, 30 Sep 2024 11:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727694026;
	bh=g3OUq+o1eRwEasYpaeVKm6GezHRdApJXSLY6K1BiVwY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JgiJvnwbApO++BTZl9fLHso4ntjr43DLeu5XuR+NxWf0PXO7BSvKVvh8mUxEraUx9
	 ECC751EbhC/gMHRmSOvyx6GU50myrPWzTCgC3vXCMDXX8S5qeMOo7kqwDMHVJvdgmp
	 Ap8lAEFkVzuvOvwmUnrcc6TaCj5On/qE6aJv9fQqsxkpNpRvuLkI5uUoXk0wIxUC2v
	 IS5biNq67nN6p0UrQWRo7qF0U0aZMkz8ftFHemyjIEhhxOTcJofXJqsMX3eNInt1Yg
	 xIcwWI00wCexiAnRKfehxpAGW8lDzw5TetBHmnYuqIApbh/GucWJZAt0WOzKqMuZq4
	 urNGRn01h6DXA==
Message-ID: <75e2514c-7647-4d3b-9c55-c6e5c615c92e@kernel.org>
Date: Mon, 30 Sep 2024 13:00:21 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the origin tree
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240930133813.3c8157df@canb.auug.org.au>
 <2064ea03-a396-418c-a6c3-1c0f1b12d2f3@kernel.org>
 <i75zg7tnd4jvelfx6qb2pc72h45kki4vfku7qwghauztgcoywe@htrp3xhyz4u2>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <i75zg7tnd4jvelfx6qb2pc72h45kki4vfku7qwghauztgcoywe@htrp3xhyz4u2>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/09/2024 12:50, Kent Overstreet wrote:
> On Mon, Sep 30, 2024 at 12:28:40PM GMT, Krzysztof Kozlowski wrote:
>> On 30/09/2024 05:38, Stephen Rothwell wrote:
>>> Hi all,
>>> 
>>> After merging the origin tree, today's linux-next build (s390
>>> defconfig) failed like this:
>>> 
>>> In file included from fs/bcachefs/bset.h:9, from
>>> fs/bcachefs/btree_iter.h:5, from fs/bcachefs/str_hash.h:5, from
>>> fs/bcachefs/xattr.h:5, from fs/bcachefs/acl.c:6: 
>>> fs/bcachefs/bkey.h: In function 'bch2_bkey_format_add_key': 
>>> fs/bcachefs/bkey.h:557:41: error: 'const struct bkey' has no
>>> member named 'bversion'; did you mean 'version'? 557 |
>>> x(BKEY_FIELD_VERSION_HI,        bversion.hi)
>>> \ |                                         ^~~~~~~~
>> 
>> 
>> Also reported earlier here: 
>> https://lore.kernel.org/all/202409272048.MZvBm569-lkp@intel.com/ 
>> https://lore.kernel.org/all/202409271712.EZRpO2Z1-lkp@intel.com/
>> 
>> But the true problem is here:
>> 
>> commit cf49f8a8c277f9f2b78e2a56189a741a508a9820 Author:     Kent
>> Overstreet <kent.overstreet@linux.dev> AuthorDate: Thu Sep 26
>> 15:49:17 2024 -0400 ^^^^^^^^^^^ Commit:     Kent Overstreet
>> <kent.overstreet@linux.dev> CommitDate: Fri Sep 27 21:46:35 2024
>> -0400 ^^^^^^^^^^^ one day difference!
>> 
>> Last minute commits usually won't receive wide build coverage, at
>> least not instantaneously.
>> 
>> And if you go through the history, I see around 40 commits with
>> authored date ~20-26 September and committed on Sep 27. Plus
>> another ~40 authored earlier but committed on September 21, which
>> is middle of merge window.
>> 
>> Why such commits for RC1 are sent at the end of merge window or 
>> committed during merge window?
> 
> the rename was something I did to track down a bug in the disk
> accounting rewrite: 
> https://lore.kernel.org/linux-bcachefs/pvga5sgp4vejnnr5ojgiuwte6qeve4x7ld4dhdmzb625l367fq@q4td2cutlfvu/T/

I am sorry, but I do not see how cleanup-like rename is related to
tracking down a tricky bug and fixing it. Looks like fixes got
inter-mixed with such minor refactoring.

>
>  I do need to get multi-arch build testing going on my CI, but right
> now I'm busy working on corner cases in the repair code...

Well, I claim it is easy, if you wait one day for the notification from
LKP - I got notification after every push, also on success, so I am sure
that my kernel (and development, but that's unrelated) builds fine on
wide configuration. And this is free as in free beer...

Best regards,
Krzysztof

