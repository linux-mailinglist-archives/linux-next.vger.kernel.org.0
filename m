Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F29214E7D1
	for <lists+linux-next@lfdr.de>; Fri, 31 Jan 2020 05:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbgAaERb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 30 Jan 2020 23:17:31 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:38320 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727448AbgAaERb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 30 Jan 2020 23:17:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=GOXsueAz7MAGYj/tGaoCm1DRnieLB+/5Y9oR3WcxDO8=; b=oeJKTlRO6Y1HQOBzE9oO9nU6N
        bJXX6gWzm/J1QIgPDHlSDLiqjqnmUJ+YDyCj2tBuwkVVcY8Ei2+r8nF2UolmkRUHNzXDL2KaQiZdL
        aPZogUr0BU5RIfDtgRd0qGmuK922+kW0oIJ7jP2O3miyDfOm5QSCxNYxYEWlEnFUapJXApRu3VaH7
        DwdPS+5Bb660bkOcR3fi1TwyFfxaduvkKoKmVMJF7d9CmcA5xqvZjt8nYhPrCGQErOEBkfg7ewAzG
        FbwQK/s0Ptj1xM5Xgrpi8gcovUVnPcXwAH2iUIgbnq6WoW+vStbBnv77OMvh2Cpo650+A4s4HqdmZ
        uu28Ea5XQ==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ixNkI-0001Ar-0F; Fri, 31 Jan 2020 04:17:30 +0000
Subject: Re: linux-next: build failure after merge of the origin tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <20200131151209.37e780f8@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <73f27df0-451f-d274-a7db-293cbf2c7690@infradead.org>
Date:   Thu, 30 Jan 2020 20:17:28 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200131151209.37e780f8@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 1/30/20 8:12 PM, Stephen Rothwell wrote:
> Hi all,
> 
> [At Michael's suggestion I have started doing htmldocs builds at the
> end of linux-next runs.  Unfortunately, this currently fails for Linus'
> tree.]
> 
> In Linus' tree, today's linux-next build (htmldocs) failed like this:
> 
> docutils.utils.SystemMessage: Documentation/driver-api/thermal/cpu-idle-cooling.rst:69: (SEVERE/4) Unexpected section title.
> 
> Caused by commit
> 
>   0a1990a2d1f2 ("thermal/drivers/cpu_cooling: Add idle cooling device documentation")
> 


I sent a patch for that on 2020-JAN-20 but no one has replied to the patch:

https://lore.kernel.org/linux-pm/712c1152-56b5-307f-b3f3-ed03a30b804a@infradead.org/


-- 
~Randy

