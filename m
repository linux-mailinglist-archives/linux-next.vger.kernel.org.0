Return-Path: <linux-next+bounces-4221-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C652999397
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 22:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BECA1C22D8A
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2024 20:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577BE1CFECC;
	Thu, 10 Oct 2024 20:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WyUNGyG1"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E112318C03D;
	Thu, 10 Oct 2024 20:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728591678; cv=none; b=GWU0ce+IixL7mh4Zy4IStLJ9TNO79qHjz0x5iEKco/llzEqOJ4Y0MiGQJoBhmIx1E0VJE8e1ViAT2ANS9LmmFercmAVGd/mTzQOYjdsNFuQKvSPa1YP+S15sHDvnfgdhzpy7X/QVhLPTC3j9ORnGfIvqfVvRPlJeSbRWZQnnulY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728591678; c=relaxed/simple;
	bh=az3IcrvzzMCeT9v2P8hafhnnGXDngyA3eBjtOZAeayA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mkf9dHmROHSNOTtXmeqzB5yQBBTJcRegrlrOHy9EVkerIarKf8Ct45CEZX7Omul9bqEvnIbU91suURhBKLff/s58H0MwPUmOKgeTmZkmApy3hc1YD88APwRDnu+R9kIF8hjgmqIwXFBUUxZ/mxz6vKK07w/zLhTIpOKCFcI2L8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WyUNGyG1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C71C4CEC5;
	Thu, 10 Oct 2024 20:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1728591677;
	bh=az3IcrvzzMCeT9v2P8hafhnnGXDngyA3eBjtOZAeayA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=WyUNGyG1Nx21ukmuZ6En1ppO06udg3Mgzs8fRVjzbCNEgD4U3g8UQHZgYmYvPL4g1
	 l6DB6tU8//Zshd/juH5qvwKRRBGza1OclXfiOKv4nTQIYTTfywKnXNtwFBzaWyoQBv
	 PENxtbdONKehogNIsUePrdvT/Ya69EttkV1qg9as=
Date: Thu, 10 Oct 2024 13:21:16 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Gow <davidgow@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Brendan Higgins <brendanhiggins@google.com>,
 Kuan-Wei Chiu <visitorckw@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Luis Felipe Hernandez
 <luis.hernandez093@gmail.com>
Subject: Re: linux-next: manual merge of the kunit-next tree with the mm
 tree
Message-Id: <20241010132116.45f077b8a819ddd46ee36132@linux-foundation.org>
In-Reply-To: <CABVgOSmbSzcGUi=E4piSojh3A4_0GjE0fAYbqKjtYGbE9beYRQ@mail.gmail.com>
References: <20241009162719.0adaea37@canb.auug.org.au>
	<b005d39f-2b75-4a26-a78c-5cd8f7076399@linuxfoundation.org>
	<2dda047a-199f-406d-9998-fa85939e8106@linuxfoundation.org>
	<20241009143611.a3d89cdd15451641c92eb25f@linux-foundation.org>
	<CABVgOSmbSzcGUi=E4piSojh3A4_0GjE0fAYbqKjtYGbE9beYRQ@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 10 Oct 2024 17:32:33 +0800 David Gow <davidgow@google.com> wrote:

> On Thu, 10 Oct 2024 at 05:36, Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Wed, 9 Oct 2024 15:00:19 -0600 Shuah Khan <skhan@linuxfoundation.org> wrote:
> >
> > > > Andrew,
> > > > Another one related to move from lib/ lib/tests/
> > > >
> > > > If you would like to take these patches - it is perfectly
> > > > fine with me. If not I can handle these.
> > >
> > > Andrew,
> > >
> > > I dropped this one from linux-kselftest kunit branch.
> > > The link to this patch if it isn't in your Inbox:
> > >
> > > https://lore.kernel.org/all/20240924032200.167622-1-luis.hernandez093@gmail.com/
> > > >
> > > > Adding David as well for feedback on this
> > >
> > > David, I think lib/ kunit patches can go through Andrew's tree.
> > > Renaming is causing merge conflicts.
> > >
> >
> > Cool.  David, I think it's simplest to just resend everything please.
> 
> No worries: a few of these patches need some small fixes / rebases
> anyway, so I'll make sure those happen and send them all as one
> series.
> 
> Would you rather this be based on 6.12-rc1, or on the current
> mm-nonmm-unstable branch, which has a couple of test changes already?

The latter would be convenient, thanks.

