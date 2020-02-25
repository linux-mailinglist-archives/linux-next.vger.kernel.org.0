Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65C5F16BA1C
	for <lists+linux-next@lfdr.de>; Tue, 25 Feb 2020 07:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729073AbgBYGx0 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 25 Feb 2020 01:53:26 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:32978 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729031AbgBYGx0 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 25 Feb 2020 01:53:26 -0500
Received: by mail-oi1-f195.google.com with SMTP id q81so11603596oig.0
        for <linux-next@vger.kernel.org>; Mon, 24 Feb 2020 22:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fSxteq8BvR6bLu5LA6jd2BwkLJks1DyRranxnHnzEYU=;
        b=QSWYzPYTbGtdSQcLlCKj5AEGOQ+3AMV+xZg0/U1875q3JKfM5DYKKf5p6HAK6CwjIP
         AOzaHHJjmake0476dUff+71jZhuvNc745oA0rLIGZ2I2H4J5IKOXbhyQXmahB1wqF2Iv
         U7eNIah3q24sEOYyMKrA6vRUfjNnXNBHWLXsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fSxteq8BvR6bLu5LA6jd2BwkLJks1DyRranxnHnzEYU=;
        b=Fw8mjWotBgDJQ96ZbSwyh+clo0hGreOPpRC11mFIlpcMFt6cQaLjtLLlNsDNw4xc3u
         UELSGDLFxRGyVKdtIe8L805Teo3o3uVCamIPrVIwtKFMoQXEUgLeF50JN2+r5Dx3z6MS
         TcgEDXd5UtslBA3O3vBdHA49W0Lqfl/k70p/ooO1B9zg3z5EB3lnU6Cc/vQ1bgDrsYVC
         iquQ/35DTFp00Q35RQ7f03IPIxgwxSfvU4l06Eqlp91maxl752YBMiWW6keYxnOxzqcR
         iNI7IDhv16DASuOe/noUbJSHaF+tu1A1BT7GvGb75+odSgE7XHwzazQ5nT9ub4VsHXDx
         Ps9w==
X-Gm-Message-State: APjAAAUM75M+In2L/H+NcLOHFmzQBizHaf15o7pZXfVSyDxiXMFbhFwD
        fBGNttYFSsGWgFdv+buonz8X8zcO7ZaIFJabhlK44heXFbvzYZ+I
X-Google-Smtp-Source: APXvYqzA/xFMqccjb+BVRQhIHMzDqHfwlaweZ5oYatBKG1/zxpMzG0KS3wxN/jHbU7SS9W3Ga5Oz56oRA9wsAEb0Dk0=
X-Received: by 2002:aca:f587:: with SMTP id t129mr2226747oih.143.1582613605142;
 Mon, 24 Feb 2020 22:53:25 -0800 (PST)
MIME-Version: 1.0
References: <1578489498.29952.11.camel@abdul> <1578560245.30409.0.camel@abdul.in.ibm.com>
 <20200109142218.GA16477@infradead.org> <1578980874.11996.3.camel@abdul.in.ibm.com>
 <20200116174443.GA30158@infradead.org> <1579265473.17382.5.camel@abdul> <1582611644.19645.6.camel@abdul.in.ibm.com>
In-Reply-To: <1582611644.19645.6.camel@abdul.in.ibm.com>
From:   Sreekanth Reddy <sreekanth.reddy@broadcom.com>
Date:   Tue, 25 Feb 2020 12:23:13 +0530
Message-ID: <CAK=zhgpWCz0+xpSGymbQEAbysH_rQf=s8iQ1gn4KwysP3c1Gcw@mail.gmail.com>
Subject: Re: [linux-next/mainline][bisected 3acac06][ppc] Oops when unloading
 mpt3sas driver
To:     Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        sachinp <sachinp@linux.vnet.ibm.com>,
        linux-scsi <linux-scsi@vger.kernel.org>, jcmvbkbc@gmail.com,
        linux-next <linux-next@vger.kernel.org>,
        Oliver <oohall@gmail.com>,
        "aneesh.kumar" <aneesh.kumar@linux.vnet.ibm.com>,
        Brian King <brking@linux.vnet.ibm.com>,
        manvanth <manvanth@linux.vnet.ibm.com>,
        iommu@lists.linux-foundation.org,
        Sathya Prakash <sathya.prakash@broadcom.com>,
        Chaitra P B <chaitra.basappa@broadcom.com>,
        Suganath Prabu Subramani 
        <suganath-prabu.subramani@broadcom.com>,
        PDL-MPT-FUSIONLINUX <MPT-FusionLinux.pdl@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 25, 2020 at 11:51 AM Abdul Haleem
<abdhalee@linux.vnet.ibm.com> wrote:
>
> On Fri, 2020-01-17 at 18:21 +0530, Abdul Haleem wrote:
> > On Thu, 2020-01-16 at 09:44 -0800, Christoph Hellwig wrote:
> > > Hi Abdul,
> > >
> > > I think the problem is that mpt3sas has some convoluted logic to do
> > > some DMA allocations with a 32-bit coherent mask, and then switches
> > > to a 63 or 64 bit mask, which is not supported by the DMA API.
> > >
> > > Can you try the patch below?
> >
> > Thank you Christoph, with the given patch applied the bug is not seen.
> >
> > rmmod of mpt3sas driver is successful, no kernel Oops
> >
> > Reported-and-tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
>
> Hi Christoph,
>
> I see the patch is under discussion, will this be merged upstream any
> time soon ? as boot is broken on our machines with out your patch.
>

Hi Abdul,

We have posted a new set of patches to fix this issue. This patch set
won't change the DMA Mask on the fly and also won't hardcode the DMA
mask to 32 bit.

[PATCH 0/5] mpt3sas: Fix changing coherent mask after allocation.

This patchset will have below patches, Please review and try with this
patch set.

Suganath Prabu S (5):
  mpt3sas: Don't change the dma coherent mask after      allocations
  mpt3sas: Rename function name is_MSB_are_same
  mpt3sas: Code Refactoring.
  mpt3sas: Handle RDPQ DMA allocation in same 4g region
  mpt3sas: Update version to 33.101.00.00

Regards,
Sreekanth

> --
> Regard's
>
> Abdul Haleem
> IBM Linux Technology Centre
>
>
>
