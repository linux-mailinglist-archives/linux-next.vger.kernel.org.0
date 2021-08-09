Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFD23E4D84
	for <lists+linux-next@lfdr.de>; Mon,  9 Aug 2021 22:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235860AbhHIUBC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 16:01:02 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:60987 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235711AbhHIUBA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Aug 2021 16:01:00 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MK5BG-1mYhNQ0sYw-00LUjk; Mon, 09 Aug 2021 22:00:38 +0200
Received: by mail-wr1-f50.google.com with SMTP id l18so22979084wrv.5;
        Mon, 09 Aug 2021 13:00:38 -0700 (PDT)
X-Gm-Message-State: AOAM532yQEQ7zTZHMOqqzi9iYYjUs1d5dUTlWDVdDFcRQRGJuaryOE3e
        ysOfnckPFXOdiAFxY5ll7+Nj4jVP+2MmyJJ+5QQ=
X-Google-Smtp-Source: ABdhPJzG1N9X/Uwy3j+iBGS3iRb/eiL2BHojTGh4oSrLEPpE7BprPj8KwqghyrtYEy2GB75OxWsQTcxi1NYn9kO/bzo=
X-Received: by 2002:adf:fd90:: with SMTP id d16mr28139547wrr.105.1628539237866;
 Mon, 09 Aug 2021 13:00:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210802233339.25285-1-broonie@kernel.org> <CAA=Fs0k95E3FN-9rwzSQcK4JmejHDKBbvk-yhRynJBTbqBNVxQ@mail.gmail.com>
 <CAK8P3a0HWO1tPwCkhasRE1iXt+-rC72nAzsUuO6jb4XasGAAPg@mail.gmail.com>
 <20210809175502.226ce4cd@elm.ozlabs.ibm.com> <CAA=Fs0nF31NdEoPLM-a2RCupQPtHgHMzxejK67UuLh0wu32EVA@mail.gmail.com>
In-Reply-To: <CAA=Fs0nF31NdEoPLM-a2RCupQPtHgHMzxejK67UuLh0wu32EVA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 9 Aug 2021 22:00:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0WRMNmBmBDerZ0nWPdFZKALnxrj-uUFBkTP-MOtv48vg@mail.gmail.com>
Message-ID: <CAK8P3a0WRMNmBmBDerZ0nWPdFZKALnxrj-uUFBkTP-MOtv48vg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the staging tree with the net-next tree
To:     Phillip Potter <phil@philpotter.co.uk>
Cc:     Stephen Rothwell <sfr@rothwell.id.au>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Greg KH <greg@kroah.com>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:RuuCxoh0DOl8RohN6Tv8yHNICMOg6CdbWaVIyyWYa7UwlF8StKi
 1Lv+J6Baa1vVMwpjt06ZJAT9N3q6lNAzDJIeFvlW2yt33dmRAa0fl2vfKTHq2I5NjRbLJtX
 6v+w6v57WqNv7tti3GEO7GEpBktjrNxSNg89TgMLpcyHwRWw/ZOZYibDruFC3+xneQwi+hN
 SJUkGIFv8QwoKihs2yHSA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bhil7uJnU8s=:FnFuZ27OAZ7BGpmoDMUYzV
 8Q+mK6VmYjvpTJWQajTpYaH8xSVICn/+77DxvgBLIlbVo40J9XCz4aWIeW5TKozxzBEzlHfVP
 rtIo9lP3G+Py0oqvyvO1ajRkAsrhLc7f9W6qywNV8QswsgEdeyadZkaeRjdEvIpn8iORSODU4
 lL9sO3qyWoRUkqiLURkw09S50Osx+6PrvRuDSHmlHEBkiyFsw1Y18ohmMWRQh9z2rOPjDIZJ5
 OtSN010+aBSQYBolMGaknxvzwMF14n0r174dq2+v+LNxjcBSKoM9eFrTtn6OZlePTP5rxvp4Z
 KEAJKJUDKXVay6O8Q/7UJAfR6jVs9ljAdl0uxqbzZDncU5xWMpHjbTpaexxxCumldvqKnp5D7
 p9FQvt9H4jepbXtXIvV85+GrMArbtAZQDq+zXGqt9hoXaOZ4KQURtA8ZQUdor25POw8bjuzBY
 nOKQXzKmmjsbPfus4Z2ho/giHhV1+9tl7snpUEadTv0pnpbZstzFi1AuYoUesN2e7Za1dif2Z
 8T/d7R5oklUhHCjJJmF+Hj6TD3sF0UU+sh0MhlPj9HRAqSlN1MD+wbrW3R/XtuPFOkMrtBe4i
 5MVyQm2lZ2Jqgy9ooaaOl6iIAHGs98SRGqed0RH+1ZbrbzfUXeAGb03CMDfs4q1XzEDtSXRg3
 fuQttmDinzPRYDdqrCyYSjql4qK9dEGV5q8vI+Yjy3fq37/oyOFR/vmolOIjXIytXJWhAHvzl
 cG2mUmrEjXSsT0V/cxuLEAEJ9Rrw+ZPw2bSQBpq4VnhC9aZwHlBjVVPz4C9DMGD6bgXYiuIGw
 YJ3ZYs6+46wTaQ1kibYuJb+K5Gdt2mbcMgJzvwrUJBeG+Z3OiuTf+FVnphTGp/g4qfTkwmQ
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 9, 2021 at 2:48 PM Phillip Potter <phil@philpotter.co.uk> wrote:
> On Mon, 9 Aug 2021 at 08:55, Stephen Rothwell <sfr@rothwell.id.au> wrote:
> > On Tue, 3 Aug 2021 11:23:29 +0200 Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > So, can that be done in the staging tree as it is, or does Greg need to
> > merge (part of) the net-next tree?  Or will someone just supply me with
> > a reasonable merge resolution patch?  Or does Greg reset the staging
> > tree to 5c872e1d2595 and try again next time?  Or similar for Dave
> > (revert Arnd's work)?
> >
> > Currently it is a mess in linux-next and probably will not work even
> > though it does build.
> >
>
> Happy to try and provide a merge resolution patch if that is easier?
> Will be this evening UK time though.

Most likely there is no user space that actually wants this function at all,
so I think the easiest way would be to remove all of rtw_ioctl in the
staging tree version of this driver.

        Arnd
