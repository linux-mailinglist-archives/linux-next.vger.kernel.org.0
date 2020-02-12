Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5F815B45A
	for <lists+linux-next@lfdr.de>; Thu, 13 Feb 2020 00:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729186AbgBLXDw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Feb 2020 18:03:52 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42206 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728447AbgBLXDw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Feb 2020 18:03:52 -0500
Received: by mail-ed1-f68.google.com with SMTP id e10so4384791edv.9
        for <linux-next@vger.kernel.org>; Wed, 12 Feb 2020 15:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mANb3MJ7SwHX/aisyLGjfvCuzvNAyVJWEC7aYrPPn4M=;
        b=z4SEjtUqoddOGb7EzSuAze78E9C1koF7GGUUxNrvWFK4BPdFQOHuadZP0VwtVjhzoY
         k7Kw2mWca9vpTu7twrNgPVvOjWO48Pwoaw+O32A7w1COMa3qbIF7HCBDjI1PnLQLgudx
         XaHtHygp12xeRMhMxsvTRWGTzGyczlgTKFczi01pY3G82adPfTDoCfTDRi7Kdu7U6P7w
         hATb1n9sYp8ipK+4pXMylM4Rm9LP7yRKxkssY5tuUyO4uEJ4bunabOQ+GYh3hwcCSCci
         TjVuYyQHD2+3INBGlro+aHtH/5jB+3RQJf5fWOQnHdDC2XAhTB/Dv5O474IYaLywNtxx
         Oyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mANb3MJ7SwHX/aisyLGjfvCuzvNAyVJWEC7aYrPPn4M=;
        b=piF3MGlrFyaShOMlWqStoKRQEijdkbZCl5tuQdyBVA+F8cv97hLOIUVwBOIfOMqyWt
         SlUNluvTWrvPHSjx3MXgQ7+Hwh6TEQgOSOIoHVxxWvGdslsktTNuMnf80e6n6c2ZLr0f
         pRfH4I9y6lHRTo8qpX3c9Z8oif0Tkj6jbhkSSnfuNwoXtNNAr90wuCMQ/dlunNjGj96x
         1Q2A1GUSUhA34nruhfYBsJzTipfS11WVYVgz/LtjOoguq3wB45Sd67h6jM6rYelNjSI2
         yN8httLw+Kz9uxx6ml2TlB1LXvOLDb9tyILvtlV8FpGNf9PcGs8jebMvxapdfJmI1y3x
         Z8vg==
X-Gm-Message-State: APjAAAUa0nU8mvfUk+wcTzIU0vWMgXirJ1ouQA11i2tJtVhQDQqnHIOv
        CHujohrg59UjRyo3rg7EBvNjZzPKLdPS899bV0Gc
X-Google-Smtp-Source: APXvYqzy0QEr2aSzOfpdxGyokni+yy+P+S72lAI7lUMjop0zSoKQdAuHHzO3m1E+hsqnujAyqfCmQ1CaxLrxqWl+hj4=
X-Received: by 2002:a05:6402:61a:: with SMTP id n26mr11930215edv.135.1581548629957;
 Wed, 12 Feb 2020 15:03:49 -0800 (PST)
MIME-Version: 1.0
References: <20200213094844.6bafd9e1@canb.auug.org.au>
In-Reply-To: <20200213094844.6bafd9e1@canb.auug.org.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Wed, 12 Feb 2020 18:03:39 -0500
Message-ID: <CAHC9VhQnot6FOaJDDsu45JkJBM7B_5frhevO5=xwpu_2=+XBCw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the selinux tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        "Connor O'Brien" <connoro@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Feb 12, 2020 at 5:48 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Today's linux-next merge of the selinux tree got a conflict in:
>
>   security/selinux/hooks.c
>
> between commit:
>
>   a20456aef80f ("selinux: fix typo in filesystem name")
>
> from Linus' tree and commit:
>
>   4ca54d3d3022 ("security: selinux: allow per-file labeling for bpffs")
>
> from the selinux tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Yes, I ran into the same problem this morning.  That is the correct
fix, thanks Stephen.

> diff --cc security/selinux/hooks.c
> index ae891d712800,44f6f4e20cba..000000000000
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@@ -698,7 -701,8 +701,8 @@@ static int selinux_set_mnt_opts(struct
>
>         if (!strcmp(sb->s_type->name, "debugfs") ||
>             !strcmp(sb->s_type->name, "tracefs") ||
>  -          !strcmp(sb->s_type->name, "binderfs") ||
>  +          !strcmp(sb->s_type->name, "binder") ||
> +           !strcmp(sb->s_type->name, "bpf") ||
>             !strcmp(sb->s_type->name, "pstore"))
>                 sbsec->flags |= SE_SBGENFS;
>

-- 
paul moore
www.paul-moore.com
