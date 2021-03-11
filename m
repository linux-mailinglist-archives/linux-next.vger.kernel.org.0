Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB9D7337574
	for <lists+linux-next@lfdr.de>; Thu, 11 Mar 2021 15:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233411AbhCKOXX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 11 Mar 2021 09:23:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233523AbhCKOXE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 11 Mar 2021 09:23:04 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09FD8C061760
        for <linux-next@vger.kernel.org>; Thu, 11 Mar 2021 06:23:04 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id f1so630136vsl.0
        for <linux-next@vger.kernel.org>; Thu, 11 Mar 2021 06:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h2lmq7UN+PmMWLB8VNTF2xiPvPnbMeNnR+7xE2jeGyE=;
        b=P+awflMVOwasBIyDbsiIehZrlVRtgMnKvsfLI+odsvbZ3p4nBkLMEQYjkmF0kaH1gY
         q/R07ji3S99brIXbrzbw95i7oI8um638380kUdpsS/DfAA1hFQPPLAw4ZJjszeB2/hUv
         z1zUja6G21eGC6NoiRK1/r8lN/8mrhNd8MetxC2Jl8MjjT8vM3SEurWxriBziKcHC6fo
         oBg1kPRUPXAj0DZ4eK3G4GcR/fCV88+oV8tnjqHY8M3LpHXpOVfQnd/Z2V8UYSne7gM5
         ZxFWC3D+SUKW97YXRWheW0/Z+M1hqVYyanjLJGBbwd5/HBMSzRoLeCAXBVqBkUqpCezr
         p2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h2lmq7UN+PmMWLB8VNTF2xiPvPnbMeNnR+7xE2jeGyE=;
        b=M2nEyREAqmczj2RiYJQZ8cowcrH+/4di5Y1TdGmSQtsdWWIW5kKPbWAU7eBzUJooig
         76i8SxJqr2LUHVJG/W073EBj0SO51ILVeikfrTiPmhgsd4rqhHuXJC1MOtk+XFQX1MlV
         LnjOhidsDeOHhWQEA8eDZAzrJAR9M7hHgk1VQa/Z/rLkWsauD13BhU6O2dGB9qrsfaDR
         4TqVrqyiqX+4CglkFmpxX5L3Smqm+6i80eG0NlfrP4tUvBh6ZxP1oTUA4Dh1lZdLTgbv
         kjVfp7R9+BJAVLfH4GJsUu6CqToxC/D0Z8a/U8ssihsmqPq6nPbcWamnd4AEcidHsHSk
         x9hw==
X-Gm-Message-State: AOAM532ZB3L55s4nLgtfRhIdTZewfbrnionFPQb8tckb8CVOJe11vN7p
        UCYe5GR0o/1pilYOxvc2DJtnjJ5hBepbrSbuwPwYJQ==
X-Google-Smtp-Source: ABdhPJxeiBueEjaeexTTaSOAXg92u30nvIqQYongr8i8pEDGjPA+ZvgECpnBFDRtv5j1Q0sn12lxiVjYZ8QQhlNljBs=
X-Received: by 2002:a67:f68c:: with SMTP id n12mr5390998vso.42.1615472582853;
 Thu, 11 Mar 2021 06:23:02 -0800 (PST)
MIME-Version: 1.0
References: <20210310081516.27b949e0@canb.auug.org.au>
In-Reply-To: <20210310081516.27b949e0@canb.auug.org.au>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 11 Mar 2021 15:22:26 +0100
Message-ID: <CAPDyKFobBbHra3KH6B+jg1d2=zp0xFZebRKWh68YMpR5Q3PXwg@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the mmc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 9 Mar 2021 at 22:15, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   a7856f326331 ("mmc: dw_mmc: simplify optional reset handling")
>
> is missing a Signed-off-by from its committer.

Taken care of, thanks for reporting!

>
> --
> Cheers,
> Stephen Rothwell

Kind regards
Uffe
