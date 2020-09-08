Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40E14260AC7
	for <lists+linux-next@lfdr.de>; Tue,  8 Sep 2020 08:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729010AbgIHGUU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Sep 2020 02:20:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:53726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726787AbgIHGUT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Sep 2020 02:20:19 -0400
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1358D218AC;
        Tue,  8 Sep 2020 06:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599546019;
        bh=b4N0Wzo0LlxmMMNaMUj5p464U5T00RHGDqLtbBe11xc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=x+BES2N4uZlqJfb5/nwqjhUJICLuiQCKQLaY67m+Tz1tFLkZh9B4XO2eOxQOgEls/
         G74xASvcaa+Hn2fVqe2VcjF9sOcLMuW9bwiIExEwWF605JE0tXJXTSNozHCxTEGta2
         DI88WbufabDj0YxutyGxzFr7Qeg3SVu8GwxEWtGA=
Received: by mail-ed1-f54.google.com with SMTP id ay8so14764189edb.8;
        Mon, 07 Sep 2020 23:20:19 -0700 (PDT)
X-Gm-Message-State: AOAM530uTZvM3BjwuDvT6tLVGt0tdxTPYLsTu86zGi1TKmnHRdRJApB9
        W90DvZJiRPomP+GzloXalyacWC9pgV/A538hnfg=
X-Google-Smtp-Source: ABdhPJxm6MgtUFHojJp4O+2jexj7kbpsA8Qrd0PhJH8gKMswfOGXw5c/YTd1KwZLwV84tza8C5lzYwBWlIheSBozyVI=
X-Received: by 2002:a50:ab1d:: with SMTP id s29mr26477632edc.246.1599546017743;
 Mon, 07 Sep 2020 23:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200908144622.09385c88@canb.auug.org.au>
In-Reply-To: <20200908144622.09385c88@canb.auug.org.au>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 8 Sep 2020 08:20:06 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeZqmcyDD8KiPQveJEW5DgKvWbcQeTQYG0A6zaHDN=_Qg@mail.gmail.com>
Message-ID: <CAJKOXPeZqmcyDD8KiPQveJEW5DgKvWbcQeTQYG0A6zaHDN=_Qg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the mmc tree with the samsung-krzk tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 8 Sep 2020 at 06:46, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the mmc tree got a conflict in:
>
>   drivers/mmc/host/Kconfig
>
> between commits:
>
>   cb6c03019cdd ("ARM: exynos: stop selecting PLAT_SAMSUNG")
>   db8230d29c3a ("ARM: s5pv210: don't imply CONFIG_PLAT_SAMSUNG")
>
> from the samsung-krzk tree and commit:
>
>   54d8454436a2 ("mmc: host: Enable compile testing of multiple drivers")
>
> from the mmc tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/mmc/host/Kconfig
> index 0d7c61d8d1d9,dc646359b4ff..000000000000
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@@ -289,7 -301,8 +301,8 @@@ config MMC_SDHCI_TEGR
>
>   config MMC_SDHCI_S3C
>         tristate "SDHCI support on Samsung S3C SoC"
> -       depends on MMC_SDHCI && (PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS)
> +       depends on MMC_SDHCI
>  -      depends on PLAT_SAMSUNG || COMPILE_TEST
> ++      depends on PLAT_SAMSUNG || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST

Thanks, this is the expected resolution.

Best regards,
Krzysztof
