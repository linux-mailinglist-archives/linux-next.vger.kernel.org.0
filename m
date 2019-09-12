Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF752B0B56
	for <lists+linux-next@lfdr.de>; Thu, 12 Sep 2019 11:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730175AbfILJ0a (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 12 Sep 2019 05:26:30 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40211 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730558AbfILJ03 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 12 Sep 2019 05:26:29 -0400
Received: by mail-lf1-f65.google.com with SMTP id d17so883597lfa.7
        for <linux-next@vger.kernel.org>; Thu, 12 Sep 2019 02:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nf9tEQrY91aUt4IWPBnEd1O7PNd6a6XOY7RZBD/1LbQ=;
        b=k5XF2mgKP8GYjwNfK/5U5szRWBPjZNDLYgASzMw5o3uofn/U8S0NJenUp6wFl4McNB
         jLfpivXXX3rnuN5W9xZ9jLSzyogf5fWgrKHLJJmx+6Vgw3id0iknV+lD0Zd3psjrJa4N
         T88g2SjCbXohaqrcwHB+7GaIVWPp68a5AYDx98Ey9h77jU2b4idFGKwt4lqRdc15/dLz
         O410hzzzlDk/cGueXK+SZIr4FcKz1dQXCX1TL44uEM3V8UKif4MRzmGE/+v788Swu3Ly
         cb86JnWISFvqt628n9DGDYkr3N9uLnqNqjLGyDen10U4Gnx4s7z1D7JwVvZxIIb2NsBL
         DXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nf9tEQrY91aUt4IWPBnEd1O7PNd6a6XOY7RZBD/1LbQ=;
        b=l6lWP2tlUoRLM59OAzVVOIDXxRtrbq4Rla2O+wiQ3Ninr/XTLl/cwnB/QafNFIXKm2
         tXNjth3sArwyMh72l9lAVq80Uz5b36pfzdrv9LXaZIYf8DbD7PNjD7oBcuzw8H4XMwPp
         nzeZsbEuG9dz+Qwg0GDQ8SZh+Q9t6QUAlGwNEJTB/KfgQ+BSKajNsjglGKACoaC+aT0c
         CBEjOwhCo+480iH9+2vZggPN4DkYky8hwVFaDwtB3QafksmQV53kVjr77BmHTy2rEbkA
         x2eGMi6mQoj/5m3VgO+U3sUGQ+PZBu390SOuLBeC7eqWJAh9+OjD6D0NZqIx5tC/NTfF
         B0uA==
X-Gm-Message-State: APjAAAWRrVTPueoW96M77GJ3kaohH5UiS2wlYeqO/Hssx9gQjt8wmvRp
        vGvfItpef3VDrvd5h6mtJ3fq4ojBQvgdbvSYK/mYFWqLniYsNw==
X-Google-Smtp-Source: APXvYqwFFq2fXxLxD1qvNzknrji54/UB+pi5FNhxEBi7CEgsrvRh/0Tsh9xZnMTvI1zRZ6w+mhNzwkXzCRxF7bX0h9U=
X-Received: by 2002:a19:117:: with SMTP id 23mr27456270lfb.115.1568280386680;
 Thu, 12 Sep 2019 02:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190911204853.7e6aad26@canb.auug.org.au>
In-Reply-To: <20190911204853.7e6aad26@canb.auug.org.au>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 12 Sep 2019 10:26:15 +0100
Message-ID: <CACRpkdYBtX09nJhwLHSF5-MMpTO6gc3i_QtanWrS4DBgppvY2g@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the pinctrl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 11, 2019 at 11:48 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:

>   cc3abdb73df4 ("pinctrl: iproc: Add 'get_direction' support")
>
> is missing a Signed-off-by from its committer.

Thanks, fixed it up!

Yours,
Linus Walleij
