Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81FFB17EC32
	for <lists+linux-next@lfdr.de>; Mon,  9 Mar 2020 23:37:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727304AbgCIWhf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Mar 2020 18:37:35 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41599 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbgCIWhf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Mar 2020 18:37:35 -0400
Received: from ip5f5bf7ec.dynamic.kabel-deutschland.de ([95.91.247.236] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1jBR1h-0004um-7Y; Mon, 09 Mar 2020 22:37:33 +0000
Date:   Mon, 9 Mar 2020 23:37:32 +0100
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christian Brauner <christian@brauner.io>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pidfd-fixes tree
Message-ID: <20200309223732.c4fr7p4lxzebqzn7@wittgenstein>
References: <20200310080758.0b7b6f6b@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200310080758.0b7b6f6b@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 10, 2020 at 08:07:58AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pidfd-fixes tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
> 
> In file included from include/linux/rwsem.h:18,
>                  from include/linux/mm_types.h:11,
>                  from include/linux/mmzone.h:21,
>                  from include/linux/gfp.h:6,
>                  from include/linux/mm.h:10,
>                  from kernel/pid.c:30:
> kernel/pid.c: In function 'alloc_pid':
> include/linux/err.h:26:9: warning: 'retval' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    26 |  return (void *) error;
>       |         ^~~~~~~~~~~~~~
> kernel/pid.c:168:6: note: 'retval' was declared here
>   168 |  int retval;
>       |      ^~~~~~
> 
> Introduced by commit
> 
>   8deb24dcb89c ("pid: make ENOMEM return value more obvious")

Thanks, will fix now. Sorry for the noise!
Christian;
