Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2C91162153
	for <lists+linux-next@lfdr.de>; Tue, 18 Feb 2020 08:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgBRHF7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 18 Feb 2020 02:05:59 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:58568 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbgBRHF6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 18 Feb 2020 02:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=0WDK64CvM/aOQVQpYJeiENx5iDKotnOnD6ArMqWTlLE=; b=fJZBxTcuObVqaB4Sl29v/3xeDX
        6AqALUVY+GjDnDPWVnbDnKpR9cm+PhFZ/rplZOPXo1sbhhixioVCR0qYsolGnfbB647PNW1sKNAwu
        hdWvGi89OsUnCZBkZv0zTQGcd55gWNBR7PtROfR7PW7sIKJ4CW0GhZgrrcFPQ19UdvlOOL9p/O0pu
        eYVbFg0nvQpJ3Gn6gV5mNaNJWh61T6oKyZF3IFdRe1IRlQ4gNoMc5n8ncp+ai63HLGJ+9LRpLHufL
        X1DF7SB0/GqiAR7ejMLmR8YtyzVo0ZPzuAE0K7L90sEz9/cRV2mxNW1azEhE/JOLq1JhQj2Tdsc/p
        0bN2FsCg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j3wx4-0002kg-Qk; Tue, 18 Feb 2020 07:05:52 +0000
Subject: Re: linux-next: Tree for Feb 18 (sound/soc/codecs/wm5110.c)
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>,
        Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com
References: <20200218152853.67e2482a@canb.auug.org.au>
 <89ef264f-12c9-ccb0-5cdd-ee5f70a469dd@infradead.org>
Message-ID: <c2273472-18af-e206-c942-fd460e0d192c@infradead.org>
Date:   Mon, 17 Feb 2020 23:05:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <89ef264f-12c9-ccb0-5cdd-ee5f70a469dd@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

[resending to broonie@kernel.org; other email address got message too big for mailbox]


On 2/17/20 11:04 PM, Randy Dunlap wrote:
> On 2/17/20 8:28 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20200217:
>>
> 
> on x86_64:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_WM5110
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && MFD_WM5110 [=n]
>   Selected by [y]:
>   - SND_SOC_BELLS [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_SAMSUNG [=y] && MFD_ARIZONA [=y] && I2C [=y] && SPI_MASTER [=y] && (MACH_WLF_CRAGG_6410 || COMPILE_TEST [=y])
>   - SND_SOC_SAMSUNG_TM2_WM5110 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_SAMSUNG [=y] && MFD_ARIZONA [=y] && I2C [=y] && SPI_MASTER [=y] && (GPIOLIB [=y] || COMPILE_TEST [=y])
> 
> 
> Full randconfig file is attached.
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
