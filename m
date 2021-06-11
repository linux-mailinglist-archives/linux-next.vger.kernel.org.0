Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE0B3A444E
	for <lists+linux-next@lfdr.de>; Fri, 11 Jun 2021 16:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbhFKOrr (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Jun 2021 10:47:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46400 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231709AbhFKOrq (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 11 Jun 2021 10:47:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623422748;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DQB6N6XL2pvcqeJiPA2ZmqiMMjPc7PLdmvPf5Fljtv8=;
        b=QMM8eT5jxXc2OTBHf73PvVsQ16FcZcar7eaGkQ+QDtTvo2mRdx/u633o7zHq4fW21nYHcP
        SlElOWmm8XLuzTITqDPc8z6xgnTkEcbG5WxWrvpqsUG4w3yiLFqQdtTS7SAzvDaNxNRF5J
        vYRRcsSDywRbO62bEzEne2efQ7rrEbg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-wWay9r-yMsyZrV_yQCs9Kg-1; Fri, 11 Jun 2021 10:45:44 -0400
X-MC-Unique: wWay9r-yMsyZrV_yQCs9Kg-1
Received: by mail-wr1-f69.google.com with SMTP id x9-20020adfffc90000b02901178add5f60so2757389wrs.5
        for <linux-next@vger.kernel.org>; Fri, 11 Jun 2021 07:45:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DQB6N6XL2pvcqeJiPA2ZmqiMMjPc7PLdmvPf5Fljtv8=;
        b=euLlrKTXwW+XzR3r7giCNXH9DvpaN4ZCsV6vi7h9TrlONupKz3Tml4kMiqe3QZaIAo
         I//KgbPu730EkuGeSYDWp1alJPbtd/CoP1bgvXwx4e+yJTT8IPFepxndjCjoGfCkfnPb
         dmUJWhQH4ZkFP+AQS4ibM48GCFSurSrT7Mal2x0A5W1w2IsMyznuq4erTXjndrLs1Sz0
         cGx8rQm6aRK/+mDcCvVAaCaLWrNhNe6f71V+w4DqmlBgSR7bbum6/GncDUM7ES+lLIxK
         mZvtVmXjOPkWFjiV7xpOR6IvD6XGPBMIgdeM8SywHebGsBb1UPkMMOIVYKT6ZI9Qnv9d
         aHtw==
X-Gm-Message-State: AOAM533GJhzgRxdI7aYwHo3e5Jgowb2AgqRy+uEa9XrE4NOHbqvfi34R
        WXGWMAmPRqv2shHb1jGhGlUScnPORQVeZmmrBVwpMn0atlhaBTl0F2A+H5ZvgaQsojOWE6oUSGF
        9hSRyPGsCDT/4S6rdWONpDWH1cl/IiZuIHnkgRQ==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr4503230wmi.2.1623422743726;
        Fri, 11 Jun 2021 07:45:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvi4w2zFQuxKj3LupeXDCj8y0WDaqvCUS9Zm2BqynGzipepPCQctsQJyLR1b2t0Ex5hUJuNOln32r8IlFD4j0=
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr4503218wmi.2.1623422743591;
 Fri, 11 Jun 2021 07:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210611111231.7750bb60@canb.auug.org.au> <YMLAcExtFTEYl5Bi@zeniv-ca.linux.org.uk>
In-Reply-To: <YMLAcExtFTEYl5Bi@zeniv-ca.linux.org.uk>
From:   Andreas Gruenbacher <agruenba@redhat.com>
Date:   Fri, 11 Jun 2021 16:45:32 +0200
Message-ID: <CAHc6FU7SZJfLAD6dRdD9V0mW1w+xZrW77REaaP+EzUBtd_uciw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the gfs2 tree with the vfs tree
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Steven Whitehouse <swhiteho@redhat.com>,
        Bob Peterson <rpeterso@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Jun 11, 2021 at 3:46 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Fri, Jun 11, 2021 at 11:12:31AM +1000, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the gfs2 tree got conflicts in:
> >
> >   Documentation/filesystems/porting.rst
> >   include/linux/uio.h
> >   lib/iov_iter.c
> >
> > between various commits from the vfs tree and the same, older version,
> > of the commits from the gfs2 tree.
> >
> > I fixed it up (I used the vfs tree versions) and can carry the fix as
> > necessary. This is now fixed as far as linux-next is concerned, but any
> > non trivial conflicts should be mentioned to your upstream maintainer
> > when your tree is submitted for merging.  You may also want to consider
> > cooperating with the maintainer of the conflicting tree to minimise any
> > particularly complex conflicts.
>
> IMO iov_iter_fault_in_writeable() is a bloody bad idea to start with...

It seems that we need a mechanism for faulting in a page in for
writing. It's ugly that iov_iter_fault_in_writeable() writes to the
page for faulting it in, and if the operation that the page was
faulted in for then fails, those writes will be visible. Would an
implementation that reads and then writes back the same value be less
bloody bad?

Thanks,
Andreas

