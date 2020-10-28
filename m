Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3DA29D9C6
	for <lists+linux-next@lfdr.de>; Thu, 29 Oct 2020 00:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389998AbgJ1XCd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Oct 2020 19:02:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731811AbgJ1XBi (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Oct 2020 19:01:38 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80023C0613D1
        for <linux-next@vger.kernel.org>; Wed, 28 Oct 2020 16:01:37 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id n18so790903wrs.5
        for <linux-next@vger.kernel.org>; Wed, 28 Oct 2020 16:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pmlvkQeg7H6smcBHZ5aZgeUaLRlAx0R+iCDWXBgF8Uk=;
        b=hzvcafzsTDtVUUVH1kS94mVKvKXmE4c6gcOeNA5ca8NF7hzCPzx9Az8oU7QVR3E5Cy
         C347ZJks3MzRvNGt8HqF6kIaNBzMySi+oOthiNzV0QTHVM45eKqOzoaE39gklCRwa9Ou
         UvDZs3x4mc9w0tfwkHoxd3L3LiCuWFZxjKskc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pmlvkQeg7H6smcBHZ5aZgeUaLRlAx0R+iCDWXBgF8Uk=;
        b=ns8ZbFTdtjvN2kzih4GM9MElT1QOcenuNCPTffqgUw9xNGYU3sBafVmXw0ogT876vL
         0l0B05HzdFryR0j/b1wnALbB6C60kHLo2CueYqp5UR54GW72XWp6q7wyHk53XWFJ55SG
         LJT6Uzzac6hIs3lWVFltYk/mZPCN5/iKn3GLbGIXVuBcRiYRCFw/m2cVyC/OZBfVr/Tu
         R3WEDjrxvtlMKFNez5KVG/Ego3yjlEG6sEspDZh7AVLxK73U1AHSoO2w55ezOKZz8YRm
         YVnYdbX67WrnQoJ9J+HrYLjok3qOCTrc8wv13v0IhJm+vPC9exxC5Vozh60nQQiCTDLR
         +Kww==
X-Gm-Message-State: AOAM533t9eSKhwaQG61IjkKEClgVTgF2UfH8wlY4VLgqi1JoIXGnEYa7
        RHznvZ3B6Ixtmeqx8BCeX4Vx5ia0Ze853ahz1jiBICa/zuG2TQ==
X-Google-Smtp-Source: ABdhPJzj9kyuupHG0/DfPab48BJrhIBCY+xoQNy6Ur/hkxg1PpSleXYOCl+TPbZZbePCJaxaotpYYjkpmW9vfAUOCi8=
X-Received: by 2002:aa7:d65a:: with SMTP id v26mr8622930edr.82.1603900571122;
 Wed, 28 Oct 2020 08:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201028142809.09f7f4b4@canb.auug.org.au>
In-Reply-To: <20201028142809.09f7f4b4@canb.auug.org.au>
From:   Micah Morton <mortonm@chromium.org>
Date:   Wed, 28 Oct 2020 08:56:00 -0700
Message-ID: <CAJ-EccOQCADagAb8YqRHL6aUVCrMuGOO=tA-TBorjO_AiXT7Gw@mail.gmail.com>
Subject: Re: linux-next: build warning in Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Thomas Cedeno <thomascedeno@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Oct 27, 2020 at 8:28 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In Linus' tree, today's linux-next build (htmldocs) produced
> this warning:
>
> Documentation/admin-guide/LSM/SafeSetID.rst:110: WARNING: Title underline too short.

Thanks for the heads up. I think someone sent a patch to fix this
yesterday: https://marc.info/?l=linux-doc&m=160379233902729&w=2

Do I need to do anything else or should that cover it?

>
> Introduced by commit
>
>   5294bac97e12 ("LSM: SafeSetID: Add GID security policy handling")
>
> --
> Cheers,
> Stephen Rothwell
