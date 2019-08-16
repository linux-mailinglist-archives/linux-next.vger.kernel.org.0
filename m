Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A65AF8FF5B
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 11:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbfHPJrW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 05:47:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36764 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbfHPJrV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Aug 2019 05:47:21 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B87612AF;
        Fri, 16 Aug 2019 11:47:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565948839;
        bh=bUdICGGdTZmBFibu3xdD2aPAGHUfElKiRrQso0XsRTc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mlqItdkhQU8LiVblfmgAjFuo001m9rrZNL9N/mwDi6KnDfDs5J+AFvViaMnQOEgu6
         fIWoCwBnwpjT/0ZTGKwhpIpR7XgDtC4ImWtCEg+pqjg2EhqXnNi8GkKPEJe5/m7WT0
         AIaGeexf6EL/gMzYLJjCil7Ke3mu4B87oJCuhImw=
Date:   Fri, 16 Aug 2019 12:47:15 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20190816094715.GB5020@pendragon.ideasonboard.com>
References: <20190816133132.6b37d7fa@canb.auug.org.au>
 <20190816044846.GA27781@ravnborg.org>
 <CAKMK7uFy2vtOpSNrJyPDp0mvPTEvTD3zw7_gTuWe6gRqj18FFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKMK7uFy2vtOpSNrJyPDp0mvPTEvTD3zw7_gTuWe6gRqj18FFg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello,

On Fri, Aug 16, 2019 at 08:23:54AM +0200, Daniel Vetter wrote:
> On Fri, Aug 16, 2019 at 6:48 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> > > Hi all,
> > >
> > > After merging the drm-misc tree, today's linux-next build (x86_64
> > > allmodconfig) produced this warning:
> > >
> > > warning: same module names found:
> > >   drivers/video/fbdev/omap2/omapfb/displays/panel-nec-nl8048hl11.ko
> > >   drivers/gpu/drm/panel/panel-nec-nl8048hl11.ko
> > > warning: same module names found:
> > >   drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.ko
> > >   drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.ko
> > > warning: same module names found:
> > >   drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.ko
> > >   drivers/gpu/drm/panel/panel-sony-acx565akm.ko
> > > warning: same module names found:
> > >   drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.ko
> > >   drivers/gpu/drm/panel/panel-tpo-td028ttec1.ko
> > > warning: same module names found:
> > >   drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.ko
> > >   drivers/gpu/drm/panel/panel-tpo-td043mtea1.ko
> > >
> > > Introduced by commits
> > >
> > >   df439abe6501 ("drm/panel: Add driver for the NEC NL8048HL11 panel")
> > >   c9cf4c2a3bd3 ("drm/panel: Add driver for the Sharp LS037V7DW01 panel")
> > >   1c8fc3f0c5d2 ("drm/panel: Add driver for the Sony ACX565AKM panel")
> > >   415b8dd08711 ("drm/panel: Add driver for the Toppoly TD028TTEC1 panel")
> > >   dc2e1e5b2799 ("drm/panel: Add driver for the Toppoly TD043MTEA1 panel")
> >
> > Ups, had not seen this one coming.
> > We are in the process of removing the drivers in drivers/video/fbdev/omap2/omapfb/
> > and decided to introduce the new drivers early to get them out of a
> > longer patch series.

Oops :-(

The new drivers were initially part of a patch series that removed the
duplicated drivers. The new drivers then got fast-tracked, and I didn't
notice this issue.

> Should we have a config dependency to not allow the old fbdev omap
> when the drm omap driver is enabled? I think that would take care of
> all this.
> 
> Or too annoying for development?
> 
> Also note that fbdev is in drm-misc now, so we should be able to fix
> this all without cross-tree conflicts.

Note that drivers/video/fbdev/omap2/omapfb/ will stay, it's
drivers/gpu/drm/omapdrm/displays/ that is being removed. FB_OMAP2
already depends on DRM_OMAP = n, I propose doing something similar at
the level of the individual display drivers.

-- 
Regards,

Laurent Pinchart
