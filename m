Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAA3818901A
	for <lists+linux-next@lfdr.de>; Tue, 17 Mar 2020 22:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgCQVKT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 17:10:19 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34365 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726680AbgCQVKT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Mar 2020 17:10:19 -0400
Received: by mail-ed1-f68.google.com with SMTP id i24so24521922eds.1
        for <linux-next@vger.kernel.org>; Tue, 17 Mar 2020 14:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nCoCinlfBkBrhCUwU5qZ/6v2x0D3qEE7/5CcMYa+4Hc=;
        b=QtVvsnITXMu+JQHBuRJji7ST79Y05GMFLP3W+OVBiySALav+qQYW4roSiH/boPJdn1
         0Ro+edqcp+QsD5buq/7z9JaNDMhOp3n0swq2vlcMaWU9bASfUxXyHFpaKOkUBreYaFlt
         Zg4iJA8r5Ez4lHcHaRGan64Mgfx3yB+4w6RRJCj6iWneEIQFUmiV/cB6CpnsFSBy6x9T
         3wyrKvg4gM7zBrYrmk1gQJE5mwkiUiPeXSTkUWttUaaBQRkbRHf39WE5DP/IFhTa6Npc
         HDBgL/ZrtUU04XlpUQJmIUM27sHpMY+Ggg+4JeEAgAYcrJTlRUKC0m5UPLkQsQVTxFVp
         /hTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nCoCinlfBkBrhCUwU5qZ/6v2x0D3qEE7/5CcMYa+4Hc=;
        b=Qz46NcI3/W26D6+iKu+s5bHTmpH/N/8Kt/pBiq6D/Gp86G+GOmAxaHDgyLb/MdYydd
         oedu0/62EAlpHZxbKoaSZd39xRNUo2oW3srQGfUeTIDJOcAuqQU9HfACFBGy3BUxpqE7
         rnLybFkxTHpbFSoVQID3e90WRI4AFsBjTX1afOt/f5yPjGsl4ieGvJwf4TTmNnQ3hkhn
         Jl06fxoic5JZuM/Q9aS+DtQzaCFWjJwUMFDyxiKzq6aXX/1o5MG9y7H2+sIwny7zhC4v
         TcofNOv4oABQkCOkaGHivP0zEOLYlqSyJnO7dF9BwMs/8GvHdfVgunSMoNaYsl6fS5Gf
         RBrQ==
X-Gm-Message-State: ANhLgQ1fqjFfuc5vuhL+Am+AyEDsYHk4E0LmqaZK3UVgMsahjg8g0zAa
        48Kg30q3+h1XSRbfReb2xxlSsTPShLv+gC5J6Jo1
X-Google-Smtp-Source: ADFU+vuu3jh28tAHj31MfyqCk4tbUgblW6g9cs4HTgMeREjvSzhKoCWkLyDPKfUdpsdchb1gV5IOO3pO8CNY2PtTOfg=
X-Received: by 2002:a17:907:105a:: with SMTP id oy26mr1044369ejb.308.1584479415386;
 Tue, 17 Mar 2020 14:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200317133117.4569cc6a@canb.auug.org.au> <bb623275e936c026cc425904e6c1cee0cbe85f28.camel@hammerspace.com>
 <20200317151829.GA4442@aion.usersys.redhat.com> <c28fe5dc9bd58388ce413f30878fd35ef0f1eb1b.camel@hammerspace.com>
In-Reply-To: <c28fe5dc9bd58388ce413f30878fd35ef0f1eb1b.camel@hammerspace.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 17 Mar 2020 17:10:04 -0400
Message-ID: <CAHC9VhR8rXQLyfdwmV3xxRLeQF57N28T1rqpLN5fG0R77U5_4A@mail.gmail.com>
Subject: Re: linux-next: manual merge of the selinux tree with the nfs tree
To:     Trond Myklebust <trondmy@hammerspace.com>
Cc:     "smayhew@redhat.com" <smayhew@redhat.com>,
        "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 17, 2020 at 12:12 PM Trond Myklebust
<trondmy@hammerspace.com> wrote:
> On Tue, 2020-03-17 at 11:18 -0400, Scott Mayhew wrote:
> > On Tue, 17 Mar 2020, Trond Myklebust wrote:
> >
> > > On Tue, 2020-03-17 at 13:31 +1100, Stephen Rothwell wrote:
> > > > Hi all,
> > > >
> > > > Today's linux-next merge of the selinux tree got a conflict in:
> > > >
> > > >   fs/nfs/getroot.c
> > > >
> > > > between commit:
> > > >
> > > >   e8213ffc2aec ("NFS: Ensure security label is set for root
> > > > inode")
> > > >
> > > > from the nfs tree and commit:
> > > >
> > > >   28d4d0e16f09 ("When using NFSv4.2, the security label for the
> > > > root
> > > > inode should be set via a call to nfs_setsecurity() during the
> > > > mount
> > > > process, otherwise the inode will appear as unlabeled for up to
> > > > acdirmin seconds.  Currently the label for the root inode is
> > > > allocated, retrieved, and freed entirely witin
> > > > nfs4_proc_get_root().")
> > > >
> > > > from the selinux tree.
> > > >
> > > > These are basically the same patch with slight formatting
> > > > differences.
> > > >
> > > > I fixed it up (I used the latter) and can carry the fix as
> > > > necessary.
> > > > This is now fixed as far as linux-next is concerned, but any non
> > > > trivial
> > > > conflicts should be mentioned to your upstream maintainer when
> > > > your
> > > > tree
> > > > is submitted for merging.  You may also want to consider
> > > > cooperating
> > > > with the maintainer of the conflicting tree to minimise any
> > > > particularly
> > > > complex conflicts.
> > > >
> > > OK... Why is this being pushed through the selinux tree? Was that
> > > your
> > > intention Scott?
> >
> > Not really... I addressed the patch to you and Anna, after all.  On
> > the
> > other hand, I didn't object when Paul picked up the patch in his
> > tree.
> > I'm guessing I should have spoken up.  Sorry about that.
> >
>
> OK. Well there doesn't seem to be anything else touching the NFS mount
> code in this dev cycle, so I don't expect any integration issues at
> this point. I'm therefore OK with it going through the selinux tree.
>
> I'll therefore drop the patch from the NFS tree, assuming you still
> have it in the selinux tree, Paul.

I was waiting to hear back from you before reverting, I'll go ahead
and leave it in the selinux/next tree.  If anything changes on the NFS
side, let me know.

-- 
paul moore
www.paul-moore.com
