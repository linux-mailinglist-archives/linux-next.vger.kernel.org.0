Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED8C4AD6CE
	for <lists+linux-next@lfdr.de>; Mon,  9 Sep 2019 12:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403813AbfIIKZ1 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Sep 2019 06:25:27 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:41196 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403812AbfIIKZ1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Sep 2019 06:25:27 -0400
Received: by mail-io1-f65.google.com with SMTP id r26so27317783ioh.8;
        Mon, 09 Sep 2019 03:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Iih+uQUiA9izQUGr4jy/Sqv8n1Gdl/kNYnNhnb/eS84=;
        b=blcu5F/m6M4e8lmPcljb3wQamY08n3LcD5Dz+Ie6fi0ZvtPexZLKYWO8dNDqhQyJZL
         6IOgDT+Bxx+K2S5qdmPOUCkbR2Fif4zO0W1AoY7yZTmuQcsg576fe/MwS0uK0UoV79TP
         nndu91jPG2ZIn5mVQ2pWMF0QUeFB2GIFibXC8PMJUHBcZZJwpUwb6bmkXrSIKdbxjOxw
         9z0wbc1CIlHSn/CficejXP59A85PdGcS11C5ZLMZf7+pVuWCcIojfGFVMlI0tOP/Ge34
         octtCcspkXOiWDLZvFT9Vw/AJxcEtwZpgkUNYCLRs4Ff0L06gUcrHuBwHiUzjI8YTpEl
         xmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Iih+uQUiA9izQUGr4jy/Sqv8n1Gdl/kNYnNhnb/eS84=;
        b=MI8a4Y9tE/AW1IHpVzV5nKC58fNPrB7How8O2k10BbEoecAiVtG24Bfib/jVGVIVLW
         dHrTH2CjvffaWmpXzVwf6/r4YMc+4H4cTm2ES3Rj0sjSJ7axTN51zgUWjY1qeby8f4SB
         BDfZ/Kw9Ls0+AFfJ2wk3OOD7NDsUbuU99Zdo3j7+gWIoOJGdsk8cvBJ2W02qtgvP3/+K
         G+IDcUg2kejHaB59RxB8Zr8M8X48X8+bf6wPPrNEHAYUUMSM9nTKGUPMr1l2qfTLIGVa
         skH+7jYOUSQR8pCOoyqFpkCkd+Q4uD2xXhuT9E52ONQ1+qA8YNV/DnZijyTuAdYNibxZ
         3AxQ==
X-Gm-Message-State: APjAAAV2fYFOvuejE/sCzt/gd+SJBytlppBm3OzEMN0nPOdzvutsBMTO
        XUpOORxwDg25gRK58JzILBIz85oxsvW689StcKOlDkyjJZE=
X-Google-Smtp-Source: APXvYqwcEAG1JfqbQemeVAXvvAIlgTBhC6sqluMv7Q1nZgjEYLOd/AxmByYzgLyU3PLNhD2AQMMbQOen/2LF49mG7PI=
X-Received: by 2002:a5e:8e0c:: with SMTP id a12mr19710141ion.22.1568024726318;
 Mon, 09 Sep 2019 03:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190907090534.GB1712@pc-sasha.localdomain> <CAKMK7uHYdXwruQxxBM12Q5MVeH9fjFpZvxZz06BSo7YrCQbM2w@mail.gmail.com>
 <20190908141307.GA7115@pc-sasha.localdomain> <20190909201159.778590a0@canb.auug.org.au>
 <20190909202128.0c420ddd@canb.auug.org.au>
In-Reply-To: <20190909202128.0c420ddd@canb.auug.org.au>
From:   Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date:   Mon, 9 Sep 2019 13:24:49 +0300
Message-ID: <CAJ1xhMXKNRfOm1Xj3B_cgLByBfDP03P+DBEbRpWc+tU6kdxtBw@mail.gmail.com>
Subject: Re: Kernel panic during drm/nouveau init 5.3.0-rc7-next-20190903
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Next <linux-next@vger.kernel.org>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        sean@poorly.run, airlied@linux.ie
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 9, 2019 at 1:21 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi,
>
> On Mon, 9 Sep 2019 20:11:59 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > If you are bisecting linux-next, I will suggest bisecting between the
> > stable branch on linux-next (which is just Linus' tree when I started
> > that day) and the top of the first linux-next that fails.  (Assuming
> > that the stable branch is good).
>
> Actually (since you won't be bisecting the latest linux-next), you
> probably want to use
>
> git merge-base stable next-20190903
>         (or whatever linux-next you are bisecting)
>
> as your first good commit (assuming it id good :-)).
>
> --
> Cheers,
> Stephen Rothwell

Hi Stephen,

Thanks very much for the tips.
I'll go ahead and give those a try.
