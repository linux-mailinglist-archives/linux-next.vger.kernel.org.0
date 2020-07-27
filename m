Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59D9C22E8ED
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 11:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbgG0JYz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 05:24:55 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:39673 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726433AbgG0JYy (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jul 2020 05:24:54 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 90AB85C0121;
        Mon, 27 Jul 2020 05:24:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 27 Jul 2020 05:24:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=wONXKD2dA0rgroO9nB09aEG0uwm
        Yq/40yIZTx+PxQHo=; b=MhdFzXzK8KFfSHqO/iYYWYSVGhtY/GQJxU9LCUd3dcL
        j55LUk2pDvSGPdJr6cmmwEU0OtOweabsQX8bkm5rZugAn0iH6AJV5sSYdauHdwIl
        uriafanzX3CPuCX4e2KFAR9dsWdAqez/dooO3+uQ09OWPKSHlq85rKf+LnuQ5+Gs
        qrti1jeOGNR5kSckCXAZx1ma5y2Pv/Z8B/nKHbFaopFuqhJtfuxwSvunwCf1LHuO
        Of4nY6JkllrgJvXifN2ZBSorrdu81GXVl5Y67ALv/r7ukmYPymn7joUpiARE6BuA
        7mGbYUaN38zS71FhPDMURbzNY60PljkICeFx4j2PMIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wONXKD
        2dA0rgroO9nB09aEG0uwmYq/40yIZTx+PxQHo=; b=dwlGuksqt0yC55nV8EffBU
        TU6v2gSa7r/VzhaGEqbLdnNR6XkGephlmh3HSCQmsLHD0r5QiAG+LRU7vOufF9qW
        PU1qQoGY+WLIhPsWivfQ8xzk3FtKeDSs6dbb5P8LOpA6CtyXixJoRTydN0V94/vz
        GrIqrlcWoJEbtJ1OVwp3V5lii521nfAoe2VB00OdRaMYXSSvd/209DuEWYK4xVCA
        LJYjmVR18qZqWPP5XyMWRpdO+PUJGWoYxbGHx8+pWvRcuYHWPZKprJSJc7S5Yq4N
        4yxF5eZRGXAJXzyb1uJtOJHrd3Vz37Ux3XTKWQOLVw7wpuR7pyKCnkYGwwuPVBVw
        ==
X-ME-Sender: <xms:ZJ0eX_HXTmVCbY5HPRCSaYcgTSvtUG6-bi01tPvZwRQxbWXYsfYe0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedriedtgdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdekledruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:ZJ0eX8WTtlDmZpmB96c-WEOGCNduKJ7OjsnG1fFZxMzgxERdvegHMQ>
    <xmx:ZJ0eXxJBfG1CI4zd4VzgknrdfeToxKWPQ-Y_4tbHzN5P2jlKeBSr5g>
    <xmx:ZJ0eX9FM2R2yl_gQVFWYyjOw2TMlFoRFrLwAtFraOi5oqP8fr9tu6Q>
    <xmx:ZZ0eXygCC6gOn-7-199r6ZoU5iffUdQzwTR_3MAPQRjPdFn14HbQZA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 8B0473280069;
        Mon, 27 Jul 2020 05:24:52 -0400 (EDT)
Date:   Mon, 27 Jul 2020 11:24:48 +0200
From:   Greg KH <greg@kroah.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Oded Gabbay <oded.gabbay@gmail.com>,
        Omer Shpigelman <oshpigelman@habana.ai>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <20200727092448.GB1764157@kroah.com>
References: <20200727180831.6c356fc1@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727180831.6c356fc1@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 27, 2020 at 06:08:31PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the char-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> In file included from drivers/misc/habanalabs/goya/goya.c:8:
> drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: No such file or directory
>    12 | #include "habanalabs.h"
>       |          ^~~~~~~~~~~~~~
> In file included from drivers/misc/habanalabs/goya/goya_security.c:8:
> drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: No such file or directory
>    12 | #include "habanalabs.h"
>       |          ^~~~~~~~~~~~~~
> 
> Presumably caused by commit
> 
>   70b2f993ea4a ("habanalabs: create common folder")
> 
> I have used the char-misc tree from next-20200724 for today.

Ugh, this is a mess of a merge with this driver.

Oded, I'll take Stephen's merge resolutions here and push out a new
version, and try to resolve this error, but if you could verify I got it
correct, that would be great.

thanks,

greg k-h
