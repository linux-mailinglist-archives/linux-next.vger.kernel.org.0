Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D38328EA1F
	for <lists+linux-next@lfdr.de>; Thu, 15 Oct 2020 03:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732245AbgJOB3i (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 14 Oct 2020 21:29:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732228AbgJOB3i (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 14 Oct 2020 21:29:38 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99B83C05111E;
        Wed, 14 Oct 2020 16:01:01 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id u19so1752544ion.3;
        Wed, 14 Oct 2020 16:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ikC4LAwwb2/OL3dDYceqRFTwnIoFZSQn/I33psN0qjs=;
        b=TCnK8mL9NI6hpr3zEveS0JTuNaHtXCx/qfHBGzgIQgrYKIyFfbL469h0Y911PX4qYA
         HA3PFnu9h7bUViHMzKVqrdtDhIfan/01bAJrm+iH8HVsCMbrGoUBCi+EwDuHU09Bq9xD
         0zniDvdoMkczvwrfTymICG2b2JPXMk43+A7TFV6EwFWXjhcXv0Zr0g7isA+HBzM1ygDz
         HielqMai2yM1V5M7vYrESoEcbxMQbPPGpBkxbresU1sEHhWVlG/vNZSnpIukEp2FJExo
         3VAds5Vc5Pir8QMG6owXKfyujHcVGoAHhUjdCq3iSTks6Ul93abkR08dX/ws2fLr75Qd
         P1CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ikC4LAwwb2/OL3dDYceqRFTwnIoFZSQn/I33psN0qjs=;
        b=PWAa163szEnrFqyh0zDo4arnEmQpbqY+QsdGs0p1NJMeH3u2iuN+3afnbQRi63A/dP
         WAN9uQ4564srgQFMUS/7J/bFnQiUF2MAQFQjeSXleGCnD3Pae2YmOkkIeTjlUrAFpvuP
         X17Whcr2F9NtfzFBpw7JsMHDih+S4DgQB7Azc7qRTzs87svwpBuvCjOS6AZUHHziFEJv
         ibb3fJ8kg0HR3DPzmNCCJz1yUcvl3HR8uPHEdyP0RI1HtWzPFAX1I8lVK7Ah60rY2lwa
         6/jFHy86bMXAh7wkXqW72HyIZpswGD7TDKkF2Llj/BXLOsa4VIETaAvm+XAno0l1AVM6
         8a7A==
X-Gm-Message-State: AOAM533UMpgP5/GU9jSsp9bC7vYvLteCFjYSJMftPaWeP/KcFOT16rXB
        E8lhlCZSwTSXu9Zkc6TiDMMC7NJLne3tDJNa5sxRYRiR197H6A==
X-Google-Smtp-Source: ABdhPJzGna7kT8ytBKEMRmafA605hdoj/96Adf60Do8VLRmdj9ntw6bzrJXYjfcdcZHwC8be0AHpI8yUwC0EME90ntk=
X-Received: by 2002:a5d:80cc:: with SMTP id h12mr1218936ior.73.1602716460855;
 Wed, 14 Oct 2020 16:01:00 -0700 (PDT)
MIME-Version: 1.0
References: <20201014182811.12027-1-cai@lca.pw>
In-Reply-To: <20201014182811.12027-1-cai@lca.pw>
From:   "Oliver O'Halloran" <oohall@gmail.com>
Date:   Thu, 15 Oct 2020 10:00:49 +1100
Message-ID: <CAOSf1CFT_Y67Q8caH2uFOYtwpRgFozh30ZWWZzzR-x18LBsG8g@mail.gmail.com>
Subject: Re: [PATCH -next] Revert "powerpc/pci: unmap legacy INTx interrupts
 when a PHB is removed"
To:     Qian Cai <cai@lca.pw>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 15, 2020 at 5:28 AM Qian Cai <cai@lca.pw> wrote:
>
> This reverts commit 3a3181e16fbde752007759f8759d25e0ff1fc425 which
> causes memory corruptions on POWER9 NV.

I was going to post this along with a fix for Cedric's original bug,
but I can do that separately so:

Acked-by: Oliver O'Halloran <oohall@gmail.com>
