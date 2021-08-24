Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4FD3F5E11
	for <lists+linux-next@lfdr.de>; Tue, 24 Aug 2021 14:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237329AbhHXMgg (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Aug 2021 08:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237325AbhHXMgf (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Aug 2021 08:36:35 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67D9BC061757;
        Tue, 24 Aug 2021 05:35:51 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id cn28so31439373edb.6;
        Tue, 24 Aug 2021 05:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ibtn/D/0mdXONoC59XUn0qwacZh8MymwLVdaR+mPlJk=;
        b=nihr1aswiKFtIOLoTvhtAt7mYe9eT+J06N1KZ0QD3EUdCPVNiL77tFq8tNbPF7hiP2
         QbfGywayZ96h2o7xAIve/Ax6P+mqIsl1XtMhVeKZ/lussCctxFt7jH9FfmPk8Q1jaVcR
         t3rtyFc8156czMTDR8YYxxRVzduGTxFHFmibsYVWy239JoByXbskurosJd63k7mv2InG
         wON0PhyzvpidhDIIT7PkJMBgvWv5qiIGqjSxF7Q+bbjZqnSwhjj9l4ZE7TMrMZkDpVJe
         e0hpzd42hIkCNpWzz81f57xu4FdQNpYxJfdcstZLSCcUpAj1RtJEXIQq9rGozHTLGb5/
         LV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ibtn/D/0mdXONoC59XUn0qwacZh8MymwLVdaR+mPlJk=;
        b=imMVMNRLSiKTvalXm6zp6a/Sldryd/yCK2HE44HtnnhjKOfOdIsxaFzbySEWtqfJnr
         No4yxs2w2k7h5rl+O4WVGKI5JRQm5pJYheGyJ1oADtpSAhoZpcIXBpcqTnshJvZa9nx8
         eVaa+VV6WCgQbpMp9BscU7imM5REMaYnR91YSO0E0yifUKqW3xNi86e0TPwLXudHQEJM
         36PDN53Iiz/XfD3iaaHvEbYbdRIQBTxy/tABXo2qYWfyqPVSnv9jLL6TUb3qDceTPT/t
         L8eEzHMUeTGjaTscTrsUSgCZfn5cGYjoXS33gjZqQ0lv3gKyKEwzlrBHgMWXynhlemuw
         5BWQ==
X-Gm-Message-State: AOAM533H3yXAREcNmHSpGXj+lFt3INlym/8Ipyun2fY3CZafOALZAI5k
        GQyZAKOI8yRetkmsPNw0gr+yjAmEcItbNUqS0NbcGhQ=
X-Google-Smtp-Source: ABdhPJzH+w6hweAkVImtRyLLyXHxS4DJl9oxoOCfBIgp57cdhXzjnuzPUijGYgU8Qp8NwskMm4UWGfGqZYblpgzahEw=
X-Received: by 2002:a05:6402:70c:: with SMTP id w12mr45954edx.289.1629808550038;
 Tue, 24 Aug 2021 05:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210824131850.62b29724@canb.auug.org.au>
In-Reply-To: <20210824131850.62b29724@canb.auug.org.au>
From:   Rob Herring <robherring2@gmail.com>
Date:   Tue, 24 Aug 2021 07:35:37 -0500
Message-ID: <CAL_JsqKooHHmePPxRXGfB3DNfceO1=cdwAP=Esp-HUWtcaWefg@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the devicetree tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 23, 2021 at 10:18 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the devicetree tree, today's linux-next build (arm
> multi_v7_defconfig) produced this warning:
>
> arch/arm/boot/dts/bcm2711-rpi-4-b.dts:220.10-231.4: Warning (pci_device_reg): /scb/pcie@7d500000/pci@1,0: PCI unit address format error, expected "0,0"
> arch/arm/boot/dts/bcm2711-rpi-4-b.dts:220.10-231.4: Warning (pci_device_reg): /scb/pcie@7d500000/pci@1,0: PCI unit address format error, expected "0,0"
>
> Presumably exposed by commit
>
>   1ee7943c3343 ("kbuild: Enable dtc 'pci_device_reg' warning by default")

Yep, that's expected. There's a couple on arm64 builds too.

Rob
