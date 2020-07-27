Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2B5E22E9BD
	for <lists+linux-next@lfdr.de>; Mon, 27 Jul 2020 12:05:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbgG0KFf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jul 2020 06:05:35 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:53343 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727775AbgG0KFf (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jul 2020 06:05:35 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id B75F05C00D3;
        Mon, 27 Jul 2020 06:05:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 27 Jul 2020 06:05:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=nkiXJc4keFr7cYw6tolgITjL9Sd
        lT92NZc95gSR+fm0=; b=Z5bnTPaU3sbRrlCzG9wPczFBbPGV9iwU/s0b9UxkXQf
        vRzgP6FKCjAkLP5O88VRX0oDTGB62E4aXa/yNvhvdbCUh18VsMN8/9GO7M0bgk0p
        gGq3lLT4aa4dMkZlP+fQAYnfqgK5rniGhg2M4ZfbzN5vwDr+QbjBH9z2quiSrwCD
        ZkIERREM2mRFWgVdDBqZVqyOmDwLUwyrL79R2Kg8h9EL0rR+XyUBIFtmWZOdN9Cu
        RcFPcqCsNeQJcErLNKGPXAMfkmCxPLRq1W4gT3yPTO4POYwpacbNEvzY7AqfxPnq
        eQjBVeKmw25KQ8Dps77vFIm+riD0VKRtkXjhG2BZC4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nkiXJc
        4keFr7cYw6tolgITjL9SdlT92NZc95gSR+fm0=; b=W3BUIpJnVYBR0xm/ujel9V
        uNyxSzGnlSy9HEZpnp1udvneuEBH40hOoKJMO8tCarWOdBfHvsgizJsjDnAsGrkG
        ZamN4+vwjVa0HmtSlggok5UTX8cgg5ggM64u7hvaoIg4Hw2G1kFCFE/Jk4Lfhlnx
        56PPMHvdVTrkqnt6/obiZvzFflSDYVWxNLsxrboKgcz8IbVL3LU2hCrNg+BbggaH
        zYOlmsiPuyQcANIpvtKRlGKOrEAqVUd2uthiA/SM60HH24N34dxrH+3iDU0CfeeZ
        0DnVacDR1zc49uTY9lUsX2O3hh0ljW9mxQLK65CY62ADVsf5GIHh7LY3IobXRJPw
        ==
X-ME-Sender: <xms:7KYeX6cUPcKSBZkSULXQsrxyvOjHlnMh_uW_Fr0i2X29jBVAs9R0zA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedriedtgddvgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdekledruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:7KYeX0PxebgLQibtZEg-RVn5Ezv1CEPgJ9XctMrAG45KZiOscOcgfQ>
    <xmx:7KYeX7hD0pVIfbco7Ky4mO8HZ6S49X8PUOOhdxIH7IEsMHQ7XurfLA>
    <xmx:7KYeX3-R4fXB2OPuWyiAz8WkFn2PW0qYz6F0wVO_lBpevRV7rmNe6Q>
    <xmx:7aYeX_6AyBrxMa_rSKrPGvjCF03YNI1IQbi2lBdP6jjddunJsHPUNQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id 88B0F3060067;
        Mon, 27 Jul 2020 06:05:32 -0400 (EDT)
Date:   Mon, 27 Jul 2020 12:05:29 +0200
From:   Greg KH <greg@kroah.com>
To:     Oded Gabbay <oded.gabbay@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Omer Shpigelman <oshpigelman@habana.ai>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <20200727100529.GA1922918@kroah.com>
References: <20200727180831.6c356fc1@canb.auug.org.au>
 <20200727092448.GB1764157@kroah.com>
 <CAFCwf13o6A_88xBZdTk+XamAULckKB3Wk8A-V8NmmvkXDwB60w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFCwf13o6A_88xBZdTk+XamAULckKB3Wk8A-V8NmmvkXDwB60w@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Jul 27, 2020 at 12:28:14PM +0300, Oded Gabbay wrote:
> On Mon, Jul 27, 2020 at 12:24 PM Greg KH <greg@kroah.com> wrote:
> >
> > On Mon, Jul 27, 2020 at 06:08:31PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > After merging the char-misc tree, today's linux-next build (x86_64
> > > allmodconfig) failed like this:
> > >
> > > In file included from drivers/misc/habanalabs/goya/goya.c:8:
> > > drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: No such file or directory
> > >    12 | #include "habanalabs.h"
> > >       |          ^~~~~~~~~~~~~~
> > > In file included from drivers/misc/habanalabs/goya/goya_security.c:8:
> > > drivers/misc/habanalabs/goya/goyaP.h:12:10: fatal error: habanalabs.h: No such file or directory
> > >    12 | #include "habanalabs.h"
> > >       |          ^~~~~~~~~~~~~~
> > >
> > > Presumably caused by commit
> > >
> > >   70b2f993ea4a ("habanalabs: create common folder")
> > >
> > > I have used the char-misc tree from next-20200724 for today.
> >
> > Ugh, this is a mess of a merge with this driver.
> >
> > Oded, I'll take Stephen's merge resolutions here and push out a new
> > version, and try to resolve this error, but if you could verify I got it
> > correct, that would be great.
> >
> > thanks,
> >
> > greg k-h
> 
> Sure, np. Just point me where to look.

I didn't see the above build issue, but maybe I didn't have the right
configuration options enabled for my build.

Oded, I've done the merge and pushed it out to my char-misc-next branch,
let me know if I've messed anything up there.

thanks,

greg k-h
