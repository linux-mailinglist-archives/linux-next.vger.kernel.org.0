Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9713A4C9B3D
	for <lists+linux-next@lfdr.de>; Wed,  2 Mar 2022 03:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234756AbiCBCdw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 1 Mar 2022 21:33:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbiCBCdv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 1 Mar 2022 21:33:51 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3255E4C7B0
        for <linux-next@vger.kernel.org>; Tue,  1 Mar 2022 18:33:08 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id j5so466502qvs.13
        for <linux-next@vger.kernel.org>; Tue, 01 Mar 2022 18:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lSiSPFe8iX4s/Cskxwb02KRknvY9DHD+1TS5sjTtth4=;
        b=fnbbwNmU7rBK+eDNfT5Q2EaTJe8Y+GrN2Xl8IUIU0/3ijzM+MeibxSa9cIODY9sw5b
         J9jVWftN6B3jhM/q9Q7mjTdZKCImRiO/BpwykvUqXU1+joEreU7xSh+Q7Cpu0p3Dsn5g
         Zjvxih+xAxi4w34QHe5PysysqeHTk+c0NFf0xZc5QLIInRN6M8pFu6oNUepiPVDmtc59
         o217fXl594Jdbrqzfn/Hn9Hu9NGWfssRZrg7JGFntwraSCA5ThIRBzXV8aZojsu7zOUH
         nFPXo6cxnb9bFVnDo8AvUbs1425mSfCvTAXten/j3bm3L/yDtvV/GvyiP4iBUh82lv9S
         DWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lSiSPFe8iX4s/Cskxwb02KRknvY9DHD+1TS5sjTtth4=;
        b=MuMJonyRWnP77Frm47p5KVf3qZTuRQn5SBJMzsfhttqaHcOPGyqV6le57S3g0PnfKJ
         aHgUSKsq/ougG/A31mEJiPNw9jY1aSiGJTXjCsubgaLN8xKjL8jQHhWZjlU6dPZEfTBy
         bpPwjlgBDsUcMRqikAUQEkPyKjvsqVkvB5EBMb43fe1izT0XbCGnpeZEcH+1wldSVNv7
         1jzZDMRnSCOTnpSqW8HDKpExYHjObo18pKnE7ptQ4UVVAxfmRepJykJsysxesz2DNGzm
         8mLl8x9+ImyRL2y+1O80WGzL78P0FVZStIItiicrDmiCVbTjYIs1YJSF1UBrndM0tlF9
         89TA==
X-Gm-Message-State: AOAM531EX7ywTvrvqNekOFvhAp6OF6n1kjI8wQH0KSxrn/jeBenqYk8e
        dqahMj1fgo8OmjfEntLMH0qMetLBOjk86iXJ7lV9LA==
X-Google-Smtp-Source: ABdhPJwBXWIugiCEDwQdJHl1jccJGbZEQk8eCYLijo1mE1EyAZf0j/6iUpvJs3E0uhFUyzDYTPaIEz7CchaXauEvo3o=
X-Received: by 2002:ad4:5883:0:b0:432:b007:962b with SMTP id
 dz3-20020ad45883000000b00432b007962bmr18357839qvb.55.1646188387369; Tue, 01
 Mar 2022 18:33:07 -0800 (PST)
MIME-Version: 1.0
References: <20220302114312.077aa81b@canb.auug.org.au>
In-Reply-To: <20220302114312.077aa81b@canb.auug.org.au>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 2 Mar 2022 05:32:56 +0300
Message-ID: <CAA8EJpojNFKB2u6KrfotYUyRfqXjKbwQfdaz1dJ7N=2M7cQA_w@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the drm-msm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 2 Mar 2022 at 03:43, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   8661f450626f ("dt-bindings: display/msm: add missing brace in dpu-qcm2290.yaml")
>
> Fixes tag
>
>   Fixes: 164f69d9d45a ("dt-bindings: msm: disp: add yaml schemas for

It seems the Fixes tag got split by my mail client.
Rob, any chance to fix that?

>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> Please do not split Fixes tags over moe than one line or truncate them.
>
> --
> Cheers,
> Stephen Rothwell



-- 
With best wishes
Dmitry
