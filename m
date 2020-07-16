Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360B0222C7F
	for <lists+linux-next@lfdr.de>; Thu, 16 Jul 2020 22:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729458AbgGPUKf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jul 2020 16:10:35 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:60733 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728907AbgGPUKf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jul 2020 16:10:35 -0400
Received: from mail-qv1-f44.google.com ([209.85.219.44]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MeCd5-1kX9G22kSN-00bJXo; Thu, 16 Jul 2020 22:10:33 +0200
Received: by mail-qv1-f44.google.com with SMTP id t11so3320396qvk.1;
        Thu, 16 Jul 2020 13:10:33 -0700 (PDT)
X-Gm-Message-State: AOAM5327dbr353eCdcRtNK6j6ef50MttfAigcuX18sini8AyJfh6BCMO
        j+0XaHr7QjDjoQmeob+fzC1kP5QsXKF8M83TRYM=
X-Google-Smtp-Source: ABdhPJwf7kynnKai6Afz4/H0ZOfc7dZWYD0b8lXfjI914wMkP72ofpm/hkrkGhRuFEea9pz2bjdqMx8ipsD3ImBVJTk=
X-Received: by 2002:ad4:4c09:: with SMTP id bz9mr5708144qvb.210.1594930232427;
 Thu, 16 Jul 2020 13:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200714075729.68b92239@canb.auug.org.au> <1381a6c0-22fe-a175-f649-ea49da3451da@kernel.org>
In-Reply-To: <1381a6c0-22fe-a175-f649-ea49da3451da@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 16 Jul 2020 22:10:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a06bHeOqkQPG3Ap4hu4yFU-LA3L-5nwqk+7VGhSrKO_ng@mail.gmail.com>
Message-ID: <CAK8P3a06bHeOqkQPG3Ap4hu4yFU-LA3L-5nwqk+7VGhSrKO_ng@mail.gmail.com>
Subject: Re: linux-next: Fixes tags need some work in the arm-soc-fixes tree
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Xd04xb6AfbcMeaVp2O5+oAotMu02M4is0P1oZOZNRddIdv5h3wf
 wiGEDgcgcAVFCILgN8gvrIN5UDfiFezxAuL0T0Uf/rl9uBURUQG2U4PKT9CkfbP2itjZKqp
 xECZtDiPO9v33CDblevk6VJClfExoccMN0SIilRWAoSPUy8TVLcTCVBVVouJEtYoixmJi0R
 ZPVUNYJfMKOyPYbSCmptQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P5u18hlfURo=:zq8//lt1fQ4GBjvBMJyN05
 MZaptGCWpcozdo0WAOGu/IHPcurpw1l1rJobQ07wALffLLgPFiGSaqJCz/PEmgoQlHMpRGd4+
 0hVej9B+GYNc58YpPL6cTkGKuW8bSt18xTaOeHYFkH8IVG16oFEiA2xrl6rqKiAdhZ66F9FCk
 Hx11n3ZjUgcRJx01p0AgOvqLknxRePXil2a0tgwAg/8ETPOBa77PZ6LTLUr+XYhr0tpowZWlm
 CeRAQrpqIXDzGeRd43RO+mnbcMs3r/8WZ1Pf2lqYOlcpX66J7pKbG0zmPsOfVa9Ne3Quuxox/
 Y8yZPXW1d/2FB/jFwQgnBRpa+gqsRiyeh5bLKutonA5z6yLrl6iRP99PkAzEPjOtOVLmcBggu
 qriBsGixfyHt1PhYdtSccAAbBFKqYIGhRwAadvJNU81q4b2dlkkUyWTfi5Fkd/L+SEu2O3Z4V
 9GWPQIh40qR7K/RmleSUli8Zo8awBnwSJfUM2hmDEo0w0NlnCXdTPlOznoBba48osnue5mqsg
 hA061v7GNUA675tmKNsD4jdSc0iKe8AQYW+s3/MizolWMftXFgd0XsfQDcCfNJzbtX3Gx+Qrx
 tt8tzbbzvfKoouVYFCn07GAaRj00V4JkJClyzbRWLWRFn8sK7E48brwuW1xDqBCaU+JzLy2QW
 hX94GjJzGzxV6dIer24n5la6Ej0T8TEEy+3Lh9wNqsD1LK9qXCIrOc0J7ao4DK3Tpz4MOePAQ
 1VNWdLLQ/jY36/UNEbOZjNT4zDhZGDDGezvuwOKc4hvxU+0h2ivraBZYdDMvKhW4qC6c492gE
 B03tTnIWBEyVKkvWkTlBG9ZW7vHvoJI5KbbIFO2RJDRnsxQpF2rhaAV/MtgTUiGaEbL/7rC
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 15, 2020 at 9:14 PM Dinh Nguyen <dinguyen@kernel.org> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA512
>
> Hi,
>
> I apologize for this! I have an updated branch that fixes these tags.
> Let me know if I need to respin the pull request.

I've recreated the branch from scratch now (this was one of only
two pull requests I got anyway), it should be fine now.

       Arnd
