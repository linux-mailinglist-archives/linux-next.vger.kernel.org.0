Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5DAE2A2661
	for <lists+linux-next@lfdr.de>; Mon,  2 Nov 2020 09:48:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbgKBIr5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 03:47:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728253AbgKBIr5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 03:47:57 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA3DC0617A6
        for <linux-next@vger.kernel.org>; Mon,  2 Nov 2020 00:47:56 -0800 (PST)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kZVVH-00047V-99; Mon, 02 Nov 2020 09:47:51 +0100
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1kZVVE-0000fA-TK; Mon, 02 Nov 2020 09:47:48 +0100
Date:   Mon, 2 Nov 2020 09:47:48 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the imx-mxs tree
Message-ID: <20201102084748.s7olylethbu2freo@pengutronix.de>
References: <20201102082413.0087d34b@canb.auug.org.au>
 <20201102000221.GR31601@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201102000221.GR31601@dragon>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:47:26 up 353 days, 6 min, 378 users,  load average: 0.04, 0.05,
 0.07
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 02, 2020 at 08:02:22AM +0800, Shawn Guo wrote:
> On Mon, Nov 02, 2020 at 08:24:13AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > In commit
> > 
> >   d969e9c05f83 ("ARM: dts: imx6q-prti6q: fix PHY address")
> > 
> > Fixes tag
> > 
> >   Fixes: 0d446a50559 ("ARM: dts: add Protonic PRTI6Q board")
> > 
> > has these problem(s):
> 
> Thanks, Stephen.  Fixed.
> 
> > 
> >   - SHA1 should be at least 12 digits long
> >     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
> >     or later) just making sure it is not set (or set to "auto").
> 
> Oleksij,
> 
> Please check your git setup as suggested.

OK, done. Thank you!

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
