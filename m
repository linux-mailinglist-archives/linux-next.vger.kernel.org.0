Return-Path: <linux-next+bounces-4087-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFBD98F14F
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 16:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFFA8B20C31
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 14:22:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E511865EB;
	Thu,  3 Oct 2024 14:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="O5H4EyTf"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C6613D245;
	Thu,  3 Oct 2024 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727965369; cv=none; b=DWHUHb1TQ6jeCnRjwGFnDl0MFuV2f69nU5amE0mDHE2BRp6/FK58gfj0pg0+SuXU2B6p7/5mgj0YtM5qjcXJnKgiMDvYnYSAEYp6N2GDHHyvxEjbKcp5Z7Oo9KZj/VZcDgsZIus3kZk5BGFPyunciOf9aPgOfXUE2ecbX9qQGQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727965369; c=relaxed/simple;
	bh=N+4jLruOY/voPlwgOR8vIkDt22CK5Tu1S+y14Dt2crM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/7zVTu9rxx983LAkrjZ7iux1Ytl6UPxhLWxL6roVq6oZFkPmCdOINWIvCNj4OpCnEXRfuHjnWU8yCrdG28u243A54P0fpAAo/6PAe7PQSvJpnU2r8LypWveKsj6T/n4rq+ysESbl5LmPFjgUf4zLuCL9xpL+ZU9fjmkiFw002U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=O5H4EyTf; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GMQSaEYRKipoUz2TKW6qIhrXIia89gFO/eo4ruiFZvc=; b=O5H4EyTfYA0wkkImHQRoZZS6ZY
	XgMbP0ROjDCnVnqM7hrSUelCK16tHL3CVpgDjPkrQl7lPwrqa8qRJS8jKVeT+OwnZ16YRDYonAmeq
	yymJVg1Ip5homJ8JHz9d2pa7HjvnVXZ/EY7UPYaNvvYaCz6SXiAlo2caoXLrM8oPhv2thUEbKitMd
	lVwmBRC5LX+HBls405UtVqx8cpkIzceR6zQL1MvA7cjWX0PKAcA2BQRlKMzbPh6b0s+SSf61xGIGx
	n/Z5MjHUP+rs+Ujc2/2XaXwSY81P70W88PrCRA5BIZCwC1zQcP2hZ0yoJN2Tpr53mp4ZMRj+hTc7l
	cazdiyUg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1swMj3-000000080cy-48HD;
	Thu, 03 Oct 2024 14:22:42 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A8F1F30083E; Thu,  3 Oct 2024 16:22:40 +0200 (CEST)
Date: Thu, 3 Oct 2024 16:22:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <20241003142240.GU5594@noisy.programming.kicks-ass.net>
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
 <20241003084039.GS5594@noisy.programming.kicks-ass.net>
 <20241003084743.GC33184@noisy.programming.kicks-ass.net>
 <20241003092707.GD33184@noisy.programming.kicks-ass.net>
 <20241003122824.GE33184@noisy.programming.kicks-ass.net>
 <83d29a0c-dab2-4570-8be0-539b43237724@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83d29a0c-dab2-4570-8be0-539b43237724@paulmck-laptop>

On Thu, Oct 03, 2024 at 05:45:47AM -0700, Paul E. McKenney wrote:

> I ran 100*TREE03 for 18 hours each, and got 23 instances of *something*
> happening (and I need to suppress stalls on the repeat).  One of the
> earlier bugs happened early, but sadly not this one.

Damn, I don't have the amount of CPU hours available you mention in your
later email. I'll just go up the rounds to 20 minutes and see if
something wants to go bang before I have to shut down the noise
pollution for the day...

