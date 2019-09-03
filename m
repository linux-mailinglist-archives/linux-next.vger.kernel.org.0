Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE115A6097
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 07:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbfICFbS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Sep 2019 01:31:18 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44965 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfICFbM (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 3 Sep 2019 01:31:12 -0400
Received: by mail-ot1-f67.google.com with SMTP id 21so8064334otj.11
        for <linux-next@vger.kernel.org>; Mon, 02 Sep 2019 22:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lGKYy9yMsvJ2kTO5n+BuY7ZyhZgTpOWzHalFTSpyidQ=;
        b=KAqD+boVKcoC0ROi4cYqnfBlJFSf5Ilc6evakbMhCji7VI5iw3xDhL39RH8t5pGCeP
         HCa+3Yf+XVz9FUJJWu2kv0MUJnvsEla+rZJ2uBTa22jzYTZisfxqS8kEQPBex0nchX3o
         7JLJP+fNEfoCJhrtvwxvS/M7ouJ+YNGgBi8y5xtVc1xOTCLN9oq8qdyqFykdlfYXiNiS
         EAHLIl+e8mOVQF6tjgfW81cVNoxSx+83LGYiafqMA8EGPbM6IGPrds5WszbCFYZI+3Vu
         Od4LWGVOan+V/9wQi3GBhzNIgoDzga26KzAI/bvAnwSthkfkKnuL9VAWb1eUsXk+q7oU
         puEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lGKYy9yMsvJ2kTO5n+BuY7ZyhZgTpOWzHalFTSpyidQ=;
        b=RwsiU8LKEwuR6D+Shh0S5NBmRheO7HLOpQK1uAuGcquKfFrdfKtyH3mswdAn6QfwYU
         ngdFGrJbocpp7XsMrNT/0lQ7tzaAOjVrv044hRUvQ67nDpe6uDswvx/cNJwYYaRBbw1u
         h7bp0NCK3q2t3FW/1cKhczQKB6axt6qMfV6zl8EkhS8CeAKADnAvUZ7vPbFfI+SdVX15
         M+6SUYlrj9iUdVXJ2X87fOvnot6CmCF2SEPszrW9scQUzB7y01BldUozUzgA7wCbnMob
         CnKjniWcMZjrijA7smE6LcNg8nsiy3896GbNJ9hvHEzxamvEIE+jRfHuiFJJ5DPfpH9q
         2i2Q==
X-Gm-Message-State: APjAAAX2aOAl+xh3Stw7IkJMqgXzLwsbSCkU0p1tdt57Pj4LFvrJm48O
        FYM1XrZ9s34V8sTuz5+2/lCY2KMYhMtbM3WSVk7F0w==
X-Google-Smtp-Source: APXvYqxICI33147suMA8tn/fNIGFMIb76QryDyObOhkgiI2hJnHiBjE0kEVaAW0OE+xuduvcFwDqLWBdPgXh0HoLOYk=
X-Received: by 2002:a9d:6d15:: with SMTP id o21mr1117891otp.363.1567488671666;
 Mon, 02 Sep 2019 22:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190902205017.3eca5b70@canb.auug.org.au> <20190902105137.GC20@mellanox.com>
 <20190903094511.2704484a@canb.auug.org.au>
In-Reply-To: <20190903094511.2704484a@canb.auug.org.au>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Mon, 2 Sep 2019 22:31:00 -0700
Message-ID: <CAPcyv4hyEK=jA=ATyzjKbJDeQfpOyRo4pxoFCTf1LHa-muC14w@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the hmm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jason Gunthorpe <jgg@mellanox.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Christoph Hellwig <hch@lst.de>,
        kbuild test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Sep 2, 2019 at 4:45 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Jason,
>
> On Mon, 2 Sep 2019 10:51:41 +0000 Jason Gunthorpe <jgg@mellanox.com> wrote:
> >
> > On Mon, Sep 02, 2019 at 08:50:17PM +1000, Stephen Rothwell wrote:
> > > Hi all,
> >
> > > ERROR: "nd_region_provider_data" [drivers/acpi/nfit/nfit.ko] undefined!
> > > ERROR: "to_nd_blk_region" [drivers/acpi/nfit/nfit.ko] undefined!
> > > ERROR: "nvdimm_region_notify" [drivers/acpi/nfit/nfit.ko] undefined!
> > > ERROR: "nvdimm_blk_region_create" [drivers/acpi/nfit/nfit.ko] undefined!
> > >
> > > Caused by commit
> > >
> > >   126470c8a58b ("libnvdimm: Enable unit test infrastructure compile checks")
> > >
> > > I have reverted that commit for today.
> >
> > Looks like more kconfig trouble, can you send Dan your kconfig? I'll
> > drop this patch again
> >
>
> Thanks.  It was just an x86_64 allmodconfig build.  I don't actually
> have the .config file (it gets cleaned up, sorry).

Strange. x86_64 allmodconfig is certainly a 0day build target. Could
this be toolchain dependent?
