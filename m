Return-Path: <linux-next+bounces-4927-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2027F9EA226
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 23:53:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7A081665CB
	for <lists+linux-next@lfdr.de>; Mon,  9 Dec 2024 22:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A7C19D075;
	Mon,  9 Dec 2024 22:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kIR/9drE";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iTcVXFj4"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5791991C8;
	Mon,  9 Dec 2024 22:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733784812; cv=none; b=qtkr5tDI1FaZMFftSSLtdInm/ymwRWU1TPPSTTJH6su1R4fofPvsIsnPgWoYKZ/PTk59FuvHP0PhouPS2fuYNMeI5JephtkNFlOyY9VPYyMcrfnKP2oOHF7pM8g+l0PTC6vaAYVxAHbdqK5F0sn9fvHmxCmqvRgJYObEu7b71oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733784812; c=relaxed/simple;
	bh=5PVuXzyChowh894auAT5ZoRTLYIMdrIFvFOJj4P2wlQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QVDbqYIKFc+pWjfuFj6Xfpb87NBIeo10eZ7S+TSoBDhQCIKoW2ZNje45oCnxS1qLwdPhPMtepDP3jpV+NJdcoeJikgV2zV61PUXvI1xcmarabysd9MrbdBcvqkMqm3E1JkR4L6msZs5qy/hyBRBGvdCO777zymoMOHqtarDRmeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kIR/9drE; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iTcVXFj4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733784808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMMrkishAKVvaLPs2kIvYJkEqrVd+c3FLBZGGUM/C6s=;
	b=kIR/9drEiSpPopen4U0v6O7MReri00hhkQ+u7mK8ymvOI0PnIMF+4Ry7BpL91PmxlPiNAq
	ANkdR2pHosYzjuJefqphBhb3zUREa/SgCw9lxLELcukgF1uzTBr35ZsH8kRSyUAjZPt5j6
	wJtUxfKxf5MjrXLW6Q8GHl2G6lD6XukwaBo11Yi9T+Dcy/ojVlqwBqsVn67fER2WCJEfOM
	mHdzBDYO+CkZIBo7W+TL0Q0oCUN2U+wW9xuY5DirPCBz9NpBxoXQbMQnWl/zRZAejCeJO5
	9++L6bytNxYGOCnkr00Tdkc8fxeE9N7dT+X9aJLh7aHANKnfoWigX6klEynewg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733784808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TMMrkishAKVvaLPs2kIvYJkEqrVd+c3FLBZGGUM/C6s=;
	b=iTcVXFj44e/PcV2+cz2JR2cO3goL/V7PGTQg8jvCj+oD9jqM+MoIYtEYQ0xWYYhvNGbIgN
	I6yCNVw4bPQn0lCQ==
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the tip tree
In-Reply-To: <CAJuCfpFTeom8u6nb8z1+BF+1B3rChUqfvgp29h3yqFWVAu5nJw@mail.gmail.com>
References: <20241209132941.58021bb7@canb.auug.org.au>
 <20241209110842.GM21636@noisy.programming.kicks-ass.net>
 <20241209114524.a150aba86198e6f0fc9afcbc@linux-foundation.org>
 <CAJuCfpFTeom8u6nb8z1+BF+1B3rChUqfvgp29h3yqFWVAu5nJw@mail.gmail.com>
Date: Mon, 09 Dec 2024 23:53:27 +0100
Message-ID: <87v7vso4d4.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09 2024 at 12:21, Suren Baghdasaryan wrote:
> On Mon, Dec 9, 2024 at 11:45=E2=80=AFAM Andrew Morton <akpm@linux-foundat=
ion.org> wrote:
>> On Mon, 9 Dec 2024 12:08:42 +0100 Peter Zijlstra <peterz@infradead.org> =
wrote:
>> > Why is this in -mm ?
>>
>> Because
>> https://lore.kernel.org/all/20241206225204.4008261-1-surenb@google.com/T=
/#u
>> needs it.
>>
>> > I agreed with Suren I'd take them through
>> > tip/perf/core to go along with Andrii's uprobe patch that relies on
>> > them.
>
> Both trees now have changes depending on those patches. If we can't
> have them in both trees then I can rework my last patchset in the mm
> tree to use old seqcount code and not require those patches, but we
> will have to deal with the merge conflicts later.

Usually one tree picks the changes up into a seperate branch based on
-rc1 and declares that branch immutable by tagging it. Both trees then
can merge it into their respective branches which depend on it.

Thanks,

        tglx

