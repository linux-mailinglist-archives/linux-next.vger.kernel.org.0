Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 325493A395E
	for <lists+linux-next@lfdr.de>; Fri, 11 Jun 2021 03:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhFKBsf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Jun 2021 21:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbhFKBsf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Jun 2021 21:48:35 -0400
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [IPv6:2607:5300:60:148a::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6004EC061574;
        Thu, 10 Jun 2021 18:46:38 -0700 (PDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lrWFc-006l8p-DK; Fri, 11 Jun 2021 01:46:24 +0000
Date:   Fri, 11 Jun 2021 01:46:24 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the gfs2 tree with the vfs tree
Message-ID: <YMLAcExtFTEYl5Bi@zeniv-ca.linux.org.uk>
References: <20210611111231.7750bb60@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611111231.7750bb60@canb.auug.org.au>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 11, 2021 at 11:12:31AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the gfs2 tree got conflicts in:
> 
>   Documentation/filesystems/porting.rst
>   include/linux/uio.h
>   lib/iov_iter.c
> 
> between various commits from the vfs tree and the same, older version,
> of the commits from the gfs2 tree.
> 
> I fixed it up (I used the vfs tree versions) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

IMO iov_iter_fault_in_writeable() is a bloody bad idea to start with...
