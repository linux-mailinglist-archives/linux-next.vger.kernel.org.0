Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 380B01FEB09
	for <lists+linux-next@lfdr.de>; Thu, 18 Jun 2020 07:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725912AbgFRFiJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Jun 2020 01:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgFRFiJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Jun 2020 01:38:09 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61CCC06174E;
        Wed, 17 Jun 2020 22:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=sggmEXQDsSXu33ja7wNDfNK8p4zxYDlskpe84OjqcXI=; b=NuUpcvlM6lLnP6YGu07G0B1WMv
        IP7m56RjMWKrff1fMxrP2e9Bqf85PkP0gcZ2SGNFbfbv+yQO/7hosKtNTdFzHjS/+XPHSysvBy5aj
        nA6Eq1b28Ry5J01lJCdq99/AgcI5hnd8mZO5H4mub7K6FfF/VdBg/rC4+gJcsffKVlOnPsidHFjFp
        Tr2rnUR+DYzrnB+zm+OORerWS9y3BUNmI2zr48pjg4bAUoaVkYBBXI+mhXsrrCYaLmbX4cIOnvNCL
        xNoyvMVBQy2bmQGS//W4wTQJMDRcYZGH7jd3R0vDJTXnO4fudyM0qLz2tprjKPBjB1tRUx+CCpE+x
        TWdFciFA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jlnFY-0000zF-1Q; Thu, 18 Jun 2020 05:38:08 +0000
Subject: Re: linux-next: Tree for Jun 18 (fs/io_uring)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        axboe <axboe@kernel.dk>, Al Viro <viro@ZenIV.linux.org.uk>
References: <20200618141530.0ca9897d@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <25b48bfa-07ef-c6c8-c4c9-61c213e22f66@infradead.org>
Date:   Wed, 17 Jun 2020 22:38:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200618141530.0ca9897d@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/17/20 9:15 PM, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next release tomorrow.
> 
> Changes since 20200617:
> 

when CONFIG_BLOCK is not set/enabled:

../fs/io_uring.c: In function 'io_async_task_func':
../fs/io_uring.c:4559:7: error: implicit declaration of function 'io_sq_thread_acquire_mm'; did you mean 'atomic_read_acquire'? [-Werror=implicit-function-declaration]
   if (io_sq_thread_acquire_mm(ctx, req)) {
       ^~~~~~~~~~~~~~~~~~~~~~~
       atomic_read_acquire
../fs/io_uring.c: In function 'io_sq_thread':
../fs/io_uring.c:6268:4: error: implicit declaration of function 'io_sq_thread_drop_mm'; did you mean 'io_sq_thread'? [-Werror=implicit-function-declaration]
    io_sq_thread_drop_mm(ctx);
    ^~~~~~~~~~~~~~~~~~~~
    io_sq_thread



-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>

