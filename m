Return-Path: <linux-next+bounces-2766-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA4A91DD45
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 12:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D3AB281551
	for <lists+linux-next@lfdr.de>; Mon,  1 Jul 2024 10:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D20013C821;
	Mon,  1 Jul 2024 10:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="V5VVmnDE"
X-Original-To: linux-next@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418D347F60;
	Mon,  1 Jul 2024 10:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719831486; cv=none; b=ON8Msz4cLOuVlc/A2AQJRs52VHhIqPvTYdd7DInB/bl/DdgU9evd7Kyeka8Lc58LGFvYkMoGCI58p/g2al3pUdkRCOkaMcMfp9DM9T3YQM3Rec6hTCQmO3k71BPHpZ0X+YCUiEbpo9tWutXY3R8L9aYAWFqnfUZY70G143NhzWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719831486; c=relaxed/simple;
	bh=eLSpo8EbkBywOWglxP9hHArZD4JJ7lpsTEJyLuyNHf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnfzgzfzK8yDey8g6hxwuWWpRi+2Af9rFshzl9qKaKdnGl0oQqTZjw0bU2Atg/VbhUGnzsnqSadmViILxiRCE34KznbDp1w4T37XEZC2LgNPDdQ2HBNiibvyTCdPde+AUIlQMZj2gOnUlXOO1ChpYsQ2OkMKjcl9WK9VMeqCNq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=V5VVmnDE; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=emXPLS7GBemo5rU7u1Tfy3cPzCBTxwIMRG6+MZJaKQ0=; b=V5VVmnDEwuSQh/OzvqLzk9JrFe
	QcuCq+pTjKTnQiCtVzFkJqZ0ICc2M2nbgRhraPIpwDD81tFEbn+j5gYGGw+PEN82WM07sXZv40BKq
	Y+Pe2c+CK+XhuUu6u9Ky80ga7/MnJ7FzckWGueWh5ZaXDYiCvama1va6gCK/u5oa1ifWCS8gN/Snl
	RmHHqTjeSEf/2cFBWZgVK1fq+YIKHjl0He1U7QLnog+0m6fdaMNloBZVkkdV5gZUB10wEr8gCt6Ph
	80SUe5VCRIB8X2F8pzmC1JHHrnPPBk74NTTaoZmCBwmtbGTAXQ1Jw/WxplUSZqXhd0o6noApaXOZQ
	E4v7EPiA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOEjQ-0000000HFor-4ABu;
	Mon, 01 Jul 2024 10:58:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A0C2C300694; Mon,  1 Jul 2024 12:58:00 +0200 (CEST)
Date: Mon, 1 Jul 2024 12:58:00 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Wander Lairson Costa <wander@redhat.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the tip tree
Message-ID: <20240701105800.GD20127@noisy.programming.kicks-ass.net>
References: <20240701200309.5c6169df@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240701200309.5c6169df@canb.auug.org.au>

On Mon, Jul 01, 2024 at 08:03:09PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> Commit
>=20
>   a7accf658efa ("sched/deadline: fix task_struct reference leak")
>=20
> is missing a Signed-off-by from its author.

Urgh, thanks for that, lemme go fix that.

