Return-Path: <linux-next+bounces-8843-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC044C350A5
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 11:10:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B634F4E62D1
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 10:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D4F2EC083;
	Wed,  5 Nov 2025 10:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ESmxx5WK"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ED32EA171;
	Wed,  5 Nov 2025 10:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762337416; cv=none; b=BMTvbrCaVPd9GiZO8hNXTcpMezvmal4WMMbhLb8Zwoj1fWe0gArFDl3dVIFkCj8BCqyd8uZim02nVvW8BSsriCNAe30wGv2kht3hWOV8kw4KmnZqrngsfR8VULgNK3t/2/WcETcbWQnujZvzW8DFLv10AjepAT5t8L0LVNemsZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762337416; c=relaxed/simple;
	bh=pEHq23DTK9plrekMdZIjwAiPfgbJQh5bAa7K8rvaR5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hZBxMHtzl8vqXx2T7wFxkb9tPw4RB3XokkwaNlvTivyb1o7Oxqy7b0d9OAYwTritASw2H9sNPMxX0JD7+6cN340WXxO49cHPAT5WSFD5oTGT1b+cw9TlrKek1lnKBvXhd6hUjm2l8aFxydSWVPiIkDjtmeaprTqsWuBEWy2OFPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ESmxx5WK; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nt39HxPM8LLaNNK+bTw52CtFLk7Av+K6+6gKwldjM1U=; b=ESmxx5WKfKSb2Hu24mTO8usLTA
	9y4wgE1xDI9NFkGiFxQLZk3ssga+EARhQBkgiL07hOkSkUAzX5nNv5nYQOfJp9VqAynNsOr4eiba/
	99PvBEPGmS8MykQEcY21kdfaZFfSrJXE4FrjIT9CHIywwq5V+jBO1yL0EFqkcKp1wuEpNLyZZFt+P
	+Hp8Prie+1idMJ/mPl8rGvizYbOJ2tZi9sK2impWEgiHNpaF8eDdOz+5VXg/Ab3lK03yV09GamgYA
	MG1eGw6OxYS/HV3N6sBm19qNvjmSHhzWhR3zieGwpAPngwwUoXTsHdY4wsjVNgJMxWwDunn9pAbEJ
	s95NQvPQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGaSw-00000002U7b-3h4J;
	Wed, 05 Nov 2025 10:10:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EC29F300230; Wed, 05 Nov 2025 11:10:10 +0100 (CET)
Date: Wed, 5 Nov 2025 11:10:10 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, nathan@kernel.org
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: new objtool warnings
Message-ID: <20251105101010.GA4068168@noisy.programming.kicks-ass.net>
References: <20251031111515.09c9a4ed@canb.auug.org.au>
 <20251103091006.GV3245006@noisy.programming.kicks-ass.net>
 <20251103203256.5ac39302@canb.auug.org.au>
 <20251103093804.GY3245006@noisy.programming.kicks-ass.net>
 <20251105143027.214f491c@canb.auug.org.au>
 <20251105085637.GO4067720@noisy.programming.kicks-ass.net>
 <20251105100014.GY4068168@noisy.programming.kicks-ass.net>
 <20251105100202.GZ4068168@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105100202.GZ4068168@noisy.programming.kicks-ass.net>

+ Nathan

On Wed, Nov 05, 2025 at 11:02:02AM +0100, Peter Zijlstra wrote:
> On Wed, Nov 05, 2025 at 11:00:14AM +0100, Peter Zijlstra wrote:
> > On Wed, Nov 05, 2025 at 09:56:37AM +0100, Peter Zijlstra wrote:
> > > On Wed, Nov 05, 2025 at 02:30:27PM +1100, Stephen Rothwell wrote:
> > > 
> > > > These objtool messages have returned today.  No change in compiler.
> > > 
> > > Yes, Ingo also reported them on IRC, let me go investigate!
> > 
> > The below cures things, but I'm not quite sure why they show up now and
> > not before. Let me poke more.
> 
> Also, someone wrecked the build system.
> 
> vmlinux.o is no longer a valid build target, and the vmlinux target
> seems to build a ton of module stuff :/

