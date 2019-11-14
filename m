Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 153D6FC5EA
	for <lists+linux-next@lfdr.de>; Thu, 14 Nov 2019 13:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfKNMKa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Nov 2019 07:10:30 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:43553 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726106AbfKNMKa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Nov 2019 07:10:30 -0500
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M7KG2-1iWLTk3ZqG-007jRg; Thu, 14 Nov 2019 13:10:29 +0100
Received: by mail-qk1-f169.google.com with SMTP id 205so4750486qkk.1;
        Thu, 14 Nov 2019 04:10:28 -0800 (PST)
X-Gm-Message-State: APjAAAWzD3T/H4O6OAmEIVTVzS1KUglGojFWpePLt7wIvxHJB0gXvzF4
        /ziJ6KBRpJVSVu54DkW2QdmsVbvoBkT4cX53Z6o=
X-Google-Smtp-Source: APXvYqwH3ImYA6idvrUy4s0YnVGkfNSxydHJRkPK4OjgDVN/gCLA9akkaakLFb4EwY/uC0H7RI8F34p6AfRs3f0kaQA=
X-Received: by 2002:a37:4f0a:: with SMTP id d10mr7182492qkb.286.1573733427609;
 Thu, 14 Nov 2019 04:10:27 -0800 (PST)
MIME-Version: 1.0
References: <20191114153810.55d937af@canb.auug.org.au>
In-Reply-To: <20191114153810.55d937af@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 14 Nov 2019 13:10:10 +0100
X-Gmail-Original-Message-ID: <CAK8P3a19MuYrrk_TZq5Jz-4AH0U5NYX1=WZZHcdyD+G+Rz8n2A@mail.gmail.com>
Message-ID: <CAK8P3a19MuYrrk_TZq5Jz-4AH0U5NYX1=WZZHcdyD+G+Rz8n2A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the y2038 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:f6q/srZqJ+R4axATfWdpSRS5KTmcTI8IclwszzAvjY8sxX8zOfL
 mpvhiVkzqcJUL/oZs0wikoxEfKVFoQ5XXRH7z2K8+IxVc9BEgMYOtcoO3X1LbF1s1q/ioqZ
 Kv8dqNFoWgNK/Io7bv7EQPuWr6rhmdYC/raEqDvBGOPDgU/mQ83HeZCHuJrYAmF55UW8zkr
 hxxKF9Spy/L80iKxxyGXA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+UifpYRhZek=:7mMsloH2NHEb8vpwx+yugo
 FetTM4kmTHRGJtejuJO8+2G8My2eNHLlWrekJXMlQAdkr4o3hrWF6xyyS7ikvXJubNXPncmuf
 nEzYWjbe6qv73KZK9YFo295kvPumFx7X4v82IBv+yi60MaHIDWko+px7SEcWgsFa1EH1ZenQY
 o6UJxrfLusiz3jLkbeslY2KEqrT2APxKzjqjfPHw+Au37rOkBxhh0JdaaYVYnwNm+tygbz76c
 1OZCqXlGrbSfWRhxlievgS1oCJ5Jgmv3jgx5+qXfSf8CKnPVqW+YxfU0qEec7LmcpXulKV3i4
 aOtqHz3LmMExVylJ51Oupq4BWTUywnYotvkPR6XIH0BuU3k9ZkxbBHZkAKA5cVXyaIwUKNTu1
 lq2oWgTce6F8ifig3dfXB1aYC2jPZErKc4THexOdCresBk3d+gQ+6w/rFDLgiHXcgc30j3GNf
 GHWN2PbsM+0jfxxE7wG1j2Enr9iONNOM7WPEsFAmParFwmYwyPqEyrtE7sETXqdkJfwZqxmE5
 gT7W3ov8mZ+fUM591Dr7/skkvRYsKOASgyCWeJs7excIvE5BJ/BP5Nlbkw53XRqSwYsGZ7oYo
 zgoP+GKnq7pUuV5UJ+IXmRZiNSbAN00aUt3gtcIad7gCgANVLwsxM6q+z+gTeuTL4kQti9nNX
 sDX0jcS0O6XXNweF1ryIY+NUs+m/ChFg5EzE7XaStKMqfClZoFftOHiatGSipDXHb+hBdW9ic
 Cdg1LewXkwA0/90/Gq38v/c0HwgcYAgtENoXjEOsmBQCByrki1nIcT0jyxppnuRtHxx9RT/q+
 iQGd9GaF+otKOyfDqBChrcGednPcmqk4HW1SubWW1Ixzp0wCU3Wayld+elI3T20fPsNV2rwSo
 CnponLfLY4FoSWsI0mKg==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 14, 2019 at 5:38 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the y2038 tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> arch/powerpc/kernel/time.c: In function 'update_vsyscall':
> arch/powerpc/kernel/time.c:960:33: error: 'struct timespec64' has no member named 'sec'
>   960 |  vdso_data->stamp_xtime_sec = xt.sec;
>       |                                 ^
> arch/powerpc/kernel/time.c:961:34: error: 'struct timespec64' has no member named 'nsec'
>   961 |  vdso_data->stamp_xtime_nsec = xt.nsec;
>       |                                  ^
>
> Caused by commit
>
>   009a81339beb ("y2038: vdso: powerpc: avoid timespec references")
>
> I have added the following patch for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Thu, 14 Nov 2019 15:28:13 +1100
> Subject: [PATCH] fix up for "y2038: vdso: powerpc: avoid timespec references"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Folded into my patch, thanks!

> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index ee9ba3a48c76..2d13cea13954 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -957,8 +957,8 @@ void update_vsyscall(struct timekeeper *tk)
>         vdso_data->tb_to_xs = new_tb_to_xs;
>         vdso_data->wtom_clock_sec = tk->wall_to_monotonic.tv_sec;
>         vdso_data->wtom_clock_nsec = tk->wall_to_monotonic.tv_nsec;
> -       vdso_data->stamp_xtime_sec = xt.sec;
> -       vdso_data->stamp_xtime_nsec = xt.nsec;
> +       vdso_data->stamp_xtime_sec = xt.tv_sec;
> +       vdso_data->stamp_xtime_nsec = xt.tv_nsec;
>         vdso_data->stamp_sec_fraction = frac_sec;
>         smp_wmb();
>         ++(vdso_data->tb_update_count);

I was sure I had at least build-tested this, but looking at 'git reflog -p',
I only see the same broken version that never worked, so I clearly did not.

     Arnd
