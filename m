Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31EEF319527
	for <lists+linux-next@lfdr.de>; Thu, 11 Feb 2021 22:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbhBKV2i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Feb 2021 16:28:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:35460 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229617AbhBKV2h (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 11 Feb 2021 16:28:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BA5364DAE;
        Thu, 11 Feb 2021 21:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613078876;
        bh=Ma+0baXQYGzHwmpu/o+V+P8RGsFBSV2ge1JYMP+k4Us=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=PW2bPARqBa9iorLD/O8DdBgYJA3I63KbyP7gre+uklgGbjjXjB9mXpTALafdkWKxm
         H4DhJupNl6vsqHxXs0CH4nY5pEKT8wmWJosNjlzOdRmUKTw+2ByW8g1vWP+E+gpg6L
         qgSehhXKkRNUMNSQEyYOnNXjRDXfhplLp8YJkq1ic+ywnJqXflEqUqYmJcnbSIehfZ
         vJACqLvMDCFIWFxY/XWoUaz8G9Ol2fju2lT4nuIsS/Bs//2gLDrNQP/PrguGQayWZx
         Eg5ca3+Cy15j+ac+DLfodC1MRrOSHOjnQX7805lNbv//kh2HDa7rY0ssenGnsh5whB
         qY3rCachPCpsw==
Message-ID: <8477502be8c33e7d21f1c0facb3c1ad9e4257f90.camel@kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the ftrace tree
From:   Tom Zanussi <zanussi@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Thu, 11 Feb 2021 15:27:54 -0600
In-Reply-To: <20210211162154.33d71924@gandalf.local.home>
References: <20210212075728.36941e15@canb.auug.org.au>
         <20210211162154.33d71924@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 2021-02-11 at 16:21 -0500, Steven Rostedt wrote:
> On Fri, 12 Feb 2021 07:57:28 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > In commit
> > 
> >   b5e7014fe1c4 ("selftests/ftrace: Update synthetic event syntax
> > errors")
> > 
> > Fixes tag
> > 
> >   Fixes: 81ff92a93d95 (selftests/ftrace: Add test case for
> > synthetic
> > 
> > has these problem(s):
> > 
> >   - Subject has leading but no trailing parentheses
> > 
> > Please do not split Fixes tags over more than one line.  Also, keep
> > all
> > the commit message tags together at the end of the message.
> > 
> 
> Thanks, I didn't even notice that :-/
> 
> Tom, FYI for next time ;-)
> 

Yep, thanks, Stephen, for pointing that out, didn't realize it until
now either.

Tom


> -- Steve

