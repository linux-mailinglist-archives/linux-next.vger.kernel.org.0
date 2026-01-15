Return-Path: <linux-next+bounces-9672-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 969EED232BF
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 09:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4B4830C6CC1
	for <lists+linux-next@lfdr.de>; Thu, 15 Jan 2026 08:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767B8332EB6;
	Thu, 15 Jan 2026 08:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="My6NHHYx"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520C2332900;
	Thu, 15 Jan 2026 08:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768465719; cv=none; b=EVYpmqjyTugXnGQuLVFfhw3Sdwbtol7x8UjmG+YBBZsVyNBmtfc+9U4TDCu4ODkb7javZXwNP30sFpZ3ZhTGfZF+t9thtM7+ZxYpY/aUAKJYWfrSOgbJQHzaZDIz3UHZxGsohZJaLKc4UPLWFue/W4OGYMrJ51H0B6DsKzfLPzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768465719; c=relaxed/simple;
	bh=ZmnY43kOhofcKK8JnCcgalrrKL2yzg9y8T+UCN/kvdw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ijHW6LZqq7Uj4fF/eDgg6OTRYYiZR3L/9uf0Un8KH0P7URzLK9MA453QnXubmKQZLiLHMY4NKmRap4AzkIUrxNvENT4TCg3KIXNhv8bx+IESy7kTlM/vidYe+Cly4dvp1qmViWjzY5uof7Z0HWnlCKEaUFb7UXYQaZzPJv+bVDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=My6NHHYx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C42C116D0;
	Thu, 15 Jan 2026 08:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768465718;
	bh=ZmnY43kOhofcKK8JnCcgalrrKL2yzg9y8T+UCN/kvdw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=My6NHHYx0chEE9H9UtfNNrP8INF8WLSnvwDMhwSFbMxWY/ZH3S0s8hPif4k1gvboZ
	 y3+FgG+x1cs9fW+Gurjt4ICmjZs8C5caDmE/qTbO7jY6K7xvLMJmKDGm5+bjwLzxAt
	 at6hMHeub8ys/8UkAalmN7vTm5KJ+Y2J21l6yWTDoVSSkX6er0C85C4gpWJjWYMV88
	 bdo05qZo4RUIwyO5BADo/biSj47RFvH05Q8KIg9k28eLJkgmrIei1PdewDOWvq7P1k
	 nTu9czAufxm5MZ0wx8hIcWU1TZIAw0N+WH+BBtz5uvHH8OQNuxGIHHK+N8TJaEQ85R
	 wrhQ08bu+nCfw==
Date: Thu, 15 Jan 2026 09:28:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs tree
Message-ID: <20260115092834.05f3bf66@foz.lan>
In-Reply-To: <20260115150458.4ad09c28@canb.auug.org.au>
References: <20260115140132.6e0c05a0@canb.auug.org.au>
	<20260115031053.GY3634291@ZenIV>
	<20260115150458.4ad09c28@canb.auug.org.au>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 15 Jan 2026 15:04:58 +1100
Stephen Rothwell <sfr@canb.auug.org.au> escreveu:

> Hi Al,
> 
> On Thu, 15 Jan 2026 03:10:53 +0000 Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > On Thu, Jan 15, 2026 at 02:01:32PM +1100, Stephen Rothwell wrote:  
> > > 
> > > After merging the vfs tree, today's linux-next build (htmldocs) produced
> > > this warning:
> > > 
> > > Documentation/filesystems/porting.rst:1348: ERROR: Unknown target name: "filename". [docutils]
> > > 
> > > Introduced by commit
> > > 
> > >   7335480a8461 ("non-consuming variant of do_linkat()")    
> > 
> > Egads...  That's from "filename_{link,renameat2}()" in there (there's also
> > "do_{link,renameat2}()" earlier in the same line, but that didn't produce
> > a warning.

Based on the error message, I suspect it is trying to create an internal
cross-reference to a "filename" reference:

	$ ack "Unknown target name" sphinx_latest/
	sphinx_latest/lib/python3.13/site-packages/docutils/transforms/references.py
	907:                        f'Unknown target name: "{node["refname"]}".',

I can't explain why filename_{} was handled differently than do_{},
but had you check the html output? Maybe there is out there a "do"
reference, which was incorrectly used here.

What I suggest here (and on similar cases) is to either:

1) Split it (and similar cases) into: 

	"filename_link() and filename_renameat2()" 

   which would give sphinx automarkup the opportunity to create
   cross references

   (my preference)

2) tell Sphinx that this is a literal with ``filename_{link,renameat2}()``

> > 
> > Any suggestions re better way to spell it for .rst?  
> 
> It eventually becomes (literally) "filename_..." so that might be the
> issue.  Maybe quote it like 'function_...()'?

The issue is that unmatched underscores (or asterisk) at either beginning 
of end of a word has special meaning on Sphinx.

> 
> Maybe Jon or Mauro have a suggestion.

Thanks,
Mauro

