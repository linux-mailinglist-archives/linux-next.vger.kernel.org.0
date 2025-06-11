Return-Path: <linux-next+bounces-7140-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B34CAD58A6
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 16:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6576A3A7000
	for <lists+linux-next@lfdr.de>; Wed, 11 Jun 2025 14:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 818AA2BD5B9;
	Wed, 11 Jun 2025 14:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PxOTczS3"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D4829ACF3;
	Wed, 11 Jun 2025 14:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651915; cv=none; b=ThUHaI0xZIW5lH1HLhSbEhhnEailF78Hxz7Gf+mvYT8Gqot41NwkuItEXIiIo1s795ltbPkBqYu2tjusiLUEBh7i3HdppvhNEuI22VqdrpPHo9bgT+MohXr5fIOiYpqqjdu/jOI+l0hBwJnFBFn+MCtKsOHoSzo94xCfAkAQj2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651915; c=relaxed/simple;
	bh=BaUwY33QL22vso/USwJ1zU/dws4QtAL5UfXQ5SdKB10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqEAXCvmRd7Va+rDUrD+FgdyhWVTixLf1RVDdjPV3NUWRAEpwRj4bGmMHDlTeR4S+mWZjSoYgwymWiafzjjAkjotZq2XG+56H/yrZ5JlPtGD+kuZTmMrft9iAh6EHUSTDEhesqaSP450KVAylvYjoFhPLmP6xvDZhNUSXRw64Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PxOTczS3; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MWhv4egdxFaSRpJgo1KQ3ZMVXfJMnS82XkkU6LdJN+g=; b=PxOTczS3UfS1Klqok7hIZtlDCD
	1M0HEP/AOMYEe76imD9DpvCXfARalIfh/C51Z8NjCOzpdG4bI2CQrwj3KF+c0GVy6BCSbx0RnSwYl
	rVAga0tPkD+f/oJiBrtLf/y8tStedxLHHouJA/agico0BdNH6/KGYV7/dMYuKFpHaHPHLX/HNVz6T
	37x50/zdKn0Nf/skcbNsDBPTOYGYDCFAJ8t1kkAH9H0ZdG4LbsyPTdiFnDR9yIpNR0cUwHoimjwsw
	YxzHq2WYpLMXK3bH9usvWZIwfxpTmxBglDretqBBmdE2ledGpt19CtEKPWyaBedKLZ0GguIm0U9B2
	2sgV1n5w==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMO5-0000000Ajos-3OEL;
	Wed, 11 Jun 2025 14:25:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 34C88308607; Wed, 11 Jun 2025 16:25:09 +0200 (CEST)
Date: Wed, 11 Jun 2025 16:25:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tip-fixes
 tree
Message-ID: <20250611142509.GC2278213@noisy.programming.kicks-ass.net>
References: <20250611221025.41c6078f@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250611221025.41c6078f@canb.auug.org.au>

On Wed, Jun 11, 2025 at 10:10:25PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Commit
>=20
>   cdd0f803c1f9 ("futex: Allow to resize the private local hash")
>=20
> is missing a Signed-off-by from its author.

Oh gawd, that commit is a right mess. I'll go rebase that tree.

Thanks!

