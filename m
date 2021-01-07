Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261302EC761
	for <lists+linux-next@lfdr.de>; Thu,  7 Jan 2021 01:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726062AbhAGAk4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Jan 2021 19:40:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbhAGAkz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Jan 2021 19:40:55 -0500
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CC33C061370;
        Wed,  6 Jan 2021 16:40:15 -0800 (PST)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kxJLS-007arZ-RK; Thu, 07 Jan 2021 00:40:06 +0000
Date:   Thu, 7 Jan 2021 00:40:06 +0000
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs tree
Message-ID: <20210107004006.GF3579531@ZenIV.linux.org.uk>
References: <20210107101544.68bdd395@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210107101544.68bdd395@canb.auug.org.au>
Sender: Al Viro <viro@ftp.linux.org.uk>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jan 07, 2021 at 10:15:44AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> In file included from fs/erofs/xattr.h:10,
>                  from fs/erofs/namei.c:7:
> fs/erofs/namei.c: In function 'erofs_lookup':
> fs/erofs/internal.h:23:21: warning: format '%s' expects argument of type 'char *', but argument 4 has type 'struct dentry *' [-Wformat=]
>    23 | #define pr_fmt(fmt) "erofs: " fmt
>       |                     ^~~~~~~~~
> include/linux/dynamic_debug.h:129:15: note: in expansion of macro 'pr_fmt'
>   129 |   func(&id, ##__VA_ARGS__);  \
>       |               ^~~~~~~~~~~
> include/linux/dynamic_debug.h:147:2: note: in expansion of macro '__dynamic_func_call'
>   147 |  __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
>       |  ^~~~~~~~~~~~~~~~~~~
> include/linux/dynamic_debug.h:157:2: note: in expansion of macro '_dynamic_func_call'
>   157 |  _dynamic_func_call(fmt, __dynamic_pr_debug,  \
>       |  ^~~~~~~~~~~~~~~~~~
> include/linux/printk.h:424:2: note: in expansion of macro 'dynamic_pr_debug'
>   424 |  dynamic_pr_debug(fmt, ##__VA_ARGS__)
>       |  ^~~~~~~~~~~~~~~~
> fs/erofs/internal.h:34:33: note: in expansion of macro 'pr_debug'
>    34 | #define erofs_dbg(x, ...)       pr_debug(x "\n", ##__VA_ARGS__)
>       |                                 ^~~~~~~~
> fs/erofs/namei.c:237:3: note: in expansion of macro 'erofs_dbg'
>   237 |   erofs_dbg("%pd, %s (nid %llu) found, d_type %u", __func__,
>       |   ^~~~~~~~~
> 
> Introduced by commit
> 
>   879d4376533c ("erofs: use %pd instead of messing with ->d_name")

Gyah...  "%s, %pd", not "%pd, %s".  Sorry, fixed and pushed.
