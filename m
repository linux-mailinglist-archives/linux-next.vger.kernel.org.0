Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A49ED1829D7
	for <lists+linux-next@lfdr.de>; Thu, 12 Mar 2020 08:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388027AbgCLHgm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Mar 2020 03:36:42 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:32965 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387999AbgCLHgm (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 12 Mar 2020 03:36:42 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id E2B4122301;
        Thu, 12 Mar 2020 03:36:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 12 Mar 2020 03:36:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=sXB0flAU1OUXmWUTjTmnOCoAJ76
        OTucwn09Wbo61ZUQ=; b=h67NDXEm//u4Jo4ujVbWvsuemkHUE/wt0X4YOXyW3SB
        sMx9h1vhd+TJYw9FzlG5soXcVfq09zsLiqcwa5dKyEOhPnEpLJ1HdLWs/PFuNuDU
        nywrPphuH+fkAJhLbMnJcHxh9uUruoEJJx4ilZczC55l3SwoMITOZ9K9w0Hhi/jT
        TiCoB+ZIMvj2jilHke0v7VjZu/qI0SwnWnb5I1wjmwt9XPpFmZ5PX1yCd+ozSjzT
        SX4Xtf+/h3fHz+crJWTLHHD8fcxwmHvD1uCFaUhPNoJYONPp04EykHnRpSf/pXRp
        zBph7JJz830mPaWLQh85je0ouF/S9nuDGW/HYogTHQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=sXB0fl
        AU1OUXmWUTjTmnOCoAJ76OTucwn09Wbo61ZUQ=; b=Peb3ncnzo60f0plhVtYEvW
        nMQDRsX0eGV+hzuFpoOKig8xqEvYsgWp5NAJVE6ZQqw+G2UV37tIESIMuO932lrw
        S42q2563mAYSMH3Ux3aaOFtwe7gOKL0fh0x1jrAc0tVv8se6S+ZT5EgvCjjkjhG6
        S7hhtN7ifrcj62Yg/237zp0zAaqqgDgkHfm1PkoBwK9ugezoVka301EHax+ALYJd
        12ruSsl1XySnZlyPyYtslmivueXW7CawEWTiow9WOAjIaQ0hDpXtKAf/yXutZ7py
        SApH3mdIyDIH7AEnPhBtk3c08q/AzE051JYbz9FaqWOxbe+2FskyWJR7qMV1OgeA
        ==
X-ME-Sender: <xms:ieZpXi6YCUAedBPwdgqqINu1XkbEwnW5Fwre5U78lBiUuiroxUBVkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddvgedguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecukfhppeekfedrkeeirdekledrud
    dtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehg
    rhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:ieZpXovGnjm1hxmXg1IUKBnRUCnpLj425dNcuVvTgpzFsYs2v8G0hA>
    <xmx:ieZpXsVPx2WfYm0OUpYEIALvYTbHHbl5wciDZ4qlZGBPgDPU8j9q-w>
    <xmx:ieZpXqAWt_V_nifuRtPbSNAKGMJboKCYuedeCAu-2u1xFwYJR1mg1w>
    <xmx:ieZpXo6YvHJYDEDUOrc0ioA7-kbPDgCE_3h4HC1TPCIV8tI2KT2fuQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id C4B70328005E;
        Thu, 12 Mar 2020 03:36:40 -0400 (EDT)
Date:   Thu, 12 Mar 2020 08:36:38 +0100
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Namjae Jeon <namjae.jeon@samsung.com>
Subject: Re: linux-next: manual merge of the staging tree with the vfs tree
Message-ID: <20200312073638.GA4171972@kroah.com>
References: <20200312161657.57abd6c2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312161657.57abd6c2@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 12, 2020 at 04:16:57PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the staging tree got conflicts in:
> 
>   drivers/staging/exfat/Kconfig
>   MAINTAINERS
> 
> between commits:
> 
>   88ab55f16aae ("MAINTAINERS: add exfat filesystem")
>   1a3c0509ce83 ("staging: exfat: make staging/exfat and fs/exfat mutually exclusive")
> 
> from the vfs tree and commit:
> 
>   590a95e418d1 ("staging: exfat: remove staging version of exfat filesystem")
> 
> from the staging tree.
> 
> I fixed it up (I removed the first file and see below) and can carry the
> fix as necessary. This is now fixed as far as linux-next is concerned,
> but any non trivial conflicts should be mentioned to your upstream
> maintainer when your tree is submitted for merging.  You may also want
> to consider cooperating with the maintainer of the conflicting tree to
> minimise any particularly complex conflicts.
> 
> diff --cc MAINTAINERS
> index 4698de48c727,836f1e262b4e..000000000000
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@@ -6361,19 -6301,6 +6356,13 @@@ F:	include/trace/events/mdio.
>   F:	include/uapi/linux/mdio.h
>   F:	include/uapi/linux/mii.h
>   
>  +EXFAT FILE SYSTEM
>  +M:	Namjae Jeon <namjae.jeon@samsung.com>
>  +M:	Sungjong Seo <sj1557.seo@samsung.com>
>  +L:	linux-fsdevel@vger.kernel.org
>  +S:	Maintained
>  +F:	fs/exfat/
>  +
> - EXFAT FILE SYSTEM
> - M:	Valdis Kletnieks <valdis.kletnieks@vt.edu>
> - L:	linux-fsdevel@vger.kernel.org
> - S:	Maintained
> - F:	drivers/staging/exfat/
> - 
>   EXT2 FILE SYSTEM
>   M:	Jan Kara <jack@suse.com>
>   L:	linux-ext4@vger.kernel.org
> 

Patch looks good to me, thanks!

greg k-h
