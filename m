Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C073DE9A6
	for <lists+linux-next@lfdr.de>; Tue,  3 Aug 2021 11:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235012AbhHCJX7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Aug 2021 05:23:59 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:38277 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234833AbhHCJX6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Aug 2021 05:23:58 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MMoKq-1mTcWM1L88-00Ihmg; Tue, 03 Aug 2021 11:23:46 +0200
Received: by mail-wr1-f47.google.com with SMTP id b11so19224488wrx.6;
        Tue, 03 Aug 2021 02:23:46 -0700 (PDT)
X-Gm-Message-State: AOAM530Zg/zPSyNarWsERgOSZlDUbtpSeMnJgvC6SJr6VVtN3pQTQCd2
        /y1AQycLUT2tN7+1i3qfM5Gnuw5XN16HYx7AjSg=
X-Google-Smtp-Source: ABdhPJx2T95w7FUlTHjCk3O4PxfI9q9E5Hmvdla2RsV5aDOkJVgc4IYEMYQOoPe1DqVGQyB7XWepQGFBaL7VmLdTYfw=
X-Received: by 2002:a5d:44c7:: with SMTP id z7mr22606289wrr.286.1627982625965;
 Tue, 03 Aug 2021 02:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210802233339.25285-1-broonie@kernel.org> <CAA=Fs0k95E3FN-9rwzSQcK4JmejHDKBbvk-yhRynJBTbqBNVxQ@mail.gmail.com>
In-Reply-To: <CAA=Fs0k95E3FN-9rwzSQcK4JmejHDKBbvk-yhRynJBTbqBNVxQ@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 3 Aug 2021 11:23:29 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0HWO1tPwCkhasRE1iXt+-rC72nAzsUuO6jb4XasGAAPg@mail.gmail.com>
Message-ID: <CAK8P3a0HWO1tPwCkhasRE1iXt+-rC72nAzsUuO6jb4XasGAAPg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the staging tree with the net-next tree
To:     Phillip Potter <phil@philpotter.co.uk>
Cc:     Mark Brown <broonie@kernel.org>, Greg KH <greg@kroah.com>,
        "David S . Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:lgVpM/ruziTpQnjryryFpX5etwoBIgzl2LGASOqLPvetijrOzx1
 DMN70pAXuuRbSpZZgIkS69lgjYf/L72mF+FTAOJJD7DqA6LnRL0foYGixWsnGLk2kDCTxxT
 xRawIraaFF90lh0EGXP2ksbvb98rFcnVBtprIury0M0mKrHEbueRDY9pueArhbMAJKW8zp3
 AibHyQbk+iMsug4HtQVlw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:cikjpRYLtGI=:UiXlzBgDzydJzJ4HuAutFt
 NL+5lb05VwEV95WgfU6QAYHIY9G+2wJ28vfu/jFVSAQRwUntvFCU3AOgRhJQB9wHUcujShKz0
 aFOmyTxiKmmLaHfbQz8dmV+S2KfYneMTJaU6u+kMk6fA53hRP36ziBZHxx7BFGYQRGE/tzl5r
 QMnZDLOXhrZWwxRRhk+8RmV78roRZE3KZGj6LAPgK90qJ7Ti+IUujXsB/KmimEPDsUXbVjqL5
 822JrhwLPIZ2pv03nnmXDYCZMXU2EVs9anWwJqYDPjRHDrzac8eXD9I7OK3U0gXsVCXP9mjOz
 IsPxpONr0QCjoE+lKezQ6z/YU0IFnaD65hpcwNZFcp+yz9Tm9rqih8Nfq0WPtkULEAVd8ZBmQ
 Ti504P0DyotsIcyI+5KEgW5iZyV+pZI+vjIchqb75hg8LodAze17iHC0yIZCnGoOocFpDmuEj
 klLnUauLzenljlaEmjKGOsz2tOfgiYxjBK7aVZ3dX429DouAZ3tALhSuTKoY1APsX9mOPqVEl
 BoCQMSI1Qed3P3eRLJNFGBMNCOLdmCOSfOMnoectDX+iE9Bbd9F3dNUJGFPMm+IPg==
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 3, 2021 at 10:57 AM Phillip Potter <phil@philpotter.co.uk> wrote:
> On Tue, 3 Aug 2021 at 00:33, Mark Brown <broonie@kernel.org> wrote:
>
> Thank you for your e-mail - not sure what is going on here as the
> r8188eu files are totally new - the net-next commit is touching files
> from a different directory (rtl8188eu) so perhaps it is getting
> confused and considering it a rename or similar? Regardless, all
> commits for r8188eu subdirectory should come from staging, as it is a
> different driver.

In net-next, the .ndo_do_ioctl() callback behaves differently, as it no
longer gets called from user space. If you have any
SIOCDEVPRIVATE ioctls in the driver, those need to be
moved over to the new .ndo_siocdevprivate callback, while any
nonstandard ioctl commands outside of that range can just be
removed.

       Arnd
