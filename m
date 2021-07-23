Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B47F3D3964
	for <lists+linux-next@lfdr.de>; Fri, 23 Jul 2021 13:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234301AbhGWKne (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 23 Jul 2021 06:43:34 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:39268 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231703AbhGWKnd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 23 Jul 2021 06:43:33 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 253511FF90;
        Fri, 23 Jul 2021 11:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1627039446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xS9EeQJKE82xivD+FsqdFH335Ef7VYaz/D3ftn0ztEo=;
        b=GUe/2Tbat5Gk+Kk4RclhlqdBkHE3JnOyO6dBrJ4So73MITNLYqc/Xym0Y0Ik932zftkb8V
        9rojo/bCx7ME2G6JGqhCmBB2akdpCfFje+i9R+GCUyIVOXIcwfVDmnQ4ZNSBQ/6flpuq6Z
        BPJBgmDjHgf76HXJEfpUJQfq/q1p7tE=
Received: from suse.cz (unknown [10.100.224.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id EEA67A3B8F;
        Fri, 23 Jul 2021 11:24:05 +0000 (UTC)
Date:   Fri, 23 Jul 2021 13:24:05 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Chris Down <chris@chrisdown.name>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCH] printk/documentation: Update printk()/_printk()
 documentation
Message-ID: <YPqm1XpFIcOjBQsl@alley>
References: <20210720162423.75f61ce0@canb.auug.org.au>
 <YPa/D8tSyk7dw1/l@chrisdown.name>
 <YPbABBSTkN+xNY0w@chrisdown.name>
 <YPqjdqSH5j69FnHV@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPqjdqSH5j69FnHV@alley>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri 2021-07-23 13:09:43, Petr Mladek wrote:
> The commit 337015573718b161 ("printk: Userspace format indexing support")
> caused the following warning when building htmldocs:
> 
> kernel/printk/printk.c:1: warning: 'printk' not found
> 
> The problem is that printk() became a macro that is defined
> in include/linux/printk.h instead of kernel/printk.c. The original
> function was renamed to _printk().
> 
> Fixes: 337015573718b161 ("printk: Userspace format indexing support")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Petr Mladek <pmladek@suse.com>
> Link: https://lore.kernel.org/r/YPbBfdz9srIpI+bb@chrisdown.name
> ---
> This should do the trick. I do not longer see the warning.

And I have just pushed it together with the other fixes into
printk/linux.git, branch for-5.15-printk-index.

Best Regards,
Petr
