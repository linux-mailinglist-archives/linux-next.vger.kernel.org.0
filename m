Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34FD5BADE8
	for <lists+linux-next@lfdr.de>; Mon, 23 Sep 2019 08:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404364AbfIWGiJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Sep 2019 02:38:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40938 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387519AbfIWGiJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 23 Sep 2019 02:38:09 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id CF375883CA;
        Mon, 23 Sep 2019 06:38:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com [10.36.116.47])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1997B5D713;
        Mon, 23 Sep 2019 06:38:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id E120F9D6A; Mon, 23 Sep 2019 08:38:03 +0200 (CEST)
Date:   Mon, 23 Sep 2019 08:38:03 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Alexander Kapshuk <alexander.kapshuk@gmail.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-next <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>, Dave Airlie <airlied@linux.ie>
Subject: Re: Kernel panic during drm/nouveau init 5.3.0-rc7-next-20190903
Message-ID: <20190923063803.c7zpqwcqq5f2acq5@sirius.home.kraxel.org>
References: <20190907090534.GB1712@pc-sasha.localdomain>
 <20190920194450.GA3970@pc-sasha.localdomain>
 <CAKMK7uECOW2YigBe7aeCDPYXoXJ8TVh65xvKBjJXXRt5Y7HngA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKMK7uECOW2YigBe7aeCDPYXoXJ8TVh65xvKBjJXXRt5Y7HngA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 23 Sep 2019 06:38:09 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> > 'Git bisect' has identified the following commits as being 'bad'.
> >
> > b96f3e7c8069b749a40ca3a33c97835d57dd45d2 is the first bad commit
> > commit b96f3e7c8069b749a40ca3a33c97835d57dd45d2
> > Author: Gerd Hoffmann <kraxel@redhat.com>
> > Date:   Mon Aug 5 16:01:10 2019 +0200
> >
> >     drm/ttm: use gem vma_node
> >
> >     Drop vma_node from ttm_buffer_object, use the gem struct
> >     (base.vma_node) instead.
> >
> >     Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> >     Reviewed-by: Christian König <christian.koenig@amd.com>
> >     Link: http://patchwork.freedesktop.org/patch/msgid/20190805140119.7337-9-kraxel@redhat.com

> > Today, I upgraded the kernel to 5.3.0-next-20190919, which booted fine
> > with no Xorg regressions to report.
> >
> > Just wondering if the earlier kernels would not boot for me because of
> > the changes introduced by the 'bad' commits being perhaps incomplete?

Yes, we had a regression in nouveau, fixed by this patch (in drm-misc-next):

commit 019cbd4a4feb3aa3a917d78e7110e3011bbff6d5
Author: Thierry Reding <treding@nvidia.com>
Date:   Wed Aug 14 11:00:48 2019 +0200

    drm/nouveau: Initialize GEM object before TTM object
    
    TTM assumes that drivers initialize the embedded GEM object before
    calling the ttm_bo_init() function. This is not currently the case
    in the Nouveau driver. Fix this by splitting up nouveau_bo_new()
    into nouveau_bo_alloc() and nouveau_bo_init() so that the GEM can
    be initialized before TTM BO initialization when necessary.
    
    Fixes: b96f3e7c8069 ("drm/ttm: use gem vma_node")
    Acked-by: Gerd Hoffmann <kraxel@redhat.com>
    Acked-by: Ben Skeggs <bskeggs@redhat.com>
    Signed-off-by: Thierry Reding <treding@nvidia.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20190814093524.GA31345@ulmo

HTH,
  Gerd

