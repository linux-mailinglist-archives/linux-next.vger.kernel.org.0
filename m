Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104421DE193
	for <lists+linux-next@lfdr.de>; Fri, 22 May 2020 10:10:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728468AbgEVIKR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 May 2020 04:10:17 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:58579 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728152AbgEVIKR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 22 May 2020 04:10:17 -0400
Received: from mail-qv1-f54.google.com ([209.85.219.54]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MTiLj-1jUAVW0KPF-00U2kz; Fri, 22 May 2020 10:10:15 +0200
Received: by mail-qv1-f54.google.com with SMTP id v15so4341049qvr.8;
        Fri, 22 May 2020 01:10:14 -0700 (PDT)
X-Gm-Message-State: AOAM532g2V8P+O9KB6SfaKuDAYwk+PdD1FKazJlLI8gMf7wbn62h19pD
        Jcv4Vqb7V9GyXoY9jkOiUe6R9BL3DxqccMTME0s=
X-Google-Smtp-Source: ABdhPJxoz0VBY0P9VSs5lNsQ3oTYwi3r5Iu1g8xwCJPQrJXyNwWk1Nipm7AlAFVx6Sc0ECmHPTYYnfW2UzAGL8m69xI=
X-Received: by 2002:a05:6214:3f0:: with SMTP id cf16mr2678071qvb.4.1590135013931;
 Fri, 22 May 2020 01:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200522082433.4f536de1@canb.auug.org.au> <CAK7LNATU18vKsSV_pugSRw4e3bQBUAQ670ac34GbO2YNHXgLPw@mail.gmail.com>
In-Reply-To: <CAK7LNATU18vKsSV_pugSRw4e3bQBUAQ670ac34GbO2YNHXgLPw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 22 May 2020 10:09:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2LbuhGVJ2jv3YvZhbTjuBoR3F_1ejVEdWwapHsb9YBvQ@mail.gmail.com>
Message-ID: <CAK8P3a2LbuhGVJ2jv3YvZhbTjuBoR3F_1ejVEdWwapHsb9YBvQ@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:HkmkdglTF1Sh0OYVQ9Fr5+RT5e+Ke51gXUQcdgIjBA6abqGi5Ej
 46ocH4RXw7W5ZUcihPhky2lLj1R5LaMXJHm6TOpUFwGjro+2wxRPtoMwa9C6M1MOQTrogde
 kTEUTh/GxKWRDfSArQFK/hEeBZfSl6gliatjakBiVR/xgsFTFFqrpFr4MJaIR/xAH6pNLpN
 vJQtXBhRIrc69EAanFtwg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:15hVWtxlQv4=:arXeV0rfxmystZzVxn9xFr
 QkWDOHE/98NnPTW/sMyivHREKytQolcSE7lOrZ5qGV3PiBVFv5Ucl8cg2AuAWUaw2VC52w7aA
 fKv3b0QltGioVNco/omnCU6JwbAYEtEmdEJ1f4G1hYW7pFsagKO+5hg7mW8leo7rNTHuCe0Bm
 YBpY2+E7HzCxnR42sr6/Mh2srcxMEHM8Z0m2+ddm935DcUboY8qHJ2XPYKMwpS3p3axq9zbyu
 YwY/r+VzY1XBh/4zhy48ozQ9PdINAu43PX7rGElZsz6FrWSaXe7GTn+GnDNUeUKwiUU/GB67f
 kruwHnpE0xGXliTJVv3AS3EduobfgcHGBw/AXJoY5RCDkStXYff1BwN1pgUYK9Bks+KLQqC6k
 TlwNgQlL5vNJERBo3L7/5EMEzxHZSNhrZ9Cv9XchFcET1X5RReJsk19jK1JNjpdW+sSt3D9WS
 Kfb4aj7dIdK5xWaOq9CT18laQDMNg3UzvFTAUoLuX6PxSFPJ5w8GiphjTLHI5blyVNL8FZrno
 eLGBfGuOm3mSo3liwPhWFs99/1vz4TlvJwNlCuGwayQGMHL6HJH/VgImDqxTcvIXYqHtjO1Hq
 ZKpkt6kC8pD3K5uH755JWpRTfOhv2AAIZBUrzbOOCrT7rqeD08aWpAzUMx89HBcrnat10mQBC
 Esk2x5DMEWy6ysh1GWkt4dskxwRUVubc6elLJPhXqYYisZ0LeK/IH67pIo45Rt36T5aV0LZ1R
 3yHpipJiWHY6M2v7pypJp5d9lEdLuOduWCFdz6cnt9vsACULARpp81BHL0JTX8A4yT2mQHMeb
 iUhW5QnpdHFGJXT7kVdFYp16mMmnYTfmpBzfzDOXXrZjg7ge3U=
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 22, 2020 at 3:28 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Fri, May 22, 2020 at 7:24 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Commit
> >
> >   82ab9b6705bd ("dt-bindings: arm: Add Akebi96 board support")
> >
> > is missing a Signed-off-by from its committer.
>
>
> Sorry, I missed to add it.
>
> Olof, Arnd,
> If you want me to resend the pull-request,
> please let me know.
> (but, probably it is too late, I guess...)

Yes, I think it's too late, I did a lot of merges yesterday and would
rather not rebase them.

       Arnd
