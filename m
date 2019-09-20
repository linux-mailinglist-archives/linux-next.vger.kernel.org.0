Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAEA7B9800
	for <lists+linux-next@lfdr.de>; Fri, 20 Sep 2019 21:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729696AbfITTs7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Sep 2019 15:48:59 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43428 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726807AbfITTs7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Sep 2019 15:48:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=weRqgS5ombpBOF0myIcU8zowirEb3nbtSgzyhH54kac=; b=CMJQgs2m5NOJ0jHHy2MS1Dd++
        +1qoR2mMF0+tP5HzwPyUPg7IINzyBCWJjcQNfaNsXsl9NkwphGbxdsYTUM1PT/gSP2P69IyUQp3Nk
        tC/sJZTQy3JaIXn5SpW2dgfbALKkPDhaIMR0+m7ev2q8bVJ4koAeyiX7LVFcohxSJoc2GvCcAub+0
        2bPww9D7kfPV0nzXb0nKN0UThUkU33dK3Ji4NCqA6CcPn+Nd1yBI0QrvV67mevoGMItKnm7DJu27D
        +6xvyV85jj9dZbk7lX5Qr9gFqmgUp0nurHWRK+rR5BYeiFLnQrMkqC8uSRzjYBZi5O/8A06V9CdAb
        atgPF0sZQ==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iBOtl-0002KP-Lk; Fri, 20 Sep 2019 19:48:58 +0000
Subject: Re: linux-next: Tree for Sep 20 (amd/display)
To:     Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190920163637.GI3822@sirena.co.uk>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f7328ccb-0561-3917-47d2-5d101400a66a@infradead.org>
Date:   Fri, 20 Sep 2019 12:48:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920163637.GI3822@sirena.co.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


on i386:

ld: drivers/gpu/drm/amd/display/dc/clk_mgr/dce110/dce110_clk_mgr.o: in function `dce11_pplib_apply_display_requirements':
dce110_clk_mgr.c:(.text+0x2f0): undefined reference to `__divdi3'
ld: dce110_clk_mgr.c:(.text+0x304): undefined reference to `__divdi3'


-- 
~Randy
