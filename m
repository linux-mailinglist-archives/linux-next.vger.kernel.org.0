Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52A1E12325C
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2019 17:25:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbfLQQZR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 11:25:17 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:33266 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728238AbfLQQZR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Dec 2019 11:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=y1j865ukVwQiFcdbByxTjg1MVj3ESO8twxvwXtt6Bg8=; b=cv0zYoqs+F4UkqTu/F9OYXrIF
        lWcGWg8mOad6d3XS0JOckN48yLCRPN8Gei2Zy5MRiMKAXT8j97UmoFHPgsOKMv9S+gSMr558DI/16
        qUsFknMqLGTnQ/1+QSyVXX2YPr8Kg8+CYroKibb4vG427mNYhj24o9nV0/MZH7oAtckVDzJ//aNgZ
        IZiE3583/knd+XCdofa1109NNYEoxxI07ZkhrPEPlE78rv01VDYcdebvRJCra2aFnLwxNxZY2/BTY
        MZ60rlqgmLeQ72MAGfeUpHb499JxSGRbm4mhbRlwH6IFYl/5xPp5JgBo+ufwFnWEgthtl/zniWIM0
        bQRzepbCA==;
Received: from [2601:1c0:6280:3f0::fee9]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ihFei-0002tm-CI; Tue, 17 Dec 2019 16:25:04 +0000
Subject: Re: [PATCH v1 1/1] drm/drm_panel: Fix EXPORT of
 drm_panel_of_backlight() one more time
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org
References: <20191217140721.42432-1-andriy.shevchenko@linux.intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <63f068fe-13b4-98d1-8e27-faa1bd0bdf23@infradead.org>
Date:   Tue, 17 Dec 2019 08:25:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191217140721.42432-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/17/19 6:07 AM, Andy Shevchenko wrote:
> The initial commit followed by the fix didn't take into consideration the case
> 
> CONFIG_DRM_PANEL=y
> CONFIG_BACKLIGHT_CLASS_DEVICE=m
> CONFIG_DRM_I915=y
> 
> where symbol devm_of_find_backlight() is not reachable from DRM subsystem.
> Quick fix is to avoid drm_panel_of_backlight() from exporting in such case.
> 
> Fixes: 907aa265fde6 ("drm/drm_panel: fix EXPORT of drm_panel_of_backlight")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Yes, that fixes the build error.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested


> ---
>  drivers/gpu/drm/drm_panel.c | 2 +-
>  include/drm/drm_panel.h     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> index 79ff3fdf6f6e..8c7bac85a793 100644
> --- a/drivers/gpu/drm/drm_panel.c
> +++ b/drivers/gpu/drm/drm_panel.c
> @@ -302,7 +302,7 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
>  EXPORT_SYMBOL(of_drm_find_panel);
>  #endif
>  
> -#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
> +#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
>  /**
>   * drm_panel_of_backlight - use backlight device node for backlight
>   * @panel: DRM panel
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 5f27b693e1a0..121f7aabccd1 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -198,7 +198,7 @@ static inline struct drm_panel *of_drm_find_panel(const struct device_node *np)
>  }
>  #endif
>  
> -#if IS_ENABLED(CONFIG_BACKLIGHT_CLASS_DEVICE)
> +#if IS_REACHABLE(CONFIG_BACKLIGHT_CLASS_DEVICE)
>  int drm_panel_of_backlight(struct drm_panel *panel);
>  #else
>  static inline int drm_panel_of_backlight(struct drm_panel *panel)
> 


-- 
~Randy

