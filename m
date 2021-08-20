Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 377AB3F27A7
	for <lists+linux-next@lfdr.de>; Fri, 20 Aug 2021 09:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238683AbhHTHc2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Aug 2021 03:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238603AbhHTHc2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Aug 2021 03:32:28 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A74C061575;
        Fri, 20 Aug 2021 00:31:50 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id w6so5467517plg.9;
        Fri, 20 Aug 2021 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n7E/a6EUqWsmgqTFrSSXMgfXwa+yrAx9MW1PuQlSZc0=;
        b=hsHfUDZ7uisqnEfdjRhkqSFqJNBswVU29sTPAsVyln3XIisuYlLf/BFI37XpH8XQFf
         TIULcFoZ0VFuGbN/+cwwtif8DxW/rcZjOHhUcQu/QfoenWyXCzx3KulZfqD5fTSByX+X
         w8TKF6lhyR2IsGLOUiVRIgOtAQ5Vw8ie+zEQ7xmuJoZ9ZaivFjIB5p/mD3PZum/C87zU
         QHXpZ1VQOL6xtF9wW9NhKyBnYnf2PHYLo3NJeVTZmIhEa+dXqt/qYno7kM112xErzs9n
         BqdEEenl9Q14r4SLCH5hUxJJa4MADrGA3SN2DqGW0lkGcaKbuyKXjZed/cCuNF1/5hXQ
         QYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n7E/a6EUqWsmgqTFrSSXMgfXwa+yrAx9MW1PuQlSZc0=;
        b=idTa7D4ICNpjPEaJpJewS+otcyFT8Q26PDwB4haFvg1+wr2RoD7N41WtbWDbf3HE28
         zbRZWDOwQRSUZnrqdnzT4w9xs22oAHehFiJ1TBAA20b5Avq1COtI9hQpMyqBjvT+M24K
         d/hVv9BCywNOFmYPpACre/IfBiKSHRvYKM240FGRl+V/MQBDkHmUtd1IP0zK5wckH56a
         On6x+XPAxQ30gm3fV2z0bC4vo7lNizGsSaNhUplAWbn3nq/GkFC5AJ9xJADWCR7ZHUa+
         53LFRc12DIuleU43UpO5KhZxVUmMMNqPAK6L44QIWF+aYDhirpf55fY4h9A1IGM22Ihk
         VXIg==
X-Gm-Message-State: AOAM533ZNNvhMOJHXWQyxByDCA1iC0XENXWTZMY9/HXDklR7mVGapyst
        d1h6N2stfCQRtJPPc+2OlEav7LO8L0A5p9NAu5Y=
X-Google-Smtp-Source: ABdhPJzJtwD2SYadVDuXC4QiKV1nLpYz39yXBfdNqqRFgmWacEITTYn4lpyPwcv1yUnmDIm7/+BY+JzHCUNf9VXRw8w=
X-Received: by 2002:a17:90a:c89:: with SMTP id v9mr3298116pja.175.1629444710261;
 Fri, 20 Aug 2021 00:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210820150022.2160a348@canb.auug.org.au>
In-Reply-To: <20210820150022.2160a348@canb.auug.org.au>
From:   M D <whenov@gmail.com>
Date:   Fri, 20 Aug 2021 15:31:31 +0800
Message-ID: <CAA2grmaYg8Qc4LXhcFAvNRN-zJaPcq+y3=MFVSFETr2pNb-Vgw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 20, 2021 at 1:00 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drivers-x86 tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/platform/x86/ideapad-laptop.c: In function 'ideapad_wmi_notify':
> drivers/platform/x86/ideapad-laptop.c:1469:3: error: a label can only be part of a statement and a declaration is not a statement
>  1469 |   unsigned long result;
>       |   ^~~~~~~~
>
> Caused by commit
>
>   18cfd76e7b84 ("ideapad-laptop: Fix Legion 5 Fn lock LED")
>
> I have used the drivers-x86 tree from next-20210819 for today.
>
> --
> Cheers,
> Stephen Rothwell

Hi Stephen,

Thanks for your work!

This error occurs because only a statement is allowed after a label,
but a definition is not a statement in C99.
This can be fixed by wrapping the case block with curly braces like this:
case 208: {
...
}

However I don't know why my compiler did not report this error. I was
using gcc 11.1.0 under Arch Linux.

Regards,
Meng Dong
