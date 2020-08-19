Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D7224992C
	for <lists+linux-next@lfdr.de>; Wed, 19 Aug 2020 11:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726863AbgHSJTN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 19 Aug 2020 05:19:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:35562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726702AbgHSJTM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 19 Aug 2020 05:19:12 -0400
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E67DD20639;
        Wed, 19 Aug 2020 09:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597828751;
        bh=17vVUD0hLGpeTSU5LuR5zZekG96o1c4OZB8ljwNyRco=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wcyi5WBEas3k+58yAJp2BR3LMxfy7u2Xn44zhDBImtOGcqKi5+zuN508pYJ/ZJLDM
         4Q4F4d2n4TYhMdbCqKJlNWq+J6TQY5w8SVRHOrwKOI7AN3/sHD1eO7JumD9tHec1Tf
         EAolX4XkCXA0rPMTeG9RGKH1HoUQ0sF7Kc0LftNk=
Date:   Wed, 19 Aug 2020 04:24:55 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: linux-next: Tree for Aug 19 (scsi/libsas/)
Message-ID: <20200819092455.GA22994@embeddedor>
References: <20200819155742.1793a180@canb.auug.org.au>
 <dbbf8037-1e6c-5e66-39e1-3a5f4b0f3249@infradead.org>
 <20200819180934.37712cd4@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819180934.37712cd4@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

Please, see my comments below...

On Wed, Aug 19, 2020 at 06:09:34PM +1000, Stephen Rothwell wrote:
> Hi Randy,
> 
> On Tue, 18 Aug 2020 23:30:36 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > Is this some kind of mis-merge?
> > 
> > In sas_discover.c:
> > 
> > 	case SAS_SATA_DEV:
> > 	case SAS_SATA_PM:
> > #ifdef CONFIG_SCSI_SAS_ATA
> > 		error = sas_discover_sata(dev);
> > 		break;
> > #else
> > 		pr_notice("ATA device seen but CONFIG_SCSI_SAS_ATA=N so cannot attach\n");
> > 		fallthrough;
> > #endif
> > 		fallthrough;	/* only for the #else condition above */
> 
> No, that comes from commit
> 
>   58e813cceabd ("treewide: Use fallthrough pseudo-keyword")
> 
> from the kspp-gustavo tree.
> 
> >   CC [M]  drivers/scsi/libsas/sas_discover.o
> > In file included from ./../include/linux/compiler_types.h:65:0,
> >                  from <command-line>:0:
> > ../drivers/scsi/libsas/sas_discover.c: In function 'sas_discover_domain':
> > ../include/linux/compiler_attributes.h:214:41: warning: attribute 'fallthrough' not preceding a case label or default label
> >  # define fallthrough                    __attribute__((__fallthrough__))
> >                                          ^
> > ../drivers/scsi/libsas/sas_discover.c:469:3: note: in expansion of macro 'fallthrough'
> >    fallthrough;
> >    ^~~~~~~~~~~
> >   CC      drivers/ide/ide-eh.o
> > ../include/linux/compiler_attributes.h:214:41: error: invalid use of attribute 'fallthrough'
> >  # define fallthrough                    __attribute__((__fallthrough__))
> >                                          ^
> > ../drivers/scsi/libsas/sas_discover.c:471:3: note: in expansion of macro 'fallthrough'
> >    fallthrough; /* only for the #else condition above */
> >    ^~~~~~~~~~~
> 

I didn't catch this build error locally and, unfortunately, kernel test
robot didn't either, see:

https://lore.kernel.org/lkml/5f3cc99a.HgvOW3rH0mD0RmkM%25lkp@intel.com/

This is fixed in my -next tree now.

Sorry for the inconvenience.

Thanks!
--
Gustavo



