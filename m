Return-Path: <linux-next+bounces-4273-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB26E99F1B7
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 17:45:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11AD61C2277D
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 15:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3831DD0C1;
	Tue, 15 Oct 2024 15:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AJ9vXj4z";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="6nWI/9U+"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E8E1D5178;
	Tue, 15 Oct 2024 15:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729007089; cv=none; b=tLlh6nbvU1TCPazsste4Vx89X+My9fdsYn6eIn1UgURwVFC1cyh5PdTk1c8PNFn0HK/6s5hYq5U+ZbpwMJkdXzdXvrPAtshEAmNxmNVo8tYKkuhPED/crZIdNPeMID1cz/7faW23Yk171PjJcL9iegtLD0hwOYaUsnLMAPoBhAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729007089; c=relaxed/simple;
	bh=WqjzFz/QaTPLWtXo71bR+OMJl4xP4c+nsfxLzXraVUk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pyratv9DLSeWS39JZYQc4n7v2zRI+xAzw1O4gW2gTQseJctpzbk4Wk9RPA9z5YyFR40OC+0bLHdXpi26vyqrPPEO4iJtFc5+VccaD3S+EL1eA27Z29qyxcdM+nPvJi1JFEmAgmRKsfzod5SDO2jowsr/ik9RlDKqwAxxNJULc44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AJ9vXj4z; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=6nWI/9U+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1729007083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ONrTJwH4wwYvB6HBb8KImooE5/yQPNcP6lQX4pdcpQo=;
	b=AJ9vXj4zSIV+AeJ/RldByZVfV8QKnkY2MPiwRTtlQEh8jJ+fkkmfo4gJoGRqcOVquI3fDb
	h1ieapAtE3VJpuVYP3yBKkhcMKeazBcyJzb75KpBbxalNowFM8wCueZ5PJKLS8+g4s4t26
	WyYbf4kx8MkbZRMQKFLfn3YXaDm/zNo+alP6CRi2epiEd6ooOGZhvEcJk6eP3n9q5YXM9a
	eEAOvlOj2uFMTQ5GPDHWwmE1xlHmBZeFM6Eej5AFmUUKOZBHkahVTA9altyJtyjuFtw/F6
	K67tCSkZSKhQYUzfmh0BU8n79Z9JPfT3BMaxhedvquEMESKVj1WOJrKkBAhMGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1729007083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ONrTJwH4wwYvB6HBb8KImooE5/yQPNcP6lQX4pdcpQo=;
	b=6nWI/9U+lBvRypx+iTHLrpwCkaN0Yq85YW0u57eKuINzQxvwacwH1fzDotVgeKNfpNVwOl
	y1ATKBD/QJg0fOBg==
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
In-Reply-To: <20241011175516.37dc061b@canb.auug.org.au>
References: <20241011135515.75317b03@canb.auug.org.au>
 <20241011175516.37dc061b@canb.auug.org.au>
Date: Tue, 15 Oct 2024 17:44:43 +0200
Message-ID: <87bjzle5g4.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Oct 11 2024 at 17:55, Stephen Rothwell wrote:
> On Fri, 11 Oct 2024 13:55:15 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> After merging the tip tree, today's linux-next build (powerpc
>> ppc64_defconfig) produced this warning:
>> 
>> kernel/time/clocksource.c:1258:13: warning: '__clocksource_change_rating' defined but not used [-Wunused-function]
>>  1258 | static void __clocksource_change_rating(struct clocksource *cs, int rating)
>>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Yes. I fixed it up on my tree and then forgot to push it into
tip. Sorry!

Thanks,

        tglx

