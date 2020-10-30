Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB7C29FF18
	for <lists+linux-next@lfdr.de>; Fri, 30 Oct 2020 08:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgJ3HwK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Oct 2020 03:52:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:57830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726052AbgJ3HwK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 30 Oct 2020 03:52:10 -0400
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 21B2022210;
        Fri, 30 Oct 2020 07:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604043696;
        bh=EzS4Q085qiKWq0D+PvSXvFRn693pGfvNpZNQQ9f3iFI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qjgCdNllhDqfGgLQRuI3A4WCt10168Nb/SKVoUozUmNGEGzJorCXdNGsQ1P/qzYEU
         q1qGDmTsm5O7LhSJHy9/FDg797yJCoDx8uu1eULkFCBFTcD2W600xLmR4L0ydk/F3p
         jfcBk7N2VW1FveWFJftEEsqavrTRHg1QsESuMRS4=
Received: by mail-ed1-f42.google.com with SMTP id l16so5646108eds.3;
        Fri, 30 Oct 2020 00:41:36 -0700 (PDT)
X-Gm-Message-State: AOAM531JAGr49jsvUsgeM//fAObzvuJyfg+kbiq36w3NZB0SgDgpsy6n
        MGPRf+m6WVKgx4NrIPXXr3TJsZG54CkTeKzH/yY=
X-Google-Smtp-Source: ABdhPJxge1YztybJz+XVGLvussORcQAXRiCZsUYCxXGbaVy2UmWQavumA9JP59uf+LBXYWaM/uUmlEVySdUWx3per5Y=
X-Received: by 2002:a05:6402:cf:: with SMTP id i15mr982230edu.246.1604043694545;
 Fri, 30 Oct 2020 00:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201030081018.11279822@canb.auug.org.au>
In-Reply-To: <20201030081018.11279822@canb.auug.org.au>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 30 Oct 2020 08:41:22 +0100
X-Gmail-Original-Message-ID: <CAJKOXPfy-iXsL43S2AYrOXGzbKjxi_Cp6BvP5zNTGGe9+G3V9w@mail.gmail.com>
Message-ID: <CAJKOXPfy-iXsL43S2AYrOXGzbKjxi_Cp6BvP5zNTGGe9+G3V9w@mail.gmail.com>
Subject: Re: linux-next: failure while fetching the pinctrl-samsung-fixes tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 29 Oct 2020 at 22:10, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Fetching the pinctrl-samsung-fixes tree produces this error:
>
> fatal: couldn't find remote ref refs/heads/pinctrl-fixes

That's my fault - I wanted to have unified naming across by
repositories. Could you start fetching branch "fixes" instead?

Best Regards.
Krzysztof
