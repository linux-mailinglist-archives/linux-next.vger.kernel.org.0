Return-Path: <linux-next+bounces-9190-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F6BC81F53
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 18:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 516814E459E
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 17:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBC1F2C1584;
	Mon, 24 Nov 2025 17:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="3XlZRRVh"
X-Original-To: linux-next@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476B323C4FA;
	Mon, 24 Nov 2025 17:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764006304; cv=none; b=EmDvcbogtfppyAnbazuvbSI9+8EjlN5ZmJqlaUt+lZDTjfPFGHhm1xtlCeViI6V8OoGYbDsTSb2aOTRkjZvBK/M3HOXDo9srsCbsaLcsiBzddv37uEDtkdTXer7mxsD6uWUq/GLk+n9pTVIddntV7qPWlezlY73cigKiuEr7Lr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764006304; c=relaxed/simple;
	bh=b+EZW0Cor7ZLJzAtKT2cBjxS5mp15VgngrgSiPVWais=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WQLKNNpk9yZ8pFX52Xafg5kpMlA/91l0n+bfkLa+k9CpULB6LBJ4FvN3UXNY5BTEKqZUXG4OUPZ8luOvRUWgcN4fBWCdY9ifskdMcgoy4qc6ZaAOrQsSMRc98/Qpcs4tS8Q2KnEwk6uN6P0GqtaaP4p/qsQQVt7Rpe40vbmJxhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=3XlZRRVh; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Uve/A3SMrG1dh4BfIQpFPuLmp0G1hcZBPqM7kiQcXoU=; b=3XlZRRVh+Xe8eI1wZ9C10f5hCU
	3sBy1s4yyc9v6Gskbon8tdFAgnC+8B3X6GtFyuqL7Cqc8VvQ6krGEylsGy6hqYQ/E8Wb63lSggPI7
	ixvtnrD6Esql3AKwOHEvlPyow84IwMV/C5HkpJAOIzNWY8j6pc2n8Va2SW/YIac6pYnCHk+vkDrlR
	1tWZTh3KYFjHJ8eukKtIRGbNhZCKTfd+KATnWxc6lkpZoVis4nbI77+5UVyb56bCFWdjoTXTMxu+X
	MYeoGpiRHsvvXNEgL+1+LgHISGauI5BlLqBK1I5csyy+7bemCN5JoVuEVcFTl7GZsxYneo33+Rx57
	HcxpzySw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNacT-0000000C7qo-3bcH;
	Mon, 24 Nov 2025 17:44:57 +0000
Message-ID: <55134c91-00c4-4a5b-a897-1c12d297671c@infradead.org>
Date: Mon, 24 Nov 2025 09:44:57 -0800
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the tip tree
To: Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>, ojeda@kernel.org,
 boqun.feng@gmail.com
References: <20251124231644.38d0303b@canb.auug.org.au>
 <20251124123249.GP4067720@noisy.programming.kicks-ass.net>
 <20251125010351.05b0b2d7@canb.auug.org.au>
 <20251124143537.GS3245006@noisy.programming.kicks-ass.net>
 <CANiq72kdCJS9ZDX+6B3pecAbfMqpt2XCqOfQfoKWgLaT9DtMpg@mail.gmail.com>
 <20251124145323.GR4067720@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251124145323.GR4067720@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 11/24/25 6:53 AM, Peter Zijlstra wrote:
> On Mon, Nov 24, 2025 at 03:48:12PM +0100, Miguel Ojeda wrote:
>> On Mon, Nov 24, 2025 at 3:35 PM Peter Zijlstra <peterz@infradead.org> wrote:
>>>
>>> At some point in the past... I just did again, and updated the relevant
>>> packages and rustavailable is still green, but allmodconfig is still not
>>> giving me rust.
>>>
>>> I'm on Debian Testing.
>>
>> There are several `depends on` for `CONFIG_RUST` as Boqun mentions, so
>> it is likely one of those is blocking you.
>>
>> The easiest way to know which one it is is to check what `menuconfig`
>> computes about the requirements (searching with the `/` command).
> 
> Yeah, that output is so long it scrolls out of the right side of the
> screen and it really isn't nice to read with all the negations.
> 

I've always found xconfig better for seeing dependencies. Of course, that
also adds a few build requirements.

-- 
~Randy


