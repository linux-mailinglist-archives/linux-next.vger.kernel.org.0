Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0421B14622E
	for <lists+linux-next@lfdr.de>; Thu, 23 Jan 2020 08:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725785AbgAWHAK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jan 2020 02:00:10 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:60326 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgAWHAK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Jan 2020 02:00:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ChLAba33mM51MG0sa60SMdlx8JloJhJmrY07NXbesbo=; b=LIM19FKL6Fk0Or3ircWKGBmsU
        +XpeXHK2pB1dtxnfSW0SFDNV3wmNhcg5Vlv26dX4Q6FV1BcHIN+tOublSJgZGZhGwbCMxrj9RQIQj
        +ET+jTtby8XFagKBAqig1oejPamPpSP0+TdnJB/vxZ8OGnOxmGa9W4s1y5CgoFtsAxGdfGb/cq6A2
        QahYje3/vjE2IQZNceCeGZu8kXjMUI4syB4tz7/R9REZqwmgk5sr1Jpf15g3VWFoj1b/wBSRNdix6
        dSyoS+0UNk891PuJEF6+ySgcLSvRFIdZUDBiSSDecwB500j1yQvOZYfJMewbFg2pgClZAVyOgypFe
        /l7Lbu6+g==;
Received: from [2601:1c0:6280:3f0::ed68]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iuWTG-0006fS-RF; Thu, 23 Jan 2020 07:00:06 +0000
Subject: Re: linux-next: Tree for Jan 23 (PHY_EXYNOS5250_SATA in
 drivers/phy/samsung/Kconfig)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Kishon Vijay Abraham I <kishon@ti.com>
References: <20200123172101.2f31947c@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <beb9e3a3-4824-6328-12f8-3d005f376374@infradead.org>
Date:   Wed, 22 Jan 2020 23:00:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200123172101.2f31947c@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/22/20 10:21 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200122:
> 

Is linux-next missing some of the COMPILE_TEST fixes?  I am still seeing
this warning (that I reported on Jan. 9-2020 and that Arnd has sent a
possible patch for):


on i386 or x86_64:

WARNING: unmet direct dependencies detected for I2C_S3C2410
  Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && HAVE_S3C2410_I2C [=n]
  Selected by [y]:
  - PHY_EXYNOS5250_SATA [=y] && (SOC_EXYNOS5250 || COMPILE_TEST [=y]) && HAS_IOMEM [=y] && OF [=y]


Thanks.
-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
