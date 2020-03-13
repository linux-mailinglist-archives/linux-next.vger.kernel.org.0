Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E12518417B
	for <lists+linux-next@lfdr.de>; Fri, 13 Mar 2020 08:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgCMHYk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 13 Mar 2020 03:24:40 -0400
Received: from sonic308-54.consmr.mail.gq1.yahoo.com ([98.137.68.30]:33013
        "EHLO sonic308-54.consmr.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726464AbgCMHYk (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 13 Mar 2020 03:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1584084279; bh=jRfvjRpjOhYlkhIr0XQ/wEIX8N5uTxdHsF8eKRaYLFY=; h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject; b=eSAB+HVCuchZHbSuzDoR3ZMtynd2DizQCgY6BHcIvT7kqePfaPKmuZTWOTsyz+hOAc1mZRzB4tzd8+Uto3Riedi6diBRBunqegfH30rISJSMWO6EB5mJmXzUYgblRYBtD4vhci5SUWuhbRCLIuZZalRUKAmSa30qs8zYobOg6bazarjssEK2QV7gU6lXgZdgxvUIUBAE2jToi222yevJjDZvWlZMvpgX5bviFAgZ8/cRyu7R1Tw9Kk3UKreX8hksZVihTLgqDaetG58Ryvh3L7zWDO0BgWAkLIXC02w59hvmlc5FyJVJzTwU5Alr91kOiaiP+zjrRcl1xfqh8W9MeA==
X-YMail-OSG: rpXF1YgVM1nVpHB76raampumoUS40UfNqAf575G9WIlMTZ290k7kACwYEzuYtSi
 qb4vKN.lWBvSdgds98YdS5_gw.iLrU3uCcwwWWUJLzxt6YWa83Ne0KLZFaEnjBBm_Xj0cMlubASO
 _Uz0F7Ld2CJSBCmhlSoHHkyetL3bgW8G.uUChMSHJGIGxieT6HffQBsXCr0ZMfbGeFy2hZV65niG
 QFPGgFW_ZkrHwO1mJIL8Iy9GlEcwJJ5y7gjf2WXSa807ALFbfhCavFeixRwwNXWRdeFok6NiQJmF
 lX_cQ1QnvVR7JszITcXT6yqS5kbCePFiWjaKbO_jME3B3MZ6NW.PB.wvt4ggMMP9N5dOduE.vRmR
 .AU50hfRgbWJ9RXlziVJ06kHWP6Xq8afNUwreVoNReyUSL7pPWEtOxiCbV6i8ECLNjpjt9pGlIVQ
 i0xD2V734Rc.TAb07P1Cq8hwylST.zCf5Jo8s7YxLj5mKtmhOeSv51sy._5E6r5sC6.jxLXLLkPu
 gHBsuT1FJFTNBy208yYkSzrR6g0ILxP.2qt1tL4Lkb2h7FSi5URL_ggyYnOE6hwG.POQlS25KVXp
 JDrFx5nFfJbs_Ru_4GrDWRgGTFUoyXWjrEE5UrekXFo_a.WnGbfQTirpTo4mvhbafZngJLhiTpqF
 TGVULdm2l1f1a1.qmuTT.myX8RYSxjibp.g8glNPq7nikGNYekIQLpi_OLtmrGWgWwn48rqoHzge
 _f.m82xe4a0KvkM1K7LV48eOXpT7zYCSIBaDeZ6_T3vemBeFNID2QQv4mn8pYq3DvfeaHE6IWy9D
 FJ9Flld4d4RrJqhkQP_hXIOHR8Gld200wYI.V0CBEbQYYiXmSx5S1wMJpz3Kqary9Ln9LW_sbkIh
 EC3hhgo76HZb6wGbQQQ9LCd4Xib5f3cNvwZ9z1GNoUnMKUnv4Dbv3iVJi_L5LeyfWgZiDXNMCEc.
 djbb9v9fcOr6qvYvIGAD3g.JX8odytpvP0y4phwX9kPGvHzF.yxif.QiTaDQvGOGl3pP5wTBYrS6
 vBg_vshxLtFBXd7WkJlEuSTvsN_bEXBvupbIQHE96DkwnKyD7_D6BPCBoUmnRSe7xcO8sDvU66wh
 i4a2YX3hFBdwx9ErMZ067USVf74nRozDvX48b3eOGxxplaDKikq5znvv23XeauD2lRpNSAv4T7Q7
 KiWstk38M_s34EYkuC0cOWxsq5ri9boaQS352KZ7JcxyWs08Uy_jy_S6nUjrjPpsZOjDDEPzUakh
 OXzqm9VtT3lnGEbEklnX9ipOpFTf2cU8wg_GNufHBa6OMD.EbZ8oIdyjXkVzlF_4mAKpW58_H59y
 BshpHLGbBcOrY3NeX.U0nfACLrdoCY_3Z0nvpCQTLs31h2VEGg2TF6UMu1gAbpG0FY1VFQYDXFXZ
 HuxHa.6vDSSrWuWeYft4fnkIllTs-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.gq1.yahoo.com with HTTP; Fri, 13 Mar 2020 07:24:39 +0000
Received: by smtp408.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 2fbb703a4b7fb9b494252cd558df4793;
          Fri, 13 Mar 2020 07:24:32 +0000 (UTC)
Date:   Fri, 13 Mar 2020 15:24:24 +0800
From:   Gao Xiang <hsiangkao@aol.com>
To:     Matteo Croce <mcroce@redhat.com>
Cc:     Jens Axboe <axboe@kernel.dk>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Coly Li <colyli@suse.de>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <20200313072416.GA7651@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20200312135457.6891749e@canb.auug.org.au>
 <CAGnkfhztbmpP0=KT-iNbkUGKerhX04ENFsexA4_2cP_RUs0Png@mail.gmail.com>
 <baefdc44-d7cb-4e9e-c46c-b37012cfc40d@kernel.dk>
 <CAGnkfhwJR0CTy51o5F_YjgXCn7RK7=X1PcNbjhT-Xpw5zg3REg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGnkfhwJR0CTy51o5F_YjgXCn7RK7=X1PcNbjhT-Xpw5zg3REg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailer: WebService/1.1.15342 hermes Apache-HttpAsyncClient/4.1.4 (Java/1.8.0_241)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Matteo,

On Thu, Mar 12, 2020 at 02:57:14PM +0100, Matteo Croce wrote:

[]

> 
> I'm running coccinelle with this change appended, and also an all allyesconfig

I just notice this topic as a part of regular mailing list reading...

I didn't see this change before, but it seems that's a trivial patch
at least from EROFS part.

And maybe yes, testing allyesconfig (or allmodconfig) in advance
is better just for the sake of dependency safety...

For the new following part, feel free to add my

Acked-by: Gao Xiang <gaoxiang25@huawei.com>

if it's of some use (If it's useless, please ignore the above words.)

Thanks,
Gao Xiang

> 
> --- a/fs/erofs/internal.h
> +++ b/fs/erofs/internal.h
> @@ -16,6 +16,7 @@
>  #include <linux/magic.h>
>  #include <linux/slab.h>
>  #include <linux/vmalloc.h>
> +#include <linux/blkdev.h>
>  #include "erofs_fs.h"
> 
> Regards,
> -- 
> Matteo Croce
> per aspera ad upstream
> 
