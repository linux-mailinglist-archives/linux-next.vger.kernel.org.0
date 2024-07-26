Return-Path: <linux-next+bounces-3139-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C95EC93D2C2
	for <lists+linux-next@lfdr.de>; Fri, 26 Jul 2024 14:04:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F4371F2122F
	for <lists+linux-next@lfdr.de>; Fri, 26 Jul 2024 12:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A027917B415;
	Fri, 26 Jul 2024 12:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hxOap7oR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NHKz0INT"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62F217A92E;
	Fri, 26 Jul 2024 12:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721995450; cv=none; b=sjPDKGXwNYT38FusEtX+4m3vVOibAyccK6jWZLmI8VolJ+fAeg9yr35+BcWybFLhrAWWWnZ/gL6s4NVSJFjJxHPIiSecZEabnslrEr7O0QjSWoRKsvHoMiq+XeXtx3hnZcCkAsvk8YwP9xxddx8fkrnOvWDq53sf1GmVSPeiGjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721995450; c=relaxed/simple;
	bh=0YqH9iJIHm92Sh2TAgWayFfwywTsb9pW2qrN9nEJOCw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aVkC6ULTPD+KT5gsd58V/vTMvJwaQr+82JSrwj4wWwtSODGuHburqiBASq4GPWpBvlNLTxJTUoJdC3IY31XT92EuifcfMFvQgO+HND9Z29UYCEeJjqjj/n/UqgonBjh60+5EQxmo3V2Nf7RL4I0qgKcJIY6Ldwe5RCQv0J4dv9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hxOap7oR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NHKz0INT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1721995445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wdi/JxZT3BsPS3gnPcMFPgNFjkUvXJli8e5ax2ZIzss=;
	b=hxOap7oRVj5qWolTFEBdY/I1W8HB/QsSk7auznsk13QO2RZxqeDr/iYHGkS9yjpioQ+ouh
	MubFS0R0kZUpIvl9/MGsVd2PVIhzxgTs+BdDGDD0SYkgbqvOpWTFb+HP1YwEfMaIaeleBC
	PHZ5HQNrsl8unWrVmFsDulNZJBgVaTYdHaNZwwxfNH5ft0IoIJWhnh7hW07fOX1z7RnV+U
	Z+s4vxULkzXyrTf6O31SWi94r/ok9oIqlBtgZbvk7s0v2xHbTKSxNJBStGC5i3/uETecY0
	K4lPmmWY4oJOK1NvOv3H7PWnfzxhrjicaRJ5hlHTy4R8RvgZhwx5fKECxKEHNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1721995445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Wdi/JxZT3BsPS3gnPcMFPgNFjkUvXJli8e5ax2ZIzss=;
	b=NHKz0INTVKj8d57dONHAOOfc6GhthsSWDccBcnz7Yg4e7t7BWYjWhDqh7KvmURkZdMt/az
	gJhlmF8Pa5L9vbBg==
To: Marc Zyngier <maz@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tags need some work in the tip tree
In-Reply-To: <8734o05q2w.wl-maz@kernel.org>
References: <20240722083153.24896521@canb.auug.org.au>
 <8734o05q2w.wl-maz@kernel.org>
Date: Fri, 26 Jul 2024 14:04:05 +0200
Message-ID: <871q3gwea2.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jul 23 2024 at 12:02, Marc Zyngier wrote:
> On Sun, 21 Jul 2024 23:31:53 +0100,
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>   - Target SHA1 does not exist
>> 
>> Maybe you meant
>> 
>> Fixes: b5712bf89b4b ("irqchip/gic-v3-its: Provide MSI parent for PCI/MSI[-X]")
>
> Odd.
>
> The SHA1 in the commit messages do match the Thomas' devmsi-arm-v4-2
> tag as of last Thursday. I guess the patches have been rebased on top
> of tip branch and not merged.
>
> The whole thing is now in Linus tree, so it is too late to do anything
> about it, unfortunately.

Yes. My bad. I missed to fixup the tags when I pulled over the whole
pile to tip irq/msi.


