Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11799A36CB
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 14:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727729AbfH3M3d (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Aug 2019 08:29:33 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:46309 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726969AbfH3M3c (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Aug 2019 08:29:32 -0400
Received: by mail-qk1-f194.google.com with SMTP id p13so5884468qkg.13;
        Fri, 30 Aug 2019 05:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UIrlR9vtJ1E/DTegVRZZ9qCNH5Gta5MlLllJAAd5X9M=;
        b=eGi/QaJW3ALjxRox5rpq1XN+XBSET/NXIQY7kzSfYF4jv38pHP9BdDvXVCW6cXcBKG
         PSfKNc5FDFxREDJO/+3q1YulKPfEEPP3UlXGgv4UX8NOxpy2F1Uaz12y1ycGjQQ0KpEv
         scWcLqDcw5sRf/kX5en+iwxiHobmXYGJYmSGEiu7UCF8k36aVblwKilzYk5959YmCbrE
         uESvvVr3dmmp0cHFTUlHbNy/sKKtqUvaI8WKpTea7026uYMptXXtUiX0bbyS6FuWlO1E
         7PtERZPFLgwMKpI98qGetrU2t6IzsFIHX0SZAPIBdjjEXB3ARQXjNNtxOiUTXYcSmyNx
         t/TQ==
X-Gm-Message-State: APjAAAUuXXH2TomwbLjVDmWn0f1MLHBA/z1Te8xgyPgEckjx9e+aPexh
        3zeuhKAinTNYJyWpiMP9zPXEAkO9hsyzQwPK4eU=
X-Google-Smtp-Source: APXvYqyJGIFhpE0otdDhC4Pc3eq2BVlXTjeHLMVZ0m7XbxfNxzW0+co1DqNfPTfujGLShw6DRiYHMZgkGOul+9nf/gU=
X-Received: by 2002:a05:620a:b:: with SMTP id j11mr15321103qki.352.1567168171671;
 Fri, 30 Aug 2019 05:29:31 -0700 (PDT)
MIME-Version: 1.0
References: <20190830092738.7ea1abd0@canb.auug.org.au>
In-Reply-To: <20190830092738.7ea1abd0@canb.auug.org.au>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 30 Aug 2019 14:29:15 +0200
Message-ID: <CAK8P3a2zc-hp_oE1+Q+RTugxeVPPc3jyrdceQ4+8t4Zw_=vHUA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the arm-soc tree with the arm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olof Johansson <olof@lixom.net>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 30, 2019 at 1:27 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the arm-soc tree got a conflict in:
>
>   arch/arm/mach-iop13xx/pci.c
>
> between commit:
>
>   4af014984273 ("ARM: 8871/1: iop13xx: Simplify iop13xx_atu{e,x}_pci_status checks")
>
> from the arm tree and commit:
>
>   59d3ae9a5bf6 ("ARM: remove Intel iop33x and iop13xx support")
>
> from the arm-soc tree.
>
> I fixed it up (the latter removed the file, so I did that) and can
> carry the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.

Yes, that's good. Russell, you could drop the patch from your tree if
you like, or let Linus handle the trivial conflict.

       Arnd
