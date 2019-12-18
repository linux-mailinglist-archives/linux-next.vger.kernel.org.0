Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D28512448C
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2019 11:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfLRKaZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Dec 2019 05:30:25 -0500
Received: from mga12.intel.com ([192.55.52.136]:57954 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725930AbfLRKaZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 18 Dec 2019 05:30:25 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Dec 2019 02:30:24 -0800
X-IronPort-AV: E=Sophos;i="5.69,329,1571727600"; 
   d="scan'208";a="210047542"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Dec 2019 02:30:20 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Sam Ravnborg <sam@ravnborg.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sean Paul <sean@poorly.run>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 1/1] drm/drm_panel: Fix EXPORT of drm_panel_of_backlight() one more time
In-Reply-To: <20191217194058.GA30852@ravnborg.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191217140721.42432-1-andriy.shevchenko@linux.intel.com> <63f068fe-13b4-98d1-8e27-faa1bd0bdf23@infradead.org> <20191217194058.GA30852@ravnborg.org>
Date:   Wed, 18 Dec 2019 12:30:17 +0200
Message-ID: <877e2uylhi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 17 Dec 2019, Sam Ravnborg <sam@ravnborg.org> wrote:
> On Tue, Dec 17, 2019 at 08:25:03AM -0800, Randy Dunlap wrote:
>> On 12/17/19 6:07 AM, Andy Shevchenko wrote:
>> > The initial commit followed by the fix didn't take into consideration the case
>> > 
>> > CONFIG_DRM_PANEL=y
>> > CONFIG_BACKLIGHT_CLASS_DEVICE=m
>> > CONFIG_DRM_I915=y
>> > 
>> > where symbol devm_of_find_backlight() is not reachable from DRM subsystem.
>> > Quick fix is to avoid drm_panel_of_backlight() from exporting in such case.
>> > 
>> > Fixes: 907aa265fde6 ("drm/drm_panel: fix EXPORT of drm_panel_of_backlight")
>> > Reported-by: Randy Dunlap <rdunlap@infradead.org>
>> > Cc: Linus Walleij <linus.walleij@linaro.org>
>> > Cc: Sam Ravnborg <sam@ravnborg.org>
>> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> > Cc: Thierry Reding <thierry.reding@gmail.com>
>> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> > Cc: Sean Paul <sean@poorly.run>
>> > Cc: David Airlie <airlied@linux.ie>
>> > Cc: Daniel Vetter <daniel@ffwll.ch>
>> > Cc: Maxime Ripard <mripard@kernel.org>
>> > Cc: dri-devel@lists.freedesktop.org
>> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> 
>> Yes, that fixes the build error.  Thanks.
>> 
>> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
>
> Hi Andy - thanks for fixing this. And thanks Randy for verifying the
> fix.
> It passed my build test and is now pushed to drm-misc-next.

As I wrote in [1], this allows a configuration that builds and links,
but is silently broken. You won't get backlight support in drm panel
which would be a reasonable expectation with
CONFIG_BACKLIGHT_CLASS_DEVICE=m.

BR,
Jani.


[1] http://mid.mail-archive.com/87d0cnynst.fsf@intel.com

-- 
Jani Nikula, Intel Open Source Graphics Center
