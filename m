Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9D8118691E
	for <lists+linux-next@lfdr.de>; Mon, 16 Mar 2020 11:32:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730639AbgCPKcT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 16 Mar 2020 06:32:19 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:59407 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730565AbgCPKcS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 16 Mar 2020 06:32:18 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id C5B3C240010;
        Mon, 16 Mar 2020 10:31:14 +0000 (UTC)
Date:   Mon, 16 Mar 2020 11:31:14 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Ran Bi <ran.bi@mediatek.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the rtc tree
Message-ID: <20200316103114.GO4518@piout.net>
References: <20200316161558.438c7d8b@canb.auug.org.au>
 <1584341922.16860.5.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1584341922.16860.5.camel@mhfsdcap03>
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 16/03/2020 14:58:42+0800, Ran Bi wrote:
> > Caused by commit
> > 
> >   00c36d73171b ("rtc: add support for the MediaTek MT2712 RTC")
> > 
> > I have used the version from next-20200313 for today.
> > 
> 
> This build fail only happen if rtc-mt2712 build as module which I
> haven't try. It because ";" was missed after "MODULE_DEVICE_TABLE(of,
> mt2712_rtc_of_match)". Should I send a fix patch for this or resend the
> whole rtc-mt2712 driver?
> 

I fixed it in my tree.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
