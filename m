Return-Path: <linux-next+bounces-2558-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A013B90915F
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 19:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5653B2120B
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 17:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ADAC16D339;
	Fri, 14 Jun 2024 17:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CDBUNfek"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3E815FD13;
	Fri, 14 Jun 2024 17:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718385711; cv=none; b=DaaEIticxNS0Ts2drIGsmUhIXFLocSsgAoVn3qtiNRDHqJzgybMqpsM4B13mm8RYaDfm02K4ZNVtV2Uiw+zPoGNR9lcnsWRiv2SUaSTV83oCGeUJkQSJNX1Ij652/DenhNw4fm5zM4zo5Bj0Pgq3znJMqIVRZAObAxNYByanbxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718385711; c=relaxed/simple;
	bh=P6JtOjCs6Jj3m4upHVfTuWBdfTxPaTKNa00iSGnrSbA=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TpE4cYXLuOLtCduvuAry9iffXLKhaK7Ru7U/+Q5SJa1PlxQOrb1jB5O6kHO9ITjGryk54Pjp6uTvgyaDNF7BJvcUZElDfdVPS+Y1Y0BTMWeI1WKa9dRO57XGISIllhbNLXj2nEhfR1QdSOqFpXTe8AtfA3mNnV/9kkgmo4BqoVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CDBUNfek; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4C8C2BD10;
	Fri, 14 Jun 2024 17:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1718385710;
	bh=P6JtOjCs6Jj3m4upHVfTuWBdfTxPaTKNa00iSGnrSbA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CDBUNfekePxrjpUgM4+htLAUDXr17ezDLUgCh/vX5jXsJno6qwWfIAwXMgT+egUYB
	 AOkEkoFrE6ugrNb6ANRtEJrDYc11NMyFmOiHBpLDNiwXlf97VqpbfNql98B+po6h7e
	 gntqUfebPK6yjawrUFef5RAjC22kEder7Y95AccQ=
Date: Fri, 14 Jun 2024 10:21:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Bert Karwatzki <spasswolf@web.de>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: commit 1c29a32ce65f4cd0f1c causes Bad rss-counter state and
 firefox-esr crash in linux-next-20240613
Message-Id: <20240614102149.f752c1609106b97ea302ccf0@linux-foundation.org>
In-Reply-To: <w5uejhiciolye2ikgsdjim25z7lau7km3tu6t2vby3kuxeshos@osowmu4ecng5>
References: <f4ea65e28ac47e6acb13f401f46a414a2f50f7bf.camel@web.de>
	<20240613170351.cc3e7ccfa1bb198b57f31352@linux-foundation.org>
	<w5uejhiciolye2ikgsdjim25z7lau7km3tu6t2vby3kuxeshos@osowmu4ecng5>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Jun 2024 08:30:20 -0400 "Liam R. Howlett" <Liam.Howlett@oracle.com> wrote:

> > 
> > > (these are the error messages of several crashes and the error seems to affect
> > > other processes, too (T1))
> > > 
> > > The crash can be provoked to appear in ~1min by opening large numbers of tabs in
> > > firefox-esr (by holding pressing ctrl+t for some time). With this I bisected the
> > > error to commit "1c29a32ce65f mm/mmap: use split munmap calls for MAP_FIXED" and
> > > reverting this commit in linux-next-20240613 fixes the issue for me.
> > 
> > Thanks, that must have taken a lot of time.
> 
> Yes, thank you for all that work and apologies in creating this
> frustrating situation.
> 
> Andrew, please drop the set from your branch.  I need to write some more
> tests, but I suspect I will need to do some work around the vma_merge()
> function, which is never a fun endeavor.

Dropped, thanks.

