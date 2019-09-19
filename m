Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A939B8165
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 21:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391010AbfIST21 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 15:28:27 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52880 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390859AbfIST21 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Sep 2019 15:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ZQQcCpBlQ0ElB9UbM8suQ0So3al3Np/N814ZFWscUMI=; b=Wk3zRWzJ8RSrEtpxScZC+fOOQ
        wM9ZJVFYHrzS5HCyaWPiyW92Z8wxulYuW5oYW+HLcSwXFSWk29PfjOV6LlObtuXgTByozDV4syuUx
        ss+I6585YVxgQ6WDyfX8CUBl5yuK/WbTcJsP1lpcTEOs1TMH2UHwKtNgPZYlS6FxX/PvA10TJYJSQ
        UBGjnriTR04SGwqORjQ404dDdXBzArIbpLEq5I/bStNakkQ7ZuDOGVCG2tf4aYh/VSa+jR7QzgvHv
        7ckvVzCFE54QDQTNxF3nlxYv7KIZJdG5wHptPtiroHguLm5ydXVDrxU6jzutXRCUEkG22hCd01ciV
        2H6HaZTgA==;
Received: from [2601:1c0:6280:3f0::9a1f]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iB26N-0000Nn-4V; Thu, 19 Sep 2019 19:28:27 +0000
Subject: Re: linux-next: Tree for Sep 19 (amdgpu)
To:     Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>
References: <20190919160641.GR3642@sirena.co.uk>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0323499e-9fbd-a707-9713-cb40cc92b6fc@infradead.org>
Date:   Thu, 19 Sep 2019 12:28:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919160641.GR3642@sirena.co.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 9/19/19 9:06 AM, Mark Brown wrote:
> Hi all,
> 
> Changes since 20190918:
> 


../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/Makefile:70: *** missing 'endif'.  Stop.


-- 
~Randy
