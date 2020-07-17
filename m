Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B21C9223FDB
	for <lists+linux-next@lfdr.de>; Fri, 17 Jul 2020 17:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgGQPrA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Jul 2020 11:47:00 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:60859 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726233AbgGQPrA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2020 11:47:00 -0400
Received: from mail-qt1-f169.google.com ([209.85.160.169]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MC2wN-1k8K0F2OBp-00CPbc; Fri, 17 Jul 2020 17:46:58 +0200
Received: by mail-qt1-f169.google.com with SMTP id d27so7952260qtg.4;
        Fri, 17 Jul 2020 08:46:58 -0700 (PDT)
X-Gm-Message-State: AOAM532TbNcU4zKi1cjTzxtHzFvnDTYxa8riS63a8CGj79yb34PKIh/H
        waRuLFBpRYJDFlzaKx5VteJHdnYFXiUED3l4ppQ=
X-Google-Smtp-Source: ABdhPJwRuQxd2c/E8rBZL1ytilWwE+6ltlolEq2ALjAYjWTYuZe9fyNBIlV0sAiIBKmo+7QuRmjyRaUqmYfsXSj9x9Q=
X-Received: by 2002:ac8:2b98:: with SMTP id m24mr11123736qtm.7.1595000817396;
 Fri, 17 Jul 2020 08:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200714075729.68b92239@canb.auug.org.au> <1381a6c0-22fe-a175-f649-ea49da3451da@kernel.org>
 <CAK8P3a06bHeOqkQPG3Ap4hu4yFU-LA3L-5nwqk+7VGhSrKO_ng@mail.gmail.com> <3761e5c8-3ba4-2925-9f3a-2d98dd1e46e2@kernel.org>
In-Reply-To: <3761e5c8-3ba4-2925-9f3a-2d98dd1e46e2@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 17 Jul 2020 17:46:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3YXWx5PhnZzsX_fYD0FC92XAn=2gr_3MA8dJ=zSpToBw@mail.gmail.com>
Message-ID: <CAK8P3a3YXWx5PhnZzsX_fYD0FC92XAn=2gr_3MA8dJ=zSpToBw@mail.gmail.com>
Subject: Re: linux-next: Fixes tags need some work in the arm-soc-fixes tree
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:25txlE2a3NAKCv+MfJ1L+MPkoqgQqo6u6Dl2ZQLy1OPvrSHXdi8
 jNATYqEBwdAjf7mZugQibV8TwuRy2cmBpVYDCa+sSNtWdZV2UovtIi8VUmK4samHZlwn0lU
 6GtTV8n1vnmAMngx4WLR9KTMK1bjx8DhgPXMM66DnvZVNfpn9RjSNoGbBAjFXnexisoEety
 knZdtdGgS6l+XPK9OKtbQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fS9YR3HV1F4=:BZIldDnwvn0uHAuBBfS17A
 qZDqpOLFkQ/csX7Sa+szfbq0kDZi39OLhZmIJ9hrkX+/B+9ljBUOe2G+5t4xbrYkYxgG1CdE1
 BHmmhnmBY2ABMg6m50S3FUu0vyDlJLW+DEuZHyYZLHoNLRBWbialzYyvQQFMy1Gz3iCTKsZer
 Zh6wVsX5asUethZNPikJul3NtVzLHPlHog4tzYhcrnfYrb+17o3jiJdSiJgWDvwZJXfO0/7Cu
 vmXuNl9/5wp9eNkq7y7nePhNUKeRags6iLGXfWOD9CNS31mM4pb1YrTZta8pPxp6sZf2DDJAT
 OBngm59bLe5qLFt8n8PGHlr/a+XzZcdxYw4tzMdoJjdTZDm2mjihBw70J8PB1p31N8vKRRwfI
 28lDoII2byqryI1iYnM5VcR7OsIq7+Vuc+c3E06YXlLkf3natEG7/Y0QjZI11S7CCFCD9f4Ma
 5fu8j7epj/EzGoj/7hy192FaxZ2TB9fKeDtdrCjT2BvTEq74ypAsH90gbYblp4QJNUTnjoLCR
 UFK/Prh+lGknijn5t/Tdvz5iodDxwFKs+QDmZqB79BPZWJTecTcRCVzETZDJJzjY8L5bIswLu
 09skolAHV3kjsbl45aWiiFoOyRNWPhvTehF10tPGYd675CAzJc1vHQh1v4n+4wxYiQPryJgUo
 5osV6nLiUitfBkBDt7fShqQAO3OnOHMy/R+3dxt1l2jfIZ7CJYPX0LkiwzaL8FXaN/ZyGcskk
 a2+OWtj4zi68w0hJqMJlO9X95ptQJT/VMKf7qD0f46a45FtiXyxiVMQCml3XDGaSGLSM2j7fd
 dHERRNZbiWr4m4Co42nM/Cw64oqqPf2cwtRQhbxQYSg1U/CQjuzmszktzwP2epkPBxKOG4Fn0
 /WsX3KiXrz4P/Ojxpy9TglLQ+YJnHQU/dcZA1uVZj3C0DQ1HFF2QwDpekLi/3O+9Dim+mz36O
 0CfK84yLcDa4+Lxd9U5PwaQ/4SbsuYmm5P1QwH9ZHhqWI74ZOVAQI
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jul 17, 2020 at 5:36 PM Dinh Nguyen <dinguyen@kernel.org> wrote:
> On 7/16/20 3:10 PM, Arnd Bergmann wrote:
> > On Wed, Jul 15, 2020 at 9:14 PM Dinh Nguyen <dinguyen@kernel.org> wrote:
> >>
> >> -----BEGIN PGP SIGNED MESSAGE-----
> >> Hash: SHA512
> >>
> >> Hi,
> >>
> >> I apologize for this! I have an updated branch that fixes these tags.
> >> Let me know if I need to respin the pull request.
> >
> > I've recreated the branch from scratch now (this was one of only
> > two pull requests I got anyway), it should be fine now.
> >
>
> Thank you!

I was about to send off the pull request to Linus now, but I now saw
that the tag I pulled was not updated and still has the broken lines.

Could you make sure you upload a new tag and send the pull
request for that so I can pull it once more?

      Arnd
