Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B1E2B191B
	for <lists+linux-next@lfdr.de>; Fri, 13 Nov 2020 11:33:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgKMKdi (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Nov 2020 05:33:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:53118 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726176AbgKMKdi (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Nov 2020 05:33:38 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 330DBAF1B;
        Fri, 13 Nov 2020 10:33:36 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
        id 865121E1312; Fri, 13 Nov 2020 11:33:35 +0100 (CET)
Date:   Fri, 13 Nov 2020 11:33:35 +0100
From:   Jan Kara <jack@suse.cz>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jan Kara <jack@suse.cz>, Ira Weiny <ira.weiny@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the ext3 tree
Message-ID: <20201113103335.GB11601@quack2.suse.cz>
References: <20201113104736.0d6ea84e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201113104736.0d6ea84e@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri 13-11-20 10:47:36, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the ext3 tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from fs/ext2/file.c:28:
> fs/ext2/ext2.h: In function 'ext2_get_page':
> fs/ext2/ext2.h:764:28: error: implicit declaration of function 'ext2_check_page'; did you mean 'ext2_get_page'? [-Werror=implicit-function-declaration]
>   764 |    if (PageError(page) || !ext2_check_page(page, quiet))
>       |                            ^~~~~~~~~~~~~~~
>       |                            ext2_get_page
> In file included from fs/ext2/balloc.c:15:
> fs/ext2/ext2.h: In function 'ext2_get_page':
> fs/ext2/ext2.h:760:22: error: implicit declaration of function 'read_mapping_page'; did you mean 'unmap_mapping_pages'? [-Werror=implicit-function-declaration]
>   760 |  struct page *page = read_mapping_page(mapping, n, NULL);
>       |                      ^~~~~~~~~~~~~~~~~
>       |                      unmap_mapping_pages
> fs/ext2/ext2.h:760:22: warning: initialization of 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
> fs/ext2/ext2.h:764:28: error: implicit declaration of function 'ext2_check_page'; did you mean 'ext2_get_page'? [-Werror=implicit-function-declaration]
>   764 |    if (PageError(page) || !ext2_check_page(page, quiet))
>       |                            ^~~~~~~~~~~~~~~
>       |                            ext2_get_page
> In file included from include/linux/buffer_head.h:14,
>                  from fs/ext2/balloc.c:20:
> include/linux/pagemap.h: At top level:
> include/linux/pagemap.h:497:28: error: conflicting types for 'read_mapping_page'
>   497 | static inline struct page *read_mapping_page(struct address_space *mapping,
>       |                            ^~~~~~~~~~~~~~~~~
> In file included from fs/ext2/balloc.c:15:
> fs/ext2/ext2.h:760:22: note: previous implicit declaration of 'read_mapping_page' was here
>   760 |  struct page *page = read_mapping_page(mapping, n, NULL);
>       |                      ^~~~~~~~~~~~~~~~~
> In file included from fs/ext2/dir.c:25:
> fs/ext2/ext2.h: In function 'ext2_get_page':
> fs/ext2/ext2.h:760:22: error: implicit declaration of function 'read_mapping_page'; did you mean 'unmap_mapping_pages'? [-Werror=implicit-function-declaration]
>   760 |  struct page *page = read_mapping_page(mapping, n, NULL);
>       |                      ^~~~~~~~~~~~~~~~~
>       |                      unmap_mapping_pages
> fs/ext2/ext2.h:760:22: warning: initialization of 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
> fs/ext2/ext2.h:764:28: error: implicit declaration of function 'ext2_check_page'; did you mean 'ext2_get_page'? [-Werror=implicit-function-declaration]
>   764 |    if (PageError(page) || !ext2_check_page(page, quiet))
>       |                            ^~~~~~~~~~~~~~~
>       |                            ext2_get_page
> In file included from include/linux/buffer_head.h:14,
>                  from fs/ext2/dir.c:26:
> include/linux/pagemap.h: At top level:
> include/linux/pagemap.h:497:28: error: conflicting types for 'read_mapping_page'
>   497 | static inline struct page *read_mapping_page(struct address_space *mapping,
>       |                            ^~~~~~~~~~~~~~~~~
> In file included from fs/ext2/dir.c:25:
> fs/ext2/ext2.h:760:22: note: previous implicit declaration of 'read_mapping_page' was here
>   760 |  struct page *page = read_mapping_page(mapping, n, NULL);
>       |                      ^~~~~~~~~~~~~~~~~
> fs/ext2/dir.c:109:13: error: conflicting types for 'ext2_check_page'
>   109 | static bool ext2_check_page(struct page *page, int quiet)
>       |             ^~~~~~~~~~~~~~~
> In file included from fs/ext2/dir.c:25:
> fs/ext2/ext2.h:764:28: note: previous implicit declaration of 'ext2_check_page' was here
>   764 |    if (PageError(page) || !ext2_check_page(page, quiet))
>       |                            ^~~~~~~~~~~~~~~
> fs/ext2/dir.c:109:13: warning: 'ext2_check_page' defined but not used [-Wunused-function]
>   109 | static bool ext2_check_page(struct page *page, int quiet)
>       |             ^~~~~~~~~~~~~~~
> 
> 
> Caused by commit
> 
>   32559cea1f55 ("fs/ext2: Use ext2_put_page")
> 
> Presumably some missing includes :-(
> 
> I have used the ext3 tree from next-20201112 for today.

Yeah, sorry for that. Should be fixed now.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
