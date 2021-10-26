Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 407CD43AC22
	for <lists+linux-next@lfdr.de>; Tue, 26 Oct 2021 08:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235223AbhJZGSG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Oct 2021 02:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235221AbhJZGSF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 Oct 2021 02:18:05 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D43FC061745;
        Mon, 25 Oct 2021 23:15:42 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id y11so12497399qtn.13;
        Mon, 25 Oct 2021 23:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D/dur7Sn2ZYzb23rhe+lhXmkmVlrpP62SVIG02l086Y=;
        b=aeMt714LaHa+SG1Xpln7wKEpu7YaAu3RlCvOBNQ5ZNJHUaTrZDegZyPVfR1k6EBzk2
         WwoxrqON094LB4Y0fOvQtY6H9KWqB+Y3qmrrGm5rvPb4bvtlvvjPvHnrrUgN8XW193ce
         gcJpBikDv0KgNZkj8SfRPWlYHpDwnQWl8Uauc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D/dur7Sn2ZYzb23rhe+lhXmkmVlrpP62SVIG02l086Y=;
        b=TAVlYFHsQ+q6ps5bnusgvWrECZijwMy/kK+J04ZlvuWKOpGHDOgGMcBqtHFCIxu4NI
         YVnOcPBNnaAxi0bo9fXht/htdm9dV6L5Ikn4mPqmVlR466N6FSGPj2xhY05rZ3sYYKY0
         pmGUSmLjdNaOIx7TVEnn/7MS5TEwPeBQZMC22tVjOXAVX/FV/49YJWIxIX3x1SbPD2jX
         YjzeKK0bJpKUnS+vbWaqDjvfEGEQZ1tR3NTnsjsOzamvDVOUprUuNDLf+Td22ZiOvaPj
         IHoFPPrfNQOkHcaIN8BhX/HjBt9TquKmC+u+yN0sCbwgBrjKQ+tOfpE0wbSBqOvJROhX
         OQQA==
X-Gm-Message-State: AOAM533RM4hVvdQjvcAmaGZo/TaIKLySwMlPpHR+RxaSTjkAfTnKOtYp
        ydLYuSIOimkGL9aVaBQQOHjJ9BZOI03OshlYNlo=
X-Google-Smtp-Source: ABdhPJwLpix2QoCyq66ckF90hg3QuitUesuv8mX2KdKU7ghjQW3WVqC0qjEWMswKGAXpcrK0KX/K0Gr7JDf80WzpCNA=
X-Received: by 2002:a05:622a:180b:: with SMTP id t11mr2167219qtc.25.1635228941623;
 Mon, 25 Oct 2021 23:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211026103939.136dc73b@canb.auug.org.au>
In-Reply-To: <20211026103939.136dc73b@canb.auug.org.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Tue, 26 Oct 2021 06:15:29 +0000
Message-ID: <CACPK8XfS+Gy1dhL-_uWKhW1D4++6LdWM-SdXtnsEV15OUhiK1w@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Chia-Wei Wang <chiawei_wang@aspeedtech.com>,
        Oskar Senft <osk@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 25 Oct 2021 at 23:39, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the arm-soc tree, today's linux-next build (htmldocs)
> produced this warning:
>
> Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing:2: WARNING: Inline emphasis start-string without end-string.
>
> Introduced by commit
>
>   c6807970c3bc ("soc: aspeed: Add UART routing support")
>
> The problem is (probably) the '*'s on the previous line.

Chai-Wei, are you able to send a fix for this issue?
