Return-Path: <linux-next+bounces-873-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8081483DAAE
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 14:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31FD4284599
	for <lists+linux-next@lfdr.de>; Fri, 26 Jan 2024 13:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8F61B942;
	Fri, 26 Jan 2024 13:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNBZL2D/"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAECC1B940
	for <linux-next@vger.kernel.org>; Fri, 26 Jan 2024 13:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706275398; cv=none; b=UmctctBftiNttItsvjA/BkfAUb/H6Q09NYj9rIAVThrOYG+w6NnbScvkupqonbmz6S8SPtCnLj7DRrdkjFixKfWJsHC9w8qlcr9ONeCBEVaD8f+N2y74rjW3RW0/xqSnKsiUkBF6jeV5Jfhr7uqjn/wzZuORIqBHzHLTk4KrXZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706275398; c=relaxed/simple;
	bh=LSAiGGF0+ag68sDTU72edWjFAXJcswHkqputLCV2UaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToWU81ZoJQrDJckG9/gl/oiH7Rkx0rhTShYok3WyUROH96sCcbEf/cxGj10BWRrBPx1Eia/8tZiCIOpQ4txvt8r+4/29Ve9a+OJ1UiO96o8mE7whdYo1ZfsJOGteHknekA2QEOT3OsFbJDr6XYvEuT6sG/L8ZY2VmdOl8Y7rEE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNBZL2D/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7EEC433C7;
	Fri, 26 Jan 2024 13:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706275396;
	bh=LSAiGGF0+ag68sDTU72edWjFAXJcswHkqputLCV2UaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DNBZL2D/GnouQgHtWUmX+Aofz/c9KCKGB6SbKwVioNYC/P/BK9bVB2TOLVlgqmNVF
	 JijOq50sHl2fvU93ZKtigcYsnef+4AkE5qdW0T50HFlPOFZRag8X5HYOevcroeTUVo
	 XwkgYKMmrA0B6uIE44o71Fa/m1ZvX70qisuTjxHY57quCIzDLlmgVcMwhoikZ3iy8Z
	 kmkv6xHdpbc/iGb4ZSDwTtMmKZWpjuacqnoTM22f+9g1NZt+/+O2UxjwStM+5ycXEc
	 fEsIR3RKliK6C6uftlFnxZBQ4ixTzQB7NHAKygcXjSp1ZCBIxnXutwma11zFxHPg06
	 0aygQJPPjKCdw==
Date: Fri, 26 Jan 2024 14:23:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Wolfram Sang <wsa@kernel.org>, linux-next <linux-next@vger.kernel.org>
Subject: Re: Request for i2c re-inclusion in linux-next
Message-ID: <qztustevwvwnfjrcour5hpxvik7ryhbyhxn5nzyosdvjdpdife@2a5orr4yo5db>
References: <sripk25leahdjiziacby4ql45kspw5cd3ic5vj23lctsawc2lm@be4sg32fjilu>
 <20240126115011.55da6838@canb.auug.org.au>
 <zgjyz7kdovuesyu4s6lfshrsktfozid6hho7xn5ckc4ux54bxj@lkhx4qbdpcki>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zgjyz7kdovuesyu4s6lfshrsktfozid6hho7xn5ckc4ux54bxj@lkhx4qbdpcki>

On Fri, Jan 26, 2024 at 07:54:04AM +0100, Andi Shyti wrote:
> Hi Stephen,
> 
> > > could you please include in the linux-next i2c related branches
> > > from my repository:
> > > 
> > > https://kernel.googlesource.com/pub/scm/linux/kernel/git/andi.shyti/linux.git
> > > 
> > > the following branches:
> > > 
> > > for next:       i2c/for-next
> > > fixes:          i2c/for-current
> > > 
> > > I have requested this branch to be the main repository for
> > > collecting i2c host patches[*].
> > > 
> > > Thank you,
> > > Andi
> > > 
> > > [*] https://lore.kernel.org/all/20240124225031.3152667-1-andi.shyti@kernel.org/
> > 
> > OK, I currently have an i2c tree from Wolfram who is listed as the
> > maintainer, so I need to hear from him (and do you meant to replace his
> > tree, or add another one?). 
> 
> Yes, I'm going to replace Wolfram's tree. We've been agreeing
> together on this change.

Sorry, replace only for the subsystem in the linked patch, as
Wolfram has confirmed.

> > Also, above you list a git tree from
> > kernel.googlesource.com, but in the patch above, you use
> > git.kernel.org.  The latter is preferred.  And currently, they do *not*
> > have the same i2c/for-next and i2c/for-current head commits.
> 
> Oh! You are right! I have done a lazy replacement
> /wsa/andi\.shyti/. Will update with the correct git.kernel.org
> repository.

Actually, the patch was right, but my mail was wrong, I did a
copy paste of my previous mail to you. The repository is this
one:

git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

or its https version:

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

whichever you prefer. There you will see the two branches. I am
trying to copy Wolfram's way of doing things.

sorry for the confusion.

Andi

