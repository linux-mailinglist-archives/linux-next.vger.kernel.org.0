Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8DED3B10C6
	for <lists+linux-next@lfdr.de>; Wed, 23 Jun 2021 01:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhFVXtU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 22 Jun 2021 19:49:20 -0400
Received: from gateway24.websitewelcome.com ([192.185.51.228]:17259 "EHLO
        gateway24.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229746AbhFVXtU (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 22 Jun 2021 19:49:20 -0400
X-Greylist: delayed 1505 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Jun 2021 19:49:20 EDT
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id 9E565164E48
        for <linux-next@vger.kernel.org>; Tue, 22 Jun 2021 17:59:26 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id vpMclx3W7hbxpvpMclZl6Y; Tue, 22 Jun 2021 17:59:26 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7ZjE/ww3YHjumRnnXmlZ48b8zONwLCovGxxgZPzissI=; b=xMBiAXE21rcybaF27+y28VMSwg
        OhMwVYVp5qwAZT6Dp0pwvK7COZQXug2AcHAKkvFZEglx8JxjzxtD6ll5OZ+m3a9A23OxQxDoecPpd
        1bIZtzlhajeCqVZWndCSmrW5I26+NqFe3bJgd7Q63xv1n/t6ziSNKryHaAnhOXuWUy+U2CcVz8gQ3
        HMVU7vkGr4Gs6ad7Fu+mbwiSf3Fhz/P0YO73dRGAPyJst/pwQDT0nppRaNderShW72XhsTfQNoHyb
        8KSRDpgZSKfOdBwsBu6qduvFv1GqmD/DaOQFlJSPIhXjmSm8giOqCz0T9NR43MaqeK4CJaQOZwfqu
        RY5/q18A==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:45694 helo=[192.168.15.8])
        by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <gustavo@embeddedor.com>)
        id 1lvpMa-003BJR-9V; Tue, 22 Jun 2021 17:59:24 -0500
Subject: Re: linux-next: build warning after merge of the kspp-gustavo tree
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        David Sterba <dsterba@suse.cz>
References: <20210623083901.1d49d19d@canb.auug.org.au>
 <a6770d54-7d40-5c21-2d21-f2e25cc5756e@embeddedor.com>
Message-ID: <22c088e7-1ecf-3dab-de47-23e865d09d1c@embeddedor.com>
Date:   Tue, 22 Jun 2021 18:01:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a6770d54-7d40-5c21-2d21-f2e25cc5756e@embeddedor.com>
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
X-Exim-ID: 1lvpMa-003BJR-9V
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8]) [187.162.31.110]:45694
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 22
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 6/22/21 17:46, Gustavo A. R. Silva wrote:
> Hi Stephen,
> 
> I will remove that commit and work on fixing those issues before
> trying again.

Done:

I just removed commit 8d7900f545f1 ("Makefile: Enable -Warray-bounds"):

https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/log/?h=for-next/kspp

Sorry for the noise.

Thanks
--
Gustavo

> 
> Thanks for the report!
> --
> Gustavo
> 
> On 6/22/21 17:39, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the kspp-gustavo tree, today's linux-next build (powerpc
>> ppc64_defconfig) produced this warning:
>>
>> In file included from fs/btrfs/ctree.h:9,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/struct-funcs.c: In function 'btrfs_get_token_16':
>> fs/btrfs/struct-funcs.c:80:46: warning: array subscript 1 is above array bounds of 'struct page *[1]' [-Warray-bounds]
>>    80 |  token->kaddr = page_address(token->eb->pages[idx + 1]);  \
>>       |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
>> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>>  1627 | #define page_address(page) lowmem_page_address(page)
>>       |                                                ^~~~
>> fs/btrfs/struct-funcs.c:161:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>>   161 | DEFINE_BTRFS_SETGET_BITS(16)
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from fs/btrfs/ctree.h:32,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>>       |               ^~~~~
>> In file included from fs/btrfs/ctree.h:9,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/struct-funcs.c: In function 'btrfs_get_16':
>> fs/btrfs/struct-funcs.c:101:32: warning: array subscript 1 is above array bounds of 'struct page * const[1]' [-Warray-bounds]
>>   101 |  kaddr = page_address(eb->pages[idx + 1]);   \
>>       |                       ~~~~~~~~~^~~~~~~~~
>> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>>  1627 | #define page_address(page) lowmem_page_address(page)
>>       |                                                ^~~~
>> fs/btrfs/struct-funcs.c:161:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>>   161 | DEFINE_BTRFS_SETGET_BITS(16)
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from fs/btrfs/ctree.h:32,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>>       |               ^~~~~
>> In file included from fs/btrfs/ctree.h:9,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/struct-funcs.c: In function 'btrfs_set_token_16':
>> fs/btrfs/struct-funcs.c:133:46: warning: array subscript 1 is above array bounds of 'struct page *[1]' [-Warray-bounds]
>>   133 |  token->kaddr = page_address(token->eb->pages[idx + 1]);  \
>>       |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
>> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>>  1627 | #define page_address(page) lowmem_page_address(page)
>>       |                                                ^~~~
>> fs/btrfs/struct-funcs.c:161:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>>   161 | DEFINE_BTRFS_SETGET_BITS(16)
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from fs/btrfs/ctree.h:32,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>>       |               ^~~~~
>> In file included from fs/btrfs/ctree.h:9,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/struct-funcs.c: In function 'btrfs_set_16':
>> fs/btrfs/struct-funcs.c:156:32: warning: array subscript 1 is above array bounds of 'struct page * const[1]' [-Warray-bounds]
>>   156 |  kaddr = page_address(eb->pages[idx + 1]);   \
>>       |                       ~~~~~~~~~^~~~~~~~~
>> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>>  1627 | #define page_address(page) lowmem_page_address(page)
>>       |                                                ^~~~
>> fs/btrfs/struct-funcs.c:161:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>>   161 | DEFINE_BTRFS_SETGET_BITS(16)
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from fs/btrfs/ctree.h:32,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>>       |               ^~~~~
>> In file included from fs/btrfs/ctree.h:9,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/struct-funcs.c: In function 'btrfs_get_token_32':
>> fs/btrfs/struct-funcs.c:80:46: warning: array subscript 1 is above array bounds of 'struct page *[1]' [-Warray-bounds]
>>    80 |  token->kaddr = page_address(token->eb->pages[idx + 1]);  \
>>       |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
>> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>>  1627 | #define page_address(page) lowmem_page_address(page)
>>       |                                                ^~~~
>> fs/btrfs/struct-funcs.c:162:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>>   162 | DEFINE_BTRFS_SETGET_BITS(32)
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from fs/btrfs/ctree.h:32,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>>       |               ^~~~~
>> In file included from fs/btrfs/ctree.h:9,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/struct-funcs.c: In function 'btrfs_get_32':
>> fs/btrfs/struct-funcs.c:101:32: warning: array subscript 1 is above array bounds of 'struct page * const[1]' [-Warray-bounds]
>>   101 |  kaddr = page_address(eb->pages[idx + 1]);   \
>>       |                       ~~~~~~~~~^~~~~~~~~
>> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>>  1627 | #define page_address(page) lowmem_page_address(page)
>>       |                                                ^~~~
>> fs/btrfs/struct-funcs.c:162:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>>   162 | DEFINE_BTRFS_SETGET_BITS(32)
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from fs/btrfs/ctree.h:32,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>>       |               ^~~~~
>> In file included from fs/btrfs/ctree.h:9,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/struct-funcs.c: In function 'btrfs_set_token_32':
>> fs/btrfs/struct-funcs.c:133:46: warning: array subscript 1 is above array bounds of 'struct page *[1]' [-Warray-bounds]
>>   133 |  token->kaddr = page_address(token->eb->pages[idx + 1]);  \
>>       |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
>> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>>  1627 | #define page_address(page) lowmem_page_address(page)
>>       |                                                ^~~~
>> fs/btrfs/struct-funcs.c:162:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>>   162 | DEFINE_BTRFS_SETGET_BITS(32)
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from fs/btrfs/ctree.h:32,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>>       |               ^~~~~
>> In file included from fs/btrfs/ctree.h:9,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/struct-funcs.c: In function 'btrfs_set_32':
>> fs/btrfs/struct-funcs.c:156:32: warning: array subscript 1 is above array bounds of 'struct page * const[1]' [-Warray-bounds]
>>   156 |  kaddr = page_address(eb->pages[idx + 1]);   \
>>       |                       ~~~~~~~~~^~~~~~~~~
>> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>>  1627 | #define page_address(page) lowmem_page_address(page)
>>       |                                                ^~~~
>> fs/btrfs/struct-funcs.c:162:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>>   162 | DEFINE_BTRFS_SETGET_BITS(32)
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from fs/btrfs/ctree.h:32,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>>       |               ^~~~~
>> In file included from fs/btrfs/ctree.h:9,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/struct-funcs.c: In function 'btrfs_get_token_64':
>> fs/btrfs/struct-funcs.c:80:46: warning: array subscript 1 is above array bounds of 'struct page *[1]' [-Warray-bounds]
>>    80 |  token->kaddr = page_address(token->eb->pages[idx + 1]);  \
>>       |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
>> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>>  1627 | #define page_address(page) lowmem_page_address(page)
>>       |                                                ^~~~
>> fs/btrfs/struct-funcs.c:163:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>>   163 | DEFINE_BTRFS_SETGET_BITS(64)
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from fs/btrfs/ctree.h:32,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>>       |               ^~~~~
>> In file included from fs/btrfs/ctree.h:9,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/struct-funcs.c: In function 'btrfs_get_64':
>> fs/btrfs/struct-funcs.c:101:32: warning: array subscript 1 is above array bounds of 'struct page * const[1]' [-Warray-bounds]
>>   101 |  kaddr = page_address(eb->pages[idx + 1]);   \
>>       |                       ~~~~~~~~~^~~~~~~~~
>> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>>  1627 | #define page_address(page) lowmem_page_address(page)
>>       |                                                ^~~~
>> fs/btrfs/struct-funcs.c:163:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>>   163 | DEFINE_BTRFS_SETGET_BITS(64)
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from fs/btrfs/ctree.h:32,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>>       |               ^~~~~
>> In file included from fs/btrfs/ctree.h:9,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/struct-funcs.c: In function 'btrfs_set_token_64':
>> fs/btrfs/struct-funcs.c:133:46: warning: array subscript 1 is above array bounds of 'struct page *[1]' [-Warray-bounds]
>>   133 |  token->kaddr = page_address(token->eb->pages[idx + 1]);  \
>>       |                              ~~~~~~~~~~~~~~~~^~~~~~~~~
>> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>>  1627 | #define page_address(page) lowmem_page_address(page)
>>       |                                                ^~~~
>> fs/btrfs/struct-funcs.c:163:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>>   163 | DEFINE_BTRFS_SETGET_BITS(64)
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from fs/btrfs/ctree.h:32,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>>       |               ^~~~~
>> In file included from fs/btrfs/ctree.h:9,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/struct-funcs.c: In function 'btrfs_set_64':
>> fs/btrfs/struct-funcs.c:156:32: warning: array subscript 1 is above array bounds of 'struct page * const[1]' [-Warray-bounds]
>>   156 |  kaddr = page_address(eb->pages[idx + 1]);   \
>>       |                       ~~~~~~~~~^~~~~~~~~
>> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>>  1627 | #define page_address(page) lowmem_page_address(page)
>>       |                                                ^~~~
>> fs/btrfs/struct-funcs.c:163:1: note: in expansion of macro 'DEFINE_BTRFS_SETGET_BITS'
>>   163 | DEFINE_BTRFS_SETGET_BITS(64)
>>       | ^~~~~~~~~~~~~~~~~~~~~~~~
>> In file included from fs/btrfs/ctree.h:32,
>>                  from fs/btrfs/struct-funcs.c:8:
>> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>>       |               ^~~~~
>> In file included from include/linux/bvec.h:14,
>>                  from include/linux/blk_types.h:10,
>>                  from include/linux/genhd.h:19,
>>                  from include/linux/blkdev.h:8,
>>                  from fs/btrfs/disk-io.c:7:
>> fs/btrfs/disk-io.c: In function 'csum_tree_block':
>> fs/btrfs/disk-io.c:225:34: warning: array subscript 1 is above array bounds of 'struct page *[1]' [-Warray-bounds]
>>   225 |   kaddr = page_address(buf->pages[i]);
>>       |                        ~~~~~~~~~~^~~
>> include/linux/mm.h:1627:48: note: in definition of macro 'page_address'
>>  1627 | #define page_address(page) lowmem_page_address(page)
>>       |                                                ^~~~
>> In file included from fs/btrfs/ctree.h:32,
>>                  from fs/btrfs/disk-io.c:22:
>> fs/btrfs/extent_io.h:97:15: note: while referencing 'pages'
>>    97 |  struct page *pages[INLINE_EXTENT_BUFFER_PAGES];
>>       |               ^~~~~
>>
>> Introduced by commit
>>
>>   8d7900f545f1 ("Makefile: Enable -Warray-bounds")
>>
