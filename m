Return-Path: <linux-next+bounces-8772-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1021C2420F
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 10:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F6FF188E2A2
	for <lists+linux-next@lfdr.de>; Fri, 31 Oct 2025 09:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADAD330D24;
	Fri, 31 Oct 2025 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RP/fNbsQ"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DDB31326D;
	Fri, 31 Oct 2025 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761902517; cv=none; b=Br3YyCMEYn8xNTqOwW7AYNElHYqj4ypcTJPMNExAwP/ros9e8dbYBtQ6uAjc2SBueYHeMHG1lz/WKGCm8GFZ80jwvSga2RA9fy/uRWll+o/mwWI+6cL9Y1JGJ+PjOquU6s4ahEHZgeRfCDUvv8yTBCBFGmIOAec4ZXt8MpbeX1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761902517; c=relaxed/simple;
	bh=P8lmUHVy6+JErlTKQ11ZXwHGapmy5YNjMPzeJKhB1dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2aIJQ0eSOTZGNvkGPTvFbny1g2pI0AJIV//+4gLpv7Yd2bspWNIKqlKJ99T5MBDB0McP1e/NptdCsAAYoZ36WhSOLnXiALit4zVEYkdlRkdMx2ND9CA8IjP5qNwBJtAe4hpCaTr+rTfuIScP1MbTbO7/tANXzZzmMUJrxGkoJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RP/fNbsQ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=P8lmUHVy6+JErlTKQ11ZXwHGapmy5YNjMPzeJKhB1dc=; b=RP/fNbsQk07nW3vUX+hvsiwaOe
	9lD48FP8byFXMlFETq4xellwFUPnQMMxJjZwIK/CXcacD2/8hVeG1knwJGVVwaB+MQbIsHTpBebZ8
	Tq2nD0XxlpjjQIsc71WoW6+j9vn8tD4kKOK0tQIY9+up7Vm6njtrsz5KWz0Dt0N/wxOla/p20vALT
	U6Epbt9bGkBGwOTYfma76Qw3lrA6DdxPFhW3zF/Jlsk0R3ER1+LYp4ooiU24p0I0IuetoiEOIjVKK
	GCuhwSEUN30miNSff6L3vtX4azBUMhdAQo48vqr75YJoflAqTKZ4Jko9mXdqT0WUDO7POajMxhMNN
	fZPWe0sA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vElKQ-0000000BDIS-0tr8;
	Fri, 31 Oct 2025 09:21:51 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 29CC730029E; Fri, 31 Oct 2025 10:21:50 +0100 (CET)
Date: Fri, 31 Oct 2025 10:21:50 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20251031092150.GS3245006@noisy.programming.kicks-ass.net>
References: <20251031120243.4394e6a8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251031120243.4394e6a8@canb.auug.org.au>

On Fri, Oct 31, 2025 at 12:02:43PM +1100, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (arm64 defconfig)
> failed like this:

arm64-defconfig builds just fine on tip/master, must be some conflict
with the arm64 tree or so. Let me go have a peek.

