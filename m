Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFAA92A3F3B
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 09:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725988AbgKCIqJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Nov 2020 03:46:09 -0500
Received: from mx2.suse.de ([195.135.220.15]:55776 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726211AbgKCIqJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Nov 2020 03:46:09 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1604393167;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mVEcr7kDtyq7N5Wpt8+TN28/bLu1zMtwTW239bYnVGY=;
        b=E9u2RP0eGfoyFhk4LCKLwiSp8ewzx4ZcEFNLXaThbEHn89+03I72D0/eiWpi8HIUJ9sxg9
        kSKQGQJ5P8F0XpqVS60GP7aRV+zO6KE3Acng03ks4NGaJvW/60ukMu1rRiuPa7ydUvgYMu
        igmIMRAgWvR77/HlcmAy+hbR6jNbMl4=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 45541AE53;
        Tue,  3 Nov 2020 08:46:07 +0000 (UTC)
Date:   Tue, 3 Nov 2020 09:46:06 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Paul Menzel <pmenzel@molgen.mpg.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the printk tree
Message-ID: <20201103084606.GK20201@alley>
References: <20201103083201.4c653eed@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103083201.4c653eed@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue 2020-11-03 08:32:01, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   8a8424bf2439 ("init/Kconfig: Fix CPU number in LOG_CPU_MAX_BUF_SHIFT description")
> 
> Fixes tag
> 
>   Fixes: 23b2899f7f ("printk: allow increasing the ring buffer depending on the number of CPUs")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Should be fixed now. It is a pity that checkpatch.pl did not warn
about it.

Thanks for the report.

Best Regards,
Petr
