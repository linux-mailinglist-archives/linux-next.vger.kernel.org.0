Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6FF418863F
	for <lists+linux-next@lfdr.de>; Tue, 17 Mar 2020 14:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgCQNt3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 17 Mar 2020 09:49:29 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:32897 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgCQNt3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 17 Mar 2020 09:49:29 -0400
Received: by mail-ed1-f65.google.com with SMTP id z65so26590255ede.0
        for <linux-next@vger.kernel.org>; Tue, 17 Mar 2020 06:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JmNKybmelgBHykhp4MQGXO2cWeb6EPOmoPyYNqmZcy8=;
        b=S+1CRQjkz63ZdDzkP7oBw1SRer0hN06iqZyM6hfijjKRoTsYMxHIVPTQhgAkPVKEVu
         jGQz1spcj0+B39kABkpKgyd2ENtsZY7HFM50i1rJ/KvMrk4t8nAdLD0HEsPZysyahwv2
         KdfiKWj5TAgnUKqVIteB9x2lYiGSkuDVofvtWIyuB4Mr91m+nyQ3J30ltjf6QV/Cst4P
         j4p+0xYM6HLc5KzYF5ESLT02M+YiqV8lODr3l9LbtV2wB6PSjMuST6h+CGZUK8cO4tar
         z7yZO37Ax7/Jm4sokUeymCDjUombPFuxLUnNgspvGJleSlEFvSIkC6P1pXggWv+39nPx
         ha3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JmNKybmelgBHykhp4MQGXO2cWeb6EPOmoPyYNqmZcy8=;
        b=Xx8kD4xywLSyXXwBe9OxhItPZaqKpj3Ty5yqV8vWpKTk1e7JJ48sHXkDHGDb6fUq09
         gXX06w0MgehsDCVmXbmUsQrTp7Ol5MXMDkEUW4gnuVTT09S8xLKZTfIw3d6t8P62bdFH
         whdA/SV5KawSqP6WryzA/pwg/iKtk+R597iMpdtXwhOp4a+E+kSOdlqhr9g3c9YcUMS/
         srC1KW3Chf48evdzGdX/4TOvtJvsk2S8x0q/SNPapfPZizS6toQfWyCblqB1ldH+Jp8V
         QS3OKlr1xXGNBwHlUo+JRmSjTX5FXr6pj6jZFvvNSdr+bCJJ1mO3NFZzSqA0K4LSZvbw
         XUYA==
X-Gm-Message-State: ANhLgQ2K0lpBtFqwsFcJvSC/QPW6b3EALCGhjUP4b2d3H5O5LB68jajV
        PEG0Mgswnk3djsL8X7zEbm4b9zT+d3Zbidlz+wf3kS9qhw==
X-Google-Smtp-Source: ADFU+vvuhgAfsTftvVLtuZdAWVwrplj3L4fhzKjJbzp4/GZPeRPk2j/mWtfOrmdYunmZb3BFH1dgvXifxwmD6cvLEk8=
X-Received: by 2002:aa7:cf93:: with SMTP id z19mr5414868edx.12.1584452967726;
 Tue, 17 Mar 2020 06:49:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200317133117.4569cc6a@canb.auug.org.au> <bb623275e936c026cc425904e6c1cee0cbe85f28.camel@hammerspace.com>
In-Reply-To: <bb623275e936c026cc425904e6c1cee0cbe85f28.camel@hammerspace.com>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 17 Mar 2020 09:49:16 -0400
Message-ID: <CAHC9VhT04gBL3yAxdtKMkZSTEoauT4G7tayg7u3Tp9GQcVEBtA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the selinux tree with the nfs tree
To:     Trond Myklebust <trondmy@hammerspace.com>
Cc:     "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "smayhew@redhat.com" <smayhew@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Mar 17, 2020 at 9:33 AM Trond Myklebust <trondmy@hammerspace.com> wrote:
> On Tue, 2020-03-17 at 13:31 +1100, Stephen Rothwell wrote:
> > Hi all,
> >
> > Today's linux-next merge of the selinux tree got a conflict in:
> >
> >   fs/nfs/getroot.c
> >
> > between commit:
> >
> >   e8213ffc2aec ("NFS: Ensure security label is set for root inode")
> >
> > from the nfs tree and commit:
> >
> >   28d4d0e16f09 ("When using NFSv4.2, the security label for the root
> > inode should be set via a call to nfs_setsecurity() during the mount
> > process, otherwise the inode will appear as unlabeled for up to
> > acdirmin seconds.  Currently the label for the root inode is
> > allocated, retrieved, and freed entirely witin
> > nfs4_proc_get_root().")
> >
> > from the selinux tree.
> >
> > These are basically the same patch with slight formatting
> > differences.
> >
> > I fixed it up (I used the latter) and can carry the fix as necessary.
> > This is now fixed as far as linux-next is concerned, but any non
> > trivial
> > conflicts should be mentioned to your upstream maintainer when your
> > tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any
> > particularly
> > complex conflicts.
> >
> OK... Why is this being pushed through the selinux tree? Was that your
> intention Scott? Given that it didn't touch anything outside NFS and
> had been acked by the Selinux folks, but had not been acked by the NFS
> maintainers, I was assuming it was waiting to be applied here.

FYI, archive link below, but the short version is that the patch fixed
a problem seen with SELinux/labeled-NFS and after not hearing anything
from the NFS folks for over a week I went ahead and merged it into the
SELinux tree.  With everything going on in the world at the moment I
didn't want this fix to get lost.  I have no problem reverting the
patch in the SELinux -next branch if you guys would prefer to push
this up to Linus via the NFS tree; I just want to make sure we get
this fixed.

https://lore.kernel.org/selinux/CAHC9VhThqgv_QzCyeVYkBASVmNg2qZGxHwcxXL7KN84kR7+XUQ@mail.gmail.com/

-- 
paul moore
www.paul-moore.com
