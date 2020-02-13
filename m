Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D05A15C99A
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2020 18:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727806AbgBMRlX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Feb 2020 12:41:23 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:50108 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727076AbgBMRlX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Feb 2020 12:41:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=g0qlXJoh4ngb/QmDMiYQd823EO/vda2eM/qz6r97Mmg=; b=G2IrNlrNBazBWx5ojTUFdydJxn
        IUfqKxJrVJo8KfP5XVw7LCCGTVga2u29p1D/c3nXC+DUk6ZXcCE+XbcLVo7pkVPRWsxLezPI8HfYT
        4a6v+Mp6fRD5CuQLC9xVi1H13rgBNcYUJttqsERAw3F4TzXyAgAUjHZtypT1JDPwoim/dKij5FyiK
        mRRl9PO8Ds9p8XU/5SdM5K24u/XpuAvOlpTJ4AB+/xoiAtX+NzVWcZeYNHOIA3/w7gm5u9rC7qZ8/
        r/5lO8k1w7eylvq+FthaQyZe2ShRCkjIjzCKFtYWvxchc0g+ePXRJ+f3cdJtHAZP6+qRtR3ITBkDI
        NXA5xnow==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j2IUJ-0002HY-3a; Thu, 13 Feb 2020 17:41:19 +0000
Subject: Re: linux-next: Tree for Feb 13
 (sound/soc/codecs/snd-soc-ab8500-codec)
From:   Randy Dunlap <rdunlap@infradead.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>,
        Takashi Iwai <tiwai@suse.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>
References: <20200213145240.2ff2b6a2@canb.auug.org.au>
 <d8dbd288-5270-42f1-0d55-b0f1516addb1@infradead.org>
Message-ID: <d0d9a245-f336-1334-90a8-631faf95d071@infradead.org>
Date:   Thu, 13 Feb 2020 09:41:16 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <d8dbd288-5270-42f1-0d55-b0f1516addb1@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/13/20 9:06 AM, Randy Dunlap wrote:
> On 2/12/20 7:52 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20200212:
>>
> 
> on x86_64:
> 
> # CONFIG_ABX500_CORE is not set [this is in MFD]
> 
> ERROR: "abx500_set_register_interruptible" [sound/soc/codecs/snd-soc-ab8500-codec.ko] undefined!
> ERROR: "abx500_get_register_interruptible" [sound/soc/codecs/snd-soc-ab8500-codec.ko] undefined!
> 
> 
> Full randconfig file is attached.
> 
> 

[adding Geert, dropping 3 ST people due to bounced email addresses]

-- 
~Randy

