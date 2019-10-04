Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCC1CCBEA3
	for <lists+linux-next@lfdr.de>; Fri,  4 Oct 2019 17:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389540AbfJDPJM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 4 Oct 2019 11:09:12 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50913 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389451AbfJDPJM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 4 Oct 2019 11:09:12 -0400
Received: by mail-wm1-f68.google.com with SMTP id 5so6225624wmg.0;
        Fri, 04 Oct 2019 08:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mW3Y0VrUb6wZtyxebbfB9Jk1tCRtuYl5oPC9U9Ftd/E=;
        b=nOY2keZsqmpuH1xbeDCnZt1MEiYieW9JrPr/H+MW3gfONPqSwgKkWjBnwCnD3bsItw
         9LwJCibDag0hBLErXz3izWl1UlY10ST+Bv3Z8dNqH50N/iyy/oOD0z1oAW14MLvVy16l
         +l/L6rcf8JaqteOYGyWtE+lBLK8gGhsawZ6x92i+ovKxPnjN8+HuXqatlY9c4yK6dJQw
         WAT9cSo971e/xlqQf6HVBh1SzzYKRUSHqXRDsyK8fPyfVYfOvOXbomyOT5qTDLOyw4Tf
         KCaNnW3eHnuQDRrzNUFxzNCnrpv4nwi6qG7PV2esRAG6hsNb5Bpm2wnYZ8sgbOoIbghv
         Jllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mW3Y0VrUb6wZtyxebbfB9Jk1tCRtuYl5oPC9U9Ftd/E=;
        b=ji4s+5c1jCr4WLuGzHmZGsiPs87JWctV4tlBx6+BoPaw0s2ZAO878TVvCCMiAuSfRQ
         Jlr2kHhJebE3xl12oFyj7VV3I2jkhMrllw89u1qE1DkP99FSQGdcKbP7FijN7bTPx7Sp
         E2c8It03M+aD7CvrubTZTxENIaGVugDZpgV+dDJMydQ1xZMGg4Q9msTjaP+u9IgJVkzU
         1CJbBe3g2wFB1OpPtdpz4o9iSW4CJfoRMBRTmzYD+ou/aoApTXsHU9x6J3aacJO427Os
         uIS6Yt/gFoiMh81r9udPyo3R0z4Cd4RekA5+i28wlVx9MyBMXEuB17oD6uIagBAPnGRU
         c0EA==
X-Gm-Message-State: APjAAAWGOshkOJYp80YBnOip0C0TrOjVzP4toXXapuLJPk7KuMj5j7Nz
        fZwEqblGVDAgdOg+3v0Ouri3BsyTm3pxG7CP8tZcSGHx
X-Google-Smtp-Source: APXvYqxneG+7AABZBLJ88L0DfeVJhZB3AgCn8Tok8QL2HTCnFpF8wIJhlR87UC42+UfW2wxt1qlX1BJsx1dRmRKkM6I=
X-Received: by 2002:a05:600c:2308:: with SMTP id 8mr11848180wmo.67.1570201750315;
 Fri, 04 Oct 2019 08:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191004155929.3ac043b5@canb.auug.org.au> <06969836-ac7f-0d18-1866-159e48018d98@infradead.org>
In-Reply-To: <06969836-ac7f-0d18-1866-159e48018d98@infradead.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 4 Oct 2019 11:08:57 -0400
Message-ID: <CADnq5_P8Z4jC9ZiW4F=3w26=V_Ft+_qTvC5OesaYmM0nMbT_MA@mail.gmail.com>
Subject: Re: linux-next: Tree for Oct 4 (amdgpu)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 4, 2019 at 11:08 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 10/3/19 10:59 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20191003:
> >
>
> on x86_64:
> CONFIG_DRM_AMDGPU=y
> # CONFIG_DRM_AMDGPU_SI is not set
> # CONFIG_DRM_AMDGPU_CIK is not set
> CONFIG_DRM_AMDGPU_USERPTR=y
> CONFIG_DRM_AMDGPU_GART_DEBUGFS=y
>
> ld: drivers/gpu/drm/amd/amdkfd/kfd_device.o:(.rodata+0xf60): undefined reference to `gfx_v7_kfd2kgd'
>

Fixed:
https://patchwork.freedesktop.org/patch/334412/

Alex

> --
> ~Randy
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
