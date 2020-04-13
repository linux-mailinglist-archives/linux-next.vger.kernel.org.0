Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 926001A6142
	for <lists+linux-next@lfdr.de>; Mon, 13 Apr 2020 02:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgDMAwU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 12 Apr 2020 20:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:53016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbgDMAwT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 12 Apr 2020 20:52:19 -0400
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 113E9C0A3BE0;
        Sun, 12 Apr 2020 17:52:20 -0700 (PDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id B2654AEC3;
        Mon, 13 Apr 2020 00:52:17 +0000 (UTC)
Subject: Re: linux-next: manual merge of the realtek tree with Linus' tree
To:     Joe Perches <joe@perches.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "linux-realtek-soc@lists.infradead.org" 
        <linux-realtek-soc@lists.infradead.org>,
        Olof Johansson <olof@lixom.net>
References: <20200413085034.5e77f236@canb.auug.org.au>
 <dbdc1f6b-faf8-7d0d-7730-4ae3f5610dde@suse.de>
 <8194c2197b9d57f6c37cc6417c9dc9b310732e6b.camel@perches.com>
From:   =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <539791a5-9b5f-4969-4dda-6f10ea11b9cd@suse.de>
Date:   Mon, 13 Apr 2020 02:52:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <8194c2197b9d57f6c37cc6417c9dc9b310732e6b.camel@perches.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello Joe,

Am 13.04.20 um 02:27 schrieb Joe Perches:
> One of the lines changed was from 2017.
> 
> d6656fa4 (Andreas Färber     2017-10-05 03:59:15 +0200 2263) F: arch/arm/mach-realtek/
> 
> Is that commit ever going forward?
> 
> commit d6656fa4c6215b293d23ed7242ced83a2fce1fec
> Author: Andreas Färber <afaerber@suse.de>
> Date:   Thu Oct 5 03:59:15 2017 +0200
> 
>      ARM: Prepare Realtek RTD1195
>      
>      Introduce ARCH_REALTEK Kconfig option also for 32-bit Arm.
>      
>      Override the text offset to cope with boot ROM occupying first 0xa800
>      bytes and further reservations up to 0xf4000 (compare Device Tree).
>      
>      Add a custom machine_desc to enforce memory carveout for I/O registers.
>      
>      Signed-off-by: Andreas Färber <afaerber@suse.de>

It was in a late pull request for 5.6 but missed it; Olof wanted to 
merge it for 5.7 instead, but apparently that didn't happen either, so 
I've rebased it for 5.8 earlier today.

For the record, the conflict came from someone reordering entries in my 
MAINTAINERS section, without notifying me.

Note that I have even older gems hidden in my branches: Infineon 
XMC4500, Spansion/Cypress/Infineon FM4, Andromeda Box Edge, ... All 
requires time and desk space.

Regards,
Andreas

-- 
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer
HRB 36809 (AG Nürnberg)
