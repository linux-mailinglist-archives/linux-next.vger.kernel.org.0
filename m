Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A603D9FE2B
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2019 11:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbfH1JPZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Aug 2019 05:15:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54646 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726273AbfH1JPZ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Aug 2019 05:15:25 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 6C5E4800DD2;
        Wed, 28 Aug 2019 09:15:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com [10.36.116.95])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E8B4960610;
        Wed, 28 Aug 2019 09:15:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id CA85D16E05; Wed, 28 Aug 2019 11:15:23 +0200 (CEST)
Date:   Wed, 28 Aug 2019 11:15:23 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20190828091523.l6mairpwot27todz@sirius.home.kraxel.org>
References: <20190828185516.22b03da8@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828185516.22b03da8@canb.auug.org.au>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Wed, 28 Aug 2019 09:15:25 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> I applied the following fix patch:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 28 Aug 2019 18:37:40 +1000
> Subject: [PATCH] drm/virtio: module_param_named() requires linux/moduleparam.h
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/virtio/virtgpu_object.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
> index aab5534056ec..b5f8923ac674 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
> @@ -23,6 +23,8 @@
>   * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <linux/moduleparam.h>
> +

Fix pushed to drm-misc-next.

thanks,
  Gerd

