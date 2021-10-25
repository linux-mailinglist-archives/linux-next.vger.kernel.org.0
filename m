Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59F3E438D5E
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 04:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhJYCIw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 24 Oct 2021 22:08:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:33406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229629AbhJYCIv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 24 Oct 2021 22:08:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D47A86058D;
        Mon, 25 Oct 2021 02:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635127590;
        bh=YLvtyghFWkryQ5bHJawA9T7NAt/Pcu5HeIsDk4wyB00=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ow57WrD+ZE5mZdy1r5H9GtjytVl2NgLJG9HxlOBc5hZvTw6o4lEv40Wu+GmoDB/S/
         sJ2MqncWkpNb95K1XrpoF8DgXAUco8Zt2JNUMLUFKJRmPIB4t0obZH3TG7a9nQRE9f
         xnwU7VqBhKkBoGZkIOAukGGqV88/XRgyOhyDMhdwy1ZcwIZYWTsfRixeetgzr3moZm
         ZqTkV34simYtGto9DAPgF3SeP4cVuQQ/Ik3Q3ZTW2R3tWyLFjSCAhc27w2yZ+Y+n0T
         YNlGu9VFI1YuIErDn/N5nSHTFpZyCaJNdHP1ijJArkl5rL42zxWxCOpvMQ+PJggePi
         SMtNq4aoDzSnw==
Date:   Sun, 24 Oct 2021 21:11:19 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20211025021119.GA1424114@embeddedor>
References: <20211018181559.5d3bcf7e@canb.auug.org.au>
 <20211025125446.51bed661@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211025125446.51bed661@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 25, 2021 at 12:54:46PM +1100, Stephen Rothwell wrote:
> > --- a/include/linux/ftrace.h
> > +++ b/include/linux/ftrace.h
> > @@ -45,6 +45,7 @@ struct ftrace_ops;
> >  void arch_ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip);
> >  #else
> >  # define FTRACE_FORCE_LIST_FUNC 0
> > +struct ftrace_regs;
> >  void arch_ftrace_ops_list_func(unsigned long ip, unsigned long parent_ip,
> >  			       struct ftrace_ops *op, struct ftrace_regs *fregs);
> >  #endif
> > -- 
> > 2.33.0
> 
> I am still applying this fix ...

I will add this fix to the original patch for my tomorrow's -next tree.

Thanks, Stephen.
--
Gustavo

