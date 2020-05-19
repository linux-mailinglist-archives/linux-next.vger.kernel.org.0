Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 214E01D9061
	for <lists+linux-next@lfdr.de>; Tue, 19 May 2020 08:56:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgESGzt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 May 2020 02:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgESGzt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 May 2020 02:55:49 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A560CC05BD09
        for <linux-next@vger.kernel.org>; Mon, 18 May 2020 23:55:47 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id i15so14485636wrx.10
        for <linux-next@vger.kernel.org>; Mon, 18 May 2020 23:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TANWEOqfTxV9xotVFJrbgUmpK/BcquydUVLVqIzATJw=;
        b=DFu/enkffHVSAltF3ls3sxCDN6A5lKhqggJ1s6HCTXKZzdgcaVMnYYGgQvoe0Lzr1I
         upnnHFOWshBVZDYO/h+mYUAcigT40QMb0+mZqiquUwyY1bJny81btQxlN6YaTgzQi85c
         mBDv4uwqoDBBQDkY1nMvsuvsZ9aQyBTi/piaHdxTUkEotPsdwiXHHn0Bzs166wYgB+vs
         dRqBpkFHa4q0dxXFCO8AR6glcmEAaAT23BWQ1P0yrvD7sfxrdMUEkfGsNMNUK4cmfnMe
         o/12cLMZIuUVsYBjuZEHBUubwSAcYBlmuCAjrfPzJ2PBbdb7InSnw2IhRFAJxFIINlmQ
         e2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TANWEOqfTxV9xotVFJrbgUmpK/BcquydUVLVqIzATJw=;
        b=YLoxTxUZfEyA+tB1wdP6ufL2CETxSjdKgdF7CqIlfZDzHXXJauWsBfwPO8X+mUhHFr
         DBITdMwdRq8ojgYM3knt7vzWRX8StPZ64r1NvVXvbpW15Hmu34vS6AmVr/Os9HTvbOJ4
         PYIA+i/S4nyKfp1nxF5mHgw3rjE9pA7y94BfV2pO5YpBlyxjJPizfw1ex2tCXpBk6hM5
         3R6kgPzQjf/rS/DcwSJImMbO0s83P/4QuaO1ZiHlJ72pbwkTg2e2oy1OM8Ayx45iWAwk
         m4fuMNlcT0s/ouiWylbWfG1U0RQtaGO1TwcOOBEFnyeTcs8/KKF9CRdADEc1SCMKLapg
         pE7Q==
X-Gm-Message-State: AOAM532MYxwDrRGJtO8Nk7LtqGsb0O8cJB2d3nDSmKkpKFahSJlooQs7
        I1lJTt0hAj8Knabg7bDkNFGBtwtL/aMz1qQsXzAnYgn3eA==
X-Google-Smtp-Source: ABdhPJyQWt5z4SzG/sMVYcC8+mS4N1nabJfc9BlW0x7OsKiZAW/PYP3ibpa34gAe3DBDIbC+UDNWbjyHXXLOPaYNCE0=
X-Received: by 2002:adf:82c3:: with SMTP id 61mr25175979wrc.326.1589871346192;
 Mon, 18 May 2020 23:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200518205725.72eb3148@canb.auug.org.au> <e132ee19-ff55-c017-732c-284a3b20daf7@infradead.org>
In-Reply-To: <e132ee19-ff55-c017-732c-284a3b20daf7@infradead.org>
From:   Danil Kipnis <danil.kipnis@cloud.ionos.com>
Date:   Tue, 19 May 2020 08:55:35 +0200
Message-ID: <CAHg0Huy7JKttHs9aEJEaRgwZAM3jcZH-Wb0p8Vy6KBVv9bW0Zg@mail.gmail.com>
Subject: Re: linux-next: Tree for May 18 (drivers/infiniband/ulp/rtrs/rtrs-clt.c)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jack Wang <jinpu.wang@cloud.ionos.com>,
        "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Randy,

On Mon, May 18, 2020 at 5:01 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 5/18/20 3:57 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20200515:
> >
>
> on i386:
>
> ../drivers/infiniband/ulp/rtrs/rtrs-clt.c: In function =E2=80=98alloc_ses=
s=E2=80=99:
> ../drivers/infiniband/ulp/rtrs/rtrs-clt.c:1447:42: error: =E2=80=98BLK_MA=
X_SEGMENT_SIZE=E2=80=99 undeclared (first use in this function); did you me=
an =E2=80=98UDP_MAX_SEGMENTS=E2=80=99?
>   sess->max_pages_per_mr =3D max_segments * BLK_MAX_SEGMENT_SIZE >> 12;
>                                           ^~~~~~~~~~~~~~~~~~~~
>                                           UDP_MAX_SEGMENTS
>
>
> Full randconfig file is attached.
Thanks a lot for the mail. Didn't try to compile this with block layer
disabled :/ Will send a fix for this today.
Best,
Danil

>
> --
> ~Randy
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
