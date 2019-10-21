Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E23CBDF3D8
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 19:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728476AbfJURJA (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 13:09:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40670 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726276AbfJURJA (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Oct 2019 13:09:00 -0400
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 11E9AC057E9A
        for <linux-next@vger.kernel.org>; Mon, 21 Oct 2019 17:09:00 +0000 (UTC)
Received: by mail-lj1-f198.google.com with SMTP id 205so2557658ljf.13
        for <linux-next@vger.kernel.org>; Mon, 21 Oct 2019 10:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wxgth48wA5oQ8cPlvqbI7UFUAhGTMgHizZwe7uVd1CY=;
        b=QukZ/oOncTnQZ6EfEROhQUwkw25Mhgz5ptN2WWBqbnlerSFzMKm0MaEtX9vOSNcrSu
         lyjTMTSEBCnaZz7HRNYAEUjn5sKPqvxd3ElMYBGg3RrrhbRybQlesSn3/8FyW+lBBEcm
         8BAhBLnaOVChwQqvNJEFDtIA4UZXArwCOzXJmwuJYFNs13abpISx1M9k3Ww0N1sF4vjF
         2GAdTQLx+h87ISFhk6kW83ioVtmmp/Q2GKGjRTQKzxbqYCCrBb8j7c8K6UqYjQ4Ukt5m
         8S8bwTd9KNDi1uJ8+QSbi2I+3cShTlwm9tSaCPWW9o44nmzMbJSjYfl0o6PcLo6yzs49
         MvIA==
X-Gm-Message-State: APjAAAVVMRUuIxB3pu0g1FXdNXt6li5hPkYsWGboGORYvPuVEa7lkt3a
        3vULpMYqIXgfYmF2PePhHTkTQ1QX84D6Kb7T8aP/XbeRzvYn8Fb5k8XleSwmJTnh6hCOTm2wnTx
        Ay73H1zEpJVsZ0rKlVXUArH8F4KMmY2Jmsnx0Vw==
X-Received: by 2002:a05:6512:61:: with SMTP id i1mr3254516lfo.97.1571677737991;
        Mon, 21 Oct 2019 10:08:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwPQCh9ZBZsdeJK9mNzzlh/TEFcN1WafH5ImLJuWpLqh97PHbMtYqa0hCLDioegMrhp3qZvJTc+WBVfIylwcAw=
X-Received: by 2002:a05:6512:61:: with SMTP id i1mr3254497lfo.97.1571677737798;
 Mon, 21 Oct 2019 10:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191021184128.601ff09d@canb.auug.org.au> <c4377d50c8a30ae292cd7886909238ce4fb56ee5.camel@redhat.com>
 <20191021151507.GD25164@mellanox.com> <CAGnkfhzCuCUBG++QRTZbsUyFr8orq059Be7AvyL+_V9Smz7J3g@mail.gmail.com>
 <20191021170111.GB6285@mellanox.com>
In-Reply-To: <20191021170111.GB6285@mellanox.com>
From:   Matteo Croce <mcroce@redhat.com>
Date:   Mon, 21 Oct 2019 19:08:21 +0200
Message-ID: <CAGnkfhwsczOBLMZSJ0pWm=L3bMqgd4mWNitpZB3-NwjFN+fYDA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the rdma-fixes tree
To:     Jason Gunthorpe <jgg@mellanox.com>
Cc:     Joe Perches <joe@perches.com>, Doug Ledford <dledford@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Potnuri Bharat Teja <bharat@chelsio.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 21, 2019 at 7:01 PM Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> On Mon, Oct 21, 2019 at 05:39:06PM +0200, Matteo Croce wrote:
> > > I thought I saw that checkpatch was checking this now?
> > >
> > > commit a8dd86bf746256fbf68f82bc13356244c5ad8efa
> > > Author: Matteo Croce <mcroce@redhat.com>
> > > Date:   Wed Sep 25 16:46:38 2019 -0700
> > >
> > >     checkpatch.pl: warn on invalid commit id
> > >
> > > Maybe that check should also check that enough hash is provided and
> > > other details like the correct subject line?
> > >
> > > I also use a check that builds the fixes line from the commit id and
> > > requires it to be the same as the patch provided. This catches all
> > > sorts of wrong fixes lines, and sometimes git even recommends 13 chars
> > > :\
> > >
> > > Jason
> >
> > Hi,
> >
> > actually I just call git_commit_info() which checks for validness.
> > I could also check that the hash is at least 12 digits, would be very easy.
>
> IMHO you should do
>
>   git log --abbrev=12 -1 --format='Fixes: %h (\"%s\")'
>
> And check that the provided fixes line matches the above output
> exactly, or nearly exactly. People do lots of funny things to fixes
> lines..
>

The point in using git_commit_info() instead of calling git directly
is that the latter would generate an error if the working copy is not
a git tree (e.g. a tar.xz downloaded from kernel.org).

-- 
Matteo Croce
per aspera ad upstream
