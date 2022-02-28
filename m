Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF93B4C6B6E
	for <lists+linux-next@lfdr.de>; Mon, 28 Feb 2022 12:58:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233346AbiB1L7T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Feb 2022 06:59:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232330AbiB1L7S (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Feb 2022 06:59:18 -0500
X-Greylist: delayed 306 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 28 Feb 2022 03:58:39 PST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54412DC7
        for <linux-next@vger.kernel.org>; Mon, 28 Feb 2022 03:58:39 -0800 (PST)
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M89P1-1nL3ge49nn-005E81; Mon, 28 Feb 2022 12:53:32 +0100
Received: by mail-wr1-f44.google.com with SMTP id v21so15009772wrv.5;
        Mon, 28 Feb 2022 03:53:31 -0800 (PST)
X-Gm-Message-State: AOAM532jb4LvTK7tumPZFcgkY46yQq1hcseE2Lsi4sS+4kDPVtZ65BBg
        zc02auoftu0Fyc8K1/xnKA/thp9wlOLNGKikFpA=
X-Google-Smtp-Source: ABdhPJykAt6ihZgqOZKp9oNRnHFW4qiCzKkcVBlncurWtBDcvGWcAcmcw25G6Q51i8qymETmBLx0d9QsS0YF+zInvuE=
X-Received: by 2002:adf:edc3:0:b0:1ec:5f11:5415 with SMTP id
 v3-20020adfedc3000000b001ec5f115415mr13619242wro.317.1646049211645; Mon, 28
 Feb 2022 03:53:31 -0800 (PST)
MIME-Version: 1.0
References: <20220228074547.3c0371cd@canb.auug.org.au>
In-Reply-To: <20220228074547.3c0371cd@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 28 Feb 2022 12:53:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0VkTROBxO7mLSsiquY9E6A-Jy4dG3a=SbtgVMHEO6knQ@mail.gmail.com>
Message-ID: <CAK8P3a0VkTROBxO7mLSsiquY9E6A-Jy4dG3a=SbtgVMHEO6knQ@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Romain Perier <romain.perier@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UInjd2IomjEIWr2e3cQcCoUXpivGIEh0UT1Fuarjo/zxVauiyZ3
 7US2Yn5QdzsYgzfvB11e8m0IYHM2SGyi/ff7pr5NDiywKgXcug5wMh/bapOUe9qvfvDhouM
 4MY2gJguFDHItLjC9WrqBZWk177Gf+bFH2oKaLQrkpixgjL2GKDyn8FcvpPI+qWNAjUtUL6
 /P3u2H+sr57OD3a6e5PuQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Nsf33fPlVRc=:yVvWZ6ZzZsUEt+mMOyvDtO
 zaM0EIZuy4voiw9n8sa7znrsW30HgiJXj/HcBIaKrank+sa2pVWfffNasm+mPhlrffU9kKZQc
 5iVDZWvSs+DM8IjgLJq9nEd28MUMbGeSaIiYkKaRYjjadtYvWapB0LGbp1L2IHi0WpqtVU2mz
 fzMZoMght4Xn3XmX98I5a6WoVmXB3HfY33UQTpq/QtzKRt1xUs7hjYLaFJgMqhsxRiXE0a7Dm
 xjpStld6ZwxjwqJrMRjM4T/EPIsQEMmcxykGnVqOY5KHx0X7mrxP6s5zq262fg7l6kXNBkMyD
 XvBXLVLce3CjxxvwYyQIDTOQxu6Zi6NuoEsyUfVQwsnJQEmy5unCEXna6CUSwL4Z3sUD+qEet
 qCMN1/PJ2wLGkwW66LyDFpcpCm2IcJQ8i7GK1OJ9LicSdX7z4I7KwrfEz6dLSlyI4KuMC8GIC
 uicJjgj0czURGNLJERF76lfoxAO4PuxzmLNyW7nGsRvhpQXqRSJ/ZBaThlQfD9IYcFtisNSls
 ySWJrsVgI6TmmS/wNeJxSe0Xz4Diq6lnSgFJES9GQoPDJ8c8b+MRrKgUdOQguCyk6bC0BK/o8
 UzRKzJPo3bBFUJ0pQvf4W6JQAbwxUwPZnBC57ucSqE8qfkt8dOhy4ldeAWUIgAwHHlbssGn6j
 zETh7S1z8X9t/AQ4xr847AklnSDX7W57XWNR0jhJOIT2LrmZIJlYWLlQ9w2yFlHeDR6SotOPl
 1ObDnHBEDPksx+mbJXdxMg5x/SZ1Xm29Ry4pKuymVg3y/lPOt5jZhSGGKpIyN+BlfEpVbP7y2
 h9oUq8MjJAlbo9BsekKl4TAHBXdH3zXTp/mjo+Rb+hTuGmtlbc=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Feb 27, 2022 at 9:45 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commits
>
>   4fcfd917c9eb ("ARM: mstar: Add OPP table for infinity3")
>   9affaa4ad7cc ("ARM: mstar: Add OPP table for infinity")
>   79f700c24b13 ("ARM: mstar: Link cpupll to second core")
>   62a2718bf4c2 ("ARM: mstar: Link cpupll to cpu")
>   6979b5fedb92 ("ARM: mstar: Add cpupll to base dtsi")
>   c952e5075de1 ("dt-bindings: clk: mstar msc313 cpupll binding description")
>
> are missing a Signed-off-by from their committer.

Thank you for the report. These are now far down in the history of
my arm/dt branch, so I don't want to rebase that any more.

I see these patches all have Daniel as author and Signoff, with Romain
providing a Reviewed-by and doing the actual commit. As both
Romain and Daniel are maintainers for this platform, my guess is that
Romain ended up rebasing the tree without adding a signoff.

        Arnd
