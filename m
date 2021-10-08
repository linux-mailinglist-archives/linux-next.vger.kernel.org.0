Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEAA4265F1
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 10:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232350AbhJHIcN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Oct 2021 04:32:13 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:36301 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbhJHIcL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 04:32:11 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MNL2Y-1mOPPw3X7y-00Op8W; Fri, 08 Oct 2021 10:30:14 +0200
Received: by mail-wr1-f52.google.com with SMTP id v25so27183234wra.2;
        Fri, 08 Oct 2021 01:30:14 -0700 (PDT)
X-Gm-Message-State: AOAM530lyAofST1GK0VGlWBqpaDtvtXB9IbNVnWMpzxzmIgH3+YZ6GPM
        R8sFvxabu8aqEeYCkvGAlDOXtzFRJXyFj+xkljA=
X-Google-Smtp-Source: ABdhPJwo4I68K0JWTGZxB0e3+qBmsipAzVep7wa0qwRwB4uZvFLP22EIhzcLcCLadL30o4o+87ASe40MpQoit7sfnMA=
X-Received: by 2002:a1c:2358:: with SMTP id j85mr2006066wmj.1.1633681814331;
 Fri, 08 Oct 2021 01:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20211008093834.6ce64bb7@canb.auug.org.au>
In-Reply-To: <20211008093834.6ce64bb7@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 8 Oct 2021 10:29:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1mcer=M1pJ23CsB1=KhCsmOeDW77F+OjE9u3wU-Heo6w@mail.gmail.com>
Message-ID: <CAK8P3a1mcer=M1pJ23CsB1=KhCsmOeDW77F+OjE9u3wU-Heo6w@mail.gmail.com>
Subject: Re: linux-next: manual merge of the asm-generic tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ZwH/s3w5zII2jQdSmRwK6j9wEnjrqQ/9TIgMrtMl7GtY9D82wq9
 uh596LpS4RrBTUbjv2gv9YMwqDOofc74Hl57701GX7Zv88E3nuzLTkhV2w8DpYty4sRHkRW
 xu6tkBcV4HHK2Qd+AhuhUaOXbLI9I00AEGG9BkQlX7wTnj+o+p9YsrWSkN0i5gyhYsaqLKe
 BhOZQB0A3haqevFHmdZZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oTO0uihoYKw=:KMsh3LahoRS8V1VJpKtyFF
 A3nBrpI/9wVuIdzp8AezsuYtoJFou7Oiq1jCF12LL8g6LnXBUNVQYEdS6hcYAaZNMNvNIQYpS
 eucYXQNF241PB69wiDwPpdja3lsB/LDA0pxYX2qWX5K+sOfw0300zADqkWVGzJ4sBHtQo98nr
 UoE7JVC+BQraKkECgsWeWr2nZRAkHEkNRmCQUdwL9d17PPG/pFJ6jz+ZH7QjHiiFzjNTWTgKK
 iIhmo5FXw8lo0onyl5Rcdn3v1OMnSsA+sg70Lh3yZ0LiJSjn/DU0hZS7/pnhStkPOmeuPO5kD
 PyO1ds0EG8QrJXEGz0aSIkRQkVtbEqTL4bQ7aH3WxvkM7YLJMLfdj6pB+xhFGf1sl+b+vNJRw
 2o2XDi+RrAQ7el709QwwW9L3vK18mADKwxBajh5lUH0GAWC3MIsTfEcfX0LtTEVVsga05OoCO
 TAPP3WMlyWzb4ArUHGfFLB5tIWDBCYARWlBE1+0EqEEQh3/4oAmyUtSSaMdj3+mVhdvbRxu2V
 AUBuWVHFH2AiSEYXUssZ+v8SqYhYJE6rcFUyLkwdPyrahEj2ocpZSfN9PnYpyZF/PyOnDVPJE
 e0dnEs8YZUIImb6MEwpp91L0lDsmcUXlFiOZN+NZyo55SNGFwr9Nei27/UrTA7CBHpiyvUiDN
 kNetcp6foEFqx1QD0RmbysuxnD92TiR89M1Jvdw/MHkPRxbE3/ZuJ7R+SkltzAeOQU2GfJ1sT
 IRT4lRtdIbyLH+33p/dtX6XmNrUtHyJFF0Y7OHw0y6+gu/X8LzmKRlkbURIuEe2ajscDcaeLI
 Hp0u6/lMRax7C63MSv5oWYNjxOY7odqmmvQUG95HQyXbKiF+ZfjBOT5dKwcur8v8iTVvGLUM+
 7aYgzVgokFIZayRp/Z7w==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 8, 2021 at 12:38 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the asm-generic tree got a conflict in:
>
>   drivers/firmware/Kconfig
>
> between commit:
>
>   4382c73a12b4 ("firmware: qcom_scm: QCOM_SCM should depend on ARCH_QCOM")
>
> from Linus' tree and commit:
>
>   7efbbe6e1414 ("qcom_scm: hide Kconfig symbol")
>
> from the asm-generic tree.
>
> I fixed it up (I just used the latter) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thanks for the report. Both of them came through my trees, so maybe
I should have added them into the same fixes branch after all...

     Arnd
