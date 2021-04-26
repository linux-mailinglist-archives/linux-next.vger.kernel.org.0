Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B403536BC25
	for <lists+linux-next@lfdr.de>; Tue, 27 Apr 2021 01:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234579AbhDZXkw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 26 Apr 2021 19:40:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234458AbhDZXkv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 26 Apr 2021 19:40:51 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E79AC061756
        for <linux-next@vger.kernel.org>; Mon, 26 Apr 2021 16:40:09 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id w3so86992282ejc.4
        for <linux-next@vger.kernel.org>; Mon, 26 Apr 2021 16:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vw/q1N9vMicwTdxGLHITsHnCd0VrdAA0I/RrXTIhVOI=;
        b=XNPk5lG2U3zyNjaKNuF1C8i1rPntHZBPQPZL/nfKK3D8V9c0WHVqvn2Afyi/RExFMU
         p0Sy8ZX8EM/MfzD+DU6Emiyf593K8wv7r+xY8zoZgcqdD39Tb5C+oUAba/RVJ7GV0U14
         5R/4K+5ZWB3aY+g1cSgnLc9oITNMPhFjXz728=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vw/q1N9vMicwTdxGLHITsHnCd0VrdAA0I/RrXTIhVOI=;
        b=B8rUHY+AjvEG3+llZ7+VfBxEt3ZPkpxzeAly4RGFJvnmeIMEGm1T1xeqq/ebXWHynN
         EsxbBA3F86u1AeMI8Ts0kIknpU7OiyYj1zkc2HiJPTo8GDl3enWlB3ogBe7ZQXex2/BS
         PLLDVIXFeMiwYXZi/+Z/PFtUGMnsQ1cAxSspzSEmkuYKNdpd+uhXdeJbr+ZDVOyGY35+
         tECackcGPq6F/qYVv3E/d4Y6O1mdnqCDMUPu10BU4F8l5jNUa4glLaq/uki8QAfHi3DT
         N285u2WfFxI7y19OAmt7QysOVv4btCV5Ef+hNA1P+odz8bfcTbUSE6u6c0s8Krks+OEC
         wtgA==
X-Gm-Message-State: AOAM532iL6MSrvseiNyXoY8mJNLlThVjIHgwxkrPG+A8TfJ9+KXgZUvA
        /0y7iQdCaLZl1Oh/6h+RcrMEfwxOFItHFNPEyeJTtiaSW8o=
X-Google-Smtp-Source: ABdhPJwpHC44uVJBxlPBTC49UbsEm4N+0n1Sb5Bp5vY2HO/P/273acyvKxuXCnQFmrQvavZlMq1qNB12n/BHwhbZHT8=
X-Received: by 2002:a17:906:13d6:: with SMTP id g22mr20750757ejc.475.1619480408197;
 Mon, 26 Apr 2021 16:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210427083307.15c6cd15@canb.auug.org.au>
In-Reply-To: <20210427083307.15c6cd15@canb.auug.org.au>
From:   Micah Morton <mortonm@chromium.org>
Date:   Mon, 26 Apr 2021 13:39:57 -1000
Message-ID: <CAJ-EccMspu59MC_DwD0No15NTOM9pbGCX94P+o8aTX26uAGN9A@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the safesetid tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Apr 26, 2021 at 12:33 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   290f1097a2bc ("LSM: SafeSetID: Fix code specification by scripts/checkpatch.pl")
>
> is missing a Signed-off-by from its committer.

Oops, thanks!

Fixed

>
> --
> Cheers,
> Stephen Rothwell
