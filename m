Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD025355E19
	for <lists+linux-next@lfdr.de>; Tue,  6 Apr 2021 23:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235430AbhDFVoz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Apr 2021 17:44:55 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:43831 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234334AbhDFVoy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Apr 2021 17:44:54 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MD5fd-1lLPBt2ux7-00992G; Tue, 06 Apr 2021 23:44:44 +0200
Received: by mail-ot1-f47.google.com with SMTP id y19-20020a0568301d93b02901b9f88a238eso16058878oti.11;
        Tue, 06 Apr 2021 14:44:44 -0700 (PDT)
X-Gm-Message-State: AOAM532tcgdkCNhOPzL2EXrnBloz0616HmpRVLqtTbGqyoXLiFrpq9SY
        Fn1nHJVRH5o3EY/d4bCluU7P0pI2IPFa8nX7sAM=
X-Google-Smtp-Source: ABdhPJyarOH3KeAsZb1n/xAz+6tAZL/soocoRG4d6OccGB57RcBs+B/s+L5uPYg/CG+2GOB326TYra83d6VMYAVc9Oo=
X-Received: by 2002:a9d:316:: with SMTP id 22mr140916otv.210.1617745483373;
 Tue, 06 Apr 2021 14:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210406081100.4a866aa6@canb.auug.org.au> <20210406081147.7a5332ed@canb.auug.org.au>
In-Reply-To: <20210406081147.7a5332ed@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 6 Apr 2021 23:44:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1W9oHfx47-_d1ytHN+ZJAQ3ivS4RfcbiVHQ-fU840-ag@mail.gmail.com>
Message-ID: <CAK8P3a1W9oHfx47-_d1ytHN+ZJAQ3ivS4RfcbiVHQ-fU840-ag@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:DG34hy8zdr3p9HXrAQ1JurI9ykMzHwekoV0bYrV+x4mTFGhjPlg
 ucwtS+9nDWFU+JtM93T4Na0oI1hqT5MNKgNfyjpAwgECSoCWzK7KSSvngOGpDVJBz7xwkQV
 CPif/OFpS3/XRv3j2igGRUEfDimjS6Obg7d6ln2ckmvuTR4HGtEyLcOarjCYSnxtQJYPMiD
 igNWh8K9sSOuFzMK5en3A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SiPc7Kajfvo=:ViOQA2JB/kUq1JisYARYHV
 VIqf57Zt6I1M70ORshIPB+6mpVliDmNpgjz24ZobwU28xvBXCQgarxvmJ3jKL1c2rkT+queXA
 ybxYUyqnwnBFnx/WIodQrGvZ30kVWIy8CBfF2YzuGBj3zud5D1K6D52R6XEwYSR6BWri4mLz1
 xwFgfx171qLx5QpyfBJvhF6BQGqe3uR+W52RbnfjSTd3Q1fDKPSIh1ODhIj61PEMoiYBP/rq7
 FaHmBj7GX4PQXN8UlWpsxcqsP5KiRLD9meqrX82cJBfc24ra4bP6HSCrNCZV1XAsYINEPo0tL
 KYeYMZRZMnaKKRGlMTR53UGiJaHNVanYUocdU7vdxAIjfGZQZa3Qz/UL1fCpfB4pjjdiSER8Y
 dOsGbuZkfL2uYP5f/pOsiD0xgOZ1JI65FU5vkNdd9MRX3u6Iy5nvYMRWAl2y0olMlLh1ntTrr
 eTpGABtQeqKX6Je5f0UwgEzUa29oHe4=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Apr 6, 2021 at 12:11 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> On Tue, 6 Apr 2021 08:11:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Commit
> >
> >   3b493ac0ac04 ("arm64: dts: allwinner: h6: Switch to macros for RSB clock/reset indices")
> >
> > is missing a Signed-off-by from its committer.
>
> Sorry, that commit is in the arm-soc-fixes tree.

Thanks for the report, I've temporarily removed the sunx-fixes branch merge
from the arm/fixes branch and will send the pull request without it.

Maxime, can you fix it up and resend the pull request?
Feel free to add any other fixes that have come up since then.

       Arnd
