Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19E7413BC14
	for <lists+linux-next@lfdr.de>; Wed, 15 Jan 2020 10:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729026AbgAOJKY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 04:10:24 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46077 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbgAOJKY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jan 2020 04:10:24 -0500
Received: by mail-lj1-f196.google.com with SMTP id j26so17656214ljc.12
        for <linux-next@vger.kernel.org>; Wed, 15 Jan 2020 01:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newoldbits-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZUooeDiuykCrSEixoglrFzv/NkRqBFJjLlMXld2oNvc=;
        b=dkPCnJajgdZv82TJTfRwIjQT4BzJ0XAJ6EjHOTKTAfRmqA7t7Nm82NV6ZvLY/LtOJo
         MzdbM9Wou0bHJP5bPaCJNwqQ2ZSanKZJG9Q2bQKYSTVYNvVNEcS9jXYRIBiJ959OcNqR
         kc7vIokUwj1LKKCJ30x2X3DqpwnR/FYoj+/2W/YsR85Va2ptlTxsBI6a31zsYDOG0DTb
         Ma+umCg1nqQQ3FkG5pi9XEkI3TLwFfb5/6VDIOJcXQq+KXh4vsPL8AazgKx7wf2+7Vuy
         6Rw9QghTREYiaSILdXpXmfnbzkf1etqMbAJNSS3DKNHvXuc8w2i4OiyJg20HyP8ZtVs0
         4D7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZUooeDiuykCrSEixoglrFzv/NkRqBFJjLlMXld2oNvc=;
        b=dINJONZLWG6nJdPJEBGO+OK7tG2nda+fLYXxTVbFIj5Vh/r14k5ZGEOa9l3aJ5tVhS
         1h1kVR+TP1pTU17ATreCdKkAiRtoHcecscHUK7ymQ/ZJh5ERzcM5MGW9SH9W6WTAe3n9
         F3t3OAwrY2g9DjJdZbam6Z9TNVDVHxGNxoJ3pgNP7Seqv7PMtaguwRT0gel5cMcmnKiz
         xy1ZhcbKCmAsYFLkMWLWbdrsUFRqs9X4hsfga3cpyd7A0nIQvbTd/MZ2AARQ4PkYH+Vw
         SmsftkKm2uQUqXOUDg9wehST6Lomddr7DAzFgrMthLbvaHPv8x6NKsgFyNBQvku3z0Xa
         +mDw==
X-Gm-Message-State: APjAAAWFrxQz/ci7D1uCk7Em/X4bn3Lzs30qoCNwmoBjJ2/dmkGgPXkE
        KOw++Jy3L1lLV9DpmRj2xNR7njujDWWTFty9YIi57TZlCnE=
X-Google-Smtp-Source: APXvYqwmx/kU1fofcAxvjyTJt+wWuHPF02t2nR4PiACn0mxCpKhZ7SIHy9YPRLm7JR5V3fes434obrv1zFT0VcCMZeE=
X-Received: by 2002:a2e:9d89:: with SMTP id c9mr1140551ljj.129.1579079421879;
 Wed, 15 Jan 2020 01:10:21 -0800 (PST)
MIME-Version: 1.0
References: <20200115132325.3ac3ca0f@canb.auug.org.au>
In-Reply-To: <20200115132325.3ac3ca0f@canb.auug.org.au>
From:   Jean Pihet <jean.pihet@newoldbits.com>
Date:   Wed, 15 Jan 2020 10:10:09 +0100
Message-ID: <CAORVsuWs=0su+y2iLfL7zUygW8UgT8WzTXoCJiyBGFp_UG8yFA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the spi tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

I did not have this warning, it may be a combination of compiler
version and build flags. Do you need a fixup patch for it?

Thanks,
Jean

On Wed, Jan 15, 2020 at 3:23 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the spi tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
>
> drivers/spi/spi-ti-qspi.c: In function 'ti_qspi_start_transfer_one':
> drivers/spi/spi-ti-qspi.c:392:8: warning: 'rx_wlen' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   392 |     if (rx_wlen >= 32)
>       |        ^
> drivers/spi/spi-ti-qspi.c:318:12: note: 'rx_wlen' was declared here
>   318 |  u8 rxlen, rx_wlen;
>       |            ^~~~~~~
>
> Introduced by commit
>
>   e7cc5cfbea4c ("spi: spi-ti-qspi: optimize byte-transfers")
>
> Looks like it may be a false positive.
>
> --
> Cheers,
> Stephen Rothwell
