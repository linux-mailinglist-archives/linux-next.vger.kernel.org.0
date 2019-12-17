Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 041E61235DD
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2019 20:41:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727836AbfLQTlH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 14:41:07 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:46666 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbfLQTlG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Dec 2019 14:41:06 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 9425E20022;
        Tue, 17 Dec 2019 20:40:59 +0100 (CET)
Date:   Tue, 17 Dec 2019 20:40:58 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 1/1] drm/drm_panel: Fix EXPORT of
 drm_panel_of_backlight() one more time
Message-ID: <20191217194058.GA30852@ravnborg.org>
References: <20191217140721.42432-1-andriy.shevchenko@linux.intel.com>
 <63f068fe-13b4-98d1-8e27-faa1bd0bdf23@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63f068fe-13b4-98d1-8e27-faa1bd0bdf23@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=JfrnYn6hAAAA:8
        a=KKAkSRfTAAAA:8 a=7gkXJVJtAAAA:8 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8
        a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=-g4Mg-S7RQq0A9TmIasA:9
        a=CjuIK1q_8ugA:10 a=1CNFftbPRP8L7MoqJWF3:22 a=cvBusfyB2V15izCimMoJ:22
        a=E9Po1WZjFZOl8hwRPBS3:22 a=D0XLA9XvdZm18NrgonBM:22
        a=AjGcO6oz07-iQ99wixmX:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 17, 2019 at 08:25:03AM -0800, Randy Dunlap wrote:
> On 12/17/19 6:07 AM, Andy Shevchenko wrote:
> > The initial commit followed by the fix didn't take into consideration the case
> > 
> > CONFIG_DRM_PANEL=y
> > CONFIG_BACKLIGHT_CLASS_DEVICE=m
> > CONFIG_DRM_I915=y
> > 
> > where symbol devm_of_find_backlight() is not reachable from DRM subsystem.
> > Quick fix is to avoid drm_panel_of_backlight() from exporting in such case.
> > 
> > Fixes: 907aa265fde6 ("drm/drm_panel: fix EXPORT of drm_panel_of_backlight")
> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Thierry Reding <thierry.reding@gmail.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Sean Paul <sean@poorly.run>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Yes, that fixes the build error.  Thanks.
> 
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Hi Andy - thanks for fixing this. And thanks Randy for verifying the
fix.
It passed my build test and is now pushed to drm-misc-next.

	Sam
