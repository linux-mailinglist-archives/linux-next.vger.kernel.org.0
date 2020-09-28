Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27EB27A739
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 08:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgI1GIu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Sep 2020 02:08:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgI1GIt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Sep 2020 02:08:49 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A206C0613CE;
        Sun, 27 Sep 2020 23:08:49 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id j11so6863016ejk.0;
        Sun, 27 Sep 2020 23:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W94+USkFOEw29LE8CB5eIdgPT0Swcp2//ikNQs39wI8=;
        b=LAZYNjM3G/CcV3a5b7ikfdXvsqLboydZLUWluGdZlPbENZBXIr1znw2HuOHa++Z1/w
         QEM5PfLTZ/122a5FiGefQsa7DWppDGVSDmJOISbrTbzWNEegsLg8VRXCcELnmY3vVJPV
         dDldTdPCx27Bp4eCvwEvmIX3Lf/QdVa3ssi2qQq8KviyULWVQtW8Ez8XeZ9D2zhaNTmw
         vMO+CIKmV6Lojy/EXgNM2i1Qf3xUpkkjfqotrxsmqOqtssbjwXW8tLTNkqlqUTtyoBOB
         HP1rxAhi5/OeED+oYyjbsTimi39EMzGXfRvHJJe2AVNfbf1DxPHcNk6ja6GLt1H2wBsc
         89+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W94+USkFOEw29LE8CB5eIdgPT0Swcp2//ikNQs39wI8=;
        b=VlrtTVidGBicckMNoRJ4AKeaiZqtWRaq7zgbNNQ7OFnGS+28LlPNLumk2ewAoDk1Mg
         pLSR5qWpN5qt5O+xUc7aU73MY9DPUfJH89B0yjO3cbLuQWQPKJYBt1i9PdzEgWlIROh7
         uhSCBtyYAykl5VXiy5bPWIxySuVcCcPzAgKyms6MTwlZLFX2/IrdzDvjT2f4MFXYa6EL
         3aZ1IRgqiFZxchIEohey8wdoA+/7Z3iG8F0VXeOP598d70oqEolVVORmhmyQyWt2Gh4r
         W91Ya1vuBEGFAgeecmX5raVdJwA6k+kCiFV3L+Xa7ceyCyi0qGq1mk5y/qEhR19Psqve
         xuyA==
X-Gm-Message-State: AOAM533C4t4QR9cgpmPRxSU82oYy/va0vYWqUAvr6HzH3jm/bY+ZPwc5
        H4NenatfaUbQYGghneZDAxrYZ7l+zckxgRgX8Cc2jD47
X-Google-Smtp-Source: ABdhPJwnmwKg6CTBdT1WpaQr+mK3XPL3ayBHn/1nHxViptewGpSpXXVGOtaQDyHJV04k07v5RDDwgJts8rPZEuPVoqU=
X-Received: by 2002:a17:906:6b95:: with SMTP id l21mr123687ejr.317.1601273327952;
 Sun, 27 Sep 2020 23:08:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200928135405.73404219@canb.auug.org.au> <20200928060427.GA15041@lst.de>
In-Reply-To: <20200928060427.GA15041@lst.de>
From:   Dave Airlie <airlied@gmail.com>
Date:   Mon, 28 Sep 2020 16:08:36 +1000
Message-ID: <CAPM=9txFX+M8O+-PCxAUnrSovXRHEZyRwOX2r3GUr7hP0A_o3A@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the drm tree
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 28 Sep 2020 at 16:05, Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Sep 28, 2020 at 01:54:05PM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > After merging the drm tree, today's linux-next build (x86_64 allmodconfig)
> > failed like this:
>
> The driver needs to switch do dma_alloc_noncoherent + dma_sync_single*
> like the other drivers converted in the dma tree.  Paul, let me know if
> you have any questions.

Is this possible in drm-next now (it's 5.9.0-rc5 based)?

or will I need to get a stable shared git tree that goes into drm-next
and you send to Linus early in the MR?

Dave.
