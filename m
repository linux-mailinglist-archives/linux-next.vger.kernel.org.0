Return-Path: <linux-next+bounces-9638-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC315D18C1A
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 13:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7581C301D0CA
	for <lists+linux-next@lfdr.de>; Tue, 13 Jan 2026 12:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B6234575A;
	Tue, 13 Jan 2026 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="bTGZN+oS"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C00726ED33;
	Tue, 13 Jan 2026 12:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768307691; cv=none; b=SmImUFo9aWeiweiZn8pWOcX030iuncjFE72Y95jVTKs8/3Z/uYoY3M/ZsifIYM6AGPvUKDUU2uHSXuwkCwMlXnKUJpzNxX49INTJ22KMEMo0XqFao2le6aJd2uTtjQVYXy02Y+X2CHs4H+/hTLzs6tjPr+ozluuXxTiLmFeOFS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768307691; c=relaxed/simple;
	bh=UwJ9tLIlYtrUrLkoaaHPB8d0HHEtqFsNU0B040zp88g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DDjiygzi1/Cf3d3vT6raF5Z3w3kbQeDY5S+VQYtf5DyppmUyt+gAyXksD7BMs40r2WzpgfleVy5/ZLkTQ+qN1bd5vRx1xAEfxOqCTFxXeomeZqPBjJWTZt09VcFGHJKvOKBV2zbJX2j+hh2IVbWlY6V0C6ptETUOnF5uTgIMeSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=bTGZN+oS; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 249BA40E00DA;
	Tue, 13 Jan 2026 12:34:47 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id GXtucEjSjD4S; Tue, 13 Jan 2026 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1768307683; bh=2CIyzx5HdNq3vMsiT6DAztvz+6NUIQA+7sv1McUKa/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bTGZN+oSmK6FqtoDdt1xvfyAx+QiLyL/9AXWKSZT7tS9C8pI61EGD7bY5huTMT/jC
	 U5Kj1yAn/kjsUWkpqLDolx1o//HxMg0wRMcOnKsyfvgRC2Nm/4uF+OQzyJl9uTdG50
	 1KFHECYjtPNefcN5ebp96rDfkMaJba6w48HVNMfE6yxqnVRnr1Xm5Gu39bwadc1dZn
	 VEPen6cBec8JEXwaW6C2eYqLETDnFylPPm2KDvi9jfUpQqbr7xt/SF3jEy6bagH7f7
	 L8Z9pR/lx9oXtAZtj67yCckFgQ4Udi9fI3EYlFBF5xRkuqV79lJxa3spsLTliR+dQW
	 e7iD65ahq04LWDvVuZpEqWV5CSOaufmronUKhTOpfDTTWsHdOXzs+QKXbHp9s3Xj0q
	 XnQhakAsXzqknfTS070xVfNT4vAPi5UfQUK26BezOLvdQkAOl5OAi4blRyEuv6FYL1
	 InSjFlJpBJLLNv1IMWBPE9QaF2FJSIsPi6yq5WLpXzSfuXAQSDtMMGHUiPdh8C6dgq
	 Q8tUjJSR8kZEYnpoJLwD/8JuA8ERJCejr01L8nitmewG77HLDlUm1mJieUhUYoo1MY
	 I2+IeP/j5n6JSG8s/LhRUIAHcCLDffQgkZDZnO6sfgviTzja1cOAjmb1tsY/OYqNWH
	 /xw2HmE8djKqN1axsXLymHPI=
Received: from zn.tnic (pd953023b.dip0.t-ipconnect.de [217.83.2.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 6C84440E0194;
	Tue, 13 Jan 2026 12:34:35 +0000 (UTC)
Date: Tue, 13 Jan 2026 13:34:29 +0100
From: Borislav Petkov <bp@alien8.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20260113123429.GGaWY71foFAmxh3XPE@fat_crate.local>
References: <20260109172955.GDaWE7E2xNc9WJlsNt@fat_crate.local>
 <20260109111744.07e51bf5c0bde0e419d09b34@linux-foundation.org>
 <20260109192404.GEaWFV1MUzYGNjq2eK@fat_crate.local>
 <20260109113921.5769acfa1d0c08628aeb7217@linux-foundation.org>
 <20260109195410.GGaWFc4o-TL_jhOTxF@fat_crate.local>
 <20260109140026.efda2135377239ba8964d139@linux-foundation.org>
 <20260111110231.GAaWODR6gOvIp6KzD6@fat_crate.local>
 <20260112123126.83e94ae2fe17829e32b0ea75@linux-foundation.org>
 <20260113114450.GEaWYwMh_v2K-nJMZ8@fat_crate.local>
 <20260113121356.GD830229@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113121356.GD830229@noisy.programming.kicks-ass.net>

On Tue, Jan 13, 2026 at 01:13:56PM +0100, Peter Zijlstra wrote:
> I think that is one of the fundamental problems in AI right now.
> Supposedly this is 'hard' :-)

Detecting that the neural network has gone into the weeds?

Probably... it's all weights and nodes, how do you differentiate what was
learned and what "just happened" during training. Fun. :-P

I just love it how all that hype gets blown into dispersing smoke when it hits
reality.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

