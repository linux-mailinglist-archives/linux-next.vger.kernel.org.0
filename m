Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 443FC23395B
	for <lists+linux-next@lfdr.de>; Thu, 30 Jul 2020 21:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730550AbgG3TxQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jul 2020 15:53:16 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38825 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726857AbgG3TxO (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 30 Jul 2020 15:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596138793;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LUonSFV6XEmNIUenD36yg/0NS2iO4j/UJ8CxJKTK1/c=;
        b=Cq7Ip1mZ48AX6la10bcYwXiKWSC3rFZGnUjr08+orYUemcm/PxphRCT2q3T4L1ni+TndGT
        8vF/7rwJdiPH/ZsBXoXYBiF1JS3X/AQnKnuCP1f3SPTKHlojvm6omvD/a0ka2TFo4j0j3H
        v933QdyiCHQ08g9GQmyTRdp6hx3ALpA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-kybUVMzfPoW0YYiKC78ySA-1; Thu, 30 Jul 2020 15:53:11 -0400
X-MC-Unique: kybUVMzfPoW0YYiKC78ySA-1
Received: by mail-wr1-f70.google.com with SMTP id d6so6763358wrv.23
        for <linux-next@vger.kernel.org>; Thu, 30 Jul 2020 12:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LUonSFV6XEmNIUenD36yg/0NS2iO4j/UJ8CxJKTK1/c=;
        b=NQ2eYVg2rJ0UNeFSCCeubIEUKTJ+SizxJX6dmFGvMNCyufEaI5O8giyFfY3tEmnllX
         eKX/9vM5wA6FVnQW1O7+Hu/igiZP/ZRDREBDPG7RMCtxF/mjkect9BTWKUE2OS3f66G9
         mFOoYr1OVFOUQgU8G6dBLDKD6wHcJM3r9uo+Sf/vMsoaGvswolxMr97Zssn+TtQGkGY+
         weYLppbNcbA+denkj6D8EBYqxPHMhfmJPadcOFZzwHQ3Z0Xfsh9jzxB8BX9Ap2aq8bq6
         NjTuE+xk4RUlST5EUdPg9RvByfz7mE5MWS+/nti5kjYMZdA5k+A5pTIY1Fnh2SNfR0tS
         0D6Q==
X-Gm-Message-State: AOAM53035JH0R+0N6gBRguiiWZ/y5hgcCDgIyMe8ut1S9ofnPhKJrJB+
        DuVgeDLh357aEWsuZdxpUlhY2gzqvsaMAKDWrnSXpNkVqqpEtONmzmU9yngPRgcY0UIFpqgYXjI
        Ie8X9dVXtz0OviDIfHIWaQA==
X-Received: by 2002:a5d:5086:: with SMTP id a6mr307336wrt.304.1596138790350;
        Thu, 30 Jul 2020 12:53:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtUCkyYmzlnOirlC1EsPCXGLv7EslLS3tLClf3ZG6+NqtRlH5qYQ9cAiYMPVBZRUrE1bGksg==
X-Received: by 2002:a5d:5086:: with SMTP id a6mr307325wrt.304.1596138790132;
        Thu, 30 Jul 2020 12:53:10 -0700 (PDT)
Received: from redhat.com (bzq-79-179-105-63.red.bezeqint.net. [79.179.105.63])
        by smtp.gmail.com with ESMTPSA id 3sm312979wms.36.2020.07.30.12.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 12:53:09 -0700 (PDT)
Date:   Thu, 30 Jul 2020 15:53:06 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the vhost tree
Message-ID: <20200730155043-mutt-send-email-mst@kernel.org>
References: <20200728080556.447ba206@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728080556.447ba206@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Jul 28, 2020 at 08:05:56AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> ommit
> 
>   ed944d574cc7 ("ack! virtio: VIRTIO_F_IOMMU_PLATFORM -> VIRTIO_F_ACCESS_PLATFORM")
> 
> is missing a Signed-off-by from its author and committer.
> 
> I have never seen an empty commit like this before - I assume it is just
> a way to add an Reviewed-by to a previous commit without rebaseing
> the tree.

Yes - I'm using these to record acks, then squash before the pull
request. git patches I'm using to support this are here - I've rebased
since but didn't have the energy to advocate for upstreaming:
https://lore.kernel.org/r/1460296343-17304-1-git-send-email-mst%40redhat.com


> -- 
> Cheers,
> Stephen Rothwell


