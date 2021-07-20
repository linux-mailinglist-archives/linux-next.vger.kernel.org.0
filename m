Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7863CF5F2
	for <lists+linux-next@lfdr.de>; Tue, 20 Jul 2021 10:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbhGTHhC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 20 Jul 2021 03:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234190AbhGTHhA (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 20 Jul 2021 03:37:00 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A80EC061574
        for <linux-next@vger.kernel.org>; Tue, 20 Jul 2021 01:17:38 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id hc15so33102344ejc.4
        for <linux-next@vger.kernel.org>; Tue, 20 Jul 2021 01:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v2gsQnzIST0gsjN3UJrcLe/t2Tw7WtqJWLfqcGrUyzU=;
        b=qfrwvKcsvCXv0OESA+8RRYb7WSVVu4AfzsV3nuOa9Q9CjH4T1NVnWAfHmEErE0ve/q
         Tl7W2dd7fkoIotTprcdm/apYaZz7befwiEzfxZcU5SCfqdl6uRTNU1z9JZIDtiNTfGaA
         9PCd5OGhMHTEpfxtbx18A9defDJgJAtNSFt4zDxnG+E/juIvSon9dvw+LmgAFkBi7dBt
         g+7M8F0ojESOmKmZ1vSLpO38Pqlwt6rrABUsjVCzmWqtISNgyeiRy3SH4v92iho/BU2M
         H854FWZE+0zyuXbPkFkJizx75kVv59dgJ77yFCWqZWBn/Pzb1wQ/QhOErneyDCVwaX8u
         d2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v2gsQnzIST0gsjN3UJrcLe/t2Tw7WtqJWLfqcGrUyzU=;
        b=KZJXa3+Ee5Aiy6PbwQLtIFp2t9dRQPoFsMjE4dUzDthcrWoYtpn5iynPbgyrJDARcx
         w7OInJwG2SaGVwZFf9/fByR2wPHVL3uocqsEPpn2olgciuD7e6xRVZa6G+3k+UfFUST2
         6EXV47t81xnWh+LxDOO0EB3QmUA1St4jkG8WqbER/6RPNAYS2Xozsu1VR1ebu9T0IgaS
         Y8AzzaGpXM1HPXwS1SHvLKBIfKYbLLahXh80vYoTD0cNxgnzMZrDn9tLYzWPitGpSGXD
         /rzr2WZp/txOlqLE5kvlyj6ZR9j+kY8EnCLFN/BXWLCkzWkJOLj7Lf2XGNTQsWMX0Ezm
         no5Q==
X-Gm-Message-State: AOAM530/GqB8Qh6GQ6RgRg0vRFtrQRzE9mWAX0engRk/RlH6ij9lhKEF
        GK0ouGd1uezfqq997RwbiFS/DAJENSNz5CtT/GhKWw==
X-Google-Smtp-Source: ABdhPJzh5NZqbV6DMl/3IzLzdFeNMJYE+oTceH2715CwSYBA7iRhUu1kXrBQ0LaNs4QVN8ZF43XJv3ua51o4ERugzfc=
X-Received: by 2002:a17:906:844d:: with SMTP id e13mr31351133ejy.503.1626769056841;
 Tue, 20 Jul 2021 01:17:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210720174300.018cc765@canb.auug.org.au>
In-Reply-To: <20210720174300.018cc765@canb.auug.org.au>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 20 Jul 2021 13:47:25 +0530
Message-ID: <CA+G9fYs2ApGkrJHL5HOO1jEJZ714itVp+Tdj7fWzkG+JWc=pOA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the printk tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Petr Mladek <pmladek@suse.com>, Chris Down <chris@chrisdown.name>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 20 Jul 2021 at 13:13, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the printk tree, today's linux-next build (mips allnoconfig)
> failed like this:
>
> arch/mips/kernel/genex.o: In function `handle_mcheck_int':
> (.text+0x190c): undefined reference to `printk'
> arch/mips/kernel/genex.o: In function `handle_reserved_int':
> (.text+0x1c8c): undefined reference to `printk'
>
> Caused by commit
>
>   337015573718 ("printk: Userspace format indexing support")

Following MIPS builds failed at our end due the reported problem.

 - build/gcc-10-allnoconfig
 - build/gcc-10-ar7_defconfig
 - build/gcc-10-ath79_defconfig
 - build/gcc-10-bcm47xx_defconfig
 - build/gcc-10-bcm63xx_defconfig
 - build/gcc-10-cavium_octeon_defconfig
 - build/gcc-10-defconfig
 - build/gcc-10-e55_defconfig
 - build/gcc-10-malta_defconfig
 - build/gcc-10-nlm_xlp_defconfig
 - build/gcc-10-rt305x_defconfig


>
> --
> Cheers,
> Stephen Rothwell

- Naresh
