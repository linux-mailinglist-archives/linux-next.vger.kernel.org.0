Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E60241244F8
	for <lists+linux-next@lfdr.de>; Wed, 18 Dec 2019 11:47:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfLRKrS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Dec 2019 05:47:18 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:57048 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725785AbfLRKrS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Dec 2019 05:47:18 -0500
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id ED91920040;
        Wed, 18 Dec 2019 11:47:10 +0100 (CET)
Date:   Wed, 18 Dec 2019 11:47:09 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sean Paul <sean@poorly.run>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 1/1] drm/drm_panel: Fix EXPORT of
 drm_panel_of_backlight() one more time
Message-ID: <20191218104709.GA12412@ravnborg.org>
References: <20191217140721.42432-1-andriy.shevchenko@linux.intel.com>
 <63f068fe-13b4-98d1-8e27-faa1bd0bdf23@infradead.org>
 <20191217194058.GA30852@ravnborg.org>
 <877e2uylhi.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877e2uylhi.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
        a=QyXUC8HyAAAA:8 a=8pmZ_kwgQ5mKVuBHgTYA:9 a=CjuIK1q_8ugA:10
        a=AjGcO6oz07-iQ99wixmX:22
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Jani.

> As I wrote in [1], this allows a configuration that builds and links,
> but is silently broken. You won't get backlight support in drm panel
> which would be a reasonable expectation with
> CONFIG_BACKLIGHT_CLASS_DEVICE=m.

Agreed - it needs to be improved. But right now we had to fix the build
breakage.

http://lore.kernel.org/r/1413580403-16225-1-git-send-email-jani.nikula@intel.com
is added to my TODO list.
May take a stamp on this over xmas.

	Sam
