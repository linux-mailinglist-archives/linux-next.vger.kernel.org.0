Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C28C086919
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 20:54:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390252AbfHHSyH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 14:54:07 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39895 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390228AbfHHSyH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2019 14:54:07 -0400
Received: by mail-wr1-f66.google.com with SMTP id t16so5815355wra.6
        for <linux-next@vger.kernel.org>; Thu, 08 Aug 2019 11:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LOP3JntYPgb4inWvNcmObUOMv1XMpxVUdJZwgqRnphQ=;
        b=eaQQQALibSFNaHCTtKDmgbd6OwQvK7RGFuHD6JI1IJGY+L0d6D9+9MLhpt/Zcuuxpc
         R/pui5mbXDUebn2oc5ZC5exlpHHbetvpA1S82Ttkyxq7mAashE7oUxu31+OVvABkfyRD
         OStZAGKWnEQQp2enyfGH7YIAux0R9TkCZqClnmhTukh7FqHHWf6Wq2ETjGDoVzhBSsd1
         sRzPUdDD41PxRH4rPo/PZDqiB4spDOm7rkOLOgp+Qy+6rfX15sckDpVrzrKi482/KqY1
         M3d9smR9bOuDG/wzPuz6CzQUU8T/z84Ze45Qh4NLGGyuxLycASdx9AE+ub75tHCIZfze
         4zGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LOP3JntYPgb4inWvNcmObUOMv1XMpxVUdJZwgqRnphQ=;
        b=nf6Th0L2bXC9FjbQJZsiBiOfhe2l9p3c4zA0HRJmVQak6/994SZYBXVgLIu6+dJ3sa
         I20jsk0NdOd8GrZYhY6PwoSzC31SV+I9K5k2NvLnIa/wiTIuXdsE76YEXox8A4rQSAA1
         qmrlwa21cZZ1l7Gpfv+h8MsoBLqyeAqUKLj9CR2kvR4TznA3V/9ChoVjCr8FLSrvnfno
         advuAqLz7OunP64oj9o9T+6u6mUgOee1lqSXGfkkbH/NhwXkRlBZFsC6r3360Mpq8Hiu
         GxTxHW2OWBNTVeEkrKWS3CSJ5SKPCQUCvR94WvEtlMouDGSxmzzVWLxyBUAEqJqN0iFi
         n4Ww==
X-Gm-Message-State: APjAAAWB6YpCTzhWSjStFr1blwXMNMn4eJvzb9B8d8031zRNGbNmCQTk
        YpSUVYPhFyIXdzBTyS2vUC+M6/Ms4TVbw2cLEC5Ubqsk
X-Google-Smtp-Source: APXvYqwHdYZA2F2s3/isE9T5301ZzT69++eZM1KslECeXSEnQQ5qDk0pE15X4tdOrg8UzJKAGqstnnoZHpTP8wjEkQg=
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr19608509wrc.4.1565290444617;
 Thu, 08 Aug 2019 11:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <5d47f990.1c69fb81.a5d88.ee1f@mx.google.com> <20190805111205.GB6432@sirena.org.uk>
 <20190808184149.GA441@roeck-us.net>
In-Reply-To: <20190808184149.GA441@roeck-us.net>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Thu, 8 Aug 2019 14:53:52 -0400
Message-ID: <CADnq5_NL6+AohC-3HJa+84k50ewqYLMy_VuFmgY=aw872JFf-A@mail.gmail.com>
Subject: Re: next/master build: 230 builds: 5 failed, 225 passed, 6 errors,
 1344 warnings (next-20190805)
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Mark Brown <broonie@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        David Zhou <David1.Zhou@amd.com>,
        kernel-build-reports@lists.linaro.org,
        David Airlie <airlied@linux.ie>, Tao Zhou <tao.zhou1@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Dennis Li <dennis.li@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Aug 8, 2019 at 2:53 PM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Mon, Aug 05, 2019 at 12:12:05PM +0100, Mark Brown wrote:
> > On Mon, Aug 05, 2019 at 02:40:32AM -0700, kernelci.org bot wrote:
> >
> > Today's -next fails to build an arm allmodconfig due to:
> >
> > > allmodconfig (arm, gcc-8) =E2=80=94 FAIL, 2 errors, 16 warnings, 0 se=
ction mismatches
> > >
> > > Errors:
> > >     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:279:9: error: implicit=
 declaration of function 'readq'; did you mean 'readb'? [-Werror=3Dimplicit=
-function-declaration]
> > >     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:298:3: error: implicit=
 declaration of function 'writeq'; did you mean 'writeb'? [-Werror=3Dimplic=
it-function-declaration]
> >
> > due to 4fa1c6a679bb0 (drm/amdgpu: add RREG64/WREG64(_PCIE) operations)
> > which introduces use of readq() and writeq().
>
> AFAICS this problem affects all 32-bit builds, including i386.
> Is it in the process of being fixed, or should we submit a
> patch limiting DRM_AMDGPU to 64-bit builds ?

Yes, the fix is being discussed here:
https://patchwork.freedesktop.org/patch/322213/

Alex

>
> Guenter
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
