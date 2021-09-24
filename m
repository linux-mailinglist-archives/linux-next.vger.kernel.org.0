Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C84B416B5B
	for <lists+linux-next@lfdr.de>; Fri, 24 Sep 2021 07:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbhIXF43 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 24 Sep 2021 01:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbhIXF42 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 24 Sep 2021 01:56:28 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2795EC061574;
        Thu, 23 Sep 2021 22:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=EoRXoCWS2hksRShenSk22EBeRFWZURSeScj9u0jC/WU=; b=niDgKO3n+bqZQbUTcUQt2mObxa
        RTchozwQHkJjEtRfk2fJfKNmvUroIdp7DO4edKfzisiM/r+CFFHMZMMm1b7vecAX8q1D09QX9tsdO
        0npFKMzNbBKNEmQoA4GY2v0wq9m2bMuHYE2k7k6J8BVtuU2vgSLtE9BbjxT9djQPO8o1tzql5Hs37
        x+nlb9n6kM2DObkDszAMo4SWJnclzzN9wjZYQtNWCYnQgzoWuQ64RNu53ezPRpyfD32SYfxN1p15V
        IMGn7O1CuG4XcRuuuxcnpA43mp5WJnq1lAnRvSbi1ILYdBl49E6OzzKyGaB+32aurWzpfmknA1AOU
        aPyJjLOg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mTeAc-00D8oc-HB; Fri, 24 Sep 2021 05:54:50 +0000
Subject: Re: linux-next: Tree for Sep 24 (m68k allmodconfig & drm/vc4/)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Maxime Ripard <maxime@cerno.tech>
References: <20210924145436.5ff73179@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dfd54a2f-d1db-8897-ae49-5c681a99b281@infradead.org>
Date:   Thu, 23 Sep 2021 22:54:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210924145436.5ff73179@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/23/21 9:54 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210923:
> 

from commit 36e9bcb8edfc in linux-next:


m68k allmodconfig:

WARNING: unmet direct dependencies detected for PM
   Depends on [n]: !MMU [=y]
   Selected by [m]:
   - DRM_VC4 [=m] && HAS_IOMEM [=y] && (ARCH_BCM || ARCH_BCM2835 || COMPILE_TEST [=y]) && DRM [=m] && SND [=m] && SND_SOC [=m] && COMMON_CLK [=y]


-- 
~Randy
