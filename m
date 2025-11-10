Return-Path: <linux-next+bounces-8916-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB29CC47C17
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 17:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B29501896523
	for <lists+linux-next@lfdr.de>; Mon, 10 Nov 2025 15:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDC23274659;
	Mon, 10 Nov 2025 15:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KubTYskI"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C34257841;
	Mon, 10 Nov 2025 15:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762790046; cv=none; b=U0OSk7u9gSK1AINI+ZaEchj5RNwCjlbxgqooWTHD+/S2zOU5Q6wlXVB9AjW89WXljAMHxXYl06FCBl4Jpt4mt1eUoXQHMrUPX+dSYwEVBi9ndYAGPn043/m+keD2bP5M6L/b0uv/Zq4J2LDE4MmnC3UdcEc4/lnyN271wcuBPhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762790046; c=relaxed/simple;
	bh=QnnErlrJTBfn1cAyTBylGg5Xqlm3o3Uti35tHTccASM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nQ9eh/cm28ZcIpCDujFxtCzqVhhMiHSnNEdceQeenkxvA7c/4E38Ux2BZm45SPPTUjyaZSRmNVlKdm/37cwcW5iUMoXeEQ1/nTZFXu/KNFJiw7RdGU+3HW0XvqaG3uPYYzUpyvYTgU23A9HYtGTBpAa4jjlqsLTJzXtQmR4jkx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KubTYskI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378BCC116D0;
	Mon, 10 Nov 2025 15:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762790046;
	bh=QnnErlrJTBfn1cAyTBylGg5Xqlm3o3Uti35tHTccASM=;
	h=Date:Reply-To:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KubTYskISSxS4+9khnrtO7MktZcAaIdEQew19DlwkkmIc9xJ7g7jdpDKPNWNEIM6J
	 +kS1hfZC2sfQ48JDgAdkI7/KhCFs5fSs9DjB11BAnF5T3rspqgZTgcV5SZtIEGnAAJ
	 o10fcc6ANVMLB4HQW+dwc3JXm5h+/gInjjXst6JC3g8P7lGKk3sDlpb0b5yNAgmTR7
	 hUx16Lr6JKSiiEb5PS8GzWnzHHG4sT94eBQCgAlw/fGZzGuFMFrgw+AUFez1/9PWC/
	 6Z+EqYLL1gLEyZENxd62lOkJ+X0SQnrp6zjCX9cQKDSoaI/WOyzcrwZmPNqwsb2OlA
	 54GGpqRtAaWjg==
Message-ID: <2b53a2d1-3e86-4558-ba7f-5ce3b1368f0f@kernel.org>
Date: Mon, 10 Nov 2025 16:54:01 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Daniel Gomez <da.gomez@kernel.org>
Subject: Re: linux-next: manual merge of the pwm tree with the modules tree
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Daniel Gomez <da.gomez@samsung.com>, Luis Chamberlain
 <mcgrof@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Sami Tolvanen <samitolvanen@google.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>
References: <20251104104827.1de36ea0@canb.auug.org.au>
 <20251104105415.68bfb090@canb.auug.org.au>
 <f374sh5rsbxvboowft6xpiimxlzw264i32txgiok53on2vxxu7@lpetaklaofzb>
 <ad9c5b79-8a33-4183-a048-48ba516e6aaf@kernel.org>
 <26c7zdxc4nv3wx25xferlggtjipigtd3tc6fk554g4tmqsuvmr@e6cll772nz2r>
Content-Language: en-US
From: Daniel Gomez <da.gomez@kernel.org>
Organization: kernel.org
In-Reply-To: <26c7zdxc4nv3wx25xferlggtjipigtd3tc6fk554g4tmqsuvmr@e6cll772nz2r>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/11/2025 16.42, Uwe Kleine-König wrote:
> Hello Daniel,
> 
> On Mon, Nov 10, 2025 at 02:59:15PM +0100, Daniel Gomez wrote:
>> On 07/11/2025 17.44, Uwe Kleine-König wrote:
>>> Hi Daniel,
>>>
>>> On Tue, Nov 04, 2025 at 10:54:15AM +1100, Stephen Rothwell wrote:
>>>> [adding the modules tree contacts]
>>>>
>>>> On Tue, 4 Nov 2025 10:48:27 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>>
>>>>> Today's linux-next merge of the pwm tree got a conflict in:
>>>>>
>>>>>   rust/macros/module.rs
>>>>>
>>>>> between commits:
>>>>>
>>>>>   3809d7a89fe5 ("rust: module: use a reference in macros::module::module")
>>>>>   0b24f9740f26 ("rust: module: update the module macro with module parameter support")
>>>>>
>>>>> from the modules tree and commit:
>>>>>
>>>>>   927687809649 ("rust: macros: Add support for 'imports_ns' to module!")
>>>
>>> I reshuffled my tree such that the import_ns commit sits directly on top
>>> of 6.18-rc1. The new commit-id is 739ad9be61e5.
>>>
>>>>> from the pwm tree.
>>>>> [...]
>>>>>  -    if let Some(imports) = info.imports_ns {
>>>>> ++    if let Some(imports) = &info.imports_ns {
>>>>> +         for ns in imports {
>>>>> +             modinfo.emit("import_ns", &ns);
>>>>> +         }
>>>>> +     }
>>>
>>> Given that the conflict resolution is non-trivial and we already know
>>> what to do, I suggest you merge my commit into the modules tree.
>>
>> Do you mean creating a separate branch that includes the conflict resolution, to
>> be used as an example when sending the PR?
> 
> If I were the module maintainer I'd pull
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git rust-module-namespace
> 
> into my tree and include that into the v6.19-rc1 pull request. That way
> the merge conflict doesn't happen at all for Linus.


That's not my understanding on how to deal with conflicts:

https://docs.kernel.org/maintainer/rebasing-and-merging.html#merging-from-sibling-or-upstream-trees

> 
> Best regards
> Uwe

