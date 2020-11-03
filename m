Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F49F2A3B74
	for <lists+linux-next@lfdr.de>; Tue,  3 Nov 2020 05:40:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725952AbgKCEkT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 2 Nov 2020 23:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725940AbgKCEkS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 2 Nov 2020 23:40:18 -0500
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C935CC0617A6;
        Mon,  2 Nov 2020 20:40:18 -0800 (PST)
Received: by mail-io1-xd41.google.com with SMTP id s24so10368605ioj.13;
        Mon, 02 Nov 2020 20:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kyN1XeWyQpkbiJCeFGA26wLQw+p9xunsGOlf3ZLborY=;
        b=RPwBQPLTrZ3EMYbCp7SoD5ujiPpnye+sHtn72lwrunMvg+rlqqM7BFQ5CK6mKtQM6I
         0FmFhKg3FHZyTJUOBOYuYCP9xIcK04MIo15Euk7wOJzBomvGP0dnUWi9HpCsAe1uYpSg
         gYCStvPrS0ZECmXZA1e/mWY9HRH/oEn+2s27Vi4NEXGgPZcwPbkopl0meTVava5hu/gF
         EJAV1tmrm38vj0HbfBGEHQTN3ysz2ZTortd8JU2ollTZAqLXZ1YPESD0R7W/9sclKmbr
         X2NY8kYvsNp38YQbr2NuK1DmbdRydDn6XIU7hoGDWQu6bxxRnWeKg1DRyepsGo//vq25
         /Shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kyN1XeWyQpkbiJCeFGA26wLQw+p9xunsGOlf3ZLborY=;
        b=LbkMZKfDjDC64OuBDuKEf5gm1e/0Jqu9l+GFCDH6FFyy1iu1Ph97NFTVPEThz+8cfq
         4WJNVoZ4fbXHT+OvQpH9Yq3wzUJwIPkTfUndwzoCouvquZcMHw9rHD0fFqcEdazBsLmX
         BdeARNQc1+HIum6EYL/oVehAnrtAkjimHu7brIO86G1GRjg4WLNj0SQzsem7zB+vftr6
         T6gCyc9itt+UM30PTqF/0qLAvZ1QOD+Bew49luE/31DFhBhSkdqd8/YalgeMCnPSxDu0
         w33fZdcIyNKMfQAygl4JURkg7cdULT43MYHIeq6om9QZLXRA3BqPD5lwzj3wIxFI8kHc
         DvCw==
X-Gm-Message-State: AOAM531Y68qMceP85ncgpSb8skeR2NyzFtYLdlApSBfbtPVydEtJ7OfS
        FEhpOVzQ6a9xq5Kk15fFUk0wBMyfh7fTjIthCJz48QKi
X-Google-Smtp-Source: ABdhPJyvABDrMU7RNxRcJtmrOH21gElCtLNzWUfKNY4J0ZhliqU+g4STqw5+59sOHoG430d7LfRreTSoBRpO81UaykY=
X-Received: by 2002:a5e:9743:: with SMTP id h3mr12614836ioq.158.1604378418103;
 Mon, 02 Nov 2020 20:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20200807101854.844619-1-clg@kaod.org> <9c5eca863c63e360662fae7597213e8927c2a885.camel@redhat.com>
 <fce8ffe1-521c-8344-c7ad-53550e408cdc@kaod.org> <89726af2-00ca-9d47-f417-4bea8d5b8b1f@ozlabs.ru>
 <3497b725-9108-9f63-9cc2-ac7b1dd06c09@kaod.org>
In-Reply-To: <3497b725-9108-9f63-9cc2-ac7b1dd06c09@kaod.org>
From:   "Oliver O'Halloran" <oohall@gmail.com>
Date:   Tue, 3 Nov 2020 15:40:07 +1100
Message-ID: <CAOSf1CFwsc1uqcdaF5Et7eHjZGMB0gZcwQFykkVwQR0B+PvsHw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/pci: unmap legacy INTx interrupts when a PHB
 is removed
To:     =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc:     Alexey Kardashevskiy <aik@ozlabs.ru>, Qian Cai <cai@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Nov 3, 2020 at 1:39 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 10/14/20 4:55 AM, Alexey Kardashevskiy wrote:
> >
> > How do you remove PHBs exactly? There is no such thing in the powernv p=
latform, I thought someone added this and you are fixing it but no. PHBs on=
 powernv are created at the boot time and there is no way to remove them, y=
ou can only try removing all the bridges.
>
> yes. I noticed that later when proposing the fix for the double
> free.
>
> > So what exactly are you doing?
>
> What you just said above, with the commands :
>
>   echo 1 >  /sys/devices/pci0031\:00/0031\:00\:00.0/remove
>   echo 1 >  /sys/devices/pci0031\:00/pci_bus/0031\:00/rescan

Right, so that'll remove the root port device (and Bus 01 beneath it),
but the PHB itself is still there. If it was removed the root bus
would also disappear.
