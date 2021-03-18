Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3B7A33FE99
	for <lists+linux-next@lfdr.de>; Thu, 18 Mar 2021 06:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbhCRFFH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 18 Mar 2021 01:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbhCRFE4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 18 Mar 2021 01:04:56 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D37EEC06174A;
        Wed, 17 Mar 2021 22:04:55 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id h82so1199774ybc.13;
        Wed, 17 Mar 2021 22:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=boxCIAX6xlwIEYen8Gi8wWHTSIpGurlMC+CfotX/SBQ=;
        b=HUFxCPBRK6lmCd14jRfuoDTMWPSIeu79dHUeEWGDK1HbBl7ic5NKlbl4D6LlUxzPbN
         xo0vn4ladGg84lhbEBQcwPXJEJZhdZIffvhEPCdi4VP7ambL9N3AlWxSXjCQjxrVUj5M
         lnbyJwrMGoxpjjF0ANu+nPUIu2TIQBIir9t1XQTzxyeRZ2VNKgdo64scfgBSyxdEya4B
         S/UiOjk6EOifrbRLMltC46xOyyDttQ+pJR0GullPcXwUeFn6T8lgC0R4SxS/o/bSINvs
         QgV9kR05FNbblJ3Ez0JRX0+9HI7AFJkFcQv0/cQJjhOSxTpF2o7iIA0PCH7rCHh6SxWt
         Vl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=boxCIAX6xlwIEYen8Gi8wWHTSIpGurlMC+CfotX/SBQ=;
        b=CMAUpqTOBSjx00p+8YAZ+MPsQEjFuGtCemLwiGGsvcrA4r4//Ymy8nBHE2RB1yeszb
         g9/mRREBZMRsXnO059XtyUD9xErch430fzTH4V16w1SMKYmkVLqihR7FZ2kg6d52kL6h
         EnPW7p15zCcwh5VWNIe+ny7rs1gGny+MugAq/BNUBuVnb5D8ugxISL3zrk1n3c3Lxf6f
         8lX//18eEp3fTjSylmZ6iVfyoonCncf3PbmEBk21QcJlmapkRmkkD3lqrLVaV09plKk3
         5vRxraPtgCU/9RpZbbOAtBKb/y8xEqDeLo6YwmO0Ivnf+88JhxEnYTcj2rKMBKNVwnij
         kYbw==
X-Gm-Message-State: AOAM5329EZUkTxSnjMwMrxvW3BOy7PTKoQXfx76yNKPZSUOp5k2S9BmK
        CBdmFjzJkdZ7PcJx7+PsuO12kt0mh9iXB6fmMHc=
X-Google-Smtp-Source: ABdhPJy1iuXZm1+a4T+hozalcShyTgPwNdLqp34VYWttkVMvJnToctKGFtLogYQGDiRfJtuA/s+ZCSTehkBquRzjY+U=
X-Received: by 2002:a5b:449:: with SMTP id s9mr9145821ybp.115.1616043895236;
 Wed, 17 Mar 2021 22:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210318153735.691c9c37@canb.auug.org.au>
In-Reply-To: <20210318153735.691c9c37@canb.auug.org.au>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 18 Mar 2021 06:04:44 +0100
Message-ID: <CANiq72k1uL3MdebRtck-EODx2YnucOAb-7hb1zzWy-L7UAwxcQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the rust tree with the kbuild tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Finn Behrens <me@kloenk.de>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 18, 2021 at 5:37 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> I fixed it up (see below - I think I got this right ...) and can carry
> the fix as necessary. This is now fixed as far as linux-next is
> concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the
> conflicting tree to minimise any particularly complex conflicts.

Yeah, the TENTATIVE_CLANG_FLAGS is the workaround to support GCC I
mentioned privately. It is unfortunate that particular bit was the one
that had to give you a conflict... :-)

Longer-term, Masahiro et. al. may have better ideas on how to do the
whole trick in a cleaner way (kbuild folks: don't worry, our branch is
not going to be merged just yet ;-)

Cheers,
Miguel
