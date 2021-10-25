Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5FD343A071
	for <lists+linux-next@lfdr.de>; Mon, 25 Oct 2021 21:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235910AbhJYTa1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Oct 2021 15:30:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:46716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233213AbhJYT3S (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Oct 2021 15:29:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4907B610A6;
        Mon, 25 Oct 2021 19:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635189970;
        bh=NBKnv1JR8cxB3WQpEgHaULJsnVf0iMZqEOQxXFV9Uoo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gfDj6BZv1jJU9xU/9g2lPaVtybHhdFcVySOVL8YLKDZNF993hcUhvcP3AysFpf+9N
         kL67hcuhlKd4ZqYQiOm5pEmuOjsAw5xfbnuv9UqmSH/zQMxksXulkakEohAHON670p
         TqnJNdgiNoyRZxoljR9BAUXPs97UxRPDHW1XhOvI0fQExdpUzsEIuAvvXDYrSU7NQn
         V1lqiVEac6uCPNboLa2VJyhcxn7YgwUO+v3v3IYEL+o+ISFLXDNqx5nd6VahTuUyqL
         roX+bG/ySNCAz70G2kQ9kXlWUW1Q69/sxVpy41KRjAQ87eQMozJEwFcT6jK1Cn8MT8
         mDFpDxnIU3iqQ==
Date:   Mon, 25 Oct 2021 14:31:02 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp-gustavo tree
Message-ID: <20211025193102.GA1436536@embeddedor>
References: <20211018193048.14517460@canb.auug.org.au>
 <20211025125534.4681416a@canb.auug.org.au>
 <202110251218.EAB410DC22@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202110251218.EAB410DC22@keescook>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 25, 2021 at 12:19:15PM -0700, Kees Cook wrote:
> On Mon, Oct 25, 2021 at 12:55:34PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > On Mon, 18 Oct 2021 19:30:48 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > > 
> > > After merging the kspp-gustavo tree, today's linux-next build (sparc64
> > > defconfig) failed like this:
> > > 
> > > sparc64-linux-gcc: error: unrecognized command line option '-Wcast-function-type'; did you mean '-Wbad-function-cast'?
> > > 
> > > $ sparc64-linux-gcc --version
> > > sparc64-linux-gcc (Custom f51944395b6aa154) 7.3.1 20180130
> > > 
> > > Caused by commit
> > > 
> > >   21078041965e ("Makefile: Enable -Wcast-function-type")
> > > 
> > > I have reverted that commit for today.
> > 
> > I am still reverting that commit ...
> 
> Gustavo, can you please switch this to using cc-option?

Yeah; I actually removed all the patches related to -Wcast-function-type
from my -next branch a few minutes ago:

https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/log/?h=for-next/kspp

I'm currently working on resolving all these conflicts in a separate branch
before merging them again in my -next tree.

Thanks
--
Gustavo
