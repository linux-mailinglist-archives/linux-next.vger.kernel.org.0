Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E85F2F7EA8
	for <lists+linux-next@lfdr.de>; Fri, 15 Jan 2021 15:57:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728559AbhAOO52 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Jan 2021 09:57:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbhAOO52 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Jan 2021 09:57:28 -0500
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7546C061757;
        Fri, 15 Jan 2021 06:56:47 -0800 (PST)
Received: by mail-oo1-xc2d.google.com with SMTP id x203so2253086ooa.9;
        Fri, 15 Jan 2021 06:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NO0K0dXCtZelpuNUhec8CuaDzfXTrQY8G8j/RO4RKUQ=;
        b=FmdnjoGeom+NzYjZMF8xspzWt7P4wbaYEKKf4CoWFs3Kdkd0A87H5cVKvHJ0Bte5sR
         RBoMKG6eibhcoufqOS9aUBHTUScKunWrFdK73ZroK4w/fgwm64bAWF680q3D5t4uH69j
         Pz7K5AlL8RflekVrpU5iwcyz8uhTibWljAJ9HJOHIRD1JuY8isVS9AesQAt4K+zpoonY
         naozFAfBXLDWh/l6aLqCxrLMZ3TuWwEe0zESi4qRkY12Plo5Kx4MkaHW9Y8lf6QWMd0E
         LbUtjaqLnBBtFQC+iLKe5UaVEBAVJV1o72PeVwDDCLsJr2nJzNJPGA5MScBQ+ZcmyC1/
         DeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NO0K0dXCtZelpuNUhec8CuaDzfXTrQY8G8j/RO4RKUQ=;
        b=n2o1N2DmJzRlC/6mfJqorOF8K/K8AeVoqVBYcFKViRE8pwGeinjrY+R9FvX7gW/Ezh
         zF/WnfYq/d2dUBCMtZk25PEvkvRbacI39PyopcPh3ukXjVbYI/2fk9D/q25Bmf+cOFCS
         3LPxnE8akHgj8JUZqoDsBveWyo5MWYhbPX2vk3OkbQc8zsQoTAgAvHbV+dsEWt6BTK9o
         urWcUyWpV/uyt7bJV+IfP+NUGmt7ZgSyNmvVT/LBiWxopm0aGDlKKwGOM39f9NcVH6ZM
         vvjihAwF/CDxlTAwB1vchx2niwSw3cVjrRxMPNx616tBXVFCXTwNkH/HbLiXxufAWpxa
         t8zw==
X-Gm-Message-State: AOAM531D6a9kiSpDtMjJT1SQUEu5YHQQFg2PWzfxQnl9g1Mboy51f8bn
        8ZA2UJ5PayWuV4GHu/OnVdHJ7enCE+7gjD1OZVk=
X-Google-Smtp-Source: ABdhPJzgaiG/3gsS8pa90VDlTf938WbevA6Pure/5BnlbJkOOiwQbElE6ZbMNYsLwSg7BYtcN/GEmRXgm2aCIvqR4R4=
X-Received: by 2002:a4a:a2c5:: with SMTP id r5mr8405442ool.72.1610722606624;
 Fri, 15 Jan 2021 06:56:46 -0800 (PST)
MIME-Version: 1.0
References: <20210115163505.4132a5b3@canb.auug.org.au> <20210115055703.GA1258199@hr-amd>
 <MWHPR12MB12481AE693629C4F60368519ECA70@MWHPR12MB1248.namprd12.prod.outlook.com>
In-Reply-To: <MWHPR12MB12481AE693629C4F60368519ECA70@MWHPR12MB1248.namprd12.prod.outlook.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 15 Jan 2021 09:56:35 -0500
Message-ID: <CADnq5_NqvfQZLfuYFqz7rimPA82qGxA2RUP=gyzt-mqSFrVyTw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the amdgpu tree
To:     "Huang, Ray" <Ray.Huang@amd.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jan 15, 2021 at 3:46 AM Huang, Ray <Ray.Huang@amd.com> wrote:
>
> [AMD Public Use]
>
> Could you please help to check whether this patch can fix the issue?

Looks good.  Might want to add a comment where you set cpu_core_num
that this is only used on APUs which are x86 only.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

>
> Thanks,
> Ray
>
> -----Original Message-----
> From: Huang, Ray <ray.huang@amd.com>
> Sent: Friday, January 15, 2021 1:57 PM
> To: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Alex Deucher <alexdeucher@gmail.com>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.org>
> Subject: Re: linux-next: build failure after merge of the amdgpu tree
>
> On Fri, Jan 15, 2021 at 01:35:05PM +0800, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the amdgpu tree, today's linux-next build (powerpc
> > allyesconfig) failed like this:
> >
> > drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c: In function 'vangogh_get_smu_metrics_data':
> > drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:300:10: error: 'boot_cpu_data' undeclared (first use in this function); did you mean 'boot_cpuid'?
>
> Ah, vangogh is an x86 cpu, let me look at this issue.
>
> Could you share me the config file you tested?
>
> Thanks,
> Ray
>
> >   300 |          boot_cpu_data.x86_max_cores * sizeof(uint16_t));
> >       |          ^~~~~~~~~~~~~
> >       |          boot_cpuid
> > drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c: In function 'vangogh_read_sensor':
> > drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1320:11: error: 'boot_cpu_data' undeclared (first use in this function); did you mean 'boot_cpuid'?
> >  1320 |   *size = boot_cpu_data.x86_max_cores * sizeof(uint16_t);
> >       |           ^~~~~~~~~~~~~
> >       |           boot_cpuid
> > drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c: In function 'vangogh_od_edit_dpm_table':
> > drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/vangogh_ppt.c:1460:19: error: 'boot_cpu_data' undeclared (first use in this function); did you mean 'boot_cpuid'?
> >  1460 |   if (input[0] >= boot_cpu_data.x86_max_cores) {
> >       |                   ^~~~~~~~~~~~~
> >       |                   boot_cpuid
> >
> > Caused by commits
> >
> >   517cb957c43b ("drm/amd/pm: implement the processor clocks which read by metric")
> >   0d90d0ddd10e ("drm/amd/pm: implement processor fine grain feature for vangogh (v3)")
> >
> > The only thing I could do easily is to disable CONFIG_DRM_AMDGPU for today.
> >
> > --
> > Cheers,
> > Stephen Rothwell
>
