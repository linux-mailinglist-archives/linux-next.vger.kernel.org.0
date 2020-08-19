Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 583D72494FB
	for <lists+linux-next@lfdr.de>; Wed, 19 Aug 2020 08:30:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgHSGaq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 02:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbgHSGap (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 19 Aug 2020 02:30:45 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13467C061389;
        Tue, 18 Aug 2020 23:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=UgSZNlUuKgU2XUXlOtW6UXW0y0qV6J6pfHHe7gP/Sl4=; b=w5IZhdb/A8fGlvpqumPxnZyxGa
        eA9F4+irb6pQJYTnyUPw4+aoVgc86Cc6ihlMmXVfWGWb4I9gY8g4M1HKuBCQArL+lGGm6EWAPwpI5
        eISXZCE4CxKBYdQnDLfvGP2nETM9VMKlicekO7MxHQGZbN4ZMmm1Lr5BhDY/UdrlT3ODDQxtnVbrf
        JNsyeN7llL3OoY8tFFKHoODmR6HmqfqvohPj3E4zm7yPQVebL87UocHSUyoEVeD/S1UN0Q9ApAHtn
        2HtJ3ckALaClJmpdaKvI1pzReu2Q8VtWrZQCwhtUBXaVzmxNssJU7jZ1dlropWtK9PJMgumRNA9is
        T39nu3eg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k8HcP-0002A9-LH; Wed, 19 Aug 2020 06:30:42 +0000
Subject: Re: linux-next: Tree for Aug 19 (scsi/libsas/)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
References: <20200819155742.1793a180@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dbbf8037-1e6c-5e66-39e1-3a5f4b0f3249@infradead.org>
Date:   Tue, 18 Aug 2020 23:30:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819155742.1793a180@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/18/20 10:57 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200818:
> 

Is this some kind of mis-merge?

In sas_discover.c:

	case SAS_SATA_DEV:
	case SAS_SATA_PM:
#ifdef CONFIG_SCSI_SAS_ATA
		error = sas_discover_sata(dev);
		break;
#else
		pr_notice("ATA device seen but CONFIG_SCSI_SAS_ATA=N so cannot attach\n");
		fallthrough;
#endif
		fallthrough;	/* only for the #else condition above */




  CC [M]  drivers/scsi/libsas/sas_discover.o
In file included from ./../include/linux/compiler_types.h:65:0,
                 from <command-line>:0:
../drivers/scsi/libsas/sas_discover.c: In function 'sas_discover_domain':
../include/linux/compiler_attributes.h:214:41: warning: attribute 'fallthrough' not preceding a case label or default label
 # define fallthrough                    __attribute__((__fallthrough__))
                                         ^
../drivers/scsi/libsas/sas_discover.c:469:3: note: in expansion of macro 'fallthrough'
   fallthrough;
   ^~~~~~~~~~~
  CC      drivers/ide/ide-eh.o
../include/linux/compiler_attributes.h:214:41: error: invalid use of attribute 'fallthrough'
 # define fallthrough                    __attribute__((__fallthrough__))
                                         ^
../drivers/scsi/libsas/sas_discover.c:471:3: note: in expansion of macro 'fallthrough'
   fallthrough; /* only for the #else condition above */
   ^~~~~~~~~~~



-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
