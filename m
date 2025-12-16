Return-Path: <linux-next+bounces-9429-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA1ACC141A
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 08:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 125E83026522
	for <lists+linux-next@lfdr.de>; Tue, 16 Dec 2025 07:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BF633A01C;
	Tue, 16 Dec 2025 07:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="xxuZ4UWW"
X-Original-To: linux-next@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91925339B20;
	Tue, 16 Dec 2025 07:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765868588; cv=none; b=aaDUjZ+oxF7Zcr3ujqdP0qqVW3Z2Nn1GJdt9xkJ6D9ZBvtgebtOT3aMgNr+xKm5QYVm2kV+zxsCLVYCqcaIU5k81wMRHIXO4pFL7tocQ5p8Q/phX66iJ6lM6diljJEMtGovRuStHfp8MANMk9i3Vri8LPVVZKjp65xy+VxusQug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765868588; c=relaxed/simple;
	bh=aEV8pE1dWKt2SN4/6rly66KWr7S7P3+iUAGfOQfmFbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSZ+Hcud2tEhC8u3gCwyXax2FIn4bNe8ro6KM7jN7gI7Vpq3OdccqaeeWH1/EMsL4CTvvfX1X2zKWRC44dt1FZZpXJgtJsBK+FbM/ePhe2LHHA59pblReUFzxNamkke8+WT16MZTk6r2buD/HhnEhzN4NCMR6qyT+P1T6VAH8Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=xxuZ4UWW; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ctnG++yE8mMOOojzzIMUU82hWTkaE9M2kYgGe7Al128=; t=1765868584;
	x=1766300584; b=xxuZ4UWWK/KK8XmAqB63L7SQf4GkJSbB4+srUIetOJ5b5946TtOT+ZlTnUE8F
	I94qtcVRGvgTSLrSPoSBgfwbXU6Tel3LHPo92gM7bQsMvYBRqjQmpVoX0hCWP0wjoMXcWAihg5jrs
	I6Cf1nKDzRVaS8hqXuqGt8CxSYv741KL8w6mAiYe6xvua3yFvdO1mrvCNt6i5Zz7hC9bMD0lBbdIY
	Xbu+VQ4wfSEia8B8Kfi5Gxm7utYzzRD46oF/6pg3w2TjLf8U7g/Axh9UkQ0qp0oXbrPdwYXaTMiN9
	gex0i1iIWuAo00W8AFGTTM3q1rxDTgcPeeuW96BdJX/fIbJmmQ==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vVP59-00BVwj-0A;
	Tue, 16 Dec 2025 08:02:51 +0100
Message-ID: <fdf21e40-b504-4122-a072-2c546b1f8237@leemhuis.info>
Date: Tue, 16 Dec 2025 08:02:50 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_error=3A_implicit_declaration_of_function_=E2=80=98?=
 =?UTF-8?B?cnFfbW9kaWZpZWRfY2xlYXLigJkgKHdhcyBbUEFUQ0ggNS81XSBzY2hlZDogUmV3?=
 =?UTF-8?Q?ork_sched=5Fclass=3A=3Awakeup=5Fpreempt=28=29_and_rq=5Fmodified?=
 =?UTF-8?B?XyooKSk=?=
To: Nathan Chancellor <nathan@kernel.org>, Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, vincent.guittot@linaro.org,
 linux-kernel@vger.kernel.org, juri.lelli@redhat.com,
 dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
 mgorman@suse.de, vschneid@redhat.com, tj@kernel.org, void@manifault.com,
 arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251127153943.696191429@infradead.org>
 <20251127154725.901391274@infradead.org>
 <3dd19f67-1132-41b3-bf6a-ec9a430424e6@leemhuis.info>
 <aT-0zW7vOrJv6pA6@gmail.com> <20251215115121.GA505816@ax162>
From: Thorsten Leemhuis <linux@leemhuis.info>
Content-Language: de-DE, en-US
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 MEK4
In-Reply-To: <20251215115121.GA505816@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1765868584;6396f309;
X-HE-SMSGID: 1vVP59-00BVwj-0A



On 12/15/25 12:51, Nathan Chancellor wrote:
> On Mon, Dec 15, 2025 at 08:12:13AM +0100, Ingo Molnar wrote:
>>
>> * Thorsten Leemhuis <linux@leemhuis.info> wrote:
>>
>>> On 11/27/25 16:39, Peter Zijlstra wrote:
>>>> Change sched_class::wakeup_preempt() to also get called for
>>>> cross-class wakeups, specifically those where the woken task is of a
>>>> higher class than the previous highest class.
>>>
>>> I suspect you might be aware of this already, but this patch afaics
>>> broke compilation of today's -next for me, as reverting fixed things.
>>
>> Yeah, sorry about that, I fumbled a conflict resolution - should be
>> fixed for tomorrow's -next.
> 
> It looks like you cleared up the rq_modified_clear() error but
> rq_modified_above() is still present in kernel/sched/ext.c.

...which afaics causes this build error in today's next:

In file included from kernel/sched/build_policy.c:62:
kernel/sched/ext.c: In function ‘do_pick_task_scx’:
kernel/sched/ext.c:2470:27: error: implicit declaration of function ‘rq_modified_above’ [-Wimplicit-function-declaration]
 2470 |         if (!force_scx && rq_modified_above(rq, &ext_sched_class))
      |                           ^~~~~~~~~~~~~~~~~
make[4]: *** [scripts/Makefile.build:287: kernel/sched/build_policy.o] Error 1
make[3]: *** [scripts/Makefile.build:556: kernel/sched] Error 2
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [scripts/Makefile.build:556: kernel] Error 2
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builddir/build/BUILD/kernel-6.19.0-build/kernel-next-20251216/linux-6.19.0-0.0.next.20251216.415.vanilla.fc44.x86_64/Makefile:2062: .] Error 2
make: *** [Makefile:256: __sub-make] Error 2

Ciao, Thorsten

