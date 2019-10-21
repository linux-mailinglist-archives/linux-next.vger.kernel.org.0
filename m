Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3A5BDF1BD
	for <lists+linux-next@lfdr.de>; Mon, 21 Oct 2019 17:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbfJUPjp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Oct 2019 11:39:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57840 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727140AbfJUPjp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 21 Oct 2019 11:39:45 -0400
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 34B38C057E9F
        for <linux-next@vger.kernel.org>; Mon, 21 Oct 2019 15:39:44 +0000 (UTC)
Received: by mail-lj1-f200.google.com with SMTP id 205so2503881ljf.13
        for <linux-next@vger.kernel.org>; Mon, 21 Oct 2019 08:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ucCEPxnyJ+ZOhtkur6cCKTnEqlAgQJbWKzro646IvWQ=;
        b=bL0eC2IfnTVf8LlBWyXeAeVYHSf11xl4HETu54oj50v5C5nO055UKjIUUScf6eqkvK
         ir8Mvl1KiPFrrSVGsGSbSYcfArawVQT58J7LZ8pK5wyhe9mw2DxevM3Q+uZVGu1r97E2
         4vRj0EulBCeom3fV5FGFySELYMDlJ+6Gur+hmWZLBp0OG1tChZAThkxTj6nBr6geh0fQ
         CLrj8qEfp5tlk4NDzO/lhycbJ15GygP6EplPWuiyTT0qRymDaEYihZi32089ddXB+y2r
         e7tK4mhtMq0Kb/M0EQUo5nIUb0WIYXYPgTOF312GvkloQaQVTUhU75PAKLlv51+/IaFU
         tCng==
X-Gm-Message-State: APjAAAV4rjRNSZ8rNdR8xCvXvV+aT3DWRZwjXTH/DTmmcQz5m2K++pa3
        FAEZOV0gVEkSPQCe5sdA8vVFtz/00MYmHNZJ2MYRjyXy0458tThaJ0zJXDAA7N4rAqMrFjMz1cf
        NOh4X/tSNFbS7YZV2B18vYUuIqDtpBft6Qua9nw==
X-Received: by 2002:a2e:6101:: with SMTP id v1mr15673661ljb.122.1571672382722;
        Mon, 21 Oct 2019 08:39:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwtNVlGAWMdHADiBXWezm/WAxA43WBOxw7+xhohe6XvEzLwaZpxidx2NA6tmbyX7cR8GVLjag1xj0PhxL5NHhA=
X-Received: by 2002:a2e:6101:: with SMTP id v1mr15673649ljb.122.1571672382491;
 Mon, 21 Oct 2019 08:39:42 -0700 (PDT)
MIME-Version: 1.0
References: <20191021184128.601ff09d@canb.auug.org.au> <c4377d50c8a30ae292cd7886909238ce4fb56ee5.camel@redhat.com>
 <20191021151507.GD25164@mellanox.com>
In-Reply-To: <20191021151507.GD25164@mellanox.com>
From:   Matteo Croce <mcroce@redhat.com>
Date:   Mon, 21 Oct 2019 17:39:06 +0200
Message-ID: <CAGnkfhzCuCUBG++QRTZbsUyFr8orq059Be7AvyL+_V9Smz7J3g@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the rdma-fixes tree
To:     Jason Gunthorpe <jgg@mellanox.com>, Joe Perches <joe@perches.com>
Cc:     Doug Ledford <dledford@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Potnuri Bharat Teja <bharat@chelsio.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 21, 2019 at 5:15 PM Jason Gunthorpe <jgg@mellanox.com> wrote:
>
> On Mon, Oct 21, 2019 at 10:50:33AM -0400, Doug Ledford wrote:
> > On Mon, 2019-10-21 at 18:41 +1100, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > In commit
> > >
> > >   612e0486ad08 ("iw_cxgb4: fix ECN check on the passive accept")
> > >
> > > Fixes tag
> > >
> > >   Fixes: 92e7ae7172 ("iw_cxgb4: Choose appropriate hw mtu index and
> > > ISS for iWARP connections")
> > >
> > > has these problem(s):
> > >
> > >   - SHA1 should be at least 12 digits long
> > >     Can be fixed by setting core.abbrev to 12 (or more) or (for git
> > > v2.11
> > >     or later) just making sure it is not set (or set to "auto").
> >
> > I'll leave it to Potnuri to fix his stuff.  As for the rdma tree, the 10
> > digit hash is still unique as of today, so I won't rebase the official
> > branch to fix this.  However, I'll see about adding a check for this in
> > my workflow.  Thanks.
>
> I thought I saw that checkpatch was checking this now?
>
> commit a8dd86bf746256fbf68f82bc13356244c5ad8efa
> Author: Matteo Croce <mcroce@redhat.com>
> Date:   Wed Sep 25 16:46:38 2019 -0700
>
>     checkpatch.pl: warn on invalid commit id
>
> Maybe that check should also check that enough hash is provided and
> other details like the correct subject line?
>
> I also use a check that builds the fixes line from the commit id and
> requires it to be the same as the patch provided. This catches all
> sorts of wrong fixes lines, and sometimes git even recommends 13 chars
> :\
>
> Jason

Hi,

actually I just call git_commit_info() which checks for validness.
I could also check that the hash is at least 12 digits, would be very easy.

Joe?

-- 
Matteo Croce
per aspera ad upstream
