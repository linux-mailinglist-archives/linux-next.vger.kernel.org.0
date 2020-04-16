Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86A821AD31D
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 01:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbgDPXSj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Apr 2020 19:18:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:59532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725988AbgDPXSj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 16 Apr 2020 19:18:39 -0400
Received: from localhost (unknown [104.132.1.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B78BE2078B;
        Thu, 16 Apr 2020 23:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587079118;
        bh=WHCk6LT72LC2+Q6AJUsZv2rkcYyjc6nGV6exXzaS/g8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HKJ4aMWgbXYkNDkPmyY8K+ZdFoWDxVYCujBwrbdLP+2d1aIG0qgTsMavlukbsw+Pj
         Zy5QlTRrX+ILmOAZSpQ1AkLtpfm694dz5a1m8hMRxWPi+b75Su+YVhoP7w87170YVk
         B5gfAn/eMKjy0gcdI9LqYR046afbtF2gBU6sH2jI=
Date:   Thu, 16 Apr 2020 16:18:38 -0700
From:   Jaegeuk Kim <jaegeuk@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the f2fs tree
Message-ID: <20200416231838.GA99506@google.com>
References: <20200417081707.0c7c84f3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417081707.0c7c84f3@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 04/17, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   46471a1f6e97 ("f2fs: add tracepoint for f2fs iostat")
> 
> is missing a Signed-off-by from its committer.
> 
> Looks like the SOB line was lost in the rebase :-(

Fixed. Thank you. :)

> 
> -- 
> Cheers,
> Stephen Rothwell


