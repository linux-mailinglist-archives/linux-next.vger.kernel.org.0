Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5A65316C64
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 18:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232596AbhBJRSV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 12:18:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:42334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232670AbhBJRSD (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 10 Feb 2021 12:18:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD4AF64E7D;
        Wed, 10 Feb 2021 17:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612977443;
        bh=20+vSD4yH5JxdBX4woYl2DAKnSili5Vlf5bTt8/yO5s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bSjHLQ10A+dP0phuwBL01NWSLBXeTYLV4zmEre8SfC1vTdRP7GRTRCm6i414De3ZX
         p531WLavpnwjkGtxOmiPiMmvF41EsQPDqtw/ZPvfeddNSYSzpzVes7Z8UWmKy0mMDq
         ZA44vNwHUx5Lujqw1YkEmdZ3teLj4DhwbjGJ4ks0D8VbMEaQm/GEYj28DWrq9Mma+B
         0EhWIpBhoiCA0X3TPsm31pcrUe4eGPYE8wJrVIScv6zP/L5QB/xqPHu4l0fYiVtfUc
         A1iWa/+UbKwxDloebISpGohN/JtVTeRaUSYWEteNJYLtA3HNLmO/JogFOecz8r78j2
         m2u3jhc+lcUng==
Date:   Wed, 10 Feb 2021 10:17:22 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Lee Jones <lee.jones@linaro.org>,
        Doug Ledford <dledford@redhat.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Parav Pandit <parav@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rdma tree
Message-ID: <20210210171722.GA1670976@ubuntu-m3-large-x86>
References: <20210210211149.3498db8a@canb.auug.org.au>
 <20210210134742.GY4247@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210134742.GY4247@nvidia.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 10, 2021 at 09:47:42AM -0400, Jason Gunthorpe wrote:
> On Wed, Feb 10, 2021 at 09:11:49PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the rdma tree, today's linux-next build (htmldocs) produced
> > this warning:
> > 
> > drivers/infiniband/core/device.c:859: warning: Function parameter or member 'dev' not described in 'ib_port_immutable_read'
> > drivers/infiniband/core/device.c:859: warning: Function parameter or member 'port' not described in 'ib_port_immutable_read'
> > 
> > Introduced by commit
> > 
> >   7416790e2245 ("RDMA/core: Introduce and use API to read port immutable data")
> 
> drivers/infinband is W=1 clean right now in linux-next
> 
> But how can I build *only* drivers/infiniband using W=1 so I can keep
> it that way?
> 
> The rest of the kernel is not clean and creates too much warning noise
> to be usable, even with my mini config.
> 
> Just doing a 'make W=1 drivers/infiniband' is sort of OK, but then I
> end up compiling things twice
> 
> Does anyone know a good solution?
> 
> Jason
> 

Hi Jason,

There was at one point an effort from Andrew Lunn to allow subsystems to
opt in W=1 unconditionally but Masahiro had some concerns with both
approaches:

https://lore.kernel.org/r/20200919190258.3673246-1-andrew@lunn.ch/
https://lore.kernel.org/r/20201001011232.4050282-1-andrew@lunn.ch/

It looks like btrfs has just opted to copy the W=1 flags into its
Makefile:

https://git.kernel.org/next/linux-next/c/3a7b58d632b24ec3321f1ee3027bd407e09e515e

Cheers,
Nathan
