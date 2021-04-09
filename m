Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5818735A4F7
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 19:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234348AbhDIRym (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 9 Apr 2021 13:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234250AbhDIRym (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 9 Apr 2021 13:54:42 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB59AC061762
        for <linux-next@vger.kernel.org>; Fri,  9 Apr 2021 10:54:26 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id l4so9940816ejc.10
        for <linux-next@vger.kernel.org>; Fri, 09 Apr 2021 10:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GuGOCMsxnSRJkFXoL0px3WemZnAxxxYEAqPblSK2aKs=;
        b=sThAnAdSnO3iZHIZPMgbX1ZpXC5ABvIgYDEYyxUSZW9IccFRNN1xNK2emIAW3ZaVnW
         XCokPA+zA8NFFg58OhLhPXBOixpKv154E2ERt/Vgb793MEmxddSnCyZ304LzkdGBDEFF
         3kUYOJFZ54z8fnBl8dS853pdQaroRotAd8toOv5cbJAAwcyZuscUZ+j3XnFEyIbuOdm2
         hSjB/zzJWinuhtGfiYVGuZeraRlZK7f2yH/rD9OpZKleTvjf7U1fO+JTpre9ybofhNRL
         cQai7Mo2sZQYCTa1ZfEgba/7Ah8cLjbGynKXhykOaaB7090u5OnpAtlNlCQRV0ztT4V4
         Qj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GuGOCMsxnSRJkFXoL0px3WemZnAxxxYEAqPblSK2aKs=;
        b=WFfxiiyUZczdAvhtedVr30KTiNmUQt+GpjjaX6/fXJA3BDJtci4PnWYlSW3PzLuz33
         EyQwfhiXCMGC+LOVZzKZNg3KPBZ0N0aDvG/0W3DIy8X0Y+JV/MFLEtYxKt/bb9o4+CrP
         KO21dd3QZFJVTQtjA6+6xbxhm3j/RgvOMrB7XY+woKu238ECqilu5n0IV4pZrmvOJNE4
         e3PggJlPhPTtSgE0/a+6Gu2CIyjiyeWuKHWyo5U2VCXFIrK4/PmiP3/DsZ39GHZ4jrZD
         jgTPMRqgxSUMF/s8YZyrIoloQSWi5xfEikWCo5lJX7a8x1Fq3tMPqE4eqvrqrSE3UqiZ
         /zFw==
X-Gm-Message-State: AOAM532OkTY/wQ7sFv2CCuG57OmgSWHzBOUQuz/f3lB/FCj5Szthwhki
        fFxIwTMTbC1lMU+oTaFRDvghoiWxHe6Iyo6YuF7PUA==
X-Google-Smtp-Source: ABdhPJztzbhO6E534jWeed4RXeQBg6BWEsaaajL/mT6jcMWBCgehqrmsGKzjtxqaNuLdBvIazSo15Sb0n7hgbUgF9Go=
X-Received: by 2002:a17:906:4f91:: with SMTP id o17mr17257086eju.503.1617990865370;
 Fri, 09 Apr 2021 10:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYu60T=vymv7gA0eaopfNDWXAVT9WRS11Rrk1OfTkrCevw@mail.gmail.com>
 <PSAP153MB042218315B664B15A59A80B094739@PSAP153MB0422.APCP153.PROD.OUTLOOK.COM>
 <CA+G9fYvcSK-Z7+VrRbHp7ADDDgw2tWWaqTfQMyC2dxuOYGLz6A@mail.gmail.com>
In-Reply-To: <CA+G9fYvcSK-Z7+VrRbHp7ADDDgw2tWWaqTfQMyC2dxuOYGLz6A@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 9 Apr 2021 23:24:14 +0530
Message-ID: <CA+G9fYuNHTscCZDwGnxv5axibgUw1iRKQ4RJrJxHQpSNrQPaBg@mail.gmail.com>
Subject: Re: [EXTERNAL] [next] ERROR: modpost: "dns_query" [fs/cifs/cifs.ko] undefined
To:     Shyam Prasad <Shyam.Prasad@microsoft.com>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
        "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>,
        Maciek Borzecki <maciek.borzecki@gmail.com>,
        Wan Jiabing <wanjiabing@vivo.com>,
        Steven French <Steven.French@microsoft.com>, pc <pc@cjr.nz>,
        Pavel Shilovskiy <pshilov@microsoft.com>,
        Steve French <sfrench@samba.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 9 Apr 2021 at 23:17, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Fri, 9 Apr 2021 at 21:49, Shyam Prasad <Shyam.Prasad@microsoft.com> wrote:
> >
> > Hi Naresh,
> >
> > AFAIK, this has been fixed in an updated patch last evening. Can you please check if you're still seeing it?
>
> Please share the fix commit and subject here.
>
> FYI,

ignore the below statement.
our build system did not trigger today tag yet.

> This build error is still on today's Linux next tag 20210409.

- Naresh
