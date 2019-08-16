Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D2D78FA03
	for <lists+linux-next@lfdr.de>; Fri, 16 Aug 2019 06:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbfHPEsx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 16 Aug 2019 00:48:53 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:53744 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfHPEsx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 16 Aug 2019 00:48:53 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 393EA8064D;
        Fri, 16 Aug 2019 06:48:47 +0200 (CEST)
Date:   Fri, 16 Aug 2019 06:48:46 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
Message-ID: <20190816044846.GA27781@ravnborg.org>
References: <20190816133132.6b37d7fa@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816133132.6b37d7fa@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=riLMJWpmpRtepst6gjgA:9 a=CjuIK1q_8ugA:10
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen.

On Fri, Aug 16, 2019 at 01:31:32PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> warning: same module names found:
>   drivers/video/fbdev/omap2/omapfb/displays/panel-nec-nl8048hl11.ko
>   drivers/gpu/drm/panel/panel-nec-nl8048hl11.ko
> warning: same module names found:
>   drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.ko
>   drivers/gpu/drm/panel/panel-sharp-ls037v7dw01.ko
> warning: same module names found:
>   drivers/video/fbdev/omap2/omapfb/displays/panel-sony-acx565akm.ko
>   drivers/gpu/drm/panel/panel-sony-acx565akm.ko
> warning: same module names found:
>   drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.ko
>   drivers/gpu/drm/panel/panel-tpo-td028ttec1.ko
> warning: same module names found:
>   drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td043mtea1.ko
>   drivers/gpu/drm/panel/panel-tpo-td043mtea1.ko
> 
> Introduced by commits
> 
>   df439abe6501 ("drm/panel: Add driver for the NEC NL8048HL11 panel")
>   c9cf4c2a3bd3 ("drm/panel: Add driver for the Sharp LS037V7DW01 panel")
>   1c8fc3f0c5d2 ("drm/panel: Add driver for the Sony ACX565AKM panel")
>   415b8dd08711 ("drm/panel: Add driver for the Toppoly TD028TTEC1 panel")
>   dc2e1e5b2799 ("drm/panel: Add driver for the Toppoly TD043MTEA1 panel")

Ups, had not seen this one coming.
We are in the process of removing the drivers in drivers/video/fbdev/omap2/omapfb/
and decided to introduce the new drivers early to get them out of a
longer patch series.

	Sam
