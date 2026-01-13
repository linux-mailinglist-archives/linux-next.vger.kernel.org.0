Return-Path: <linux-next+bounces-9636-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2CED1888E
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 12:45:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 805F630164DB
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 11:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ABFE346E5F;
	Tue, 13 Jan 2026 11:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Nl8cGxst"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B537538BF83;
	Tue, 13 Jan 2026 11:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768304718; cv=none; b=luBO3Qwr9E+EYZuZBEkpd9wq4HK0WbsMxa34xs3Kdm9SqYIdU8yT66cQvyNXFvmek8+l34jKEAjU0Nt+QYhOfTfPh/lHsAEFPhUSHRH4t2EHDRjhK5BaAzVUIkUuoVbB9GOG3MBCI2VJQ2etM+PnQrcMrqEk/Dradb1G8zUwFd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768304718; c=relaxed/simple;
	bh=k/X8K1pr9/ugiaE3DZw3tpmR670yUxsOr/DwbjASNWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Syzpt86pR7dH/ChaOYv6wA+uQUUBaOChf8SjVUwcb7Go/sFlbQNhTPWL6ovNvOQc2WWqT24nDmkW2fBsVETMIt9ElM2YZ8EygrF9KL6+xunbb4hDW3O/P53irjRR+NtOO9/eefxyVMXX4RuiGdQVsqRXAs1YLx//b/pjVH/9lFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Nl8cGxst; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 41B6940E01A9;
	Tue, 13 Jan 2026 11:45:08 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id WFrMfwSqP0Gv; Tue, 13 Jan 2026 11:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1768304704; bh=PjAvm+IzqZIENKxuilK5gFOxEarHebmRVLJCjUkvYvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nl8cGxst4WQL96OAQnDEfLZdXBuYe7CKjWQCfv5v1Vp7xa+LvYi2GcqjlR2ICNTuE
	 cvhQWZzim+TmAlFmnrnl1+jXlzHFahWPqPj/Gg+XIC6076YRosdzVMdl1ts/nEq4u+
	 FRANiConc8JoFyV3nyaSzFfG1MRdwSsz4tmmWfKSWpXL8Ph3qzvEfQ1zSJvwP5G2gi
	 cZbl5KAUATeMr1waK/bW455V8eHuFPmZ7+SY3grkRTz8wlvSkMsbcIp85XdTXpYYGE
	 GHSkyAtXihxXo9GNoPClRNb5jKyVSMKaYeQ7RwvjHVJoFTgIUo2ROrOWw8Gy60J+SN
	 MSYHgEnykMOOtqB0Muo/778DfAQhs64q0Ghtfkk1oVqW0cMBWHWJVkADcAMRPxcpNc
	 2tOwtWl3FKvcCBFx3fbetyDQcUZmUA416MOtJ9R/ijtkAojRfJwUF0JfA5KBj/nm3y
	 SKylaXxqk2mn5HDBnJpUe2WIY7fKXW9lyN2eW04VZqzfHXIvn2Uz0Ip8UhZzJk3rFk
	 b2LJC43kRic11koYQyofMAtVk47o2dvThIwkWau1k0Y1bOQmSvJCKPEbo17jVbE+1e
	 SReRz+kmw2n8SoP4s2S9KYkZyuIjQdXq+/PaCUMinMxutddwOYH0J8/hhnC9TfkkBt
	 VOzKfIYxXWPc1EK5h1IMI3Es=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id B322D40E00DA;
	Tue, 13 Jan 2026 11:44:56 +0000 (UTC)
Date: Tue, 13 Jan 2026 12:44:50 +0100
From: Borislav Petkov <bp@alien8.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20260113114450.GEaWYwMh_v2K-nJMZ8@fat_crate.local>
References: <20260107144753.7071f5f2@canb.auug.org.au>
 <20260107105222.GAaV465o3HUxGxBXGe@fat_crate.local>
 <20260109172955.GDaWE7E2xNc9WJlsNt@fat_crate.local>
 <20260109111744.07e51bf5c0bde0e419d09b34@linux-foundation.org>
 <20260109192404.GEaWFV1MUzYGNjq2eK@fat_crate.local>
 <20260109113921.5769acfa1d0c08628aeb7217@linux-foundation.org>
 <20260109195410.GGaWFc4o-TL_jhOTxF@fat_crate.local>
 <20260109140026.efda2135377239ba8964d139@linux-foundation.org>
 <20260111110231.GAaWODR6gOvIp6KzD6@fat_crate.local>
 <20260112123126.83e94ae2fe17829e32b0ea75@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260112123126.83e94ae2fe17829e32b0ea75@linux-foundation.org>

On Mon, Jan 12, 2026 at 12:31:26PM -0800, Andrew Morton wrote:
> oops.  When triaging Subjects, something which is clearly x86 gets less
> love.

Right. We definitely need to improve 2-way communication when we have
patch(sets) touching cross-tree.

> I'm optimistic.  Did you see Mathieu's review of a Gemini review? 
> https://lkml.kernel.org/r/6fbb17fe-f2b1-4233-9834-5a5020cd87b3@efficios.com

Right.

At the same time, we need reviewers of the AI review because I did see very
persuasive explanations about something which is simply not true. I'd prefer
if the AI said "I don't know" than hallucinating. Especially for patch review.

> Yeah.  I've been paying a lot of attention to the review economy
> lately, I'm hopeful we can do some things to help level the playing
> field, take load off those few who do so much of it.  Early days.

Yap.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

