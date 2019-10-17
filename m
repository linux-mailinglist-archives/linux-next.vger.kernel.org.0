Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2D1ADB0FD
	for <lists+linux-next@lfdr.de>; Thu, 17 Oct 2019 17:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391405AbfJQPWX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Oct 2019 11:22:23 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:48806 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391285AbfJQPWX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Oct 2019 11:22:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=BhyZS7+sRv/JZoP4+6IBFbCyglVKgcF0rn92fjDmAO4=; b=gtWpIetf0FkX1pIJJ0IwoGVv1
        HsDLDA4LxEH/3ehgYeE2v/v4db7yQfFqttcJ3hZn40dmLYr7HcSeUIEDeiJ+SXdj6qWTsJDunTnJW
        UsVMf/lRaXRA6k+XOkmMYFfQ7ql2huqjvy76X4Ss6lAckL+3wwNBjXoTscIdmn7FZiz5en14jen27
        JMuybt8YtEWBjpZhLazYG0NlpASIKyzP0/YxdSi/9XBgUOIlAkuqw7PKFPdQJK0ouTyQSzShFMFkD
        9OvxDkSoKwSmw2Ygq9z9CN/k/9Icn8f2HccjIUmvMMzz9uZIagfqbuxRB3y3XfxsVL8Aq6+H9pp6x
        DFbYCt2dA==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iL7bW-0005jG-JK; Thu, 17 Oct 2019 15:22:19 +0000
Subject: Re: linux-next: Tree for Oct 17 (soundwire)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>,
        Vinod Koul <vkoul@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Sanyog Kale <sanyog.r.kale@intel.com>
References: <20191017152645.65892c78@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e8994e88-bdab-b3be-d62f-550ce9f2c76d@infradead.org>
Date:   Thu, 17 Oct 2019 08:22:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191017152645.65892c78@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/16/19 9:26 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20191016:
> 

on x86_64:

# CONFIG_BLOCK is not set

  CC [M]  drivers/soundwire/intel_init.o
In file included from ../drivers/soundwire/intel_init.c:12:0:
../include/linux/iomap.h: In function ‘iomap_sector’:
../include/linux/iomap.h:76:48: error: ‘SECTOR_SHIFT’ undeclared (first use in this function); did you mean ‘SECTIONS_SHIFT’?
  return (iomap->addr + pos - iomap->offset) >> SECTOR_SHIFT;
                                                ^~~~~~~~~~~~
                                                SECTIONS_SHIFT


-- 
~Randy
