Return-Path: <linux-next+bounces-6047-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56073A7353E
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 16:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2507E3A6019
	for <lists+linux-next@lfdr.de>; Thu, 27 Mar 2025 15:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4848C146A72;
	Thu, 27 Mar 2025 15:01:37 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFCD17BBF;
	Thu, 27 Mar 2025 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087697; cv=none; b=krFVCqf0f2mCnQY01yQhpx1+edvZ4S6tDupMqpG+UToJguoWh9RK5yH56Pnj4hB6Q6d2KHkteocHAPdX74/BZJFgxbdq1ZKLX87ygk8WdvEIzcLWnQhhZpwXr6bmNdyB2DzY+mGVBzO9bXPoCIKoz+2pkEIakTzAvs7UClw0l50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087697; c=relaxed/simple;
	bh=DjqgAa5c152SPr0+0FEIElEfWoK8C3QCr/Kacy8y4lg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L72mU8DTVpPGYVIU4PBYSpmmRfZVPZP2gFVjpd4pYdXMO60zhhc5vYH2yyCzRGMRXAUJcDxxtcYwOfVyVrOKX8Dt3QLMgCduV+urROVwPcwqUhdJtgpk/MPNU6UwUBNJte4GsQFcouUU9EK6LvVmUGHg063cqUXgj2cMv7S/UwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85959C4CEDD;
	Thu, 27 Mar 2025 15:01:35 +0000 (UTC)
Date: Thu, 27 Mar 2025 11:02:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Jason Baron <jbaron@akamai.com>, Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Tom
 Lendacky <thomas.lendacky@amd.com>, "Aithal, Srikanth" <sraithal@amd.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "Roth, Michael" <Michael.Roth@amd.com>
Subject: Re: linux-next regression: SNP Guest boot hangs with certain
 cpu/mem config combination
Message-ID: <20250327110224.68c69c78@gandalf.local.home>
In-Reply-To: <xcxcte6tzti7e6gcucf2ylfptie6kkvs2q5edup6mtzo5tenft@d2rm3p2yjoue>
References: <363f8293-23e3-44d3-8005-b31eb5b7f975@amd.com>
	<rar5bkfy7iplfhitsbna3b2dmxbk7nunlaiclwars6kffdetl4@lzm7iualliua>
	<08981771-39ac-af66-e2ec-e8f9bf6aed0a@amd.com>
	<idlcitykk3hxg5by5sltuljyjf7uanmve5fspu6dectubhy5za@mjmv4i5vwyby>
	<ydvzjdcauzyvv7hxtra6l2gh4diz7zp4wx46eqculr7azynjke@z4x6eryq3rqd>
	<4f258a96-42fe-4567-886b-e8e2b949ab1a@akamai.com>
	<xcxcte6tzti7e6gcucf2ylfptie6kkvs2q5edup6mtzo5tenft@d2rm3p2yjoue>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Mar 2025 16:43:43 +0200
"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com> wrote:

> > > The only option I see so far is to drop static branch from this path.
> > > 
> > > But I am not sure if it the only case were we use static branch from CPU
> > > hotplug callbacks.
> > > 
> > > Any other ideas?  
> > 
> > 
> > Hmmm, didn't take too close a look here, but there is the
> > static_key_slow_dec_cpuslocked() variant, would that work here? Is the issue
> > the caller may or may not have the cpu_hotplug lock?  
> 
> Yes. This is generic page alloc path and it can be called with and without
> the lock.

Note, it's not the static_branch that is an issue, it's enabling/disabling
the static branch that is. Changing a static branch takes a bit of work as
it does modify the kernel text.

Is it possible to delay the update via a workqueue?

-- Steve

