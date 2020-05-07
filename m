Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D2921C800D
	for <lists+linux-next@lfdr.de>; Thu,  7 May 2020 04:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbgEGCgE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 May 2020 22:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728079AbgEGCgE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 May 2020 22:36:04 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBCEFC061A0F;
        Wed,  6 May 2020 19:36:03 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jWWOD-002cOr-Vc; Thu, 07 May 2020 02:35:58 +0000
Date:   Thu, 7 May 2020 03:35:57 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jens Axboe <axboe@kernel.dk>
Subject: Re: linux-next: build failure after merge of the vfs tree
Message-ID: <20200507023557.GE23230@ZenIV.linux.org.uk>
References: <20200507103921.371b1329@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200507103921.371b1329@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 07, 2020 at 10:39:21AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> fs/eventfd.c: In function 'eventfd_read':
> fs/eventfd.c:226:6: error: implicit declaration of function 'iov_iter_count' [-Werror=implicit-function-declaration]
>   226 |  if (iov_iter_count(to) < sizeof(ucnt))
>       |      ^~~~~~~~~~~~~~
> In file included from include/linux/file.h:9,
>                  from fs/eventfd.c:9:
> fs/eventfd.c:257:15: error: implicit declaration of function 'copy_to_iter'; did you mean 'copy_to_user'? [-Werror=implicit-function-declaration]
>   257 |  if (unlikely(copy_to_iter(&ucnt, sizeof(ucnt), to) != sizeof(ucnt)))
>       |               ^~~~~~~~~~~~
> 
> Caused by commit
> 
>   a6515b3a7410 ("eventfd: convert to f_op->read_iter()")
> 
> I have applied the following patch for today:

[snip]

folded and pushed out
