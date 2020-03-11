Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60081180E7D
	for <lists+linux-next@lfdr.de>; Wed, 11 Mar 2020 04:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727693AbgCKDa3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 10 Mar 2020 23:30:29 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37115 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727659AbgCKDa3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 10 Mar 2020 23:30:29 -0400
Received: from ip5f5bf7ec.dynamic.kabel-deutschland.de ([95.91.247.236] helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1jBs4b-0007j0-Tj; Wed, 11 Mar 2020 03:30:22 +0000
Date:   Wed, 11 Mar 2020 04:30:21 +0100
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next <linux-next@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pid: fix uninitialized retval in alloc_pid()
Message-ID: <20200311033021.qm26c6cltfndlx3c@wittgenstein>
References: <20200311032153.431492-1-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200311032153.431492-1-jhubbard@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 10, 2020 at 08:21:53PM -0700, John Hubbard wrote:
> Commit 8deb24dcb89cb ("pid: make ENOMEM return value more obvious")
> left the return value uninitialized in one error case. The justification
> for the above commit included a statement that retval is "initialized on
> ever[y] failure path in the loop". However, that is not quite good
> enough because there is an earlier case that is before the loop. And
> also, it's more maintenance and merge-safe to initialize it once at the
> top, as evidenced by this build warning that we now have.
> 
> Therefore, restore the top-level initialization of retval.
> 
> Also move the descriptive comment up, and remove the now-redundant
> later initialization of retval.
> 
> Fixes: 8deb24dcb89cb ("pid: make ENOMEM return value more obvious")
> Cc: Christian Brauner <christian.brauner@ubuntu.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Thanks. I already have a fixed-up version in my tree after Stephen
reported it earlier today:
https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/commit/?h=fixes&id=10dab84caf400f2f5f8b010ebb0c7c4272ec5093

(Fwiw, we can't just move the it back up. It needs to be set after the
loop too because it can be set to EPERM before. See
https://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux.git/commit/?h=fixes&id=b26ebfe12f34f372cf041c6f801fa49c3fb382c5
for the motiviation for the comment.)

Christian
