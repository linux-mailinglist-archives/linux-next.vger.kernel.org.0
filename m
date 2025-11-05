Return-Path: <linux-next+bounces-8841-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE165C3502D
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 11:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F5343BBAB4
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 10:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2A72BE635;
	Wed,  5 Nov 2025 10:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WRA9Hevf"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B713022FDFF;
	Wed,  5 Nov 2025 10:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762336819; cv=none; b=Xi0J7qdnTB5UfRt7dg16s8dBuUN8SMUfy+bga15VWIab6cbuXvLoV8D3dZBkufgDVfvz2ipRqRr7gGjsCKA8IP/pp5BajZ5BYuQCGfZfX2Hs/jY2qd5KBG634IjPlntAicsrY5ee+Z9wKd+n0cHr3Ty7qIjTuXCJgucDo0PchPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762336819; c=relaxed/simple;
	bh=y5XfCnRe90zDqIcfR6P7+o9li/iq96jiZT4R84wCdGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COAi94Hx7bcym0cKf/sSGLQn0s/nFtCkIYAUSjNSoQVd1ynjxEql5VibDTce+FMgWQQo6xWkyiz4J0rUWMObNOI0hZpXu5my3ZCMCa9nZwkWWFkVWm82Cx+4jssiVwzDlODSyeKC7/NgOfWq1tePoCVehuXDu42Ej5dZkUuYPh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=WRA9Hevf; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yjCbZ8y9z25g7/me6m0P5Ikyl8/YO43uzmGCsC0V9qM=; b=WRA9HevfA9obrzHNSl9f3chymy
	gz7GBZxtDiLSMTRhMMJtI/a35Vhybz2sdQ5hsdSbAmSncSVdkTLXClj4mxr2hdSal1DDwOzpREK5f
	oacHaIfEzaPVtNVOR6V4ndW7hWnVvqnOG5Jbt2SDtfY0/HAjLHmLuA2Yd/OD+3rFMIO71mtpWeIFQ
	QcUN7qNirIyeBpCeTe33nod1AyBYGIR0j+ZSuMjjMOZYv/DcumsiJZfOpW0kH9g4Yq2ukocLoHuRY
	96/tQCIUMOmwlxu3uwoz4h+pWptlF6A2pDoSI6pfeAYtUNRZJqQyLg0din+krCOJ497qgYdAGCii+
	f5P0e8Ew==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGZRd-00000001oGq-3BzD;
	Wed, 05 Nov 2025 09:04:45 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5E0BD300230; Wed, 05 Nov 2025 11:00:14 +0100 (CET)
Date: Wed, 5 Nov 2025 11:00:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: new objtool warnings
Message-ID: <20251105100014.GY4068168@noisy.programming.kicks-ass.net>
References: <20251031111515.09c9a4ed@canb.auug.org.au>
 <20251103091006.GV3245006@noisy.programming.kicks-ass.net>
 <20251103203256.5ac39302@canb.auug.org.au>
 <20251103093804.GY3245006@noisy.programming.kicks-ass.net>
 <20251105143027.214f491c@canb.auug.org.au>
 <20251105085637.GO4067720@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105085637.GO4067720@noisy.programming.kicks-ass.net>

On Wed, Nov 05, 2025 at 09:56:37AM +0100, Peter Zijlstra wrote:
> On Wed, Nov 05, 2025 at 02:30:27PM +1100, Stephen Rothwell wrote:
> 
> > These objtool messages have returned today.  No change in compiler.
> 
> Yes, Ingo also reported them on IRC, let me go investigate!

The below cures things, but I'm not quite sure why they show up now and
not before. Let me poke more.

---
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 72e3f7a59469..6ab913e57da0 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -293,11 +293,11 @@ static __always_inline void irqentry_exit_to_user_mode_prepare(struct pt_regs *r
 static __always_inline void exit_to_user_mode(void)
 {
 	instrumentation_begin();
+	unwind_reset_info();
 	trace_hardirqs_on_prepare();
 	lockdep_hardirqs_on_prepare();
 	instrumentation_end();
 
-	unwind_reset_info();
 	user_enter_irqoff();
 	arch_exit_to_user_mode();
 	lockdep_hardirqs_on(CALLER_ADDR0);

