Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4309419691
	for <lists+linux-next@lfdr.de>; Mon, 27 Sep 2021 16:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234783AbhI0OoS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Sep 2021 10:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234706AbhI0OoS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 27 Sep 2021 10:44:18 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BCFC061575
        for <linux-next@vger.kernel.org>; Mon, 27 Sep 2021 07:42:40 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id b12so7722512ilf.11
        for <linux-next@vger.kernel.org>; Mon, 27 Sep 2021 07:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qvtZBZ+cLSMTupAyX2ZKGNNGtfrOCy1D4m7ug1Iv9X0=;
        b=FoMhf7fbYbBHrVsX94BuI5a4xIeWR401smJ1jgv4AMdBDP7eETvTkECdzoAIfy84gR
         uEtEaHGmIkJ50ww2IBTfO31HvsgASAV5T9/IBhedUO+md2ElfKEb1ht1YMOyJs+b+O6z
         nw44azCCLeZ8Xsm5V4J0cx4XySUVHvNNX+zPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qvtZBZ+cLSMTupAyX2ZKGNNGtfrOCy1D4m7ug1Iv9X0=;
        b=HZ/wY5jbmLquG8/T0gEABr1lXej/E7/yMXQFa7pqkF+fNXP2czFjRR4l4hwQNITj54
         U+EseiX9YR3R3trl/NQu+0IuF/Dzr1wdz+kRbl7ho4bUOKc/YkHfvvwyG5H23UFdZ7g5
         dp5NboGyJN0SA5hs2Xjg0tOGl1o562KV+kv602lRheLZcqLNTjskLSeHXxOeBcKIXExI
         +ywC+nsh1+Xg+WoBUfYzT2Dv96k4q/3LmDmgmHKnhvPEePqa9Kud3RnxukYsP9eLH9KL
         We0XByi3CgKGbFfLUJ0NK1OZq/Z0hanaObNp1uIdZLcejwQ1451KWK3gU4C1wrvaUpNQ
         9Iwg==
X-Gm-Message-State: AOAM533rTxvpj4lYbcjZHIyfLGHxCD8gMQnwXS8gzhkE+/x02WdMDPOG
        sxwky0rZEjtlgUbZfaH3pLUSJ3OCAfFrdA==
X-Google-Smtp-Source: ABdhPJzoal0WENaVlUnlYShDMyM9/Xuoh4vEsUrgJMC8M5JBzVlo/dNDELK6YsKLEVB5XoGNVkvHSA==
X-Received: by 2002:a92:c247:: with SMTP id k7mr308814ilo.258.1632753759553;
        Mon, 27 Sep 2021 07:42:39 -0700 (PDT)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com. [209.85.166.52])
        by smtp.gmail.com with ESMTPSA id h5sm9100939ioz.31.2021.09.27.07.42.39
        for <linux-next@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 07:42:39 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id n71so23174028iod.0
        for <linux-next@vger.kernel.org>; Mon, 27 Sep 2021 07:42:39 -0700 (PDT)
X-Received: by 2002:a6b:f915:: with SMTP id j21mr81319iog.98.1632753758718;
 Mon, 27 Sep 2021 07:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210927154422.605920fd@canb.auug.org.au>
In-Reply-To: <20210927154422.605920fd@canb.auug.org.au>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 27 Sep 2021 07:42:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VrkmTDA-zLFW=1f1RAAVB_P=kJDQtAx+tng6+ZkhkCSA@mail.gmail.com>
Message-ID: <CAD=FV=VrkmTDA-zLFW=1f1RAAVB_P=kJDQtAx+tng6+ZkhkCSA@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drm-misc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Sun, Sep 26, 2021 at 10:44 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (htmldocs)
> produced these warnings:
>
> include/drm/drm_edid.h:530: warning: Function parameter or member 'vend_chr_1' not described in 'drm_edid_encode_panel_id'
> include/drm/drm_edid.h:530: warning: Excess function parameter 'vend_chr_3' description in 'drm_edid_encode_panel_id'
>
>
> Introduced by commit
>
>   7d1be0a09fa6 ("drm/edid: Fix EDID quirk compile error on older compilers")

Thanks for the report! Fix posted.

https://lore.kernel.org/r/20210927074104.1.Ibf22f2a0b75287a5d636c0570c11498648bf61c6@changeid
