Return-Path: <linux-next+bounces-8839-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAC8C34A6A
	for <lists+linux-next@lfdr.de>; Wed, 05 Nov 2025 10:02:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 341244FEC85
	for <lists+linux-next@lfdr.de>; Wed,  5 Nov 2025 08:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 892742EC579;
	Wed,  5 Nov 2025 08:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cu6/Vn7f"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0244D2EA479;
	Wed,  5 Nov 2025 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762333003; cv=none; b=LbjtTwA7mi/8H2IHhLA8Zbw7mLoHPCYblwCO3ObYNiNTPUnXXSJ3PAnacKYo81Cvq2XzHjZMHtxxM0e50U7bC7br8HwaS9fwWioFsXPtHwcR3vf8FmjdMZcLW6FAhaonKODbIDqXnUz1Id/bs5dvIUbQ/wBCmZ7gCf6IFUoKKsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762333003; c=relaxed/simple;
	bh=FtZ09HnczsfmJHeK6VIVud5Z/XyydU0A4O4OKqEko4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GM8yjT0+KNTm/jy8PlYrgBmquwRXLkWFTwD1LAGH+YoOIlJ7NL2fjZe4V+1Egf0L+y0SNRbGdyhhI0F4MtlOBjyfBLWjeUVOxCgNJUwbEmFF7fbyKH8Fca2VKpgjmA1j1Jv722YJxJzAqLDRz3pv/EfG1AUyFTC/ity7kbW8UZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cu6/Vn7f; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DNtjIJAbQBBDXsPnvWJF1LFx1X0S2xH9jOEKzFxstX8=; b=cu6/Vn7fJHea1LIJw+1AtjP3/M
	QJoCbtTtTox9zQOTmbiBjmOP4hGZlDg3vWhfigaPMzCOTgjWDhZpbZOs1qhPPuOdPJvJuGwtDCfYU
	TlJ9MaJJbFtBLXySkUxy75819eLf29UAUerzwaziMOxxGek3Cj7u9p4JmMa7UlpJv4VYWmpgi8Jxk
	PeGce4n8G1uV/Es4lKUfx4bUZLal44tMwMUtpkAisCLSSciPtz9SLNnW4I7vhVJxpm2iC97dLsIPR
	OaMJYn7JdaLGALdsADnNIr9W+2hSjS3QZlM1/IMNfu0NhlS3/PouT+6fwN4Df6Pci+L0Mzb4tN3b4
	QFeDEodg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYS5-00000001fyW-0AEF;
	Wed, 05 Nov 2025 08:01:09 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 308BA300230; Wed, 05 Nov 2025 09:56:37 +0100 (CET)
Date: Wed, 5 Nov 2025 09:56:37 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: new objtool warnings
Message-ID: <20251105085637.GO4067720@noisy.programming.kicks-ass.net>
References: <20251031111515.09c9a4ed@canb.auug.org.au>
 <20251103091006.GV3245006@noisy.programming.kicks-ass.net>
 <20251103203256.5ac39302@canb.auug.org.au>
 <20251103093804.GY3245006@noisy.programming.kicks-ass.net>
 <20251105143027.214f491c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105143027.214f491c@canb.auug.org.au>

On Wed, Nov 05, 2025 at 02:30:27PM +1100, Stephen Rothwell wrote:

> These objtool messages have returned today.  No change in compiler.

Yes, Ingo also reported them on IRC, let me go investigate!

