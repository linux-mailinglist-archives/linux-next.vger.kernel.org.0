Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2643DBAB1
	for <lists+linux-next@lfdr.de>; Fri, 30 Jul 2021 16:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239141AbhG3OiL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Jul 2021 10:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231255AbhG3OiL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Jul 2021 10:38:11 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC076C06175F;
        Fri, 30 Jul 2021 07:38:06 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id z6-20020a9d24860000b02904d14e47202cso970168ota.4;
        Fri, 30 Jul 2021 07:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SI25ow92uZg+BEB0RQ5f76l9YsfOVkkwHkMuJVkTQbo=;
        b=nm4KNOhAX8VAnpPT8J2+3gPGVJx389TFMyTRjhX1GK0PKsMo+5ydL2u2hu+ZwdrVCU
         xLw6Pgq65ioerSCoN4qgMojjtq8JkGM4T3oDoGbGfOq1SbLJcG4nGPNTbW7Q1odLbhXb
         po8ou6GMAi79k3Uwr+Ctk2LyJmDG96fLK8Gi83aE+tacL7aGE3B/G3GFqlYGFKng8z0U
         btC8zhVBbKQ7UyocO06TiOKIAnFtK0dKIvQtJFWZy1jpy2RgrUIFMOrDp+JBDS3x2Fjx
         52oTEIqnEoR3JYvhn9Lw8vH4nYjG9EU73G9BYSOlNuM7F116E8UWnOrlPYEjPk8bEK2q
         okiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SI25ow92uZg+BEB0RQ5f76l9YsfOVkkwHkMuJVkTQbo=;
        b=Db/R2rBaH7gZ5Om/ZkLeyhc5I2ZuQOC4C42Vehp1rnE0Cl1kJz997O/Ubgq0kcirlq
         RENlWG46m7/U6Zfg1O8vYB6MNzCdlojzuTa5Ah5oI5DCME6FWn0N3WDwzmtJgOV+odJ4
         Chr/E2AQOAyCJptkYASo0/bOejAdNb/st7qw9V0fw+iYv1rtCxwNGBPf63SrI0d6P3p3
         n9ycMBBpwIU1jrCCuoF7iJ22c7b/teCQylSBKbdpPIcSOoid1t3LhScQyXN6ja09RoHL
         Wy636YVBO1Z7lygmsuC0zlmeovFU902wQA/D8NybQ2X1TFCK5E8wJq8a24BSVMh9Hf1t
         s6AQ==
X-Gm-Message-State: AOAM530qKQ+rk4IQF/24rGkvjdq9fedKFbmKezy+rKg/wPW1Z0zGIE7K
        Rv4p/oTU3bJfbd0/14FMXofAwwArSHzYmeTkexY=
X-Google-Smtp-Source: ABdhPJyp6Y5YIGa0VrmyMO+wfLAp/fxsN36Xdb5hvOSq9M3mXfE2z2vcjQmGShhZgxi19K0zkyBH9EQR8bYYK9iBaRo=
X-Received: by 2002:a05:6830:1c2f:: with SMTP id f15mr2283318ote.23.1627655886012;
 Fri, 30 Jul 2021 07:38:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210730030347.13996-1-rdunlap@infradead.org>
In-Reply-To: <20210730030347.13996-1-rdunlap@infradead.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 30 Jul 2021 10:37:54 -0400
Message-ID: <CADnq5_PPYtdb17WLtgjeS3THXBeHw_DyMKueZ4LP8cVS1G8Tcw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu: fix checking pmops when PM_SLEEP is not enabled
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Applied.  Thanks!

Alex

On Thu, Jul 29, 2021 at 11:03 PM Randy Dunlap <rdunlap@infradead.org> wrote=
:
>
> 'pm_suspend_target_state' is only available when CONFIG_PM_SLEEP
> is set/enabled. OTOH, when both SUSPEND and HIBERNATION are not set,
> PM_SLEEP is not set, so this variable cannot be used.
>
> ../drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c: In function =E2=80=98amdgpu_=
acpi_is_s0ix_active=E2=80=99:
> ../drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c:1046:11: error: =E2=80=98pm_s=
uspend_target_state=E2=80=99 undeclared (first use in this function); did y=
ou mean =E2=80=98__KSYM_pm_suspend_target_state=E2=80=99?
>     return pm_suspend_target_state =3D=3D PM_SUSPEND_TO_IDLE;
>            ^~~~~~~~~~~~~~~~~~~~~~~
>            __KSYM_pm_suspend_target_state
>
> Also use shorter IS_ENABLED(CONFIG_foo) notation for checking the
> 2 config symbols.
>
> Fixes: 91b03fc6b50c ("drm/amdgpu: Check pmops for desired suspend state")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-next@vger.kernel.org
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linext-20210729.orig/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ linext-20210729/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -1040,7 +1040,7 @@ void amdgpu_acpi_detect(void)
>   */
>  bool amdgpu_acpi_is_s0ix_active(struct amdgpu_device *adev)
>  {
> -#if defined(CONFIG_AMD_PMC) || defined(CONFIG_AMD_PMC_MODULE)
> +#if IS_ENABLED(CONFIG_AMD_PMC) && IS_ENABLED(CONFIG_PM_SLEEP)
>         if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
>                 if (adev->flags & AMD_IS_APU)
>                         return pm_suspend_target_state =3D=3D PM_SUSPEND_=
TO_IDLE;
