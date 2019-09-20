Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5939BB99B9
	for <lists+linux-next@lfdr.de>; Sat, 21 Sep 2019 00:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406164AbfITWf5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Sep 2019 18:35:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35446 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406093AbfITWf5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Sep 2019 18:35:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=NEWIc8p+eWJkSfR001CCsjTaw+6M+U0tYPGR2ne+fs8=; b=i4MeTf2PIAgQ6Z9wsFYf9fV5k
        +ZW1Eu0jsyTawHiq6IKagwWIfayV6BexWAyl/56kFc1t1qGpRmvO/NWGPYI+wy8V5wrBGwX8ZhEDB
        F90JzjdMWQGP2w4o1jwbI6RB6Ry/42DoF9nBx4u+pPibs7mGrO5AlAEhSSGoosfW4Vlv0uuVHKord
        yUhJi5gTvkUWSLZpDzE9pAIlkXf03I0c1EcdbjNsc4cPe74vXd9hQihKUa9XAmrAOoc0bJGlC/Oz1
        C1CwNIXakCfkp4wyTivAX/OEBsrPSIPX30BX7trMtIOGMDfdtXu/xu92R1ZLr9WtpW70kR4xQqmTb
        hUw+uXNYg==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iBRVN-0006oZ-64; Fri, 20 Sep 2019 22:35:57 +0000
Subject: Re: linux-next: Tree for Sep 20 (amdgpu-2)
To:     Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
References: <20190920163637.GI3822@sirena.co.uk>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <797e0870-bab3-2716-119c-c06735354506@infradead.org>
Date:   Fri, 20 Sep 2019 15:35:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920163637.GI3822@sirena.co.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/20/19 9:36 AM, Mark Brown wrote:
> Hi all,
> 
> News: There will likely be no more -next builds until Stephen returns on
> the 30th, I *may* do some next week but it's more likely that I won't
> and it certainly won't be every day.
> 
> Changes since 20190919:
> 

on x86_64:

(1) where is function get_wm_urgent() defined?  I cannot find it (i.e.,
grep cannot find it).

../drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c: In function ‘calculate_wm_set_for_vlevel’:
../drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c:964:22: error: SSE register return with SSE disabled
  wm_set->urgent_ns = get_wm_urgent(dml, pipes, pipe_cnt) * 1000;
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

(2) drivers/gpu/drm/amd/amdgpu/../display/dc/dcn21/dcn21_resource.c needs
#include <linux/slab.h>
for the kzalloc() and kfree() function calls.


Thanks.
-- 
~Randy
