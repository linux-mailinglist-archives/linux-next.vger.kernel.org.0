Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB9DC2A39EE
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 02:35:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbgKCBf6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 20:35:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:47698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726246AbgKCBf6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 2 Nov 2020 20:35:58 -0500
Received: from google.com (unknown [104.132.1.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 02C5A2224E;
        Tue,  3 Nov 2020 01:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604367358;
        bh=imgsOHAhOwrwk2jJpxhn96iuDwIVE5N4T6lmBAiyNi4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LabjAq4bmcOp6LrvoZHXkBPWrx13gAlEdDEKY+X/lrmegTFLiHQ0qKtpvdRrzZyEi
         eo0KlUHgFS1qxxQs0y4A+/UjGhbpBtL8Qh/AF60N/ybx+TbuTR243uP/3KFnq3ugLz
         Z89RD2ippB/blHVS102Bk7UdDnpbsWWU13flIwCo=
Date:   Mon, 2 Nov 2020 17:35:56 -0800
From:   Jaegeuk Kim <jaegeuk@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daeho Jeong <daehojeong@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the f2fs tree
Message-ID: <20201103013556.GA3578719@google.com>
References: <20201103123112.68f54d17@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103123112.68f54d17@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/03, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the f2fs tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from <command-line>:32:
> ./usr/include/linux/f2fs.h:92:2: error: unknown type name 'u8'
>    92 |  u8 algorithm;
>       |  ^~
> ./usr/include/linux/f2fs.h:93:2: error: unknown type name 'u8'
>    93 |  u8 log_cluster_size;
>       |  ^~
> 
> Caused by commit
> 
>   63d18d4913e5 ("f2fs: add F2FS_IOC_GET_COMPRESS_OPTION ioctl")
> 
> You should only use the "__" versions of types in uapi headers.

Thanks, I fixed it in the git directly.

> 
> I have used the version of the f2fs tree from next-20201102 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell


