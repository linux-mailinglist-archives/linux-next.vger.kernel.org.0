Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941C43D93C4
	for <lists+linux-next@lfdr.de>; Wed, 28 Jul 2021 19:02:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhG1RCb (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Jul 2021 13:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhG1RC3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 28 Jul 2021 13:02:29 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62CB5C061757;
        Wed, 28 Jul 2021 10:02:25 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id j1so6098497pjv.3;
        Wed, 28 Jul 2021 10:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JGFDDjacBRjxyAnzN4CvLDDxGvGaTiT/tmmgH6BU6SE=;
        b=n2QuhUDGM48atZWRY/aljXhxd9/Ay3bGpZVPfiM9Nt0A+y3sCcsfMa46IuBp/Zdy3B
         LqCgFGmGrhfp1datijDUx+gY1Jar9Guez8AlxGKcaNgXlJzD891dOtZCWhsnznDzhi4A
         zlcMXd4RuWrF1xrz3KM4Itl9JYllp8AJMQfLgl/Y+mKszdZDuZM32+wR/u/fIxO8P6oc
         8Xtc97OQALykME7uo1zctiMLSZ7rxJRnJWUpNc9vcNW1ee1Pl5aMugQnGgbHSkRbZL+W
         N2dhyLEfuva8CJX0e6fFI/ol2Qu1kLL6Gtl8ZrppsmeTiU08PTQshXimEAVi8ANkvXUf
         Kalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JGFDDjacBRjxyAnzN4CvLDDxGvGaTiT/tmmgH6BU6SE=;
        b=pwRusiS/S5zmKMyFIrARimXTnVowxypSFF65El/yigCsbHD5yFAE6IpLjSzEdKKvS+
         VdoCmOsYvsSE4b4MPtCJzJgX2BxlvxD/7D+rwCgbOVWwVqLJKkbcLom2nPzC1Z1FzXLr
         mSD4nKZnupkS5QHvxrKpdw0370w425LswU3lEoRC70lNTmTPt5UcLbvVsj6v87OxSvGD
         Z5CjfTFwfSd4hqtlCtodvJvneeEF128xtUGwMBAxlSvW/g7KKjXO/1tgTAx26kPMnzCj
         Yu3iFFcc1Es5Y1H7WlJk+jOpnI8x7ptgOWvNc+IqgJj41CrmYlTOGbkjPbmYVxb81QXW
         dREA==
X-Gm-Message-State: AOAM530WqlLMGboki95746g2sCOscQ9X4FbF02qUV6SXHQPhxp7IuE3D
        OcuDuEc5MWAkQo86JUH/k3cG9E9tdZ+1i145d8s=
X-Google-Smtp-Source: ABdhPJyW8YD9ucztMeB9MdK83Zh6EDesq/+KxR0bBFUhv5UtQd61jJyeNfi0FOOJsVZ9hRC7PJTyc97iovetydrjlHU=
X-Received: by 2002:a17:90a:7146:: with SMTP id g6mr733453pjs.228.1627491744801;
 Wed, 28 Jul 2021 10:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210728164847.46855-1-broonie@kernel.org>
In-Reply-To: <20210728164847.46855-1-broonie@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 28 Jul 2021 20:01:45 +0300
Message-ID: <CAHp75VcP2V2j_ZHtc9y9Jw527E8PZaoFngsXD3oA0Yvmm=L4SA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drivers-x86 tree
To:     Mark Brown <broonie@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mark.gross@intel.com>,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 28, 2021 at 7:49 PM Mark Brown <broonie@kernel.org> wrote:
>
> Hi all,
>
> After merging the drivers-x86 tree, today's linux-next build
> (x86 allmodconfig) failed like this:
>
> error: the following would cause module name conflict:
>   drivers/misc/c2port/core.ko
>   drivers/platform/x86/intel/pmc/core.ko
>
> Caused by commit
>
>   29036fcc92b22d ("platform/x86/intel: intel_pmc_core: Move intel_pmc_core* files to pmc subfolder")
>
> Since there was nothing in the branch yesterday I've just dropped the
> tree entirely.

Yeah, PMC Makefile should keep the object name the same, something like

obj-$(..._PMC_...) += intel_pmc_....o
intel-pmc_...-y := core.o ...


-- 
With Best Regards,
Andy Shevchenko
