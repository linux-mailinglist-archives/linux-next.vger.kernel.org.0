Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B577D1387B9
	for <lists+linux-next@lfdr.de>; Sun, 12 Jan 2020 19:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733152AbgALScj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jan 2020 13:32:39 -0500
Received: from zeniv.linux.org.uk ([195.92.253.2]:38282 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732957AbgALScj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Jan 2020 13:32:39 -0500
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iqi2N-006mo9-2h; Sun, 12 Jan 2020 18:32:35 +0000
Date:   Sun, 12 Jan 2020 18:32:35 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20200112183235.GO8904@ZenIV.linux.org.uk>
References: <20200106123027.1a162197@canb.auug.org.au>
 <e9a87175-64c9-46da-4737-72987a53e836@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9a87175-64c9-46da-4737-72987a53e836@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 06, 2020 at 09:04:01PM -0700, Jens Axboe wrote:
> On 1/5/20 6:30 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the block tree, today's linux-next build (arm
> > multi_v7_defconfig) failed like this:
> > 
> > fs/open.c:977:12: error: conflicting types for 'build_open_flags'
> >   977 | inline int build_open_flags(const struct open_how *how,
> >       |            ^~~~~~~~~~~~~~~~
> > In file included from /home/sfr/next/next/fs/open.c:36:
> > fs/internal.h:127:12: note: previous declaration of 'build_open_flags' was here
> >   127 | extern int build_open_flags(int flags, umode_t mode, struct open_flags *op);
> >       |            ^~~~~~~~~~~~~~~~
> > 
> > Caused by commits
> > 
> >   4e9e15c9426e ("fs: make build_open_flags() available internally")
> >   3bba3e571bc8 ("io_uring: add support for IORING_OP_OPENAT")
> > 
> > interacting with commit
> > 
> >   0a51692d49ec ("open: introduce openat2(2) syscall")
> > 
> > from the vfs tree.
> > 
> > I have applied the following fix up patch for today:
> 
> Thanks Stephen - I'll pull in the VFS tree and rebase the 5.6 io_uring
> bits on that. Then I'll send it out for review again, haven't heard from
> Al on the non-block open change.

FWIW, I don't believe that your approach is workable.  First of all,
*ANY* transition out of RCU mode can lead to blocking.  You need to
acquire several references (mount and dentry, at the very least).
Suppose the last one fails (->d_seq mismatch).  Now you suddenly
have to drop the one(s) you've acquired.  And both dput() and mntput()
are fundamentally blocking operations.

It simply does not work.  You could cobble up something that kinda-sorta
works, if your added flag had
	* caused hard failure on unlazy_child()
	* caused hard failure on unlazy_walk() with any symlinks in stack
	* caused hard failure on unlazy_walk() if it would've been required
to grab root
	* made unlazy_walk() go through very careful dance if it's just
about nd->path; I'm not sure how well that could be done, but theoretically
it's not impossible.

But for open() it's not going to work at all.  Any open for write => you
will have to wait if you run into fs freeze.  O_TRUNC => you've got IO
to do.  Worst of all, once you've dropped out of RCU mode, *YOU* *CAN'T*
*FAIL*.  Because that means blocking operations.  So you need to verify
that you won't run into a blocking ->open(), IMA deciding to play silly
buggers and read through the entire file, etc., etc. _before_ dropping
out of RCU mode.

do_last() is messy enough as it is; adding _this_ is completely out of
question.

Jens, if you have a workable plan on that non-blocking open of yours,
post it in full details.  Until then - NAK, and that's about as hard one
as I ever had to give.
