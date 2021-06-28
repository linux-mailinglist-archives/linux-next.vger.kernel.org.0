Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5C53B6643
	for <lists+linux-next@lfdr.de>; Mon, 28 Jun 2021 17:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233773AbhF1P6E (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Jun 2021 11:58:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235756AbhF1P56 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Jun 2021 11:57:58 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A719DC061149;
        Mon, 28 Jun 2021 08:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=DDSYK3q7WkwGOU/fE4Ul6NNgA9L+t+kmkbABPG7mL/I=; b=RAELPFVjGPRefTYMZ2kMVG8s/d
        DH8w9/1y1tOOjBkbkxmzkzuWiEtJHIt2HMw7ZJXhXY4FuN3LkO8cN8SZNijulHCD9I4UXYSOAOyll
        6FMBusc8n/wav8saPbWQPLiXcz5nqlcpGo9MHwkRxidpt7omirpxrknFvddKRwIwAm2H/4ubDxJsP
        HQOokJiWQkTWn+40AcMzV5b66qDyQE7e0wCiIbAJ+vwUFtmPE97mY5SvvCLjCDI8U5lad+mY5YXpW
        GqgmFArzE6t2/G3W3P8v4GgSAgzwvVkU0xtWBchJSJQdSV/xF1LXWMaeKM6ObO+WhxXXcmxzk4Ocw
        t4eAZD6A==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lxtZO-008Vir-2C; Mon, 28 Jun 2021 15:53:10 +0000
Subject: Re: linux-next: Tree for Jun 28 (drm/vmwgfx/)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Roland Scheidegger <sroland@vmware.com>,
        Zack Rusin <zackr@vmware.com>
References: <20210628205732.4c2a0abf@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e99431bc-676e-29a6-e6ee-ea5fa18f0ea4@infradead.org>
Date:   Mon, 28 Jun 2021 08:53:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628205732.4c2a0abf@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 6/28/21 3:57 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210625:
> 

on i386 or 86_64:

../drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function 'vmw_vram_manager_init':
../drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:678:8: error: implicit declaration of function 'ttm_range_man_init'; did you mean 'ttm_tt_mgr_init'? [-Werror=implicit-function-declaration]
  ret = ttm_range_man_init(&dev_priv->bdev, TTM_PL_VRAM, false,
        ^~~~~~~~~~~~~~~~~~
        ttm_tt_mgr_init
../drivers/gpu/drm/vmwgfx/vmwgfx_drv.c: In function 'vmw_vram_manager_fini':
../drivers/gpu/drm/vmwgfx/vmwgfx_drv.c:690:2: error: implicit declaration of function 'ttm_range_man_fini'; did you mean 'ttm_pool_mgr_fini'? [-Werror=implicit-function-declaration]
  ttm_range_man_fini(&dev_priv->bdev, TTM_PL_VRAM);
  ^~~~~~~~~~~~~~~~~~
  ttm_pool_mgr_fini


The randconfig seed for this build is:
KCONFIG_SEED=0x96D160F4

or do you want the full randconfig file?


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>

