Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3BA1493D8
	for <lists+linux-next@lfdr.de>; Sat, 25 Jan 2020 08:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbgAYHGz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 25 Jan 2020 02:06:55 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46271 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727046AbgAYHGz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sat, 25 Jan 2020 02:06:55 -0500
Received: by mail-wr1-f68.google.com with SMTP id z7so4727305wrl.13
        for <linux-next@vger.kernel.org>; Fri, 24 Jan 2020 23:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=J2pAdz/2no+OOg9fKoS5FkAo0J1e424VM8oJW+tiob0=;
        b=iUx7nPSxTTagp7Ag7cP6ZLkQksAJzUfDwlOlpn93fDgcU/CWH5BN6v3XU4rKI7YrLv
         vjr1uWgrDmh9+dN3c5kjP9G1B9uj0Uqj1oSypuajuo7A96HOXwXuh4VbKqKTtwNgU4PW
         OOdmwUmaGXcXnhE/pHieJckCqK7vCixFms+uFW7vd9CcNESZuJ0qNJzlIsKPnFh4WZ96
         nHI/YoeUr0t/uLjSMOI+2uWrWzP1+JWXs3Ay1+Me3zXF6jJeCfAuMduhOlphCFybBUw4
         1dyWj8VNHeJgqGkNc91+L2BnSyFXhmKP0YPHHYIcsWIhLptuxK26jx+mhAv0gXVjEK2d
         yDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=J2pAdz/2no+OOg9fKoS5FkAo0J1e424VM8oJW+tiob0=;
        b=tLh1P7xrhMWcJtdyzrkrtSxP3OCYJRnv42B79v4FnF3Q72yf8Umj1zwrvCkgNVH6iq
         WYWzsnRr/gx6SeyuTDUBMn4fBoXtvWGsrXggcYUPXD8oFxztF3u0vz1gLw65qQsaCpF8
         33FLS2Hxj210fQRnWTv2WKUON4oABWUyfdUxPJfCUxYFVTAKqCMiR5odh9T7pPw9bvVF
         lTUOlpak0cB5336o14R6Yeh2ee3g5Nn7jvyQq3/jYLAECnweegJn71Lo6iov4wfOqTUm
         rspTuc/uaN+b6Uof4iU2BiM32WwvRxoK7i9o5X/H3/0IhnrkJrV5TStcVZuaNQ8wdPWG
         aqYA==
X-Gm-Message-State: APjAAAXDb3zSr6aJregm/cSI0hfiKmfVnvRw72/0dI746bcDEG5hGI7O
        qd61nqXWQtu7o5ah3iIgyv31SGIgJEYvTw3uo0kWnA==
X-Google-Smtp-Source: APXvYqz3cWy/GqT/vNNk3kJQESif/EIu2KbH+K7HS8QiTyZS5IvujaaqLJaXWZ+XalPPx69ooJAoQ0ErXha/5McJ8Rg=
X-Received: by 2002:a5d:65cf:: with SMTP id e15mr8635872wrw.126.1579936013232;
 Fri, 24 Jan 2020 23:06:53 -0800 (PST)
MIME-Version: 1.0
References: <20200124051332.DoQFo8kO9%akpm@linux-foundation.org> <1ccf26d9-9420-fc33-ad96-c3daedb1c487@infradead.org>
In-Reply-To: <1ccf26d9-9420-fc33-ad96-c3daedb1c487@infradead.org>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Sat, 25 Jan 2020 08:06:42 +0100
Message-ID: <CAKv+Gu8ZcO3jRMuMJL_eTmWtuzJ+=qEA9muuN5DpdpikFLwamg@mail.gmail.com>
Subject: Re: mmotm 2020-01-23-21-12 uploaded (efi)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Mark Brown <broonie@kernel.org>, linux-fsdevel@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        mhocko@suse.cz, mm-commits@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Ard Biesheuvel <ardb@kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, 25 Jan 2020 at 01:09, Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 1/23/20 9:13 PM, akpm@linux-foundation.org wrote:
> > The mm-of-the-moment snapshot 2020-01-23-21-12 has been uploaded to
> >
> >    http://www.ozlabs.org/~akpm/mmotm/
> >
> > mmotm-readme.txt says
> >
> > README for mm-of-the-moment:
> >
> > http://www.ozlabs.org/~akpm/mmotm/
> >
> > This is a snapshot of my -mm patch queue.  Uploaded at random hopefully
> > more than once a week.
> >
>
> on x86_64:
> CONFIG_X86_UV is not set/enabled.
>
> from linux-next.patch (in mmotm):
>
> ld: arch/x86/platform/efi/efi_64.o: in function `efi_set_virtual_address_map':
> efi_64.c:(.init.text+0x11aa): undefined reference to `efi_uv1_memmap_phys_prolog'
> ld: efi_64.c:(.init.text+0x123c): undefined reference to `efi_uv1_memmap_phys_epilog'
>
>
> Full randconfig file is attached.
>

Should be fixed by

https://lore.kernel.org/linux-efi/20200121093912.5246-1-ardb@kernel.org/
