Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A23425545
	for <lists+linux-next@lfdr.de>; Thu,  7 Oct 2021 16:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241664AbhJGOYb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 7 Oct 2021 10:24:31 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:55155 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241622AbhJGOYa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 7 Oct 2021 10:24:30 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MfHQp-1n0QFs2hb9-00glOw; Thu, 07 Oct 2021 16:22:35 +0200
Received: by mail-wr1-f41.google.com with SMTP id i12so7051367wrb.7;
        Thu, 07 Oct 2021 07:22:35 -0700 (PDT)
X-Gm-Message-State: AOAM532HJq1qfZq/HjuzVos0QZQ6IlcH8RvU+ovrPeEss8FTydMnn9aT
        n4F2iGtZVTqMJ12M1InCyZfqIPydn09oJjuo1r0=
X-Google-Smtp-Source: ABdhPJy3Lon0IU3ks/b058uaiy0ad95pOq5B1PqBU743qiE81z3/tuCXenWevOClGigtya7fNnV9ePq5QABgExd78xU=
X-Received: by 2002:adf:a3da:: with SMTP id m26mr5673108wrb.336.1633616555268;
 Thu, 07 Oct 2021 07:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210928153508.101208f8@canb.auug.org.au> <20211006140451.2dcea4ea@canb.auug.org.au>
In-Reply-To: <20211006140451.2dcea4ea@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 7 Oct 2021 16:22:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0QuZpmOikbiCxqn1VUXk-ZJwoGm6uMvfiWdp2sWYHfFg@mail.gmail.com>
Message-ID: <CAK8P3a0QuZpmOikbiCxqn1VUXk-ZJwoGm6uMvfiWdp2sWYHfFg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:EKzOAQTmevDYMSd2sY/siJF0nEYzUmxrxRPmRxY2O6vmid3sN72
 w37Ocyk+ZUgDODb8/sgMKJH6Zgurdci100vqdqsyb/ZImOIQ07RO6RlYojH8TcujSe7qiPp
 8REnW+BQL2xSDAETrxE+CKA/pmwPT4sQvjxai1eX2YETemLbv3u+rdBUheWTSAiQPf14phz
 MLDP3ZtLWvCEhD8zqg7Nw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GkWhAj1Gzoo=:chj4qdklkT6qaWpmLCCVcC
 qbyrXmwoqiXLSdoJy7Eh9Ollu8GHjxzfDw74mBPeZ6Q8JK2GiARJVsHZthBZgnUD204k6bKfI
 /BmOr56kwTm6l0Uq4Smd6qNhxkGTF5B2WKtsdCQkFjxcPAhjSxCf5pfmGXInzOQogaHo1vt7J
 DCL1jQ39vSsivVVx1OL8JSt7d+1QJeKe0GgLbIsAXft0A2DQ9TeriRxSjIuJ9g0ad17cNKUtb
 /HyRyQ5xsBBIctjZlpO6APkVqLZQHEPBvvHPiJWGBieg5UJQnGM66OK8Ipr6ivDksL06Iv78t
 +R5vBIcQO8q6PCrP+mAbSzoKK0GwH5LNOdS32tAO9TFAufJNL9lNOKlGSIj3fdyY7Ef/252+T
 78YM6aNpN3ujXQmKqkDGv5aEzkcID/yhxZGoB0ORvpCj+n8tOtUeTVWTL1jcaCN6xl6GS5NY3
 +QSqg8mZqQRY/U32Cn5i2whrMV6rckO8t1R6Z4Fd3CPnyPUqZizFvB/X3Lb81hRaxTGW3+zOA
 yWU4evkdpejeciAasPq0rcBK0hUVJRYi9RomgQmOuedP36/n4XosTYvN05LwVIqt7OVKMlNId
 gDSCcbphXOvNOLgq2dCXdj0eWdxZIoLI/6RccJzllKcK+pcudJ/VqQypkbZCpz0mgqZ2PDe8L
 a7JNARo8OJgf68LB19taHxKvybMMI3ERsp+GJO18D3oQIVQNlQRAGy1ap6q71bBbTFhwZfYGJ
 kX1893wdieyUqhGsOWEF6nlF89QrEx94OwsrBQ==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Oct 6, 2021 at 5:04 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> >
> >   f6bc909e7673 ("firmware: cs_dsp: add driver to support firmware loading on Cirrus Logic DSPs")
> >
> > I have reverted that commit for today.
>
> Any progress on this?  I am still reverting the above commit.
>

I have added my two patches for Kconfig to the asm-generic tree now, planning to
send that as bugfixes for the next -rc.

       Arnd
