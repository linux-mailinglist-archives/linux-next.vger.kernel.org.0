Return-Path: <linux-next+bounces-6117-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5765DA770B8
	for <lists+linux-next@lfdr.de>; Tue,  1 Apr 2025 00:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 501CF3A52C8
	for <lists+linux-next@lfdr.de>; Mon, 31 Mar 2025 22:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 905C721A428;
	Mon, 31 Mar 2025 22:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnDDnq9b"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676E8215073;
	Mon, 31 Mar 2025 22:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743459160; cv=none; b=aqN4JAgoY46t5BAxB+0JfFnb6nWA9s11i9nLzMW3sWh1yi8X3MUaWTPRO9ta+BjmfdCSWrkJisuvPjFTZPuuYKx0BZdFKqj3KvmbDMnoqRKVxWgdL6zo72Eeh/xPQ2Ge+l1qiSPN5Q0XwRG8/wizAes/q/C3Aj7Hobm/G+gCT/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743459160; c=relaxed/simple;
	bh=ZmEEVOqTb0kAYM8Db95VajzFAGTnoSSniEzBUsF7BXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2nqlgSj0MSs4EIVXQ6JahsCkIzY1WKxw3oOJKCk+nX2/plphpGwcyh4rfHarmIoBmyWGmhb/uINBbMy46umW2uUkE7eCbd3SRg56Yvlos/xSBrYQ2RdGqleMJEb2ft3BrWE8Cve1Q0L6T+t2twUHZpAKsSh0vcgvJ9a1P8WtO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnDDnq9b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD63C4CEE3;
	Mon, 31 Mar 2025 22:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743459159;
	bh=ZmEEVOqTb0kAYM8Db95VajzFAGTnoSSniEzBUsF7BXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OnDDnq9bsQrWxj0kTdGfiQwJytwM9kxHt0KYlyOVE721H49iM0ylSbt/n+QdJFikO
	 U4rIe8UGAHsj7MbhHL7zkISfF9gaiEWQIaq1oDXC0S+QMVyLxQz0xGcad0Red3Ou0m
	 yZw75jzZ4c1IZPsVQ2IBMsJxMGoHuFMb9V3fYsg8Modz8ZhfPQukbW9GO1R4r4j31k
	 Ubu9x3JLEgdVuetpg7XBr96CnnD19K5NGYnaSEa9kOCAIIDjTMcsmDsQrNg5PCz6Bt
	 ARXg793U38EpFAITre6bmgL6yKfCbdFAIoWGSZOjYr5Semsntn47UFMuRKWauCg9yp
	 s5xEVIIPe+Lng==
Date: Mon, 31 Mar 2025 15:12:38 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, paulmck@kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: linux-next: Tree for Mar 31 (objtool warnings: RCU)
Message-ID: <d5a6xgr5n4sw33doyzbkypt5uwovy6kaiq6cl444jgpkc2licx@qzufobtaoylq>
References: <20250331171209.770159dd@canb.auug.org.au>
 <d1eca076-fdde-484a-b33e-70e0d167c36d@infradead.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d1eca076-fdde-484a-b33e-70e0d167c36d@infradead.org>

On Mon, Mar 31, 2025 at 02:22:23PM -0700, Randy Dunlap wrote:
> 
> 
> On 3/30/25 11:12 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20250328:
> > 
> 
> on x86_64 with gcc (SUSE Linux) 14.2.1 20250220 [revision 9ffecde121af883b60bbe60d00425036bc873048]:
> 
> vmlinux.o: warning: objtool: irqentry_nmi_enter+0xa2: call to ct_nmi_enter() leaves .noinstr.text section
> vmlinux.o: warning: objtool: irqentry_nmi_exit+0x16: call to ct_nmi_exit() leaves .noinstr.text section
> vmlinux.o: warning: objtool: irqentry_exit+0x78: call to ct_irq_exit() leaves .noinstr.text section
> vmlinux.o: warning: objtool: __ct_user_enter+0x75: call to rcu_irq_work_resched() leaves .noinstr.text section

Yup, those need to be __always_inline.  Will fix.

-- 
Josh

