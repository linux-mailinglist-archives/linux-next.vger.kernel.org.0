Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47882EF088
	for <lists+linux-next@lfdr.de>; Fri,  8 Jan 2021 11:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726120AbhAHKSX convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Fri, 8 Jan 2021 05:18:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbhAHKSX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Jan 2021 05:18:23 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E998C0612F4
        for <linux-next@vger.kernel.org>; Fri,  8 Jan 2021 02:17:42 -0800 (PST)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kxopt-0008R4-RV; Fri, 08 Jan 2021 11:17:37 +0100
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1kxopo-0007ev-2X; Fri, 08 Jan 2021 11:17:32 +0100
Message-ID: <8a37aaa3bd4d2b032f45cbab998943e6a7f5c086.camel@pengutronix.de>
Subject: Re: linux-next: Tree for Jan 7
 (drivers/gpu/drm/imx/parallel-display.o)
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Daniel Vetter <daniel@ffwll.ch>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Fri, 08 Jan 2021 11:17:32 +0100
In-Reply-To: <CAKMK7uGP6tmmSx8jFcGK_kLDYQO6PBy-TYMEj=WWh5VRTJ7cFQ@mail.gmail.com>
References: <20210107140103.0cca6432@canb.auug.org.au>
         <e1042fe6-10e9-b62c-fae9-0d3b66e42866@infradead.org>
         <CAKMK7uGP6tmmSx8jFcGK_kLDYQO6PBy-TYMEj=WWh5VRTJ7cFQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 2021-01-08 at 10:03 +0100, Daniel Vetter wrote:
> On Fri, Jan 8, 2021 at 9:55 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> > On 1/6/21 7:01 PM, Stephen Rothwell wrote:
> > > Hi all,
> > > 
> > > Changes since 20210106:
> > > 
> > 
> > on x86_64:
> > 
> > ld: drivers/gpu/drm/imx/parallel-display.o: in function `imx_pd_connector_get_modes':
> > parallel-display.c:(.text+0x8d): undefined reference to `of_get_drm_display_mode'
>
> Probably something in the pull from philipp that I just merged
> yesterday.

That is likely, although I'm not quite sure how that activated, the
of_get_drm_display_mode call was there before.

> Philip, can you pls take care?
> -Daniel

Thank you for the notice, since the of_get_drm_display_mode() is only
for legacy device trees I'd like to stub it out and keep compile test
coverage:

https://lore.kernel.org/dri-devel/20210108101343.23695-1-p.zabel@pengutronix.de/T/#u

regards
Philipp
