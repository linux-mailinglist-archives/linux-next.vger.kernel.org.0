Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A96A21B0DA
	for <lists+linux-next@lfdr.de>; Fri, 10 Jul 2020 09:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgGJH7N (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 10 Jul 2020 03:59:13 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:38944 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbgGJH7J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 10 Jul 2020 03:59:09 -0400
Received: from ip5f5af08c.dynamic.kabel-deutschland.de ([95.90.240.140] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1jtnw2-0002Un-JH; Fri, 10 Jul 2020 07:59:06 +0000
Date:   Fri, 10 Jul 2020 09:59:06 +0200
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christian Brauner <christian@brauner.io>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the pidfd tree
Message-ID: <20200710075906.dilvvpj3q5dij7fu@wittgenstein>
References: <20200710163204.651bb496@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200710163204.651bb496@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 10, 2020 at 04:32:04PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the pidfd tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> fs/nsfs.c: In function 'ns_ioctl':
> fs/nsfs.c:195:14: warning: unused variable 'pid_struct' [-Wunused-variable]
>   195 |  struct pid *pid_struct;
>       |              ^~~~~~~~~~
> fs/nsfs.c:194:22: warning: unused variable 'child_reaper' [-Wunused-variable]
>   194 |  struct task_struct *child_reaper;
>       |                      ^~~~~~~~~~~~
> 
> Introduced by commit
> 
>   a57927d2dce2 ("nsfs: add NS_GET_INIT_PID ioctl")

Hm, I wonder how that didn't get caught during a git rebase -x "make" v5.8-rc4 build...
Sorry about that!

Thanks!
Christian
