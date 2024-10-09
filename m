Return-Path: <linux-next+bounces-4190-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6E69976CD
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 22:47:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CB9DB232CD
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 20:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5AB1E32A4;
	Wed,  9 Oct 2024 20:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DmqfJkxE"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABF41E2855;
	Wed,  9 Oct 2024 20:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728506577; cv=none; b=r166GHV5EiHExXz9OO+UKzwZL/X9vsMW8K/AvLc00yEHB7rSZyIvaEsPr9fdq3Y0urQ2C5mUHvnT/pC1Ny3y6vUGzwTRs0QyZyg2uzrKpX0Lq/EefDHW+2+HbIKsGlio6UNE7TFBBxh/vQBrdaQ2BsOfTZxPFJ60j7gHLENIbnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728506577; c=relaxed/simple;
	bh=zeKKGXr+sbnGZiIl0J/Po0rwXhuW0y6Kc7Cpd5EtiWI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=EuvMpdNb7JVSKxtI01Nw6lzWDb2C+7sqQhCi5ENpBB+Ixe6MNsYwOEpsVcko9DeJuUMs5ZUgwsdKkaUiJUuVcCqA1RHu0r+U9WIFQsNA43HOwL7ssxcETyxozfiFvMeW9oTaXAAFLPCIEqJvFKOSluyQ7OU6K1+8jy3V1j1j3v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DmqfJkxE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABA7C4CEC3;
	Wed,  9 Oct 2024 20:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1728506576;
	bh=zeKKGXr+sbnGZiIl0J/Po0rwXhuW0y6Kc7Cpd5EtiWI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DmqfJkxEuG6aBoSRqZAsohmfKwvIsC5T8552XljZ9cc4mRzqrTWwm8LGSAlPt/roH
	 Uey2cspaBCQXu2VlgX17CaqjSPNJUvzJmw2rSSl/t3Ask/cAIXnEooxzMd1MwmXwCj
	 6+ePAsDMFG46oqJ5/TveuzdAyWN80qtAiyM5UNFA=
Date: Wed, 9 Oct 2024 13:42:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Brendan Higgins
 <brendanhiggins@google.com>, David Gow <davidgow@google.com>, Bruno
 Sobreira =?ISO-8859-1?Q?Fran=E7a?= <brunofrancadevsec@gmail.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Luis Felipe Hernandez
 <luis.hernandez093@gmail.com>
Subject: Re: linux-next: manual merge of the kunit-next tree with the mm
 tree
Message-Id: <20241009134255.8083566505456b4f1159a6d2@linux-foundation.org>
In-Reply-To: <51d2cb33-c0d3-4837-a22c-9c42a7a4818e@linuxfoundation.org>
References: <20241004135527.1e2fc747@canb.auug.org.au>
	<51d2cb33-c0d3-4837-a22c-9c42a7a4818e@linuxfoundation.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Oct 2024 09:11:19 -0600 Shuah Khan <skhan@linuxfoundation.org> wrote:

> > I fixed it up (I used the latter version of lib/math/Makefile and see
> > below the signature by the patch immediately below) and can carry the
> > fix as necessary. This is now fixed as far as linux-next is concerned,
> > but any non trivial conflicts should be mentioned to your upstream
> > maintainer when your tree is submitted for merging.  You may also want
> > to consider cooperating with the maintainer of the conflicting tree to
> > minimise any particularly complex conflicts.
> 
> Sorry for the delay on this. Thank you for fixing this up.
> 
> Andrew,
> 
> Looks like we might see more conflicts between mm and kunit trees
> with the move from lib/ lib/tests/
> 
> I dropped a couple of patches I couldn't apply. Would you like
> me to drop this from kunit tree?

Yes please, it's mostly a lib/ thing.

I can't actually find the original patch email.  f099bda563dd doesn't
have a Link: to the submission (please update your scripts to fix
this)  and the patch wasn't cc'ed to anything to which I subscribe
(please prefer to cc linux-kernel on most patches because of this).


