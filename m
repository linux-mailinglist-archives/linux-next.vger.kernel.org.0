Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC7CBC2201
	for <lists+linux-next@lfdr.de>; Mon, 30 Sep 2019 15:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730583AbfI3Nck (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Sep 2019 09:32:40 -0400
Received: from sonic304-22.consmr.mail.ir2.yahoo.com ([77.238.179.147]:45822
        "EHLO sonic304-22.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728214AbfI3Nck (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Sep 2019 09:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1569850357; bh=BxjFlLKbyfwD4BKbabhEjF41rLGBsTJMHktjvyywruE=; h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Subject; b=Fc/8aLGBGSikJBya/Z0iQ6aV31XZmOdHAhr8S3if90MuGUtTsbLUH/c4uLMvkUc08km/wjyMFpRWd8PCJygJhnLBp38wyM0HwTUrOjLTtdqIpHIiZVYPHgDouwNcprXx3Pi4YHdD1g71cH0eRIrBPLajTKHbJXKuTgkKW3oKAgVcBQU3nIfbDMfc5D3HuNImQeTVrDAhQwnA5e84SlbXtRBM7IQMDrF/6MlnOjS03XipY2kuRrhR+lqEObT6wtOKEr/JTOcPYfw+pFggJySioR3PgqSfyBKLBDTzhw+7RSsBkkGpOlMFg9FidUVITOJUONHzidYEf4nvPFX+omrJ4Q==
X-YMail-OSG: tL7.wYAVM1lmXJG5K4v4fv6b1XYZnXDiBXdbRGi8FpKEs9aO8eY6BSrYKF8_J0p
 .WSmm81PA_FtiiQb8Nl._FPdFZDKK4.3MZE3poClsouWr1ne7Aisk7gZQXz_Yh5ge6wR_2Q6IzVN
 3NghMbfJ5FGTASJrc7Ae0x1gMu07SWh9L4mqKXNO.cZhB3nNkR.yTy9qe.ruZZEp5IinU1_heX2a
 kd6LVRV0sqZAXt7y3V_yPs6WtyCCpTqu_5sG4O8mGdHDnNy0Ybs4ryLUnqNmWanyh3xuYqbRWmWp
 Ch5drbdfUni3lxxZ8wXMVQCS95q6ePTOCYG1kfczFmrHrTBhgmKq2dXgFAZGsy_I.2AoiU6umnr1
 smrInCe0GSRvkJStqp.zSvteyvNLhFYnv3qG5rsKy_yggZc2rzYSLIdzsvpBpO_p7bwQIWC7dKyl
 8A8DnrovFPW1zN2szXVTMArnplCV8k_wQGnkkoMxXSmICECsbCPcqeuik6T9oV06E1klQ4AjHLz_
 XLRPQdTiZrNxbar86XBbLoWP1lI9XcjhEfTTirAi5eE8ZyzxkXjfHiAeGu3t7eyeiBvfSwIJwYEx
 Kv5XjiTJw8A.eWQcRURMJsJ7GRPwrLUOv.XCvRzuLQUS6B1t6AeGztQZoVl7C5rmBiIsVdeftU09
 3tqpNH1ga7kzeFKF6YxnTWqe1W3vlyekEuzdPZTkya1umCtHzna6zslz73INeJTPQX6O0S1RHs06
 OVX0wzgOcgTZg61pmikvh2m9GFVSqUThah3dDSoep4ZQ.9.lN9WubKg2_s.eVfW7Rast66cQl.2P
 Skq35Zal0PWOs_Y7K59URD2X.CfGbD0HgKTbTFQ235iQYVSCWKDzECn1_fxuTcKfZTXK.EB.gYk.
 UWMz1gnFbl0B5dBIcNsRITS6cRIDJsRr63.Cur031IFm8ynO7C1sgglZlU8TqPyZk0c5mIlZDsAg
 V5_H5nAChlavU5RVs.edHKP.0JSf4m1TMjSKHLRtiQsnl1c8963nELAiB2OjfdMUlMkjeS67MYip
 Oh2EUwhEjHEOaW06tm.z2YMzYdQdjLY_ZAU2Uz.MpOkagrUCh6saANFXZyz442MxAaFmWd._SM9Y
 UXZIYSAYK2U29yAJnjEk1mw_oPmCi1OeOtTNDVCCQ7uS00_ac.u2yInD0pnVKTNsUWuNoqvU3l1V
 omJ6qbi_KphSc75oBGtoltsBBO0Oqa5erylWb1FzQ.6ovN3fJOy7bANknNVqN4mZULU8iG_rjGtH
 xy60WlNZB2L1RF_ZgDSPIBxoV74l.BbCjg43cHIgak1fVv3hvhRy7zGV4HzbctK2DXpo-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ir2.yahoo.com with HTTP; Mon, 30 Sep 2019 13:32:37 +0000
Received: by smtp406.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 6d7d90c5e89d60ecb175859a862eb901;
          Mon, 30 Sep 2019 13:32:33 +0000 (UTC)
Date:   Mon, 30 Sep 2019 21:32:22 +0800
From:   Gao Xiang <hsiangkao@aol.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Brown <broonie@kernel.org>, linux-erofs@lists.ozlabs.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-next@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miao Xie <miaoxie@huawei.com>,
        Gao Xiang <gaoxiang25@huawei.com>
Subject: Re: erofs -next tree inclusion request
Message-ID: <20190930132925.GA10677@hsiangkao-HP-ZHAN-66-Pro-G1>
References: <20190919120110.GA48697@architecture4>
 <20190919121739.GG3642@sirena.co.uk>
 <20190919122328.GA82662@architecture4>
 <20190919143722.GA5363@hsiangkao-HP-ZHAN-66-Pro-G1>
 <20190930231439.37295a14@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190930231439.37295a14@canb.auug.org.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, Sep 30, 2019 at 11:14:39PM +1000, Stephen Rothwell wrote:
> Hi Gao,
> 
> On Thu, 19 Sep 2019 22:37:22 +0800 Gao Xiang <hsiangkao@aol.com> wrote:
> >
> > The fixes only -fixes branch is
> > git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git fixes
> 
> I have added this from tomorrow (sorry for the drop out today).

That is ok, and thanks for your great work.

> 
> Which address(es) should I use as your contact address(es)?

I think xiang@kernel.org is preferred since it can always redirect
to my workable email address.

> 
> Thanks for adding your subsystem tree as a participant of linux-next.  As
> you may know, this is not a judgement of your code.  The purpose of
> linux-next is for integration testing and to lower the impact of
> conflicts between subsystems in the next merge window. 
> 
> You will need to ensure that the patches/commits in your tree/series have
> been:
>      * submitted under GPL v2 (or later) and include the Contributor's
>         Signed-off-by,
>      * posted to the relevant mailing list,
>      * reviewed by you (or another maintainer of your subsystem tree),
>      * successfully unit tested, and 
>      * destined for the current or next Linux merge window.
> 
> Basically, this should be just what you would send to Linus (or ask him
> to fetch).  It is allowed to be rebased if you deem it necessary.

Thanks for the kind reminder :)

Thanks,
Gao Xiang

