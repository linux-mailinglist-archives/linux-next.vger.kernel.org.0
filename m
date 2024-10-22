Return-Path: <linux-next+bounces-4359-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 868969A9636
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 04:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C4C97B21745
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2024 02:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDEC136E30;
	Tue, 22 Oct 2024 02:22:42 +0000 (UTC)
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5239E132124;
	Tue, 22 Oct 2024 02:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729563762; cv=none; b=IqRFSyxgJ6s+mIax4QeASsM9296t402uHXPbAdhMjLX1+oCh8+ebO2RqqTQ8ewwtz3iMdtxWE6vAXpHK6Rm31n4KWauEOV4kOsIvsGJNr9QeYeUvC3fQmardU62YGjHwy0tKBi8lqu/HNAxMKbsIOluiuQqFdcChPRiHUhf1w+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729563762; c=relaxed/simple;
	bh=2a3w8oGbXsSi9zfA1//J61n38C78KNX+XqsERod9J60=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yeo9RfOLtnOM9xuA6hLsi3nomhGBlaTsmmYFOig36ZoozAxRBwzNccw3pKYt5fVTcju7XXBFenWBby3dc0QB0jm5qLrgTCxZ1ewb+ZE/sYbg1EcjoLJEqGMmmFDS6Y/N+wIm5jzKahs/UXOOyBbpKq246HcprWljZDjqAHd9FVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24AA8C4CEC3;
	Tue, 22 Oct 2024 02:22:40 +0000 (UTC)
Date: Mon, 21 Oct 2024 22:22:36 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: linux-next: manual merge of the ftrace tree with Linus' tree
Message-ID: <20241021222236.3670ab79@rorschach.local.home>
In-Reply-To: <20241021132636.39d409f8@canb.auug.org.au>
References: <20241021132636.39d409f8@canb.auug.org.au>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 21 Oct 2024 13:26:36 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the ftrace tree got a conflict in:
> 
>   kernel/trace/ring_buffer.c
> 
> between commit:
> 
>   09661f75e75c ("ring-buffer: Fix reader locking when changing the sub buffer order")
> 
> from Linus' tree and commit:
> 
>   1f1c2bc9d075 ("ring-buffer: Limit time with disabled interrupts in rb_check_pages()")
> 
> from the ftrace tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Thanks, but I screwed up my ring-buffer branch. I have a new one
tested, and I'll be rebasing it today.

-- Steve

