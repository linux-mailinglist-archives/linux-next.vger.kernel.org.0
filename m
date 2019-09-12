Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06259B1043
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2019 15:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731818AbfILNrU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Sep 2019 09:47:20 -0400
Received: from verein.lst.de ([213.95.11.211]:47203 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731786AbfILNrU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Sep 2019 09:47:20 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 1667A227A81; Thu, 12 Sep 2019 15:47:17 +0200 (CEST)
Date:   Thu, 12 Sep 2019 15:47:16 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christoph Hellwig <hch@lst.de>, Al Viro <viro@ZenIV.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the configfs tree with the
 vfs-fixes tree
Message-ID: <20190912134716.GA19681@lst.de>
References: <20190912234412.38998b12@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912234412.38998b12@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 12, 2019 at 11:44:12PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the configfs tree got a conflict in:
> 
>   fs/configfs/symlink.c
> 
> between commit:
> 
>   e272d4fb74d6 ("configfs: fix a deadlock in configfs_symlink()")
> 
> from the vfs-fixes tree and commit:

The configfs one has been rebased.  I also have another refactoring
after this one before the rest of Als patches, so you'll run into
more issues.

Al, can you drop the branch from your tree?
