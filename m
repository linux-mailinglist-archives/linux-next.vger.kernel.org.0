Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F1573FB1BE
	for <lists+linux-next@lfdr.de>; Mon, 30 Aug 2021 09:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233533AbhH3HRL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Aug 2021 03:17:11 -0400
Received: from mout.gmx.net ([212.227.15.19]:44145 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232321AbhH3HRH (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Aug 2021 03:17:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630307765;
        bh=bpFSBAWY49Ucun86Z2NPDOFfr4ral54Ta4KMR7IzGgo=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=fA+ojfVEF4Lei9VPOTsbVN596jE2/hid3Qx4zw3STmsF3VfeypuFwFTQYlH0I0pXP
         ATojS97zK3Zec42Fl4/awZOkTc+t57MtmSAQ2HODszR7yXDjZVTUiOiVAm9OxNDFTz
         s/SJcV+hN+su8IS7xSnPdKWGjxwR9zep5sYn+k4o=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.146.54]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MORAa-1mdwgl36p4-00PxoB; Mon, 30
 Aug 2021 09:16:05 +0200
Subject: Re: linux-next: manual merge of the tty tree with the parisc-hd tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>, Greg KH <greg@kroah.com>,
        Parisc List <linux-parisc@vger.kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Jiri Slaby <jslaby@suse.cz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20210830154605.2abe717e@canb.auug.org.au>
From:   Helge Deller <deller@gmx.de>
Message-ID: <17384403-c428-70a9-4930-390869a45405@gmx.de>
Date:   Mon, 30 Aug 2021 09:14:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830154605.2abe717e@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UbMZo7fA0HW3ds2Otwjkz8azxmPQC5Yt65n7vYLUezJr+YW3qrn
 uZ913YbnJyGIhlla3IC3dz2ylXXwi6aIA8f7u/ihRXIeAy9o1TG3tUxoVY97/2L33a4x7HG
 2tQRGPYXi04fDiOrPBhgylKlAX1bfrndajUER8IUHBTsnmRRq/f80BXabJwlNBeXt5OVBbb
 5WQXjxeEieqUwVhoZnCmA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gp5Rp5DeFi8=:Bgely+eeDkiIrYacUran9r
 VcsJfavcsSqMvi7dJz1NGtgClIRJD/eRPRSKt74lWwkHWjvNGdCyq1cVIrxgNhsyPQzV1MaMY
 HFErEefjdaJBlwq5RdrndBkleD5PQB4zFgtdEgCg8rHHMOkBl0ZXWpNgyIxMPR9UirSh0tR47
 1ZIDt91bNG9kFLa8OjKTr4LHiohefQ5tq4ugTV2wK4z3V5K388lBbyTarNZxdMrM9vUTYIkRu
 GQKf9Id5Ixgg21qUthkezQih6V5h4/TQ9R8JKcpNayi3zHZN3vyb05ZlnKMzVoetnbKvthbAR
 IObhixhpM4AdPUtbsl2yCsTrcLW5XD7V2AcbM6EFue+AhZcHDU7hx5++AVq/HRcnB8sDmvnmu
 ydfa43UzHQs8mS+dJDxA2TzDjAK+SrFe2VDW4XoQ/6Ig9wicArC2Fw22eD4CptzCQs3D8Sixv
 Nvw8SgkIB7T6s4di50EM9KjfHvQVsgtgURMBUQRgsgk6qOFiYQCUrWgrvCuK6aKL3fkYVudZt
 aQ9uh32COa9foFZlTdf10cOcr0MjOIBenA280/m/UWnx3nqD/9W5LRz5OZeaU2PKZNyb7IUey
 J98D2ZLCS4le+StnYwKt7WKhPdHLykj2RWZulKAcDy8akMk8oZYsBpZwLMAi0aFAD6bilnVow
 WWTduu3hQ7jXc86yqpd+L9N2i49ACTDHiAWMHa4ZHIGYR1Y1OdvkCrVPNaw5kaHp/W+2HCz/2
 0rgPfHb6K/RpTjgq8COEZ8fh2MAO5hVftVlqEXR8+H05kpmP9r+Haj5EYqxf8Hzt8Z1Qf4Esy
 N1fkGv/ggj8emnA0LyzXLPjC1vEiKM9s6FQCQWwH14iymnGUEODYqs/KXXAPcEmt9xNw1TmaA
 BZBmRgkoMo8owufIcZLeUF1kQkJEwAH+08vdVU/oKwoCSzyDbSgwbmOvu/HKpThOBkcwz4Krb
 95hs8IihTFBMIEo6LiWGAERVQoxHZLJ2eMWKRxvPm2K3q0eGJr+joTxijBBdtJ8+PlWf6kCLr
 4QV1EHaCD+xlDS2Umh82gYXnKnsNupgr8z7UD070TmghxweYSi+KZDHBKT3D5dEPgOw8IlDzH
 adKF464exO37Aesj4oTxzx/ft1DoLxmJc9w
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/30/21 7:46 AM, Stephen Rothwell wrote:
> Today's linux-next merge of the tty tree got a conflict in:
>
>    arch/parisc/kernel/pdc_cons.c
>
> between commit:
>
>    9613b0cb3eb4 ("tty: pdc_cons, free tty_driver upon failure")
>
> from the parisc-hd tree and commits:
>
>    0524513afe45 ("tty: don't store semi-state into tty drivers")
>    72fdb403008c ("tty: pdc_cons, free tty_driver upon failure")
>
> from the tty tree.
>
> I fixed it up (I just used the latter version) ...

The latter version triggers build errors.
Jiri's patch needs fixing. Instead of:
+               tty_driver_kref_put(driver);
it needs to be:
+               tty_driver_kref_put(pdc_console_tty_driver);

Jiri, maybe you can fix it in your tree?
I'm happy to drop the patch from my tree.

Helge
