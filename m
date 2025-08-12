Return-Path: <linux-next+bounces-7918-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B66BBB239CF
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 22:13:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B70FE566BEE
	for <lists+linux-next@lfdr.de>; Tue, 12 Aug 2025 20:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20E8D2F0674;
	Tue, 12 Aug 2025 20:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="yXFFQV+L"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB242F0673;
	Tue, 12 Aug 2025 20:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029576; cv=none; b=EU0XKvKv4CeSo4i8QtQP/rFBLLaXY6MvvrSOL2XoxUOp8qhSNvKrvNW/qEczW5NwZyK0Irv8tbmn4KujEM3pBqAif2zzOHQx4tbjamGS7ImSidInOuhGo7gp7ZqN6FbC7oTMINaxMeqhzNIE8Q9RopW5WBT9Uih4HrWSRySgymk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029576; c=relaxed/simple;
	bh=NYQSLcw0vNoKoeTcq59Vpczm0X9l0yl9QaR6m+RIb8M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ihd2aPQLZy8czAyYqpetMkMEjvnH3EL3cPv6G9cnoO2kjUQtxSa0kjNAJH+GlS1vVjwyFSg0gxCevYGKohR/R3s2bgqj1VHkesBmcGNvy/Xb5SU5IeVOe9dMNze4+pNu4epOYPxX/3HfFJ/HsWUJQYg+23RfiwLtJljJ1+Mq8Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=yXFFQV+L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2DDC4CEF0;
	Tue, 12 Aug 2025 20:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1755029575;
	bh=NYQSLcw0vNoKoeTcq59Vpczm0X9l0yl9QaR6m+RIb8M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=yXFFQV+LGRIeLtKHZH6AYaNtF2Jgeci4X510TKbA3Tq587o5ouJ99zSqMkDqpZ7BP
	 PfC3QgwPwzSn6CgWzOLwBPkZdvZCqO00RfTdQJrHQPn0fu6P6OvUVvVjxffIJkj1+J
	 9z4xO3l2YBeNvcEQjkpIZrg1HwSDM96tT0o0UWL8=
Date: Tue, 12 Aug 2025 13:12:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the mm-hotfixes tree
Message-Id: <20250812131254.2c7d019dd5b2b406b3ff4e84@linux-foundation.org>
In-Reply-To: <CA+CK2bA=thKfEuiFZ-Nmr1ZNALC7ZcKv5uPVy2RCgc-Jy96Now@mail.gmail.com>
References: <20250812164436.557c805f@canb.auug.org.au>
	<CA+CK2bA=thKfEuiFZ-Nmr1ZNALC7ZcKv5uPVy2RCgc-Jy96Now@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 12 Aug 2025 13:46:57 +0000 Pasha Tatashin <pasha.tatashin@soleen.com> wrote:

> On Tue, Aug 12, 2025 at 6:44 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > In commit
> >
> >   25ee3c404f35 ("kho: mm: don't allow deferred struct page with KHO")
> >
> > Fixes tag
> >
> >   Fixes: 990a950fe8fd ("kexec: add config option for KHO")
> >
> > has these problem(s):
> >
> >   - Target SHA1 does not exist
> >
> > Maybe you meant
> >
> > Fixes: 4e1d010e3bda ("kexec: add config option for KHO")

Cool, thanks.

> Yes, this is the correct one. Thank you!
> 
> Andrew, do you want me to send a new patch version to update the commit log?

Nope, I made that change.



