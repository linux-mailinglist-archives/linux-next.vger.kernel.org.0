Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E1CB1094DF
	for <lists+linux-next@lfdr.de>; Mon, 25 Nov 2019 21:59:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbfKYU7v (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Nov 2019 15:59:51 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:53723 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfKYU7v (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Nov 2019 15:59:51 -0500
Received: from mail-qk1-f174.google.com ([209.85.222.174]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MRC7g-1iCCPJ2jye-00N6M9; Mon, 25 Nov 2019 21:59:49 +0100
Received: by mail-qk1-f174.google.com with SMTP id m16so14121761qki.11;
        Mon, 25 Nov 2019 12:59:49 -0800 (PST)
X-Gm-Message-State: APjAAAXTabbiu5j6YUwuHWv9hL4NSR9fYkY88rWV5HWlgPMekbGFcsra
        rO8Bsz+orVnczHt7NXRZNMEygLdLOdmjLi/D6hs=
X-Google-Smtp-Source: APXvYqxmZOcefA2LlmFbC6aXXulIYnIOG4RBlr+X6STgUWPPjM6lGpUeZNAgwn5IesLBKeX9aT4LydQt3R04sYxTlko=
X-Received: by 2002:a37:a757:: with SMTP id q84mr17995885qke.394.1574715588474;
 Mon, 25 Nov 2019 12:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20191126073742.4422e60d@canb.auug.org.au>
In-Reply-To: <20191126073742.4422e60d@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 25 Nov 2019 21:59:32 +0100
X-Gmail-Original-Message-ID: <CAK8P3a28LzrYyxbY7q1FzrwEZn_JQOpYTd9P3ZDJNOWh7jYnpw@mail.gmail.com>
Message-ID: <CAK8P3a28LzrYyxbY7q1FzrwEZn_JQOpYTd9P3ZDJNOWh7jYnpw@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the y2038 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Zsda7Ttl4PIB2Y7ZEgQlHcCaCBaOSjLLm6OxhhwvRbqsSk/tKjq
 1MAu6dFYwXUGewQnSxOzQX8C+G/CKQW4QuD5d/+v7tkbMAdBgKtkqCF7d1iyECqMfqTqUb1
 EASpws5KamLd10xyZt4WPibepgH8amr1Fyhabio+lVdK72u4nmHz2zfMalJnRY3GWOLn6eE
 CYgvxpV4rl9hh2UR47tWw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:s29ATZM6Ijg=:7Iv2omIUYWZW8JrbroGGoh
 LS8rN/YPu9PI8g6DpF62uuV3cH+aH7kRyuqe5AIUvyOSi0ePFT1NfSD9RQ/ldHdYJV8KU1xwE
 nB3GgDX3RPJQK5nVySMBTp2d1258OSf13YxEgJLGhV87nfB3/uAWgc6dt8+y3XKSY7iPwFmK7
 8/JReG17ZLbLOeN5zOyPKt/GHsjOXqIOEFQXijx+tZESbXdr4f1/1kJE26MtEv+/QfqE6pumq
 mwX/rrkMA8/W5vOI0VWn/tnu3s0qEJ/VEFUFvbrAA/S11JDe4hBUOBxD1Cgs3GLmxkY3OKbO9
 489hhwIr9Red8NTLZnnRCw7buAkoBV0+GepdyOrdvC9yM2e5ZJs77jwZG9SoLikvfN0IKQMLU
 2ZjD4mSqbO68PSN/C0xOauKwpIVIJSRtsjtFrEPymRl+7beVReqJRjwXuetuo8piJ0zj58/RH
 xN0FP/GFEAnsS+d63WmGc5hzU8pfNNq0NXYO1oR2rKGsRZiLgg2chYrUgQYw2mT3sErrXixGt
 7FNfM4k4tpFRQxKh/pCTb6lffzbiNq9jtad8mhqz+Xf1Ncl1uPlmpYjWym3dJmyYso7WseXct
 uwXn0BjtBQkd1N7jXGbesYgziP3xoVWALSX/UhcEP9ChM88vErlZHb/gJ2k6pVmDC3S5751so
 O8iJA7AosKz9CWT6o/6S5qrdS6NwTI9ESrV5C3t39xwpEq8S3Fp5ZPRv4W9Jr75aCrC/1GtOZ
 VRugbd8dUPVPFBgGeoz0FgEQ25nbPbSLmBgV3hnyyjLr3uu2j1/ETv3sEKtVgp68bM6htSpre
 nde+2mhOJKjY/x82r6W8Dxc6o3P+/4ilvhhB5Fh2ZPGLWqKlOfBpdIH+RWT8AQz9VnDFkOUL1
 Zjk+sekrDdIZ2yQcHymQ==
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 25, 2019 at 9:37 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   9dbda081bcd8 ("y2038: alarm: fix half-second cut-off")
>
> Fixes tag
>
>   Fixes: 3f58eae704d7 ("y2038: itimer: change implementation to timespec64")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Did you mean
>
> Fixes: bd40a175769d ("y2038: itimer: change implementation to timespec64")
>

Fixed, thanks for the report!

       Arnd
