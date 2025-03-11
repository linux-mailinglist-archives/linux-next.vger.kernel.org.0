Return-Path: <linux-next+bounces-5738-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB0CA5C1AE
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 13:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B71043AE089
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 12:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD832505DF;
	Tue, 11 Mar 2025 12:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bXATl3Ow";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="he0iUTbS"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B34225A32;
	Tue, 11 Mar 2025 12:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741697769; cv=none; b=mQMT5eezB0K4Fz4Hy02bC8v0ErDlpYKU/xc0Ej2CBA1wvNURGP8+Ly9ChyJ6XC1U3QpQG2PX3tC5o46nZzLvo2/0XhujQ2lqmfBZ8GQkTS/YdaodUEiDuZqykloF+ieiqV8dz5XXkgSthhCmwZ0YrpDm2PvQVYAm3FzYCnXpigo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741697769; c=relaxed/simple;
	bh=LnKPXToH14oLYpbZUXfvUBr9Oc+J111e2HIOb4Gn8+Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jXckrRaI9DLUVDDg3RrvSNfUDseo29V4ZCsCfcYHLS+Jc2i+2CyRFLbxJao5kutq8N3IjP8FTeEaX5MN8jS05Ie2iedNU2GtR925fOQ19lwEgwe7L0DLvNvYw5kSoGXquW92rL4irCWRxR0bjCduWeajoBHZAz1f9jcHxBvLTUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bXATl3Ow; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=he0iUTbS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741697763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gnsf0FrT5DicBhAB6QKWi/9sPeTz7JHcJEUdjBYndj4=;
	b=bXATl3OwQliRn+OKl1rhZntDdylx01g9/qQMSSFwM41wimHdT5lcYLjoQ+Q4kPyIAQWTyb
	M+Nm3qtDTSZJ1xj+y7C6uULo89HIcy/cG/dupiPmuhRXtCMMO/gSuDKVsJ4w5Qpz+EvQIq
	3wGJ7Cc8cJaoXIRThMEoutv4q1gwhoBfQU0UcdDAWGAi5Wcp05kj8M2iv0v6KiJjBsaWkj
	3HfVpPqzx4f7Q7G+sI+c/r0/6+Mz3vumS8L/aXghWqSzKhxuSkS/RDJiJXMgGWVlqJukxx
	0fdCbA/3l8yLaQKVTpAvgxKtXS6MytI4+yWtIATSOUa0LTLBXiyZta2eYoK4Zw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741697763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gnsf0FrT5DicBhAB6QKWi/9sPeTz7JHcJEUdjBYndj4=;
	b=he0iUTbS42CamtFt8rurJ6mYgkH/PQbjINAlxo+BUQT+tRtXag5G18nUDaMvFyPvFAABdi
	0gtVEIGEDcfPaPBA==
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton
 <akpm@linux-foundation.org>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the tip tree
In-Reply-To: <20250311224338.4baf583c@canb.auug.org.au>
References: <20250311150847.5a63db36@canb.auug.org.au>
 <20250311020240.3b8c34b155f76fff5cccee01@linux-foundation.org>
 <20250311224338.4baf583c@canb.auug.org.au>
Date: Tue, 11 Mar 2025 13:56:02 +0100
Message-ID: <878qpb20bh.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Mar 11 2025 at 22:43, Stephen Rothwell wrote:
> On Tue, 11 Mar 2025 02:02:40 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
>> There's presumably a better way of doing this, but it's really the
>> first time it has happened in N years so it isn't obviously worth
>> investing in setting something up.
>
> This is why we have shared stable branches.  If the tip guys have all
> those commits in a branch that they guarantee will not rebase (or be
> rewritten), then you could fetch that branch and merge it into your
> tree somewhere.

tip timers/vdso is stable and won't be rebased. It might get delta fixes
on top, but that should be not a problem.

Andrew, feel free to pull that in.

Thanks,

        tglx

