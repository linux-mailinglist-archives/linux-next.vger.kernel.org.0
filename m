Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4854F4F56
	for <lists+linux-next@lfdr.de>; Fri,  8 Nov 2019 16:21:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727296AbfKHPU6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Nov 2019 10:20:58 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:44871 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727497AbfKHPU6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Nov 2019 10:20:58 -0500
X-Originating-IP: 92.137.17.54
Received: from localhost (alyon-657-1-975-54.w92-137.abo.wanadoo.fr [92.137.17.54])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 123871BF211;
        Fri,  8 Nov 2019 15:20:55 +0000 (UTC)
Date:   Fri, 8 Nov 2019 16:20:55 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rtc tree
Message-ID: <20191108152055.GC216543@piout.net>
References: <20191030154105.16a2797f@canb.auug.org.au>
 <20191108162929.2aeb6f5d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108162929.2aeb6f5d@canb.auug.org.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On 08/11/2019 16:29:29+1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Wed, 30 Oct 2019 15:41:05 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > After merging the rtc tree, today's linux-next build (x86_64 allmodconfig)
> > produced this warning:
> > 
> > WARNING: unmet direct dependencies detected for FSL_RCPM
> >   Depends on [n]: PM_SLEEP [=y] && (ARM || ARM64)
> >   Selected by [m]:
> >   - RTC_DRV_FSL_FTM_ALARM [=m] && RTC_CLASS [=y] && (ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST [=y])
> > 
> > WARNING: unmet direct dependencies detected for FSL_RCPM
> >   Depends on [n]: PM_SLEEP [=y] && (ARM || ARM64)
> >   Selected by [m]:
> >   - RTC_DRV_FSL_FTM_ALARM [=m] && RTC_CLASS [=y] && (ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST [=y])
> > 
> > WARNING: unmet direct dependencies detected for FSL_RCPM
> >   Depends on [n]: PM_SLEEP [=y] && (ARM || ARM64)
> >   Selected by [m]:
> >   - RTC_DRV_FSL_FTM_ALARM [=m] && RTC_CLASS [=y] && (ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST [=y])
> > 
> > Introduced by commit
> > 
> >   e1c2feb1efa2 ("rtc: fsl-ftm-alarm: allow COMPILE_TEST")
> 
> I am still getting these warnings.
> 

I've dropped the patch for now, sorry about that.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
