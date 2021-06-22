Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE6373B1056
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 01:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbhFVXIz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 19:08:55 -0400
Received: from gateway22.websitewelcome.com ([192.185.46.225]:49035 "EHLO
        gateway22.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229675AbhFVXIx (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Jun 2021 19:08:53 -0400
X-Greylist: delayed 1301 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Jun 2021 19:08:53 EDT
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
        by gateway22.websitewelcome.com (Postfix) with ESMTP id 3A7BEDABC
        for <linux-next@vger.kernel.org>; Tue, 22 Jun 2021 17:44:54 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id vp8YlzCgSuywRvp8YlnRNx; Tue, 22 Jun 2021 17:44:54 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=OJUkMfA+JgaB80nhxjaqKdAAwKPsyK2LZa1fEH8Nw5s=; b=UkTaRtw+7uscS7vpYWGhKYBUxi
        Ryh4QO8h29fQZjybia8sDUAR5CtE2Dv4upNLEYjUyuxOJ2zCVLRfZ7Q4Cl7dkRK6/kLDNFoTjEng3
        SyTvo23qRKXZdjhsn6DMfvqqjnlXdTI99sFxooC4M2BCzSSsIr+mQ+mq/XrBw5AgWCv58eu59lgsf
        UpeGMCIDhTqaudQysNfSgO6qn49I++KSy3ImQuYGUtshiebs9loB1vPlIQ20J3p506dUvwNKIaKOB
        TnAB7MtjEjPrtAoR9Pl5zvU54ZruH3zdJQNjnJlfG6T9Hx0H5qaNRy9sw+bLK8Yu0jOyvSUsHjgnO
        3cGVbTtA==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:45646 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1lvp8U-002vwe-TR; Tue, 22 Jun 2021 17:44:51 -0500
Subject: Re: linux-next: build warning after merge of the kspp-gustavo tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        David Sterba <dsterba@suse.cz>
References: <20210623083901.1d49d19d@canb.auug.org.au>
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <a6770d54-7d40-5c21-2d21-f2e25cc5756e@embeddedor.com>
Date:   Tue, 22 Jun 2021 17:46:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210623083901.1d49d19d@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lvp8U-002vwe-TR
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:45646
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 17
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

I will remove that commit and work on fixing those issues before
trying again.

Thanks for the report!
--
Gustavo

On 6/22/21 17:39, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp-gustavo tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> In file included from fs/btrfs/ctree.h:9,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/struct-funcs.c: In function 'btrfs_get_token_16':
> fs/btrfs/struct-funcs.c:80:46: warning: array subscript 1 is above array bounds of 'struct page *[1]' [-Warray-bounds]
>    80 |  token->kaddr = page_address(token->eb->pages[idx + 1]);  \
>       |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>  1627 | #define page_address(page) lowmem_page_address(page)
>       |                                                ^~~~
> fs/btrfs/struct-funcs.c:161:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>   161 | DEFINE_BTRFS_SETGET_BITS(16)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from fs/btrfs/ctree.h:32,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>       |               ^~~~~
> In file included from fs/btrfs/ctree.h:9,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/struct-funcs.c: In function 'btrfs_get_16':
> fs/btrfs/struct-funcs.c:101:32: warning: array subscript 1 is above array bounds of 'struct page * const[1]' [-Warray-bounds]
>   101 |  kaddr = page_address(eb->pages[idx + 1]);   \
>       |                       ~~~~~~~~~^~~~~~~~~
> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>  1627 | #define page_address(page) lowmem_page_address(page)
>       |                                                ^~~~
> fs/btrfs/struct-funcs.c:161:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>   161 | DEFINE_BTRFS_SETGET_BITS(16)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from fs/btrfs/ctree.h:32,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>       |               ^~~~~
> In file included from fs/btrfs/ctree.h:9,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/struct-funcs.c: In function 'btrfs_set_token_16':
> fs/btrfs/struct-funcs.c:133:46: warning: array subscript 1 is above array bounds of 'struct page *[1]' [-Warray-bounds]
>   133 |  token->kaddr = page_address(token->eb->pages[idx + 1]);  \
>       |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>  1627 | #define page_address(page) lowmem_page_address(page)
>       |                                                ^~~~
> fs/btrfs/struct-funcs.c:161:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>   161 | DEFINE_BTRFS_SETGET_BITS(16)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from fs/btrfs/ctree.h:32,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>       |               ^~~~~
> In file included from fs/btrfs/ctree.h:9,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/struct-funcs.c: In function 'btrfs_set_16':
> fs/btrfs/struct-funcs.c:156:32: warning: array subscript 1 is above array bounds of 'struct page * const[1]' [-Warray-bounds]
>   156 |  kaddr = page_address(eb->pages[idx + 1]);   \
>       |                       ~~~~~~~~~^~~~~~~~~
> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>  1627 | #define page_address(page) lowmem_page_address(page)
>       |                                                ^~~~
> fs/btrfs/struct-funcs.c:161:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>   161 | DEFINE_BTRFS_SETGET_BITS(16)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from fs/btrfs/ctree.h:32,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>       |               ^~~~~
> In file included from fs/btrfs/ctree.h:9,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/struct-funcs.c: In function 'btrfs_get_token_32':
> fs/btrfs/struct-funcs.c:80:46: warning: array subscript 1 is above array bounds of 'struct page *[1]' [-Warray-bounds]
>    80 |  token->kaddr = page_address(token->eb->pages[idx + 1]);  \
>       |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>  1627 | #define page_address(page) lowmem_page_address(page)
>       |                                                ^~~~
> fs/btrfs/struct-funcs.c:162:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>   162 | DEFINE_BTRFS_SETGET_BITS(32)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from fs/btrfs/ctree.h:32,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>       |               ^~~~~
> In file included from fs/btrfs/ctree.h:9,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/struct-funcs.c: In function 'btrfs_get_32':
> fs/btrfs/struct-funcs.c:101:32: warning: array subscript 1 is above array bounds of 'struct page * const[1]' [-Warray-bounds]
>   101 |  kaddr = page_address(eb->pages[idx + 1]);   \
>       |                       ~~~~~~~~~^~~~~~~~~
> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>  1627 | #define page_address(page) lowmem_page_address(page)
>       |                                                ^~~~
> fs/btrfs/struct-funcs.c:162:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>   162 | DEFINE_BTRFS_SETGET_BITS(32)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from fs/btrfs/ctree.h:32,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>       |               ^~~~~
> In file included from fs/btrfs/ctree.h:9,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/struct-funcs.c: In function 'btrfs_set_token_32':
> fs/btrfs/struct-funcs.c:133:46: warning: array subscript 1 is above array bounds of 'struct page *[1]' [-Warray-bounds]
>   133 |  token->kaddr = page_address(token->eb->pages[idx + 1]);  \
>       |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>  1627 | #define page_address(page) lowmem_page_address(page)
>       |                                                ^~~~
> fs/btrfs/struct-funcs.c:162:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>   162 | DEFINE_BTRFS_SETGET_BITS(32)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from fs/btrfs/ctree.h:32,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>       |               ^~~~~
> In file included from fs/btrfs/ctree.h:9,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/struct-funcs.c: In function 'btrfs_set_32':
> fs/btrfs/struct-funcs.c:156:32: warning: array subscript 1 is above array bounds of 'struct page * const[1]' [-Warray-bounds]
>   156 |  kaddr = page_address(eb->pages[idx + 1]);   \
>       |                       ~~~~~~~~~^~~~~~~~~
> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>  1627 | #define page_address(page) lowmem_page_address(page)
>       |                                                ^~~~
> fs/btrfs/struct-funcs.c:162:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>   162 | DEFINE_BTRFS_SETGET_BITS(32)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from fs/btrfs/ctree.h:32,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>       |               ^~~~~
> In file included from fs/btrfs/ctree.h:9,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/struct-funcs.c: In function 'btrfs_get_token_64':
> fs/btrfs/struct-funcs.c:80:46: warning: array subscript 1 is above array bounds of 'struct page *[1]' [-Warray-bounds]
>    80 |  token->kaddr = page_address(token->eb->pages[idx + 1]);  \
>       |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>  1627 | #define page_address(page) lowmem_page_address(page)
>       |                                                ^~~~
> fs/btrfs/struct-funcs.c:163:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>   163 | DEFINE_BTRFS_SETGET_BITS(64)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from fs/btrfs/ctree.h:32,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>       |               ^~~~~
> In file included from fs/btrfs/ctree.h:9,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/struct-funcs.c: In function 'btrfs_get_64':
> fs/btrfs/struct-funcs.c:101:32: warning: array subscript 1 is above array bounds of 'struct page * const[1]' [-Warray-bounds]
>   101 |  kaddr = page_address(eb->pages[idx + 1]);   \
>       |                       ~~~~~~~~~^~~~~~~~~
> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>  1627 | #define page_address(page) lowmem_page_address(page)
>       |                                                ^~~~
> fs/btrfs/struct-funcs.c:163:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>   163 | DEFINE_BTRFS_SETGET_BITS(64)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from fs/btrfs/ctree.h:32,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>       |               ^~~~~
> In file included from fs/btrfs/ctree.h:9,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/struct-funcs.c: In function 'btrfs_set_token_64':
> fs/btrfs/struct-funcs.c:133:46: warning: array subscript 1 is above array bounds of 'struct page *[1]' [-Warray-bounds]
>   133 |  token->kaddr = page_address(token->eb->pages[idx + 1]);  \
>       |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>  1627 | #define page_address(page) lowmem_page_address(page)
>       |                                                ^~~~
> fs/btrfs/struct-funcs.c:163:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>   163 | DEFINE_BTRFS_SETGET_BITS(64)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from fs/btrfs/ctree.h:32,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>       |               ^~~~~
> In file included from fs/btrfs/ctree.h:9,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/struct-funcs.c: In function 'btrfs_set_64':
> fs/btrfs/struct-funcs.c:156:32: warning: array subscript 1 is above array bounds of 'struct page * const[1]' [-Warray-bounds]
>   156 |  kaddr = page_address(eb->pages[idx + 1]);   \
>       |                       ~~~~~~~~~^~~~~~~~~
> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>  1627 | #define page_address(page) lowmem_page_address(page)
>       |                                                ^~~~
> fs/btrfs/struct-funcs.c:163:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>   163 | DEFINE_BTRFS_SETGET_BITS(64)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> In file included from fs/btrfs/ctree.h:32,
>                  from fs/btrfs/struct-funcs.c:8:
> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>       |               ^~~~~
> In file included from include/linux/bvec.h:14,
>                  from include/linux/blk_types.h:10,
>                  from include/linux/genhd.h:19,
>                  from include/linux/blkdev.h:8,
>                  from fs/btrfs/disk-io.c:7:
> fs/btrfs/disk-io.c: In function 'csum_tree_block':
> fs/btrfs/disk-io.c:225:34: warning: array subscript 1 is above array bounds of 'struct page *[1]' [-Warray-bounds]
>   225 |   kaddr = page_address(buf->pages[i]);
>       |                        ~~~~~~~~~~^~~
> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>  1627 | #define page_address(page) lowmem_page_address(page)
>       |                                                ^~~~
> In file included from fs/btrfs/ctree.h:32,
>                  from fs/btrfs/disk-io.c:22:
> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>       |               ^~~~~
> 
> Introduced by commit
> 
>   8d7900f545f1 ("Makefile: Enable -Warray-bounds")
> 
