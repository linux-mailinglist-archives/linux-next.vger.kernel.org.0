Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52D3B2E8C97
	for <lists+linux-next@lfdr.de>; Sun,  3 Jan 2021 15:24:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbhACOY2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 3 Jan 2021 09:24:28 -0500
Received: from relay11.mail.gandi.net ([217.70.178.231]:57691 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbhACOY1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 3 Jan 2021 09:24:27 -0500
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 2D397100003;
        Sun,  3 Jan 2021 14:23:43 +0000 (UTC)
Date:   Sun, 3 Jan 2021 15:23:43 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: error while fetching the i3c-fixes tree
Message-ID: <20210103142343.GC382945@piout.net>
References: <20210103223217.478bc238@canb.auug.org.au>
 <20210103151855.5d25ee80@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210103151855.5d25ee80@collabora.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 03/01/2021 15:18:55+0100, Boris Brezillon wrote:
> +Alexandre, the new I3C maintainer. You should probably flag him as the
> person to contact if you have problem with the I3C tree in the future.
> 
> Hi Stephen,
> 
> On Sun, 3 Jan 2021 22:32:17 +1100
> Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi all,
> > 
> > Fetching the i3c-fixes tree
> > (git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux.git#master)
> > produces this error:
> > 
> > fatal: couldn't find remote ref refs/heads/master
> > 
> > Should I maybe use the i3c/fixes branch instead?
> 
> Oops, I thought you were using that branch already. I guess I never
> noticed because I didn't use the fixes branch much and kept the master
> one around.
> 

Yes, please use the i3c/fixes branch. I did indeed remove the master
branch as this was not used anyway.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
