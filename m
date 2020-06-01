Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA7E51E9DDF
	for <lists+linux-next@lfdr.de>; Mon,  1 Jun 2020 08:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgFAGId (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Jun 2020 02:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbgFAGIc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 1 Jun 2020 02:08:32 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D437C061A0E
        for <linux-next@vger.kernel.org>; Sun, 31 May 2020 23:08:32 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id e1so2155535vkd.1
        for <linux-next@vger.kernel.org>; Sun, 31 May 2020 23:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QkmSio6UgYEwUD2SM8rAy/RIFijHP9divvcJZFzKfTA=;
        b=Ue1eDUAQymiljRlFA3oApYNxcyFCrmEwh752ztED+rE0vtnA1EgfxpjRH9ijf5dp2w
         7SoAAFunru/w/k0nwRajS8uwDXR45eFdtoh2owusugMDswollTsnUx3Afm7SSVuMN8Kf
         Nb9Sk0q+tD8GdHSIDFp+BqztLFmoS617kynUBIPeamU43WPkw/lAfQMvc1nquOueLwFV
         xiDFHXh/V7XSaIG+qDzKow2eLflBju8ZRSiSIntrf/9tn+cS3L07bmJC/1HyktoUyZTR
         NM/St+D0DSJ+DaCgbZKfLjapqIuA1hpkvUjdNkiTFXR2IwWoLAiHGghYihO3RbLbeACt
         rOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QkmSio6UgYEwUD2SM8rAy/RIFijHP9divvcJZFzKfTA=;
        b=laiA8+EZJQaFwz92Uod34KAsjCChuv41D8WTFrPnwlVDtgs0TvnpadMynRG9FiHvyj
         qt+MkjVX+RehBXqaeWeVW2aF0Bs8mlsD4gU5TVIoMX8HUhAvWjOXHg1060gHhZhTwk2j
         dL+FYU8pRJ4GWB37QYPrAdC/MzGg8THi4QiyGGgRPTXvMahtbX3wr+mGhjB/e4YAv6WB
         6heDK+ww+LVQ5Q9ZthY3UQJh7J65pzY9bSo4Vr3wk3JVZYO3Dl25rM5crAOoqmoK5rfl
         h5Zob/QFf0uj5kh/J+Y0sj18inNXurr/QuIjMP7RECeE3N0H17MMD7W5ynKMoK+oBq1d
         6Eug==
X-Gm-Message-State: AOAM530kwzg6yv2PAro7S2VsDQMzTGClVUrlNdhJ8tOvB8z39rC4uf2/
        EbfjyOtgf4q5GTG2fR4RfbAkF6oVg8ln+mmrFoVuHg==
X-Google-Smtp-Source: ABdhPJyuPjNqhHOp0uHEqICQDEH190vhJmliPr9HWavME5pHMwm7rpvSf/xMwZSCN53vg1xB/069+QfzSagWH2U4l2M=
X-Received: by 2002:ac5:cc44:: with SMTP id l4mr4878591vkm.43.1590991710866;
 Sun, 31 May 2020 23:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200529221631.6057872e@canb.auug.org.au>
In-Reply-To: <20200529221631.6057872e@canb.auug.org.au>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 1 Jun 2020 08:07:54 +0200
Message-ID: <CAPDyKFo7036hqm9nTzT5ov2HGir5ThMfuorMUeS2hM7utGVqvw@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the mmc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 29 May 2020 at 14:16, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   7b16993c2bb2 ("mmc: sdhci-msm: Clear tuning done flag while hs400 tuning")
>
> Fixes tag
>
>   Fixes: ff06ce4 ("mmc: sdhci-msm: Add HS400 platform support")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>     Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
>     or later) just making sure it is not set (or set to "auto").

Stephen, thanks for the notification, patch amended!

Kind regards
Uffe
