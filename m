Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7107F2D821F
	for <lists+linux-next@lfdr.de>; Fri, 11 Dec 2020 23:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406922AbgLKWbP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Dec 2020 17:31:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406946AbgLKWbN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Dec 2020 17:31:13 -0500
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA19AC061794
        for <linux-next@vger.kernel.org>; Fri, 11 Dec 2020 14:30:32 -0800 (PST)
Received: by mail-yb1-xb44.google.com with SMTP id t13so9357992ybq.7
        for <linux-next@vger.kernel.org>; Fri, 11 Dec 2020 14:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DP4u3vyOK1sWRkeFBHWzyC0Qo+Tg4a0hdWg9PLXt3LI=;
        b=dQ+wUD6qOEbwif75TWsTM+enWTSOPm3SNDSssvHnd0zoAJo1h7QfGOOoD9syKnkLVl
         C27SrGgxPVqok7to50/jRSkqMmigLyVJ20yuhqtreHsjd9pPRkV7fJG3ksl1tlEBU0qv
         72q2WYPDiMk3NFLxaHWu0hykAN8QuyjAWDOVTrTGBZa27IZf4OWtQOFJpkaGcqmTkpum
         u+COznp6nvTukB//0hKmDAim1qAaV7Lr7QpNlnZXCjXm54type681d1kg/EjrrGwXUea
         ZxxlI/o2703XOzBWDWdewwdgCimXj/sCvoilcoN/rQp7Nrb0SYX6WNuQO+8BGsQeCbv7
         yXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DP4u3vyOK1sWRkeFBHWzyC0Qo+Tg4a0hdWg9PLXt3LI=;
        b=sEBCZOCPrpMGneSEDxwS5TiR/CZNHX92vhjizLcuzhXEGNh3ikzd/3nEuFzYqkjIHS
         sSAR9UzarnZHlijUoND0XfRSaMwr2QRTCcvID6EOgfMDYBsFpPSCkCCgyqfm+ttlbxjB
         P2rMwcxftjPEfi6Ia6/RR5FsVu8x93TforvvHND8K7g/ObvFDvg9hGz8aAMNxynNT7Fp
         HXfhIJ2LBs+PFfC6uQls+8HiSzk4AcxOcOYk8WMv6wilotAkuT6HoPs0awBcRRIA/FZ5
         CSsPbD/2rnMCngpcc3bX86eOTeDSNZ7dmIlwxMkzf/hToLJOBF1/XbSPwFF7ojikc9JJ
         Pu6Q==
X-Gm-Message-State: AOAM532oZLZ29oaKGKbtl1CUk2pSpvPASCdB2fl2s7PmH5YSWGCU3vGa
        f0R6sGzw3wHcwxf/2gWClrUVI4gBpNuEFYNH6nn2Mg==
X-Google-Smtp-Source: ABdhPJwi1KxiLbsYZDLOGSqH5Ut1oteRY1ce66tvlhetU1GnU1dasj0j9yrAzoEUGAb6ZstqFJ/R8Ja8XFgNVbOXVFA=
X-Received: by 2002:a5b:b49:: with SMTP id b9mr20504737ybr.310.1607725831810;
 Fri, 11 Dec 2020 14:30:31 -0800 (PST)
MIME-Version: 1.0
References: <20201121020232.908850-1-saravanak@google.com> <20201121020232.908850-17-saravanak@google.com>
 <02e7047071f0b54b046ac472adeeb3fafabc643c.camel@redhat.com>
 <788ee1c7-0ea2-33ec-658e-50707f7515a6@arm.com> <CAGETcx-MsNyWWT=s1H6hDK+=QvibBLQrT9rM51y5bkomV_+G6g@mail.gmail.com>
 <813b3fbd80ad4dfee7ff8517d4829a1f@kernel.org> <CAGETcx_hPVv1iTt6q3gLmBN=q+_O6vTwxeS5Nj55Smm3FNk24Q@mail.gmail.com>
 <caf7719771210fb91565d105bd9c7e4b@kernel.org>
In-Reply-To: <caf7719771210fb91565d105bd9c7e4b@kernel.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 11 Dec 2020 14:29:55 -0800
Message-ID: <CAGETcx8Fjr-0S5kjUxYytncgQ9ZtMoeey_P680R6RPFk7-haZQ@mail.gmail.com>
Subject: Re: [PATCH v2 16/17] driver core: Refactor fw_devlink feature
To:     Marc Zyngier <maz@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>, Qian Cai <qcai@redhat.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-efi <linux-efi@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Android Kernel Team <kernel-team@android.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Dec 11, 2020 at 11:07 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-12-11 18:20, Saravana Kannan wrote:
>
> > Lol, my only contribution to the patch will be the commit text. I'll
> > send them with reported-by, suggested-by and tested-by if no one less
> > beats me to it.
>
> Teamwork!
>
>          M.

Forgot to CC most of the folks/lists here, but patch has been sent.

https://lore.kernel.org/lkml/20201211202629.2164655-1-saravanak@google.com/

-Saravana
