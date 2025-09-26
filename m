Return-Path: <linux-next+bounces-8500-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BA8BA353C
	for <lists+linux-next@lfdr.de>; Fri, 26 Sep 2025 12:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3CE516D07E
	for <lists+linux-next@lfdr.de>; Fri, 26 Sep 2025 10:19:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B15E296BB4;
	Fri, 26 Sep 2025 10:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YISELRqU"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0C138DEC;
	Fri, 26 Sep 2025 10:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758881951; cv=none; b=C4/jEdm/ITGcBx2t8SRlBff8zpKEiSsDY4W2SBCSWj1BaExtmHiPDg/gOS9jH9JgFUimLTIbIuYJKJo8MaSoa+fWUMNVY+uGLQbgdIDhv6YSSBaK2V9KRZxJ/wiF51ULH2ZjKx9VeGNeNkshkJn+hOMblRCucmxqhV6e4qDfrXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758881951; c=relaxed/simple;
	bh=JFDZxhbAOWY6uLKoeoQWYCsOzYG6G0mCmDq0bzhHoIU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qpZok1OhCmgrpMUuGiGdQyPzUtrT0DcyMFAIdxNI19SkSvBK20X0sjpjS3xh0wl+oJ5qmtzUid0Yq8ydKp4BGpGo1dSd4DgX41cXz3CwZ1aCdBdKjQFtM2MRbeJwlrMp2K3IwWVaBeJdOOzrmlVns3jeUuhpxJdqo5CRgW6ZYcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YISELRqU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF026C4CEF4;
	Fri, 26 Sep 2025 10:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758881950;
	bh=JFDZxhbAOWY6uLKoeoQWYCsOzYG6G0mCmDq0bzhHoIU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YISELRqU8JjUyCu0p7Yr3c4QF9KtW8c6wZLw86zXIvaPqeg+pO5usY2CcVXgTlwoT
	 uwvLtp2NTUWu+7UKkkAIV+xY+3iFrhAQiIL75ONB2PUVsbsgAhzfmRXbupYmpQH1Yg
	 gHpVhcYjilpblF0ZzAsT3hoDni0asVkowerZdZK+f1ToXhu9F/SsHj2uC2oPvzVYSb
	 gfa9UqQMez+spLESq/jJ7Q8jMtpLZ3RrONrbhXDY1oRswMQzY5piutWo0ebPQAZ9j1
	 yzm8F7nIugdb8++8TIorcZgu85WSlcVWHTSPwdi61azQkBISex0po77uEzjWsQLRD+
	 yv3sR3Q4k7VOA==
Date: Fri, 26 Sep 2025 12:19:05 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Akira Yokosawa <akiyks@gmail.com>, broonie@kernel.org, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-next@vger.kernel.org, mchehab@kernel.org
Subject: Re: linux-next: Tree for Sep 24 (htmldocs / pdfdocs)
Message-ID: <20250926121905.385a084d@foz.lan>
In-Reply-To: <fbfb1bf8-c4b9-4c9b-9d58-84c2dda22649@infradead.org>
References: <e7c29532-71de-496b-a89f-743cef28736e@infradead.org>
	<3666a4ec-ef29-4342-b3aa-8c602c258bea@gmail.com>
	<fbfb1bf8-c4b9-4c9b-9d58-84c2dda22649@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 25 Sep 2025 09:59:45 -0700
Randy Dunlap <rdunlap@infradead.org> escreveu:

> Hi Akira,
> 
> On 9/25/25 7:15 AM, Akira Yokosawa wrote:
> > Hi Randy,
> > 
> > On Wed, 24 Sep 2025 10:54:18 -0700, Randy Dunlap wrote:  
> >> On 9/24/25 7:41 AM, Mark Brown wrote:  
> >>> Hi all,
> >>>
> >>> There will be no -next releases Tuesday and Wednesday next week, and
> >>> it's possible I might run out of time on Monday.
> >>>  
> >>
> >> When I run 'make O=DOCS htmldocs', I see these warning messages:
> >>
> >> ../Documentation/Makefile:70: warning: overriding recipe for target 'pdfdocs'
> >> ../Documentation/Makefile:61: warning: ignoring old recipe for target 'pdfdocs'
> >>
> >>
> >> Is this a known issue?  
> > 
> > I could reproduce these warnings under containers who have minimal
> > packages needed for htmldocs *only*.
> > 
> > Current "docs-mw" branch doesn't show them.  "build-scripts" is the
> > one who carries this harmless regression.
> > 
> > By "harmless", I mean "pdfdocs" needs texlive packages anyway.  
> 
> 
> Right, I don't have any texlive (or latex or tetex) packages installed.
> I shouldn't need to since I am not building any pdfdocs, so I
> shouldn't get these warning messages. But if they go away in the near
> future, that's great.

Just sent the fixes. They are because I forgot to do another cleanup
at docs Makefile and didn't test on an environment without latex.

Fix is trivial: just drop the second (unneeded) pdfdocs target.


Thanks,
Mauro

