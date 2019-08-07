Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 098EC8528C
	for <lists+linux-next@lfdr.de>; Wed,  7 Aug 2019 20:00:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388163AbfHGSAa (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 7 Aug 2019 14:00:30 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35563 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387953AbfHGSAa (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 7 Aug 2019 14:00:30 -0400
Received: by mail-wr1-f68.google.com with SMTP id k2so6408448wrq.2
        for <linux-next@vger.kernel.org>; Wed, 07 Aug 2019 11:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pFr71ba4wTvnk5UDS39uecfIkQHbPN6xMB7Jqj/WRjI=;
        b=m9c1MHBuDCeo2Z88IwdSKM3amtE+vs5AoTgGWNdzmSKxistPEwZwFwKjKOLAiLTeV6
         piYs3QuMN0mGgOTedewVtsKw6qXYqOQJOQPsI5Rm8+ruxJDY7UzJ0azIgMMOGtyZK+lV
         V7In9wNR3+wK9STFB9PBqcyUKPMKk7zpVsyzghfv//fV2Ebtgud3fEvcjSc7HTvIofTb
         Qd+WAVy0hbQmfbe4a2WUuvfG8a6nAvDRMPFqtp0p13DTdg3Pj2Q+jxfAHLlIwmkCdvHs
         1rlYxkg6QGFqJXU/uqlv42MHh0n48W1PN9Ac1hDIIwt118wPYPPSqTk0Y1U70qTPHe0L
         biLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pFr71ba4wTvnk5UDS39uecfIkQHbPN6xMB7Jqj/WRjI=;
        b=HkF6Aqwjn1CUtpRS9YvbVuTbpXMtClVJ/pd2cL76NzcsAvJRs2Xw2RrytQV/U4NvDG
         h5bJf5qGVMtn0HRko8U0DPiyPrAfBBgtGgbyzmMqsZac/juItVYrmD0BvzpXwfBnMvJt
         SYEbVHbNTCLmE8xrguauB97o8H3Tv/B8KIMupRDePTdbFiDlKKFrcFGn1qbsE9wdtwiw
         vyQBSJcPd5jv/C0qHWMGnEqxmhI4qKA/D3zqe0GB5lcfHNMc39Gso9teNoKADaDJ0TYK
         IsrsNye7/FHHQzytzFXk22l/kBMIQMvb5jnI6Z53Eji226ndA6o9W6xOsP93OWYHBi2/
         8Nxg==
X-Gm-Message-State: APjAAAVop9ep4NVUtrbxZ5Wallc2R+xSCFkjey/+tghmRm4U+PxKPrv/
        vTiadu9MxT3HvskQNlYCxBQqxGqSMsn+8hW0r4k=
X-Google-Smtp-Source: APXvYqxaCIZWdK+Tqrsn08yT+fqkM7ITkRh9oQN0LjCE02z/d6ocRZC1bG+I6yilPRfn2AKU8KzS1UbPFYRTzQWESuw=
X-Received: by 2002:a5d:6ccd:: with SMTP id c13mr12673000wrc.4.1565200827673;
 Wed, 07 Aug 2019 11:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190807025640.682-1-tao.zhou1@amd.com> <20190807070834.GA24792@infradead.org>
 <daff9fc7-ead8-40e0-9a16-cb3b90b01722@amd.com> <20190807104104.GA18773@infradead.org>
 <18cd9fa5-2d87-2f41-b5fa-927b9790287d@amd.com> <20190807130043.GA6023@infradead.org>
 <c613ca25-4443-f275-ea8d-6d55af10ac77@amd.com>
In-Reply-To: <c613ca25-4443-f275-ea8d-6d55af10ac77@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Wed, 7 Aug 2019 14:00:15 -0400
Message-ID: <CADnq5_M8YvmsA1SDCNygQ2+tcxGjDCbz9ETQ1Fu22OUr03t29g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: replace readq/writeq with atomic64 operations
To:     "Koenig, Christian" <Christian.Koenig@amd.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "kernel-build-reports@lists.linaro.org" 
        <kernel-build-reports@lists.linaro.org>,
        "Zhou1, Tao" <Tao.Zhou1@amd.com>,
        "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "Li, Dennis" <Dennis.Li@amd.com>,
        "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Aug 7, 2019 at 9:03 AM Koenig, Christian
<Christian.Koenig@amd.com> wrote:
>
> Am 07.08.19 um 15:00 schrieb Christoph Hellwig:
> > On Wed, Aug 07, 2019 at 10:55:01AM +0000, Koenig, Christian wrote:
> >>>> Essentially writeq/readq doesn't seems to be available on all
> >>>> architectures either.
> >>> writeq/readq are provided whenever the CPU actually supports 64-bit
> >>> atomic loads and stores.
> >> Is there a config option which we can make the driver depend on?
> >>
> >> I mean that ARM doesn't support 64bit atomic loads and stores on MMIO is
> >> quite a boomer for us.
> > The model is to cheack if readq/writeq are defined, and if not to
> > include the one of io-64-nonatomic-hi-lo.h or io-64-nonatomic-lo-hi.h.
> > The reason for that is that hardware is supposed to be able to deal with
> > two 32-bit writes, but it depends on the hardware if the lower or upper
> > half is what commits the write.
>
> Read, but as I understood Tao change this is not the case here.
> Otherwise we would just use our WREG32/RREG32 macros in the driver.
>
> Tao, please explain why exactly we need the WREG64/RREG64 change which
> caused this.

We use this for doorbells as well which is also MMIO.  Basically we
have the requirement to read or write the full 64 bits in one
operation.  E.g., for 64-bit doorbells, the entire register is the
trigger so if we do it as two writes, we'll miss half the update.  In
the case of some error counter registers, reading the register will
clear the value so we need to read out the full value or we lose the
half the value.  This works properly on x86 and AMD64.

Alex

>
> Christian.
>
> >
> > The only 32-bit platform that claims support for readq/writeq is sh,
> > and I have doubts if that actually works as expected.
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
