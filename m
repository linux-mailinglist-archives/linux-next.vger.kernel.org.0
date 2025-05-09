Return-Path: <linux-next+bounces-6628-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E007DAB0A4E
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 08:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60CC54C3585
	for <lists+linux-next@lfdr.de>; Fri,  9 May 2025 06:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B987526A08E;
	Fri,  9 May 2025 06:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zjso23WF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="m2elasvB"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1C6264A84;
	Fri,  9 May 2025 06:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746771126; cv=none; b=iZ7HgJD1ujNm676cB+wZQfD5t2M2fIYKxqP0tIV0csqPhr+rX1ZR8AKArvpCKmwpQpDi0NOTm8JFt0Bm5b2WUDi4UdYSuS5i9hFl+bWl1GsOWevzynw6ji1IwM6EhLTw1aXUIR+RN1tmcANsUVz60+M4CxdpqYHLN+N8pW3P9Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746771126; c=relaxed/simple;
	bh=EBOGrAw4Os2phUDIo9oV+zsZr3pz5AX/0UCC8ECPHYw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YcBXTimb5bfVLv1k8M0+EmUVWAIOrTD9aOvpYcRCAVF1g1Em2g9YnNJQcJDchXkjozdp39zsA1y5dEW09y/Z1X6KAiPM98Zw2SAznrsJ2z7Yw6ClGN+/bVv6LCMshuxx+kTAnzYI8XSds1/7eAbxFX+7yZJ0370A+EH4gpu0kvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zjso23WF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=m2elasvB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746771122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gQhL/zyL49irqKyovfJLz1V1udPg6T5kLoJ7hlE7PeI=;
	b=zjso23WFgU+4rv7GJc1BegpJV1XWNNfeHwWdBJA2bcQLX/CMDLGUxO1ikiWwzQ93b95YVH
	xuXG/hiDYQ241qAsp8SjLBGB+zIUOnXSusBXoD4I62ut2avhIrjOb1wOuxwemNNPo3wu+f
	r6jv7G5Lglk8tEfJJKrbpELXKs4PHGvPANsP4tXadf3fT+XIfzzkIqNwBAEbJYSxjm1hy/
	N2UGYQlQRxnIG5wCqF8HI792lbWAsEvRg8o+QAQQc47L+6x6yMaue0W2QvOeJQu0qPkMLb
	8oZtht5XVVC+86p1nmYCFhCAb0qdLxJTC2ZXgxhrZ8WroDFtrls1cU1Wy8rqgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746771122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gQhL/zyL49irqKyovfJLz1V1udPg6T5kLoJ7hlE7PeI=;
	b=m2elasvBKh2AfN0UtHut/CqU7Sz7jTdXh7jTgiapvsVYZztb4k6aFVFctg7HMdeZe1poux
	s+AZ9+ozns00CECw==
To: paulmck@kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org,
 kernel-team@meta.com
Subject: Re: [BUG] Lockdep warning from "genirq/cpuhotplug: Convert to lock
 guards"
In-Reply-To: <a6f59b64-1604-4186-8a75-8ad776974a65@paulmck-laptop>
References: <a6f59b64-1604-4186-8a75-8ad776974a65@paulmck-laptop>
Date: Fri, 09 May 2025 08:12:01 +0200
Message-ID: <87plgil3da.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 08 2025 at 15:29, Paul E. McKenney wrote:
> Testing next-20250508 with lockdep enabled got a splat that is shown in
> all its glory below.  Reverting this commit makes the problem go away:
>
> 88a4df117ad6 ("genirq/cpuhotplug: Convert to lock guards")

https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=irq/core

