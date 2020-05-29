Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 096741E723D
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 03:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391058AbgE2Bv0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 21:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390018AbgE2BvY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 May 2020 21:51:24 -0400
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [IPv6:2002:c35c:fd02::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6386EC08C5C6;
        Thu, 28 May 2020 18:51:24 -0700 (PDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.93 #3 (Red Hat Linux))
        id 1jeUAx-00HHeZ-HP; Fri, 29 May 2020 01:51:11 +0000
Date:   Fri, 29 May 2020 02:51:11 +0100
From:   Al Viro <viro@zeniv.linux.org.uk>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Gao Xiang <xiang@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chengguang Xu <cgxu519@mykernel.net>,
        Chao Yu <yuchao0@huawei.com>
Subject: Re: linux-next: manual merge of the vfs tree with the erofs tree
Message-ID: <20200529015111.GA23230@ZenIV.linux.org.uk>
References: <20200529114501.3e2ecc14@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529114501.3e2ecc14@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 29, 2020 at 11:45:01AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vfs tree got a conflict in:
> 
>   fs/erofs/super.c
> 
> between commit:
> 
>   e7cda1ee94f4 ("erofs: code cleanup by removing ifdef macro surrounding")
> 
> from the erofs tree and commit:
> 
>   91a7c5e1d30e ("erofs: convert to use the new mount fs_context api")
> 
> from the vfs tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc fs/erofs/super.c
> index 8e46d204a0c2,2c0bad903fa6..000000000000
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@@ -408,16 -365,12 +365,9 @@@ static int erofs_fc_fill_super(struct s
>   	sb->s_time_gran = 1;
>   
>   	sb->s_op = &erofs_sops;
>  -
>  -#ifdef CONFIG_EROFS_FS_XATTR
>   	sb->s_xattr = erofs_xattr_handlers;
>  -#endif
>   
> - 	/* set erofs default mount options */
> - 	erofs_default_options(sbi);
> - 
> - 	err = erofs_parse_options(sb, data);
> - 	if (err)
> - 		return err;
> - 
> - 	if (test_opt(sbi, POSIX_ACL))
> + 	if (test_opt(ctx, POSIX_ACL))
>   		sb->s_flags |= SB_POSIXACL;
>   	else
>   		sb->s_flags &= ~SB_POSIXACL;

FWIW, I would be glad to have that old erofs commit moved over to
erofs tree...  Folks?
