Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90BFC4C7139
	for <lists+linux-next@lfdr.de>; Mon, 28 Feb 2022 17:03:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237704AbiB1QDt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Feb 2022 11:03:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237750AbiB1QDp (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Feb 2022 11:03:45 -0500
X-Greylist: delayed 315 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 28 Feb 2022 08:03:06 PST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A4233EABF
        for <linux-next@vger.kernel.org>; Mon, 28 Feb 2022 08:03:05 -0800 (PST)
Received: from mail-wm1-f42.google.com ([209.85.128.42]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mlejs-1o75lX2fGk-00iitS; Mon, 28 Feb 2022 16:57:49 +0100
Received: by mail-wm1-f42.google.com with SMTP id bg31-20020a05600c3c9f00b00381590dbb33so2533810wmb.3;
        Mon, 28 Feb 2022 07:57:49 -0800 (PST)
X-Gm-Message-State: AOAM531l1YBEHnse++Jn6wdDuelDvTv7m0BqcBCBml49+CGttC0H3MhZ
        d5fMcYeZeEpr4b4ORHfWgeF561WYP1pLr0kvyik=
X-Google-Smtp-Source: ABdhPJwWO7JpZGQq+hYomYAuL8Jmwra1m177yHdVjT4LcY+LCSudgwemaoWEFE8W+L0d9PhzW8PLwjisjmxhpCV5Slc=
X-Received: by 2002:a05:600c:154b:b0:381:8148:64d with SMTP id
 f11-20020a05600c154b00b003818148064dmr607563wmg.98.1646063869351; Mon, 28 Feb
 2022 07:57:49 -0800 (PST)
MIME-Version: 1.0
References: <20220301025101.7fb280fd@canb.auug.org.au>
In-Reply-To: <20220301025101.7fb280fd@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 28 Feb 2022 16:57:33 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0+fGJniopx1q5OhY9zk-PNemcUZ2XXx-JWOLGdDwmu5A@mail.gmail.com>
Message-ID: <CAK8P3a0+fGJniopx1q5OhY9zk-PNemcUZ2XXx-JWOLGdDwmu5A@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Conor Dooley <mail@conchuod.ie>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ck/zoYCKU8CZmRgNR+kp5gcjeL3JEJr3m7MojCX3aWfkojGUGMK
 o5tSIBOGAXqa9e5zG2wj2y1O3HdANI7jeEtwFYiVz83xCp2xUGasBW0P8Sch3MdGcuj09K7
 olwgEYYW6JD6/V4C0D6WnQRMoBw6WoPIAWY/lbz23n1a+M+6Jq0wUvTiq7C90Z4mTnpU55p
 oteGyGJEn01FheCj9szDQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Uo3frJBpn9Y=:/IB+RyNKY9ewcbUcuF8qE9
 UsPW0zy4N/tzla2bC2BYdsom/Q5zeTo4JQlYNXBok+y5TYNgppKikoEkItE6wkUdKIxNSSnPO
 dvekH2bv2sgyVt1KPLJt9sVcI8zpbbXyERzp/Jf223BKmo7avmmEsDT/qP060kL23n8u4Hfct
 j4rgsHfLVIbPzyaF9ZtESoaKnP2s/13MdjrWFeEm9gyfWSb4kQ11O+1iyEWw7yZvXG3hlzSst
 29ar4NCbxerDYRbfXwlxdJDY28Hyow/lEmWjVCI1U4922rosuq2GHUUrubqW7jTL85KTnLphR
 eOPvyVCUJv+/nHxjJ7bqgu3N11rD7gGJYGGOLgXVGdNQjNGRHcl/KzKj7gfGv5O5rXEuwCp+A
 7bTD6yivGYvftyUCRP47sW/K5xgffNdc0aLR+BnmpCo/mHLqgLryg3h/31mrPiABtUn2z81co
 +C4VJCc0TvK9JV3TpfXnGikKDQ9mT48USnslw5LrRXlpV+ex/I4Ubm6+72EZQ7sLCpJH6m13V
 sSEGg4hxSvHog/WuGkCa984C+2Jrz8eg1wVw1FHjUL2/md0f25dtTlLLYAzXf/dY4q/EfRX6M
 mXhnT7fVgEwxqlycjVj+xhIWphGUv+PCPjb7SN45JmroyNSbWOjGgAH/Ajf20/SWwcjuAAbm3
 3SeY6pd3W1NiMdQRvFt8xcdpJmyw0/DrF9hAhnz+5CgciwB6wHCRJ7rpM6VAhVXJ+JToObvwk
 kqNUjr6sDgSbP4DYg4xw82Ru1AyuIYD+uR7hKfFoFdSYMpjyZjSE45hzdKyfkOoxg+/GzWZrY
 CYt7QccPreKVhyrIS6HVyhiqSlfsVExuEeq65WWfqDET9wyHWo=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Feb 28, 2022 at 4:51 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   ed40a635b5ec ("soc: microchip: make mpfs_sys_controller_put static")
>
> Fixes tag
>
>   Fixes: dsafsdfd0054 ("soc: add microchip polarfire soc system controller")
>
> has these problem(s):
>
>   - No SHA1 recognised
>
> Maybe you meant
>
> Fixes: d0054a470c33 ("soc: add microchip polarfire soc system controller")

Fixed, thanks!
