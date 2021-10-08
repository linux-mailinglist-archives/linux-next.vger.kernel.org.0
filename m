Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 842C0426C8D
	for <lists+linux-next@lfdr.de>; Fri,  8 Oct 2021 16:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230042AbhJHONl (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 8 Oct 2021 10:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229756AbhJHONk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 8 Oct 2021 10:13:40 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5179C061570;
        Fri,  8 Oct 2021 07:11:44 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id y16-20020a4ade10000000b002b5dd6f4c8dso2940158oot.12;
        Fri, 08 Oct 2021 07:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MbGs/6x4pN4s6g/EDyFQWl+AmouMo20lgCsXdHhqXbI=;
        b=CYlQUjWN7bHcAi6jliv4m4PdnbRKujP760zw7djhMLhe92lpS0Eo7QJHgRnuCVoiMB
         umvqWwHyO+dGKgnVKJ6pNM4ppmM5zxEj9a437Ysr8OPkghAJVtI9nR/GqL6bbX0QYkZa
         OcAUYlfGQK2M23mfZsUFWQhcSBbvN4GMZxUU1cJm9dMf1RbAZJrDWzSevROtoMni5WzL
         sE+wqqBD/vY0f1GVwSliqxvGQvIfRhar5x76tyAwO2FrMbZhztGUFe0wjqONBy+ay2GE
         c/a4WIgdBvnmA7D+h+39cI5n7UQ5POrXb/nK/uAbRJq30bJT5nvt0RtTBfP5Y3RUAHPq
         xuwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MbGs/6x4pN4s6g/EDyFQWl+AmouMo20lgCsXdHhqXbI=;
        b=Q0cK8MNIsMcq2zLl3nMrJn9bW+xDEtrVWZpaaFOoevkhMNrCwUXIIYWW7wX/CX8+My
         t5b5SaL8yVDk+czoI33G22QixRh1QK2c0uCgJgXPbm/SFECTOMjODe0lFYloTgmAnVHz
         NeSeCLDajsJknS27TgwY80UFfpA5cNkjeaOYXSQ7S0nXaG/PoUSlEZiMffZ8dgGto1zE
         PcCNharwJZ+iGjc+dH+O6l6M9S+UgmdIGr10nhOYB7WyNdB/Zqzl326fnbSygR5/0fXL
         TIYACkBEvvt457G+HDaGJGRB4yvKvGhdqUBNvCQu4ULc5Fy6XzwlwznDu2ldLG30WgPh
         Ymjg==
X-Gm-Message-State: AOAM530eQ3sDKzPLQwfZoQm9cnqdREVNJuhJtY1NlfGuJEBI1u2sGXjI
        eQ56PDjZPHGkSFmTRhEDEpINY4L3PDAghcaFcFa87Xzs5It2Ww==
X-Google-Smtp-Source: ABdhPJyuzJhYJX1W0W2grPoVqrm/kc4OHoRdDoWqTvxU16y8o9/g+xwk/94jq0VboLjiC07sPgOqwvAv7cNk7vbd41s=
X-Received: by 2002:a4a:e899:: with SMTP id g25mr8372784ooe.68.1633702304000;
 Fri, 08 Oct 2021 07:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211008113116.4bdd7b6c@canb.auug.org.au> <jXLIcCYkgHdIQna5SW6W4GGHVG5By4-GXiaosbXyyaYXFNTH60nmH6twdxMYgM2X63FhEOyxU7Qh_vbKFywBKmUwp7l4DYXe_hTt86AS-ZM=@emersion.fr>
 <20211008192910.600a188d@canb.auug.org.au> <Dz13Vv6-f2sFL9b6FSyhY_PlgeJfAnCBSn_SLFYSVRmXevReQOCK7ZD_DRX2DsjHYb45cTPpnTC-aG-tFNU2AapS9qsQZQB_boozWiTz-dI=@emersion.fr>
In-Reply-To: <Dz13Vv6-f2sFL9b6FSyhY_PlgeJfAnCBSn_SLFYSVRmXevReQOCK7ZD_DRX2DsjHYb45cTPpnTC-aG-tFNU2AapS9qsQZQB_boozWiTz-dI=@emersion.fr>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 8 Oct 2021 10:11:33 -0400
Message-ID: <CADnq5_NUkzK=uOJKn5tiaSSA0i=WPJZFZBSPDne8ooims8JkCQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
To:     Simon Ser <contact@emersion.fr>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 8, 2021 at 5:22 AM Simon Ser <contact@emersion.fr> wrote:
>
> On Friday, October 8th, 2021 at 10:29, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> > That symbol (get_mm_exe_file) is not exported to modules.
>
> I see this:
>
>     EXPORT_SYMBOL(get_mm_exe_file);
>
> in kernel/fork.c

Was recently removed:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/kernel/fork.c?id=05da8113c9ba63a8913e6c73dc06ed01cae55f68
I guess we need to rethink that patch.

Alex
