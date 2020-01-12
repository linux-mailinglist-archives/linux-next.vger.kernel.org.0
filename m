Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D292138840
	for <lists+linux-next@lfdr.de>; Sun, 12 Jan 2020 21:35:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733277AbgALUfl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Jan 2020 15:35:41 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:47292 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732914AbgALUfl (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Jan 2020 15:35:41 -0500
Received: from ip5f5bd663.dynamic.kabel-deutschland.de ([95.91.214.99] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1iqjxS-0004tC-II; Sun, 12 Jan 2020 20:35:38 +0000
Date:   Sun, 12 Jan 2020 21:35:37 +0100
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christian Brauner <christian@brauner.io>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the pidfd tree
Message-ID: <20200112203536.ahxzux7ao6b3ypul@wittgenstein>
References: <20200113072221.4c17f28a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200113072221.4c17f28a@canb.auug.org.au>
User-Agent: NeoMutt/20180716
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jan 13, 2020 at 07:22:21AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   f8e8354b6b5f ("test: Add test for pidfd getfd")
>   666c3470317f ("arch: wire up pidfd_getfd syscall")
>   527051993a23 ("pid: Implement pidfd_getfd syscall")
>   6fbe955c41ae ("vfs, fdtable: Add fget_task helper")
> 
> are missing a Signed-off-by from their committer.

Thanks for reporting this.
Fixed now!

Christian
