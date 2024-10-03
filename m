Return-Path: <linux-next+bounces-4076-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DC498EBC8
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 10:40:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF5981F22EFE
	for <lists+linux-next@lfdr.de>; Thu,  3 Oct 2024 08:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B8713B59E;
	Thu,  3 Oct 2024 08:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="V13xVqOL"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB961EA90;
	Thu,  3 Oct 2024 08:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727944851; cv=none; b=fXjkmoWLtGvPHdqya9SMQ/WlYR+YE4+yyZ1byWdyoCJg0+Ule/xSo1gkdkC0NcG2lFhkQT8HMCAcpoo0dyif6dDuac66wcHW6+Pv2sTkznxISC/BEsYDAy/s/xUoSVO9InN2i4bW9eQe/yZEIq3Ea6ZK/azoHqQ9Iu1pWZYaP6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727944851; c=relaxed/simple;
	bh=ozsTHHN1tQdq3DPq/PBbkyMzuqXkRqtMPzkWQLhoMjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oACSS5XSamg+axEg23TB+3F7qEp/A8D20XZAtjYDwbvR2vYq+fJzKxqC5U2C2sbuJiHobjdJJsbO+nmjNdSayilH0IAAYVB6acSbLQj6WedzXPr9h4DXZQ2PsLGw5md/EjOe0yUtkCOVDTZAvSHw/sYouhxOK464KFlKxFsCkdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=V13xVqOL; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FKE4OTThlFnQ8/AKf3q8EqzQ1CuTSy2Zta7/0vgbdCU=; b=V13xVqOLZd8Pd2cXJZ/Np8XGPt
	O46djXot3BfPSvLA3GyJbIPWCWI3AA4NDRaL+SFZxZ791mjebRwuDvvsigog0MyRpFZC3lDC5+l4H
	qgEBORIDMgHPx1N3f6AbRB/gbQWVg8HhOawO/iPUM00pDiFQuDuMXpHhtyL5lez5rIqsDO1XmHiKf
	syXToKChjiIAAKirDpyZfpjS0XLYBu8HzW/wL4pPKPJZrIbmuVxvxN5mBuKUcg+0sDCp4V0CJn0As
	q2dCvELrLTad00T53N/ybtDCS57Sn0g1D2rLPyoMVnNv1Ru3BnL8T1mTXS4JJuZ2d67oha6sq429/
	z62qsg0g==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1swHO4-00000007P4v-018V;
	Thu, 03 Oct 2024 08:40:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7462B30083E; Thu,  3 Oct 2024 10:40:39 +0200 (CEST)
Date: Thu, 3 Oct 2024 10:40:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: vschneid@redhat.com, linux-kernel@vger.kernel.org, sfr@canb.auug.org.au,
	linux-next@vger.kernel.org, kernel-team@meta.com
Subject: Re: [BUG almost bisected] Splat in dequeue_rt_stack() and build error
Message-ID: <20241003084039.GS5594@noisy.programming.kicks-ass.net>
References: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c28dbc65-7499-41a5-84d0-991843153b1a@paulmck-laptop>

On Wed, Aug 21, 2024 at 02:57:16PM -0700, Paul E. McKenney wrote:

> My reproducer on the two-socket 40-core 80-HW-thread systems is:
> 
> tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs "50*TREE03" --trust-make
> 

This gets me a very long stream of:

Results directory: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33
tools/testing/selftests/rcutorture/bin/kvm.sh --allcpus --duration 1m --configs 50*TREE03 --trust-make
TREE03 -------
QEMU error, output:
cat: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33/TREE03/qemu-output: No such file or directory
TREE03.10 -------
QEMU error, output:
cat: /usr/src/linux-rcu/tools/testing/selftests/rcutorture/res/2024.10.03-09.30.33/TREE03.10/qemu-output: No such file or directory
...


Did I not do it right?

