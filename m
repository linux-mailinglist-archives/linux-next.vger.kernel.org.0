Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D2B402DD4
	for <lists+linux-next@lfdr.de>; Tue,  7 Sep 2021 19:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238674AbhIGRoq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Sep 2021 13:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbhIGRoo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Sep 2021 13:44:44 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF59C061757
        for <linux-next@vger.kernel.org>; Tue,  7 Sep 2021 10:43:38 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id g184so10792732pgc.6
        for <linux-next@vger.kernel.org>; Tue, 07 Sep 2021 10:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lqwUbYH10yU7MeGsUaFiPo7qZbwKlSS2XiBb3FPapD8=;
        b=lKx2rrU1ztadshXEidn+Xm1KEocYYVZI9KeUxEWOtzv8EkwbzAloRRnia/EHQ0AUnU
         4/NAEhIc1VIiPrR+F2QQVeT7Tn9aEnfrPM+L/561NwCaEKLVFu1XtxsovCVtIkssmHis
         2pmtR82t9pmP/hiVcIGmVw3wbxCav30E2j9mzM5hIL9sv/LX0aOebmWI9mhTMUee6xzo
         t9Jxj+3SYJFl98ncNPmY5layzsUw8MVLDtZ/AUj+QR0Zd3b+aLlnwxFfLaeZ1j05wzjD
         ux4MvK0xrzWqP2ja29LKhuMxuP2FrBJ+o/vc5b7rtLALWcIo49z4zWpn2LVjkLUHH/d3
         88ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lqwUbYH10yU7MeGsUaFiPo7qZbwKlSS2XiBb3FPapD8=;
        b=aEUwyS4Nq/Z6D8t7qyyF3O5ZMRVNWfeKMAqOP7PloGx72X8zoHCp10VRub6Ptpmesd
         LE69/C3w2lCrDMAoa2gCOdvzlWZ4NTSYMBBTP3KZJ3JDtMaupgH4V2u8FX8OZK4zJF3l
         NPjG52OttyDzX5eCrDkE6Mu2IsVbt8a6M5xd7FjVZrsnZ+XI3WLtZuVyBs+QCvydpwWB
         IhGErkZiUIJhErDMAoklzggm9UTbdqPo+gytmdakl5H+pxwLFnDjxFCzoDonuDRszcHt
         oLEjLr8O8GMXgQhkUJMDpeLllHKKzdTmcj9mKE7s5/EoTv+K7QlRW2TJw7d7GFUGZ/dA
         Z6dQ==
X-Gm-Message-State: AOAM532XVWvtkIXc0oYbkD7yjQCOkQo8Zs9VY/ueN+yJqcY6+cIAO+ID
        BW41NunlnT1axZTufyUC/t2kbnhlKrZ2sNEaA/H90Qka8ME=
X-Google-Smtp-Source: ABdhPJyyDhFDo9smGv6KpQDswNiKCX9+8fgALhkfPGkcKWUVrfkE10SeT/PZSkNnTqVoL2xCobfI3W1cx5t2bZm5SXE=
X-Received: by 2002:aa7:8298:0:b029:338:340:a085 with SMTP id
 s24-20020aa782980000b02903380340a085mr17912192pfm.46.1631036617612; Tue, 07
 Sep 2021 10:43:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210906142037.59f76dab@canb.auug.org.au>
In-Reply-To: <20210906142037.59f76dab@canb.auug.org.au>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 7 Sep 2021 10:43:27 -0700
Message-ID: <CAPcyv4gSW0Rkz24eCs9gHE_hPZzPWbNXU1TMNGSHGW0sqvUgTQ@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the cxl tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Sep 5, 2021 at 9:20 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the cxl tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> drivers/nvdimm/label.c:750:32: error: 'uuid_to_nvdimm_cclass' defined but not used [-Werror=unused-function]
>   750 | static enum nvdimm_claim_class uuid_to_nvdimm_cclass(uuid_t *uuid)
>       |                                ^~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>
> Caused by commit
>
>   d68bc4b2338b ("libnvdimm/labels: Add address-abstraction uuid definitions")
>
> Exposed by commit
>
>   3fe617ccafd6 ("Enable '-Werror' by default for all kernel builds")
>
> I have applied the following patch for today.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 6 Sep 2021 14:14:52 +1000
> Subject: [PATCH] cxl: mark unused function as such
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/nvdimm/label.c | 1 +
>  1 file changed, 1 insertion(+)
>

Thanks for that Stephen. I'll just back this patch out and retry for
v5.16, it's not super critical.
