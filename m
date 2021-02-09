Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3525314E58
	for <lists+linux-next@lfdr.de>; Tue,  9 Feb 2021 12:44:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbhBILn2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 9 Feb 2021 06:43:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:49180 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230243AbhBILhA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 Feb 2021 06:37:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7244964E7C;
        Tue,  9 Feb 2021 11:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612870547;
        bh=cxgAuJRm38/lVceJ/ps0Yb69dDCyZKfKKvBlFNDAF/A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IZ1cj4KnjSlwEEladkNVmZeb30f1KQMaWz+3kzY+NiHMnOXemEj4KsX7Yxb5oh6Xy
         BjzafS2f9AxVu9IU5Rd5EpNwfKZkXJhlNWsA+zFZB9N5xCpJwxuRlKGT88L2fv5Yds
         4OHcdCOsz1d9NuCYglJiDyYbJftiu2JGFDZtg0zzWZ410FwVW2SLtl31RKhlWOITbG
         ZQI/Hre+u9VLnVZaTDEqKqKbhhR59PeCKL8Yiq8V8Nf16mzKLdb6V+IGftesZHmjDj
         nSylNcDC6Q+2ibkdoRbxaZEEKgL3345RCIThRWTVDuqINbYqOiNNzr4B8eHcBpC1W0
         EIjEBev/ulZiA==
Received: by mail-ot1-f46.google.com with SMTP id t25so17184384otc.5;
        Tue, 09 Feb 2021 03:35:47 -0800 (PST)
X-Gm-Message-State: AOAM530wiqzIgevIyQvkEzGW9wJcWrH+4bPxPk0BHY8TRYOp7Nw7rIhJ
        eciTNs4zltmesnBdbStaKGoYQUJ7bYuvO69gQ6Q=
X-Google-Smtp-Source: ABdhPJyDKj0Y1Dtdu/MPQyiWZkTlTUQx+JYmtp05L9HUwi5QghIkuV68JOUMJUdTxsnglziqty9H1SeZzl5r4g+yYT0=
X-Received: by 2002:a9d:3403:: with SMTP id v3mr6838001otb.305.1612870546669;
 Tue, 09 Feb 2021 03:35:46 -0800 (PST)
MIME-Version: 1.0
References: <20210128170331.4f2ac87b@canb.auug.org.au> <CAMuHMdWAOXpJGTRM7O7ix4uG-hpH-kDiueN51oA0YEZ0vJdZfw@mail.gmail.com>
In-Reply-To: <CAMuHMdWAOXpJGTRM7O7ix4uG-hpH-kDiueN51oA0YEZ0vJdZfw@mail.gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 9 Feb 2021 12:35:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1Fv=Bei+Zkq43yn_dek=RB96_yXrtJ-ZA5K4nf06joOw@mail.gmail.com>
Message-ID: <CAK8P3a1Fv=Bei+Zkq43yn_dek=RB96_yXrtJ-ZA5K4nf06joOw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the arm-soc tree
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 9, 2021 at 11:01 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Jan 28, 2021 at 7:05 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> > diff --cc arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> > index 37da418393e0,950010a290f0..000000000000
> > --- a/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> > +++ b/arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dts
> > @@@ -42,7 -42,6 +42,11 @@@
> >         clock-names = "apb_pclk";
> >   };
> >
> >  +&wdt {
> >  +      status = "okay";
> >  +      clocks = <&wdt_clk>;
> >  +};
> > ++
> > + &gpio {
> > +       status = "okay";
> > + };
>
> Probably some sort order should be taken into account (gpio before uart0),
> also avoidng the conflict?
>

We normally do this by asking everyone to send the dts changes for
inclusion through the soc tree rather than the subsystem that contains
the driver. Why is this one in the gpio-brgl tree?

       Arnd
