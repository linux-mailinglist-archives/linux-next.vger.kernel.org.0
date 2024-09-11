Return-Path: <linux-next+bounces-3759-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB688975317
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 15:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A8AB1F25CA0
	for <lists+linux-next@lfdr.de>; Wed, 11 Sep 2024 13:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A7818A6A0;
	Wed, 11 Sep 2024 13:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GOvQDY0O"
X-Original-To: linux-next@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB3D19C56A;
	Wed, 11 Sep 2024 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726059613; cv=none; b=T4vtONKwTmlqskxPc0TrBzgwLhyXfvDL5p3tcYbg1uiT9y/oAQq4EXTwQUrq9pGWHbfOEecOEsHOLfpivX7rTg6BtObubjeXace91CijudDm6HULUFoED/ulDMSgzXR/tDoONDhViDFgsQzIHTrdQBhPXOWtNBmVzjauZCS6MSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726059613; c=relaxed/simple;
	bh=eZl7GMdLLi3L8qA2u8VuIPmAZvEKSeCDM0KWkFbtFEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTv1riN9yq8EDlvquOpdzS1FIO0bjT6h/zvoJLfvX9FsW8DGKPwpnIommSvXIMO2Y515uIRuemMUwe/lRyaJ8tn/vL1wdJDtJsCB0ULWoFeTB5of5eGecK16ilncnKDWHqi5rE3xloO7EQAkU3go5ORLfFIdSIqpFRqGmjfBc5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GOvQDY0O; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hSVMRsGputlYIlT1RrYrCo7vuttB4Q0ezIS5EfJe+QI=; b=GOvQDY0O2BaYGmhE9yB9FiB4QJ
	4JRGw8UJY7bvpH+q5PnmotmTdZgcHb0XnwxEUIZQaHgj25XlOI9z1JRZC8XfY2cRcltcCpeo31dyT
	yDSQ+169h/VRoh9GMFl2pk2B6EM9sTfOmkT949OzjzZfhB3z07vBHwIcrqQQ9D5XWXj6B3SQejMDh
	GAaDcllPcQm1/GgjeaZ09g2kx3CCzS44VD8n9Ydr5wf9AXKPfjve4MdAQgaKbAL3hJYKrW4KuXxHZ
	8zwI6UY7zpzVItpTJt9nWajGIRI+fi8mBkQP2hrb/uOH8aFJneqgsAxs+4+GQ23gMz6PKWG8LQCSE
	XTiDhaBQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1soMx2-00000000B3M-437O;
	Wed, 11 Sep 2024 13:00:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 95C9E300642; Wed, 11 Sep 2024 15:00:04 +0200 (CEST)
Date: Wed, 11 Sep 2024 15:00:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
	'@noisy.programming.kicks-ass.net
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the tip tree
Message-ID: <20240911130004.GS4723@noisy.programming.kicks-ass.net>
References: <20240911204015.6c5cd861@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240911204015.6c5cd861@canb.auug.org.au>

On Wed, Sep 11, 2024 at 08:40:15PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (arm64 defconfig)
> failed like this:
>=20
> drivers/cpufreq/cppc_cpufreq.c: In function 'cppc_freq_invariance_init':
> drivers/cpufreq/cppc_cpufreq.c:227:35: error: 'NSER_PER_MSEC' undeclared =
(first use in this function); did you mean 'NSEC_PER_MSEC'?
>   227 |                 .sched_runtime  =3D NSER_PER_MSEC,
>       |                                   ^~~~~~~~~~~~~
>       |                                   NSEC_PER_MSEC
> drivers/cpufreq/cppc_cpufreq.c:227:35: note: each undeclared identifier i=
s reported only once for each function it appears in
> drivers/cpufreq/cppc_cpufreq.c:229:17: error: request for member 'sched_p=
eriod' in something not a structure or union
>   229 |                 .sched_period   =3D 10 * NSEC_PER_MSEC,
>       |                 ^
>=20
> Caused by commit
>=20
>   b3a47ff09554 ("cpufreq/cppc: Use NSEC_PER_MSEC for deadline task")
>=20
> I have reverted that commit for today.

Thanks, I've rebased tip/sched/core and fixed it up. Sorry for the fail.

