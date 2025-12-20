Return-Path: <linux-next+bounces-9497-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E22CECD2F00
	for <lists+linux-next@lfdr.de>; Sat, 20 Dec 2025 13:52:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F7593016CF7
	for <lists+linux-next@lfdr.de>; Sat, 20 Dec 2025 12:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0A6F28850B;
	Sat, 20 Dec 2025 12:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Yn6JYeis"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE66D1925BC;
	Sat, 20 Dec 2025 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766235130; cv=none; b=RzZ7tcQirQhtjJ/U+ubgzKfDp5jV60VabGo3icq3DyZcNr7Z/ARKff7WOMBPCnvdRJTSrWbVTaMNeToFbsOXpUVxk6fSsDyCMioTvxoaDP2EJmgTFsJTsJMftXBHAvuTEto+pysTvMcambhJ8V8eP+KeE78WgGdLKauUBPEbkls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766235130; c=relaxed/simple;
	bh=tWm20/+cXLus9beoe5QhI8HD8SrpOzk+xo49jrqyxpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzaMCTagu+yi8LLJZPuM2BB8ZLFYQ3FXqavg3RFak4ppZLEKvt1V5tJaSlz0JOs+3d+hVv8OLh9dkxydX6dQKNE9nmQQWZSm+yKuFY6e8AnOeD2yDGDIc4pinmSPvaT7tnFXvJkY8/AUVg05YgqBRbPzx8NvAI248LW5HR26Fi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Yn6JYeis; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=y9LRU/tsqzTP+0etrwgZFHv2yi1/U7F5m0QCtyhoT/s=; b=Yn6JYeisKn0+pkzNTy5AHZ3Toc
	lPOeRvdh1poXR9bpp9BHzbKNZLfHgd3x+TIMPDZ6P8oV306WxU4z/fjLaywO12CgyvYYv3crsUyI4
	0sRe120G6Olt2VioeSilqEplwe2i1H1vv7yl4v/HOxVzHgAXmz9Wr79/2zIOrV6y6XYud8DM8qbxL
	WPc8CpzPDTfGbwVNpHvhT7oGYNCX5rRy0kjvKI1ThScXh8U5TsZO1+tm+MgcmL0HGkZt6iAEj4fur
	vGCKJELzvIWoqRCNuPe038BnNEC4nOwvT2WyWTRLxKonCYFH47hcpGMu95VTWhFA3R6PK8CcfhV13
	q3FtjrBQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWwRG-00000008y0A-0pkT;
	Sat, 20 Dec 2025 12:52:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B7B24300578; Sat, 20 Dec 2025 13:52:01 +0100 (CET)
Date: Sat, 20 Dec 2025 13:52:01 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
	Mark Brown <broonie@kernel.org>, kernel-team@meta.com
Subject: Re: Shutdown-time hangs in -next in locktorture
Message-ID: <20251220125201.GZ3911114@noisy.programming.kicks-ass.net>
References: <7f63c3aa-5cf7-47a6-bdd9-d16d9ea65c63@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7f63c3aa-5cf7-47a6-bdd9-d16d9ea65c63@paulmck-laptop>

On Fri, Dec 19, 2025 at 04:29:26PM -0800, Paul E. McKenney wrote:
> Hello, Peter,
> 
> I started hitting shutdown-time hangs in next-20251217 which persist
> in next-20251219.  This hang happens on both x86 and arm64.  Once I
> figured out that the failure is high probability, but not deterministic,
> bisection converged here:
> 
> 5d1f0b2f278e ("sched/core: Rework sched_class::wakeup_preempt() and rq_modified_*()")

That commit no longer exists in tip/sched/core; it was fixed a few days
ago, except other problems made -next use an old tip branch which has
caused this fix to have delayed visibility :-(

