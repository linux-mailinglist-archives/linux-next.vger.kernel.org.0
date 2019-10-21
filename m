Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F994DF86C
	for <lists+linux-next@lfdr.de>; Tue, 22 Oct 2019 01:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730069AbfJUXLs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 19:11:48 -0400
Received: from 2.152.178.181.dyn.user.ono.com ([2.152.178.181]:48098 "EHLO
        pulsar.hadrons.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730276AbfJUXLs (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Oct 2019 19:11:48 -0400
X-Greylist: delayed 1836 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Oct 2019 19:11:47 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hadrons.org
        ; s=201908; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
        From:Date:From:Reply-To:Subject:Content-Transfer-Encoding:Content-ID:
        Content-Description:References:X-Debbugs-Cc;
        bh=lcZ+YMK9Whi3z5tx7xSI8b6zl56GrrzI4ArlbeylLpQ=; b=Z7Y5hGMHdidz4k/M88HQxnRP8X
        M1p/0nnLKKgjZgcK8WtKsxct9/D22d3I1D/xnLjiv/zjDdOEwRSGaBDeLShPruvPtj48jgU0TtHsg
        xHVoeRZg6qdzTtLGR2c9twppv/19Fcpax+wnNBQlEskJWBnXO6OqFHw+6O9e9Zh2oP87C9Xqx4pqe
        P4612ObycNaGWYeokAELYxC9KxWSu/2PcfaPI8OFlsrkiQglI5TQ6AixKXi6z0/oYw9kbptltD9nl
        +o/foFD8bugCUjyR05p/aXHpO+naPMztzCg2vDPhv9Oeh3OUla57u5yRCrZFDP1T+nSfNAc5mcEzv
        EwhVJjfQ==;
Received: from guillem by pulsar.hadrons.org with local (Exim 4.92)
        (envelope-from <guillem@hadrons.org>)
        id 1iMgP5-0004ci-4m; Tue, 22 Oct 2019 00:43:55 +0200
Date:   Tue, 22 Oct 2019 00:40:57 +0200
From:   Guillem Jover <guillem@hadrons.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Al Viro <viro@ZenIV.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: build warning after merge of the vfs-fixes tree
Message-ID: <20191021224057.GA6880@thunder.hadrons.org>
Mail-Followup-To: Guillem Jover <guillem@hadrons.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Al Viro <viro@ZenIV.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191022093512.4317a715@canb.auug.org.au>
 <20191022074426.2c0a2485@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi!

On Tue, 2019-10-22 at 07:44:26 +1100, Stephen Rothwell wrote:
> Fixes tag
> 
>   Fixes: 7a074e96 ("aio: implement io_pgetevents")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

On Tue, 2019-10-22 at 09:35:12 +1100, Stephen Rothwell wrote:
> On Tue, 22 Oct 2019 08:07:34 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > fs/aio.c:2196:38: note: in expansion of macro 'NULL'
> >  2196 |  struct __compat_aio_sigset ksig = { NULL, };
> >       |                                      ^~~~

> > fs/aio.c:2196:38: note: in expansion of macro 'NULL'
> >  2196 |  struct __compat_aio_sigset ksig = { NULL, };
> >       |                                      ^~~~

> > fs/aio.c:2231:38: note: in expansion of macro 'NULL'
> >  2231 |  struct __compat_aio_sigset ksig = { NULL, };
> >       |                                      ^~~~

> > fs/aio.c:2231:38: note: in expansion of macro 'NULL'
> >  2231 |  struct __compat_aio_sigset ksig = { NULL, };
> >       |                                      ^~~~
> > 
> > Introduced by commit
> > 
> >   de80166a573d ("aio: Fix io_pgetevents() struct __compat_aio_sigset layout")

Ugh, sorry about that, I guess I didn't see the warnings in the scroll
back when I built this back then for testing. :/ Sending a new version
fixing both issues.

Thanks,
Guillem
