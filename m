Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDEC64BE9D
	for <lists+linux-next@lfdr.de>; Tue, 13 Dec 2022 22:41:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236425AbiLMVlG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Dec 2022 16:41:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236318AbiLMVlD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 13 Dec 2022 16:41:03 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB0B51A22B
        for <linux-next@vger.kernel.org>; Tue, 13 Dec 2022 13:41:02 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso9129516wmo.1
        for <linux-next@vger.kernel.org>; Tue, 13 Dec 2022 13:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ExNia9axPb632CeUP3D82TcXswYKc1XabGdF09Bfmok=;
        b=O1bnR0d3Sz2sQ/iwbn0thL8rjx5LG1pt7LMBQ4LXHUr3fyksCc+sw5R7Cpy7dFSlKn
         SWHqPIsX3waC5LO6vHeOLJYh4K1ayPWl5fQjMeTZx/8i6YEhusqJQ9yYfyFmrg99rWzE
         ppryKgpvbhzSCD8SoBFFsGmkkvh21ETpcJZNM7fjF7L034kW178B3e/ttfA7YTSKh+/z
         wJ6a4yzHOmI4IUuaUCqxO3hb6RW/h4Q4h/TYFDgCYmTezSPiogI2xbmvs9rX8BO74cRb
         EWEEtnD7f2q3uxYj97ROIdovHIqucccmAOI9gV9dp3uNId0/g41CjMDOJpcL3KAC2+K5
         WQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExNia9axPb632CeUP3D82TcXswYKc1XabGdF09Bfmok=;
        b=ctSwEdtuscE+fi6tsWCYsKxmrAhnE+3uGI/jZqYHFN6AoTBlSwyogh6rlZNznc6Hpp
         0I3KpaOGessg/CmShHksVvmRbeGl5B2NoITpTc98+/9iyvuINW1DOZBXG9L7O47cDhiX
         4Nmh0rRPNWg7yNsS0qGAS4HU5DMKE+Hm2mRDtBXWU+T/d8gFTL59gXLokrpcEqY9XhOh
         y+7xfriTDt3fq3ncsHm7IDxf76oAKkCoMs9Oa9B6N7RVgj+EIaVDOrvRpHULPVDCWvy7
         k7a03pgsXaibYYDdWnt2+tOrp5/LdM/FarPO5kw4EOxR4nGyTb3o9oASxbC9p/eIKLZI
         309A==
X-Gm-Message-State: ANoB5pmnXxb6ldxGputBSNV551uDyd87uQNGa3m/R/mi7J2OFJVIv5xu
        tLY257GpyeAJH5PXrIWqsrEb9Rq4m2f7tQXo5St2G2Vha9f8dw==
X-Google-Smtp-Source: AA0mqf78EqI92Ik4Fo7R9+CzL2vFmkDSzfzMSFjcL5Pl+kEWT3xTY52WSy9BnTmMUlIdK7F5AiY32YW2Mtk6hqrFfiQ=
X-Received: by 2002:a1c:7c05:0:b0:3cf:cb16:f24a with SMTP id
 x5-20020a1c7c05000000b003cfcb16f24amr8692wmc.182.1670967661383; Tue, 13 Dec
 2022 13:41:01 -0800 (PST)
MIME-Version: 1.0
References: <20221214083434.4616378b@canb.auug.org.au> <45524A4F-3892-46B5-B987-6DCF11F58DF8@gmail.com>
In-Reply-To: <45524A4F-3892-46B5-B987-6DCF11F58DF8@gmail.com>
From:   Ian Rogers <irogers@google.com>
Date:   Tue, 13 Dec 2022 13:40:49 -0800
Message-ID: <CAP-5=fUmYuHODMJWyxJykzhUijz9d7ahirQrwP6b3usV9z74BQ@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the perf tree
To:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Dec 13, 2022 at 1:37 PM Arnaldo Carvalho de Melo
<arnaldo.melo@gmail.com> wrote:
>
>
>
> On December 13, 2022 6:34:34 PM GMT-03:00, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >Hi all,
> >
> >Commit
> >
> >  9e03ed43cd4f ("perf stat: Check existence of os->prefix, fixing a segfault")
> >
> >is missing a Signed-off-by from its author.
>
> Thanks, I'll fix this as well.
>
> - Arnaldo

Happy any which way this is resolved. In case it is useful:
Signed-off-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> >
