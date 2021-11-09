Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 309D644A5E6
	for <lists+linux-next@lfdr.de>; Tue,  9 Nov 2021 05:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237214AbhKIEwP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Nov 2021 23:52:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235277AbhKIEwO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Nov 2021 23:52:14 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91C91C061766
        for <linux-next@vger.kernel.org>; Mon,  8 Nov 2021 20:49:29 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id t19so1315695oij.1
        for <linux-next@vger.kernel.org>; Mon, 08 Nov 2021 20:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rlx5ig/p8TgGeMfy0pbJ8Y1W0ysG3o+WRmp65zyry/4=;
        b=wyVqGyzwbTPFmH3jNBYvzmbr5Hg7ZuZy995CFeJqz164nSmNC/YQkeEcQx9YjXmEBo
         Zv6euQ0GKZRD6Xag9CeBddLn9WYNt5AVFGY9TLEoX/Z7tF+uKbfZmGdCj2X97n19LmcU
         AR4ZOB0XlX70i0hZpfhRutlJ3Z6posyhayc7A5SVPDeWoNJ25rquGEu8Mvw5F+raNpQH
         T3fsoKJXUZQNHD4+NagH3/KxVdAThAhIQYr1SRRZPcpBxiS33xAuRnl2DVd8A/7yPEQX
         wyopkEnkosxGHLwYMetLb+u6O4V7vDtqNLSt4IpG81Yr9Zqf4Wv1kcp4GqGhUTolEuBE
         HcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rlx5ig/p8TgGeMfy0pbJ8Y1W0ysG3o+WRmp65zyry/4=;
        b=MmyYXSCCzusFNNLznAu4Dw38cv0HjeFOhRdM8TIIg3sbCTFwnFFPYNScOvjFElGukt
         noPzQHMnTaxoHwv3r9VbmaIknSaZl+w+IFtlv5QjH9pgBwiTNwGZdrJDQsexJOVrXsR8
         McuL/Yqaslm9MmC9pbVWiPVzRHums/6vZSB4tixNjpSkPFUZ517CZx428UkgIP+GYW/0
         rCiuxJwLOKz9FHjbDo6hfUsivtuqypeZhc/Hz6UgQ0IsHy1DaqD5fyDSNyHEkEcPgVUl
         fXEUqUFsqapDITlnG3OZNeSkYNbVac9ZXkps7g68a+MiaJgPWvOvKSwtn2YxOiPJs5fY
         dHyw==
X-Gm-Message-State: AOAM531JBi6h+Cpy/2BKyKGBlJogUSwUh0Uo8moa2PFqaxPHXmJ7F2mk
        IDspOugMvtfphiguEuXyjBM4znT7nCTeDihUCwRTZA==
X-Google-Smtp-Source: ABdhPJzLqV0lBRq0GsaWFIm02n4JJ8IfObFpzzxQbQHklGa1so6hofe+FUTP5ZyLO4QjjI1FUCwxvlfBeeymh6ewkiw=
X-Received: by 2002:a05:6808:60e:: with SMTP id y14mr3329472oih.162.1636433368909;
 Mon, 08 Nov 2021 20:49:28 -0800 (PST)
MIME-Version: 1.0
References: <20211026162852.6cf2a2aa@canb.auug.org.au> <DM5PR12MB24064E6B3635CF9EDA7696CBB7849@DM5PR12MB2406.namprd12.prod.outlook.com>
 <dad7a9b1-6521-801c-d8b8-75dca8a4bfdd@gmail.com> <DM5PR12MB2406509A3EB867608F604598B7869@DM5PR12MB2406.namprd12.prod.outlook.com>
In-Reply-To: <DM5PR12MB2406509A3EB867608F604598B7869@DM5PR12MB2406.namprd12.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 05:49:16 +0100
Message-ID: <CACRpkdabLs-xZAkqKyiA7PEY1KuWNQFk2wyLhASC1BzfzNKcYg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "Kartik ." <kkartik@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 28, 2021 at 2:31 PM Prathamesh Shete <pshete@nvidia.com> wrote:

> Thanks Dmitry for pointing out.
> Attached patch to fix the issue.
> Please help apply the patch.

Patch applied for fixes.

Yours,
Linus Walleij
