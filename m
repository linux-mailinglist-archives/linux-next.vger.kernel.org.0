Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94D30642EA7
	for <lists+linux-next@lfdr.de>; Mon,  5 Dec 2022 18:25:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbiLERZx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Dec 2022 12:25:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232287AbiLERZe (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 5 Dec 2022 12:25:34 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78472218A0
        for <linux-next@vger.kernel.org>; Mon,  5 Dec 2022 09:25:00 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id s16so5391890iln.4
        for <linux-next@vger.kernel.org>; Mon, 05 Dec 2022 09:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RySgEr1sUrHZ1nCymQmDeo4/Y6ZOXyOJnU/yj5J5hPk=;
        b=jk/sO03XWU7B+5BxvbidUGg1TqxV0JKJkO0ZUSHCzCKgw0EwCHR2G4U2Cio6qiPMAS
         WzOhXtv40Us4zZtxD7bxfTOWmsdHFp8EeYRHGYsANXcwUucUqleazvtHmFWR/1ly1HKP
         w0nf2Y31smroEHo6yHqRMAor1loYRgGsFco55tCpLoadMTQBrb9x7eZiKRiYeo+z+xXB
         yt1+/GLji90LXjjpHCVok7GUdLMvoo8m6zytufr1LB25T2JNsSor6JtXD4IrcKZncDIF
         U4wD36zEmK3QGuKjnoV5BdURrDxqYmffhKcJEJs7dbNyntal+z7NroySBLCN2c7LpmoP
         0Jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RySgEr1sUrHZ1nCymQmDeo4/Y6ZOXyOJnU/yj5J5hPk=;
        b=XfOtnEFYi0gBOOwv94wy+g39hJIo0k2qOMrGvTcgXi3BzqX20AJqNdiFL6SIeVElH3
         MkRvUZ75eX0w3Jnb9RxzsE4i/ZZJ0+CDtLSwjmWbNNAh8xKRXjJfzNGZJLv+ToxVTrGn
         X8HsJonxdqa/vx+p318vdTWXLkei3BRxklJpWHPXAADzcjDKpzFgP113QBj2brPF+LMS
         llWsix3PBp2qWZhDb77jz3UGCVL5IXZGY0otS9pkLcAWZP9ifEJa0sECT/qOFgGhTMD0
         m/sLv7U3o3IO1netCi4rqRWe6Xqp2jaCx1Yegd32sdxNT40EGdAlyD/4OhgQZUnT07ay
         U9fg==
X-Gm-Message-State: ANoB5pkYILN6oZm7JtCfub23BIIxKXoDeOh64adbjUJ5bQ1y22QCy4xP
        bvwYCQJ6+er5HyBUhH6bCo2cAyTGce6/21PTUeJhhg==
X-Google-Smtp-Source: AA0mqf60ATo6agV4JyMK9bqx86xQx3PiS4Uc05Puk4GWZywUQxl83TslhpKnozbKFULr20r1ijqitmL4cz1/uYQ27WU=
X-Received: by 2002:a05:6e02:1101:b0:300:d3e3:a124 with SMTP id
 u1-20020a056e02110100b00300d3e3a124mr29618361ilk.260.1670261099858; Mon, 05
 Dec 2022 09:24:59 -0800 (PST)
MIME-Version: 1.0
References: <20221128134120.0afdceb3@canb.auug.org.au>
In-Reply-To: <20221128134120.0afdceb3@canb.auug.org.au>
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
Date:   Mon, 5 Dec 2022 10:24:48 -0700
Message-ID: <CANLsYkw0Nq38rZzGTTpCL4J3aWJQpX32iOe4zdTT0+CcfhcOmg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rpmsg tree with the spi tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Brown <broonie@kernel.org>,
        Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
        Ben Levinsky <ben.levinsky@amd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>,
        Tanmay Shah <tanmay.shah@amd.com>,
        Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen - thanks for the legwork on this.


On Sun, 27 Nov 2022 at 19:41, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the rpmsg tree got a conflict in:
>
>   include/linux/firmware/xlnx-zynqmp.h
>
> between commit:
>
>   1e400cb9cff2 ("firmware: xilinx: Add qspi firmware interface")
>

Mark - since this is in the SPI tree, can you send me a pull request
for this commit?  I will do the refactoring on my side.

Thanks,
Mathieu

> from the spi tree and commit:
>
>   b2bd0a8c3ab1 ("firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU configuration.")
>
> from the rpmsg tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc include/linux/firmware/xlnx-zynqmp.h
> index fac37680ffe7,cf92e739fa3b..000000000000
> --- a/include/linux/firmware/xlnx-zynqmp.h
> +++ b/include/linux/firmware/xlnx-zynqmp.h
> @@@ -135,7 -138,10 +138,11 @@@ enum pm_ret_status
>   };
>
>   enum pm_ioctl_id {
> +       IOCTL_GET_RPU_OPER_MODE = 0,
> +       IOCTL_SET_RPU_OPER_MODE = 1,
> +       IOCTL_RPU_BOOT_ADDR_CONFIG = 2,
> +       IOCTL_TCM_COMB_CONFIG = 3,
>  +      IOCTL_SET_TAPDELAY_BYPASS = 4,
>         IOCTL_SD_DLL_RESET = 6,
>         IOCTL_SET_SD_TAPDELAY = 7,
>         IOCTL_SET_PLL_FRAC_MODE = 8,
