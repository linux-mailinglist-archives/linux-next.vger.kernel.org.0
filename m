Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1BD182529
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 23:47:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730084AbgCKWrI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 11 Mar 2020 18:47:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:50840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729739AbgCKWrI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 11 Mar 2020 18:47:08 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0331F206E7;
        Wed, 11 Mar 2020 22:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583966828;
        bh=UcNd5rYmINjwGgfboOi/vC/8shoIdG5DtpBHMlvH6Ls=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KZVa7ZPGNaqaiG4v4C38D6UvLLRqNoYWMAZH4Bi8oTEMEozqM9VjVHGBgUWyZPXDd
         XKSKgE7dJEWJbeSxZNDL+XP7wwA0dldCByvGTYYwEnUP/l80mCfAa4Pbh9FuAPTkWg
         IgtwL2rWjAYE5FLiLZ91QnjvjX6VfJ+8g28vdft8=
Received: by pali.im (Postfix)
        id 96068803; Wed, 11 Mar 2020 23:47:05 +0100 (CET)
Date:   Wed, 11 Mar 2020 23:47:05 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     'Linux Next Mailing List' <linux-next@vger.kernel.org>,
        'Linux Kernel Mailing List' <linux-kernel@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        Valdis Kletnieks <valdis.kletnieks@vt.edu>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Namjae Jeon <namjae.jeon@samsung.com>,
        Sungjong Seo <sj1557.seo@samsung.com>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] staging: exfat: remove staging version of exfat
 filesystem
Message-ID: <20200311224705.z3sn3taxjap67jle@pali>
References: <003501d5f66b$7fe3b260$7fab1720$@samsung.com>
 <20200310105421.GA2810679@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200310105421.GA2810679@kroah.com>
User-Agent: NeoMutt/20180716
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tuesday 10 March 2020 11:54:21 Greg Kroah-Hartman wrote:
> Now that there is a "real" solution for exfat in the vfs tree queued up
> to be merged in 5.7-rc1 the "old" exfat code in staging can be removed.
> 
> Many thanks to Valdis for doing the work to get this into the tree in
> the first place, it was greatly appreciated.
> 
> Cc: Valdis Kletnieks <valdis.kletnieks@vt.edu>
> Cc: Pali Rohár <pali@kernel.org>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Al Viro <viro@ZenIV.linux.org.uk>
> Cc: Namjae Jeon <namjae.jeon@samsung.com>
> Cc: Sungjong Seo <sj1557.seo@samsung.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: Pali Rohár <pali@kernel.org>

> ---
>  MAINTAINERS                          |    6 -
>  drivers/staging/Kconfig              |    2 -
>  drivers/staging/Makefile             |    1 -
>  drivers/staging/exfat/Kconfig        |   41 -
>  drivers/staging/exfat/Makefile       |   10 -
>  drivers/staging/exfat/TODO           |   69 -
>  drivers/staging/exfat/exfat.h        |  760 ------
>  drivers/staging/exfat/exfat_blkdev.c |  138 --
>  drivers/staging/exfat/exfat_cache.c  |  514 ----
>  drivers/staging/exfat/exfat_core.c   | 2529 --------------------
>  drivers/staging/exfat/exfat_nls.c    |  212 --
>  drivers/staging/exfat/exfat_super.c  | 3296 --------------------------
>  drivers/staging/exfat/exfat_upcase.c |  740 ------
>  13 files changed, 8318 deletions(-)
>  delete mode 100644 drivers/staging/exfat/Kconfig
>  delete mode 100644 drivers/staging/exfat/Makefile
>  delete mode 100644 drivers/staging/exfat/TODO
>  delete mode 100644 drivers/staging/exfat/exfat.h
>  delete mode 100644 drivers/staging/exfat/exfat_blkdev.c
>  delete mode 100644 drivers/staging/exfat/exfat_cache.c
>  delete mode 100644 drivers/staging/exfat/exfat_core.c
>  delete mode 100644 drivers/staging/exfat/exfat_nls.c
>  delete mode 100644 drivers/staging/exfat/exfat_super.c
>  delete mode 100644 drivers/staging/exfat/exfat_upcase.c
