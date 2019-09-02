Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1744AA5A92
	for <lists+linux-next@lfdr.de>; Mon,  2 Sep 2019 17:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfIBPaJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Sep 2019 11:30:09 -0400
Received: from zeniv.linux.org.uk ([195.92.253.2]:43218 "EHLO
        ZenIV.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbfIBPaJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Sep 2019 11:30:09 -0400
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.1 #3 (Red Hat Linux))
        id 1i4oHM-0000An-6r; Mon, 02 Sep 2019 15:30:04 +0000
Date:   Mon, 2 Sep 2019 16:30:04 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Miklos Szeredi <miklos@szeredi.hu>
Cc:     David Howells <dhowells@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: linux-next: manual merge of the vfs tree with the fuse tree
Message-ID: <20190902153004.GD1131@ZenIV.linux.org.uk>
References: <20190830130119.446e7389@canb.auug.org.au>
 <CAJfpeguxmJvCV+PXr=wz5HXONKv4RDmZ1LpYNEqAtvw_smP5Ag@mail.gmail.com>
 <CAJfpegsijOi6TdRcObGSAJ+tS0JiZky=v6Wqh5u8RZTzi6tkjA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJfpegsijOi6TdRcObGSAJ+tS0JiZky=v6Wqh5u8RZTzi6tkjA@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 02, 2019 at 05:10:27PM +0200, Miklos Szeredi wrote:
> On Mon, Sep 2, 2019 at 11:00 AM Miklos Szeredi <miklos@szeredi.hu> wrote:
> >
> > On Fri, Aug 30, 2019 at 5:01 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > >
> > > Hi all,
> > >
> > > Today's linux-next merge of the vfs tree got a conflict in:
> > >
> > >   fs/fuse/inode.c
> > >
> > > between commit:
> > >
> > >   1458e5e9f99a ("fuse: extract fuse_fill_super_common()")
> > >
> > > from the fuse tree and commit:
> > >
> > >   2ad9ab0f7429 ("vfs: Convert fuse to use the new mount API")
> > >   48ceb15f98c8 ("vfs: Move the subtype parameter into fuse")
> >
> > And the latter is b0rked anyway.
> 
> Both, actually.
> 
> Pushed fixed ones to fuse.git#for-next.

... originals cheerfully dropped; will be gone in today's push to
vfs.git#for-next.
