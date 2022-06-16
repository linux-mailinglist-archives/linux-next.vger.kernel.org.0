Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAB2854DA3A
	for <lists+linux-next@lfdr.de>; Thu, 16 Jun 2022 08:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358858AbiFPGIB (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jun 2022 02:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358986AbiFPGH6 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jun 2022 02:07:58 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367E325C78
        for <linux-next@vger.kernel.org>; Wed, 15 Jun 2022 23:07:51 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id o43so842366qvo.4
        for <linux-next@vger.kernel.org>; Wed, 15 Jun 2022 23:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OSikkE+MEEMjueKMGZL5HcqfjXaJL8eeDSb1s5a5Lws=;
        b=RoCzOgxXeL5ZbiNFy131xVGTqFXAlwIj+lwtmGkBrF4tCm5VCP0QnB8WNCjuP9mo+A
         Bl0uGyDDvaocUFhaY1J7DVhPCUXiDwb2viE2yZjjQTHtqomOLxEm2tuBxpBXYd85Qzo/
         KxMO/EpE4bZ3to9er5RwjIU6352uC54c2+xxbJwarH8WM9eFR1H1ED0U1K2VqTHMi4xa
         CqFJbaX0Pb/VNhKeTcKA4oSOGL15uvDnywGgZa2S3NPGgBeBMsNRG96MHZE7NiNix59q
         7+AzL5IQahF8tbNaT2FS+fKaawEgzZfDRGVjvLMq09+czhigMPkNtFZtl4KJx4JHWGYq
         YU/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OSikkE+MEEMjueKMGZL5HcqfjXaJL8eeDSb1s5a5Lws=;
        b=4WC53uw8uU6YHuLR3zbmlCyyc4o8wHcAQe4C3MrDWLEtW7F8cKGrY7LBt0Lenps55G
         zKCEQ9F8E2xYKfxRQ8yB0XEsvRMy6qQ54NkQutrXRV0Tpg3M3dU2meZckQ/l+bgm1Lib
         ON+C0KcQK95QsFN42UGqYn5zvS2okHkxI3PCo6zYZti3oAmsf2XaPrhSJoCFZL8hsmHa
         iypl1qCdggC1rUj8W7AOwDeyVXBzbjF1bubVRQGFBvumTtGa7SSe/59OocaygUuiTJ9O
         o0Ffbdi9Q0SitrH2QY95CclPkVMPLCttd4mNSYl7PAtYnF2INIw1xWRGgW+/MBIQamxd
         bj4g==
X-Gm-Message-State: AJIora+x8WS6tS7gUbQilk9JKhq3HerNxOC8zL1+6SaB1dgw/vYnZRE8
        WeZt2MwvvaAlWxBSqnIZxUxZf2Ph/TCAihFnHcKwhA==
X-Google-Smtp-Source: AGRyM1t8qy+xXgFGDVWFOe+JTBKrhzpPWs4Eq0C7HOrf5Cc35GA39MII73qeuavrDgjgPVyf9lDy0jlJ2zdeiwyknKM=
X-Received: by 2002:ad4:5aa4:0:b0:465:2b11:cfd with SMTP id
 u4-20020ad45aa4000000b004652b110cfdmr2913827qvg.55.1655359669605; Wed, 15 Jun
 2022 23:07:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220616085937.2de4c9a5@canb.auug.org.au>
In-Reply-To: <20220616085937.2de4c9a5@canb.auug.org.au>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 16 Jun 2022 09:07:38 +0300
Message-ID: <CAA8EJpqa=dU_w7P=Tm=rhw8MMjFCQ-bmK7eiRks7tAr2nyFaaw@mail.gmail.com>
Subject: Re: linux-next: Fixes tags need some work in the drm-msm-lumag tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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

Hi Stephen,

On Thu, 16 Jun 2022 at 01:59, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> In commit
>
>   c2bff24488ca ("drm/msm/dpu: remove hard-coded linewidth limit for writeback")
>
> Fixes tag
>
>   Fixes: d7d0e73f7de3 ("introduce the dpu_encoder_phys_* for writeback")
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format='Fixes: %h ("%s")'
>
> Fixes: d7d0e73f7de3 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
>
> In commit
>
>   583e280ebb28 ("drm/msm/dpu: fix maxlinewidth for writeback block")
>
> Fixes tag
>
>   Fixes: 53324b99bd7b ("add writeback blocks to the sm8250 DPU catalog")
>
> has these problem(s):
>
>   - Subject does not match target commit subject
>     Just use
>         git log -1 --format='Fixes: %h ("%s")'
>
> Fixes: 53324b99bd7b ("drm/msm/dpu: add writeback blocks to the sm8250 DPU catalog")
>
> In commit
>
>   defeb127761a ("drm/msm/dp: check core_initialized before disable interrupts at dp_display_unbind()")
>
> Fixes tag
>
>   Fixes: a65c95ff88f2 ("drm/msm/dp: stop event kernel thread when DP unbind")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes; 570d3e5d28db ("drm/msm/dp: stop event kernel thread when DP unbind")

Thanks for the notice. All three commits will be fixed in the next update.

-- 
With best wishes
Dmitry
