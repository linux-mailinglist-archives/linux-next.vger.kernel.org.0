Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA741CF239
	for <lists+linux-next@lfdr.de>; Tue, 12 May 2020 12:20:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgELKUa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 12 May 2020 06:20:30 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:57069 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgELKU3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 12 May 2020 06:20:29 -0400
Received: from ip5f5af183.dynamic.kabel-deutschland.de ([95.90.241.131] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1jYS1R-0005rQ-CY; Tue, 12 May 2020 10:20:25 +0000
Date:   Tue, 12 May 2020 12:20:24 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christian Brauner <christian@brauner.io>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pidfd tree
Message-ID: <20200512102024.f7sycax5qzvxay7t@wittgenstein>
References: <20200512201811.12480da0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200512201811.12480da0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, May 12, 2020 at 08:18:11PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pidfd tree, today's linux-next build (x86_64
> allnoconfig) failed like this:
> 
> fs/nsfs.c:232:6: error: redefinition of 'proc_ns_file'
>   232 | bool proc_ns_file(const struct file *file)
>       |      ^~~~~~~~~~~~
> In file included from fs/nsfs.c:6:
> include/linux/proc_fs.h:194:20: note: previous definition of 'proc_ns_file' was here
>   194 | static inline bool proc_ns_file(const struct file *file)
>       |                    ^~~~~~~~~~~~
> 
> Caused by commit
> 
>   1e76b8ad203a ("nsproxy: attach to namespaces via pidfds")
> 
> I have applied the following hack for today:

Thanks for spotting this. I'll fix this now.

Christian

> 
> From 07065344c6fb39c440b0de5f75842066bc97a675 Mon Sep 17 00:00:00 2001
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 12 May 2020 20:08:51 +1000
> Subject: [PATCH] nsproxy: protect proc_ns_file() when CONFIG_PROC_FS is not set
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/nsfs.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/fs/nsfs.c b/fs/nsfs.c
> index 800c1d0eb0d0..9215ad7597d6 100644
> --- a/fs/nsfs.c
> +++ b/fs/nsfs.c
> @@ -229,10 +229,12 @@ int ns_get_name(char *buf, size_t size, struct task_struct *task,
>  	return res;
>  }
>  
> +#ifdef CONFIG_PROC_FS
>  bool proc_ns_file(const struct file *file)
>  {
>  	return file->f_op == &ns_file_operations;
>  }
> +#endif
>  
>  struct file *proc_ns_fget(int fd)
>  {
> -- 
> 2.26.2
> 
> -- 
> Cheers,
> Stephen Rothwell


