Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C2C628E7D6
	for <lists+linux-next@lfdr.de>; Wed, 14 Oct 2020 22:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbgJNUY3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 16:24:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:38236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726111AbgJNUY3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 14 Oct 2020 16:24:29 -0400
Received: from localhost (unknown [104.132.1.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE3252222C;
        Wed, 14 Oct 2020 20:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602707068;
        bh=Os2UxVsxzmhTbMvce37WirEBM9B8sreN6vfIOrjcDQ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CWa1mq0ILaQeCRNgtiSGecmKBtJ7hXulY9rqblcFRNsRrmnIFqElVJ/EUag6YT8Pp
         rdIRdW3lox7PtPA6kCe9nZa51LKctvbk48o529ERVXDOY2T3wsTIXY3Aa7OcV6pTEe
         Kq49jblpG9Cfrsle3VKeZ7EoJTz7kwXiIlrh/WUw=
Date:   Wed, 14 Oct 2020 13:24:28 -0700
From:   jaegeuk@kernel.org
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jamie Iles <jamie@nuviainc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the f2fs tree
Message-ID: <20201014202428.GA1536937@google.com>
References: <20201015071617.1f5ab26f@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015071617.1f5ab26f@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks,

I fixed it in f2fs-next branch.

Thanks,

On 10/15, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   e965857201e0 ("f2fs: wait for sysfs kobject removal before freeing f2fs_sb_info")
> 
> Fixes tag
> 
>   Fixes: bf9e697ecd4 ("f2fs: expose features to sysfs entry")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").
> 
> -- 
> Cheers,
> Stephen Rothwell


