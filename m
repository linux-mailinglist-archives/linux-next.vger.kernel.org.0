Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BAD31ED824
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 23:44:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbgFCVoo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 17:44:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgFCVoo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 3 Jun 2020 17:44:44 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0703EC08C5C0;
        Wed,  3 Jun 2020 14:44:44 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id d128so3604690wmc.1;
        Wed, 03 Jun 2020 14:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+yAvhub8sTxM3gTatxTKu08jxopfkyMEa6lUTC8uDRg=;
        b=HpFtuwTRFecplFuSTnU3TaJmgj57jJMBpSaTHisrXQjT76WYx2y895URYnM1MhfyMh
         NBynJYsGVpnlOW7ghI7K83YlVtm3EyCIZ6yuS26sNzh48AuMa6RwB9pgpbTfGzuM9dWZ
         LlNdqAikRYswoS8b4Hvi3Q7nilPIemxfzsNn53ck32Lx2rqpBEUZL6Bypp1JY1NjT5Eg
         Yi7nwPQO/3NzdYdfylanhXmyTKoJNAfOd1Zpf7Fm/uMWBoPyYgN64YrTRwf59XrLlEtb
         at0nGgNY6bsKpBbAtGuX4uND4AM9h1qk/22zQlHHvzrSgrWhYLJSSDucsBK1kYnz7pFX
         zdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+yAvhub8sTxM3gTatxTKu08jxopfkyMEa6lUTC8uDRg=;
        b=ht9X9+7/sv3+2gsTvRNrKfe6cQSSvivWsgPYJ7xD2TFyDeruEk7K290YMT93XZephE
         4FMRuw2eAkQ80lhiEsGo+u0/qGWALuf+W5k7j4c/ycavsj+25joGpLr5tLYUu5LZI8OP
         oxcewm7qAYvbbZHzSCvRETLpB17Nt4CiRN7hd3ZjVd+Sj0A6Ddsfrm/5tBkDXlD95azX
         3DVvagc9iGH8l26pHTAzd7NkwNVTUGMlK9TNSVxMbagkMwVDhEYiaR5E5O0VGoNJ5vIf
         F4hn8wXOwWh0XovmBF33ZR4x65nArordGPiESRvEJE8rJM0lsG1rHS0is0X75pxtxwmW
         j9RA==
X-Gm-Message-State: AOAM532ckh9Gcp3a8ZLGJCRraCFQiUFTzokP/7qsGh27m3ABctoMR4Zt
        4ushqWBmJ6JYnR1M7Q4WzbVVJi90T5XfL6DbG2JPbg==
X-Google-Smtp-Source: ABdhPJwIzGRzccpTjHF91zlEsgjGbu7/ZbtGVh3EDbM5YyW4WLWaV5c9/UNXqB5RKBfk4BvG+eSdGJjB1OE+BerkdVs=
X-Received: by 2002:a7b:cd96:: with SMTP id y22mr1047727wmj.56.1591220682782;
 Wed, 03 Jun 2020 14:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200604073544.1ef1e38a@canb.auug.org.au>
In-Reply-To: <20200604073544.1ef1e38a@canb.auug.org.au>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 3 Jun 2020 17:44:31 -0400
Message-ID: <CADnq5_P0SCBUE=zmg0Bezp=6C7x32-T4DW0+iSsJmrYtaB=sJg@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the amdgpu tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jun 3, 2020 at 5:35 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commits
>
>   2967442ac479 ("drm/amd/display: Add DCN3 to Kconfig")
>   4e7406acd3e6 ("drm/amd/display: Add DCN3 blocks to Makefile")
>   b8163750954c ("drm/amd/display: fix and simplify pipe split logic for DCN3")
>   a6a7b1845598 ("drm/amdgpu: Enable DM block for DCN3")
>   5aa25fb310d5 ("drm/amd/display: Remove Unused Registers")
>   ea05812d2d55 ("drm/amd/display: Handle RGBE_ALPHA Pixel Format")
>   b663d733cbe1 ("drm/amd/display: Init function tables for DCN3")
>   19e1ceaeaadf ("drm/amd/display: Add DCN3 VPG")
>   889bc1fa55f5 ("drm/amd/display: Add DCN3 AFMT")
>   0e5cf8885f67 ("drm/amd/display: Add DCN3 Command Table Helpers")
>   3086e21408a6 ("drm/amd/display: Add DCN3 Resource")
>   3fbd2731be3e ("drm/amd/display: Add DCN3 Support in DM (v2)")
>   581b9589487e ("drm/amd/display: Add DCN3 HWSEQ")
>   ca2e97c317ad ("drm/amd/display: Add DCN3 DMUB")
>   c8728a921074 ("drm/amd/display: Add DCN3 GPIO")
>   e51d66e1d338 ("drm/amd/display: Add DCN3 IRQ")
>   3ab489724031 ("drm/amd/display: Add DCN3 DML")
>   202ad3f23604 ("drm/amd/display: Add DCN3 DWB")
>   8905a0576034 ("drm/amd/display: Add DCN3 MMHUBHUB")
>   481beb130dec ("drm/amd/display: Add DCN3 HUBP")
>   ee52a594ac12 ("drm/amd/display: Add DCN3 HUBHUB")
>   7dcc0bbf90d9 ("drm/amd/display: Add DCN3 DPP")
>   c37075e358b6 ("drm/amd/display: Add DCN3 MPC")
>   5629c57da234 ("drm/amd/display: Add DCN3 OPP header")
>   86f1f7c7bc4f ("drm/amd/display: Add DCN3 OPTC")
>   f0d3ced5769c ("drm/amd/display: Add DCN3 DCCG")
>   bce3430d79d4 ("drm/amd/display: Add DCN3 CLK_MGR")
>   ca1404079b72 ("drm/amd/display: Add DCN3 DIO")
>   639f7ee6f6d3 ("drm/amd/display: Add DCN3 chip ids")
>   5fa689e66bf4 ("drm/amdgpu/powerplay: add smu block for sienna_cichlid")
>
> are missing a Signed-off-by from their committer.

Fixed.

>
> Is all this new stuff really destined for v5.8?

No.  5.9.

Alex

> --
> Cheers,
> Stephen Rothwell
