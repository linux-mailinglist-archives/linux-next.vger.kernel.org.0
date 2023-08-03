Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ED9776E857
	for <lists+linux-next@lfdr.de>; Thu,  3 Aug 2023 14:35:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234842AbjHCMfI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 3 Aug 2023 08:35:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbjHCMfF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 3 Aug 2023 08:35:05 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58A893594
        for <linux-next@vger.kernel.org>; Thu,  3 Aug 2023 05:35:04 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-583fe10bb3cso10036147b3.2
        for <linux-next@vger.kernel.org>; Thu, 03 Aug 2023 05:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691066103; x=1691670903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uP/jKoz3Vq3oW08eo+q5fcY5zoQdMMEoKncOlPNggLQ=;
        b=Ra3TJ/pkeiD7p+QcyEftin0Si/oOornFouMbh93+ep8PE08dBuWmqZe19x8/7P2odm
         jaECWvgkEpaU17BbgQNMUgxEsaMCASWSnZd4Szyd8SE0tkRtSVRmhsc0BPhrpyf9tZzw
         LaFSYDDA2CxXK0IBNkGIQSiitumh6yvxIw9PNOzhS6JvEFp8IehMBHOO/qiGp2caK3nf
         e2x+9xx7aHw4ONBVDmmiLbmVX91W+nqRHLbfaEar5WdzW2RCewFbBSCYnK0s9AMHDLXf
         zNfRDbVxHLGSSKCIq1veHFgnqGx0wz47229rw8UGDAs4EZc4hl3Mtvn/9Ddfxb51AegS
         C10A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691066103; x=1691670903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uP/jKoz3Vq3oW08eo+q5fcY5zoQdMMEoKncOlPNggLQ=;
        b=R0qsugqx66Ps7VcpuDg9p1xSoPAy9sqSuq1wRVhZHXNmAVDTBVpOTYwHqZ87Qz/i35
         m3OWrJfyPYq2lkcchuJLw1fhhCIRl7IS/0szkta/6/I4XQm0SDe6ptUynzWkKx06//sf
         Nk9aTRtWiZaOGkTtrt8FwgXxM81SznQTYoRlBmeDji4JdzX0h8bNxXa099P/enbALIAY
         blVZR4iMQW1ip5nWb0Rd7QnmGEDGOjwC3RGLk7NA7VUeeNHpJ4Le93u/7LFkKrvDmZ9X
         7Fb9J0j4XSPDkL7uO4hbm176kG58hH02QxllZnJY27g/P6J3eMronGa2rcqwui04TsxC
         JYHg==
X-Gm-Message-State: ABy/qLa99Un5Y9Skn2EEg8EcueUBWiS0zlFPYm23nAQOPlrnpC7P+7dx
        xFZwYfT39WbT22TBDkvUgUA/t9PmQsIkP5YX2gf8RTf7IxUwwaH+icg=
X-Google-Smtp-Source: APBJJlEdy5ScnSZ2Umnr9ihUIRZLoMmfGq9QPaqtmqdFeuiXX/baC6nwNAZh/bJFnF+CAzPz8pEuuJ+69hh9yHAAqBQ=
X-Received: by 2002:a25:db88:0:b0:d06:79a2:ad59 with SMTP id
 g130-20020a25db88000000b00d0679a2ad59mr21035312ybf.3.1691066103482; Thu, 03
 Aug 2023 05:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230803081942.79524e1e@canb.auug.org.au>
In-Reply-To: <20230803081942.79524e1e@canb.auug.org.au>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 3 Aug 2023 15:34:52 +0300
Message-ID: <CAA8EJpoMm2Px2gff7VzcxkRphTtr1mrEkG9fE7KiSDGNcRV2uA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the drm-msm-lumag tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen, colleagues,

On Thu, 3 Aug 2023 at 01:19, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   08bfcdc2c358 ("drm/msm/dpu: increase memtype count to 16 for sm8550")
>
> Fixes tag
>
>   Fixes: efcd0107 ("drm/msm/dpu: add support for SM8550")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     This can be fixed for the future by setting core.abbrev to 12 (or
>     more) or (for git v2.11 or later) just making sure it is not set
>     (or set to "auto").

I have fixed the commit, it should be fine now.

-- 
With best wishes
Dmitry
