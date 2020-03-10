Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC24617F516
	for <lists+linux-next@lfdr.de>; Tue, 10 Mar 2020 11:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726100AbgCJKc3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 06:32:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:34194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725845AbgCJKc2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 10 Mar 2020 06:32:28 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97A3520727;
        Tue, 10 Mar 2020 10:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583836348;
        bh=vlZvaTgV1LJ4vneBszORHsUjgKRrmYkAcHG6k1h4z+8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WqdT/OvQ+bFtw5OgGTEOkNg4D7ILc1g7hKidFzB135uOzKK/mHJPgmLv37gaL9gO+
         QxeF1H4l8ykqB9rh5rvQlKY2+1ZnT11foo8+w2w2mJau7jhQhKunLv6aEE4zgrAyFd
         Bx0sCCLvi8MhOOWRVcWf06AnfRgJAY9z8AwFQhno=
Date:   Tue, 10 Mar 2020 11:32:25 +0100
From:   'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
To:     Namjae Jeon <namjae.jeon@samsung.com>
Cc:     'Pali =?iso-8859-1?Q?Roh=E1r'?= <pali@kernel.org>,
        'Stephen Rothwell' <sfr@canb.auug.org.au>,
        'Al Viro' <viro@zeniv.linux.org.uk>,
        'Linux Next Mailing List' <linux-next@vger.kernel.org>,
        'Linux Kernel Mailing List' <linux-kernel@vger.kernel.org>,
        'Sungjong Seo' <sj1557.seo@samsung.com>,
        'Christoph Hellwig' <hch@lst.de>
Subject: Re: linux-next: build warning after merge of the vfs tree
Message-ID: <20200310103225.GA2692297@kroah.com>
References: <20200310095918.3ea6432f@canb.auug.org.au>
 <CGME20200309231744epcas1p3c0c6f455449fbcbb67df2fdcbe7ba351@epcas1p3.samsung.com>
 <20200309231739.2w45cleifsmwbfd6@pali>
 <003501d5f66b$7fe3b260$7fab1720$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <003501d5f66b$7fe3b260$7fab1720$@samsung.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 10, 2020 at 08:36:04AM +0900, Namjae Jeon wrote:
> > On Tuesday 10 March 2020 09:59:18 Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > After merging the vfs tree, today's linux-next build (x86_64
> > > allmodconfig) produced this warning:
> > >
> > > warning: same module names found:
> > >   fs/exfat/exfat.ko
> > >   drivers/staging/exfat/exfat.ko
> > >
> > > Introduced by commit
> > >
> > >   b9d1e2e6265f ("exfat: add Kconfig and Makefile")
> > >
> > > and not fixed by commit
> > >
> > >   1a3c0509ce83 ("staging: exfat: make staging/exfat and fs/exfat
> > > mutually exclusive")
> > 
> > Hello Stephen!
> > 
> > exfat.ko from fs/exfat subdirectory is a rewrite/cleanup of staging exfat
> > driver. It means that fs/exfat replaces staging/exfat and so after
> > fs/exfat is merged, the old staging/exfat code is not needed anymore.
> > 
> > Therefore I think that instead of hacking Kconfig/Makefile files to define
> > mutually exclusivity, it is better to remove staging/exfat code.
> > 
> > Removal of old staging code should be easy and should fix this problem.
> Agree.
> Greg, You told me to let me know when fs/exfat gets accepted. Now it's time
> to drop staging/exfat.

Wonderful!  I'll go drop it right now, thanks for letting me know!

greg k-h
