Return-Path: <linux-next+bounces-3368-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6366E958C7E
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 18:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 952C41C21BDC
	for <lists+linux-next@lfdr.de>; Tue, 20 Aug 2024 16:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8840A1B8E8A;
	Tue, 20 Aug 2024 16:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="d7D6BxcO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zrO8ccSA"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B3918C92C;
	Tue, 20 Aug 2024 16:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724172079; cv=none; b=dhapTev5nfKBcUR8/2WHLsAl55taMBB2FLhQR2158eNWDPaR6eNcu6Ii5Kwgl2+Xwsj7T5tKn1TzQN3viPq8D89miZtMusl8Qs2a4MSz4EvSWuS/ipxfi4+GvfmM+41XGCBCALCfcYh6WIofIyHDNpClQBe3g5CmW7MbWfz8TZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724172079; c=relaxed/simple;
	bh=2BgMQWnE6AnFzThtFk+y0zPJsHWZhJh+IjfNq9ifaXU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=n4ZbF4yDZ7250bkox6p4ToYlIjbDCD4FJ4eMz4Gzbpna3hnqZXVg1wfl86DRs52EDYGZ2/7b+Gpe7RRNu1ROVDp9OHg5Mxx8LHXV0FHRvNPIJgeYYoHnTo3tR9/T1Ql1RJXtXWyFpqa1OCSFxaetPRMz3vAmlRm4e5Ug3IGGYBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=d7D6BxcO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zrO8ccSA; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724172076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p44GcnqNmnAYJCHzPD7nfC5avisxQIOEdIVIsvuCwRw=;
	b=d7D6BxcOL8bVWUtg8IUw6cbOMgqV2z6nrsTODWCnQdy8iDfWsjpLVWzpACvcRXOLAoDXtd
	pT7dAyr0VQoNExMSTXtheQXfjZVbaKt3z59+Rdbr1mthByfS0gJFLF5zqgRAHGeRVQH4eS
	3fU9hlzZ8uiJKkkAVvHoWqwdW96B2k0TZ45mYbcm+uviZh7IVG0SDzKMzenmQtlovKt6eU
	Tu9JPfC39oKuyHUwoSgYPSsLLs+BDQAvEseGqOcN/AIBu0bAbXgBknz4j2Gfw9eRIkmbeV
	QKuqwLG/XV/T0gL/E8Ju9hABQ7ieO/mgR80mIVT3CBXeoXY5C3Wat+3mqfHGMQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724172076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p44GcnqNmnAYJCHzPD7nfC5avisxQIOEdIVIsvuCwRw=;
	b=zrO8ccSAX3LwHDbsWKms7xFb6GSiFdmYs5mL3lVbLn/XlC3tvClZMXox0DE0KsfANaLaoD
	SJWJGUuemsLPlaCw==
To: Stephen Rothwell <sfr@canb.auug.org.au>, Ingo Molnar <mingo@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tip tree
In-Reply-To: <20240819080923.39087b2e@canb.auug.org.au>
References: <20240819080923.39087b2e@canb.auug.org.au>
Date: Tue, 20 Aug 2024 18:41:16 +0200
Message-ID: <87h6bfjger.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Aug 19 2024 at 08:09, Stephen Rothwell wrote:
>   50059ccaa3c9 ("irqdomain: Always associate interrupts for legacy domains")
>
> is missing a Signed-off-by from its committer.

Fixed it up.

Thanks for noticing.

       tglx

