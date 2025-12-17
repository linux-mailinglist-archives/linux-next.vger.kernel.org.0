Return-Path: <linux-next+bounces-9446-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 62077CC912D
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 18:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 59F8A3007191
	for <lists+linux-next@lfdr.de>; Wed, 17 Dec 2025 17:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4621933BBBB;
	Wed, 17 Dec 2025 17:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RFV61cwy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qWWjo1wJ"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B705B22C32D
	for <linux-next@vger.kernel.org>; Wed, 17 Dec 2025 17:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765992674; cv=none; b=eTD5Is39EKlqwP0s1SZK+3Uzpg3MosTOMNIIidmKQJEXd3cEaQyj2WqJx8xHsfovRowIXfp+EDW1uULOPa3IJcr/qJudOw2CdO+aGphAEzseBCdYIwdgY51+Q4kNjvloH45zVPNTe8KEO2Ni1EjzIJWlGAAluMIh2nS8bQnv+XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765992674; c=relaxed/simple;
	bh=hQsYAIqDrRXg0r8g4XwZdF1T2e2CQF4iC1hiQjxadf0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h87Y38iR1r/gHu/55eHBwcAkUP7gco0dDD5ZpEGkpNkviAcROcbMIRBjf9MMTlCzgaxa9sNGK2EDyMHN11zTYVXdDsXshf4ZSWSiFyyJGuJtk9DO9/hEeCgJxkg5Hcf9AqOCkGxrJJ/w6YQ1gF1PtC//6bDNE4COtP7YitXicpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RFV61cwy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qWWjo1wJ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1765992671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PqeMNGjJyPXkpcP70Kvy/xsxscAUTTtTXVs7cAEpLtU=;
	b=RFV61cwybx5GgFTsxF68RkL4jlucFNo6yj5wFmxAaw7ZTzp12j1WR4tMSlleXnmQgt18vF
	Xn863h9abC6EPXJJeIYHkiT+GUjG2XoGxtgzwP5m7KzuxgJ/GBgypgGpMIT9wUOG7Pgg/t
	+fAOxCaETIv/pwjq2NfGDm3dM6JtwfVAnqKY1keBcbFTfpgjOJllq5mvEUGV29MZgWBAuC
	S2+1H393TH1FKj5a18JPg/lJb2doiuhSUmC6iNTXOW8KQCVS6tVk105cy8NeBRtQxDs27+
	eaAUodmwlmhES5eEzC1mkWfRzB3cMg4s6uPzrn7jiFqk1Vl7VCyWRyr1YyB39Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1765992671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PqeMNGjJyPXkpcP70Kvy/xsxscAUTTtTXVs7cAEpLtU=;
	b=qWWjo1wJN2ulua4vHced8Jns5JZrKjwiHl/gU+Ih7LCqrnmA4BXnuyT3qgUDT6rO0fDjEi
	CBXlhytb3Sa0ZQCg==
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: KernelCI bot <bot@kernelci.org>, kernelci@lists.linux.dev,
 kernelci-results@groups.io, regressions@lists.linux.dev,
 gus@collabora.com, linux-next@vger.kernel.org, Nick Hu
 <nick.hu@sifive.com>
Subject: Re: [REGRESSION] next/master: (build) initialization of
 =?utf-8?Q?=E2=80=98int?=
 (*)(void =?utf-8?Q?*=29=E2=80=99?= from incompatible pointer type...
In-Reply-To: <20251217164346.37b36bea@canb.auug.org.au>
References: <176594754327.3108.9546235188357594114@77bfb67944a2>
 <20251217164346.37b36bea@canb.auug.org.au>
Date: Wed, 17 Dec 2025 18:31:09 +0100
Message-ID: <878qf1c8wy.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Dec 17 2025 at 16:43, Stephen Rothwell wrote:
> Caused by commit
>
>   1c546bb43361 ("irqchip/riscv-aplic: Preserve APLIC states across suspend/resume")
>
> From the tip tree
> (https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git#master).
>
> The call back arguments and the registration method changed in
> v6.19-rc1 in commit
>
>   a97fbc3ee3e2 ("syscore: Pass context data to callbacks")

Right. Geert pointed that out already and it's fixed in the offending
commit.

Thanks,

        tglx

