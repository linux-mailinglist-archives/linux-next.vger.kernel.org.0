Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED62122408
	for <lists+linux-next@lfdr.de>; Tue, 17 Dec 2019 06:48:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbfLQFsy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Dec 2019 00:48:54 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:39738 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725796AbfLQFsy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Dec 2019 00:48:54 -0500
X-Greylist: delayed 350 seconds by postgrey-1.27 at vger.kernel.org; Tue, 17 Dec 2019 00:48:53 EST
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 24D5C20023;
        Tue, 17 Dec 2019 06:42:57 +0100 (CET)
Date:   Tue, 17 Dec 2019 06:42:55 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: Re: linux-next: Tree for Dec 16 (drm_panel & intel_panel)
Message-ID: <20191217054255.GA26868@ravnborg.org>
References: <20191216162209.5b5256dd@canb.auug.org.au>
 <d92bec2a-62cb-004e-7f8c-01fc12a53a74@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d92bec2a-62cb-004e-7f8c-01fc12a53a74@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=4kOG7-xGWyIPk-DUqGkA:9 a=CjuIK1q_8ugA:10
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Randy.

On Mon, Dec 16, 2019 at 08:25:11AM -0800, Randy Dunlap wrote:
> On 12/15/19 9:22 PM, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Changes since 20191213:
> > 
> 
> on x86_64:
> 
> ld: drivers/gpu/drm/drm_panel.o: in function `drm_panel_of_backlight':
> (.text+0x2ee): undefined reference to `devm_of_find_backlight'
> 
> ld: drivers/gpu/drm/i915/display/intel_panel.o: in function `intel_backlight_device_register':
> intel_panel.c:(.text+0x593e): undefined reference to `backlight_device_register'
> ld: drivers/gpu/drm/i915/display/intel_panel.o: in function `intel_backlight_device_unregister':
> intel_panel.c:(.text+0x5a04): undefined reference to `backlight_device_unregister'
> 
> CONFIG_DRM_PANEL=y
> CONFIG_BACKLIGHT_CLASS_DEVICE=m
> CONFIG_DRM_I915=y
> 
> Full randconfig file is attached.

Can you please verify if you have:
907aa265fde6589b8059dc51649c6d1f49ade2f3
("drm/drm_panel: fix EXPORT of drm_panel_of_backlight")

This commit is supposed to fix it.

	Sam

