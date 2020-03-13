Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A915B184110
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 07:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726216AbgCMGsN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 02:48:13 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:34701 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbgCMGsN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 13 Mar 2020 02:48:13 -0400
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1jCe77-0007U2-CO; Fri, 13 Mar 2020 07:48:09 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1jCe75-0002wf-1z; Fri, 13 Mar 2020 07:48:07 +0100
Date:   Fri, 13 Mar 2020 07:48:07 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: linux-next: build failure after merge of the v4l-dvb tree
Message-ID: <20200313064807.op4ghjsc22du3q4e@pengutronix.de>
References: <20200313131903.3975cdd2@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313131903.3975cdd2@canb.auug.org.au>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:41:38 up 118 days, 22:00, 137 users,  load average: 0.13, 0.06,
 0.01
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-next@vger.kernel.org
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 20-03-13 13:19, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the v4l-dvb tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
> 
> ERROR: modpost: "fwnode_get_name" [drivers/media/v4l2-core/v4l2-fwnode.ko] undefined!
> 
> Caused by commit
> 
>   dfc22c073b78 ("media: v4l2-fwnode: add initial connector parsing support")
> 
> I have used the v4l-dvb tree from next-20200312 for today.

I'm sorry for that. I put my branch on our 0day to test most of the
compile configs. Obviously this casae wasn't covered..

@Sakari
I will send a patch to fix this by adding:
EXPORT_SYMBOL_GPL(fwnode_get_name).

Regards,
  Marco
