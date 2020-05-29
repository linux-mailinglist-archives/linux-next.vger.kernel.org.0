Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE7BF1E73BB
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 05:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436719AbgE2DkZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 May 2020 23:40:25 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23052 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2436751AbgE2DkY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 28 May 2020 23:40:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590723622;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LckFzfKpAYEdTFxchZpw4kb5NHTX4jw9/QaNtcrDL8Y=;
        b=Y5bcbiTdeobRtLIqyihRRr/0dwpCzlbHKIybjQ2egxlw2o/yuOyP7B5NUef03++aCZYC8Y
        8oNd6e9Uzza+aE6WBdCNq7aBzxjOuyubz/zeatrM2Ge7ipGwYMDsA6r3Q5ZtVUfKDMyuPL
        NpuWo6lbSqhufByVz6qUgw/WGvwoogs=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-Tav_lSO2Nl6d9VXxS4T35Q-1; Thu, 28 May 2020 23:40:20 -0400
X-MC-Unique: Tav_lSO2Nl6d9VXxS4T35Q-1
Received: by mail-pj1-f72.google.com with SMTP id gk8so694813pjb.8
        for <linux-next@vger.kernel.org>; Thu, 28 May 2020 20:40:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LckFzfKpAYEdTFxchZpw4kb5NHTX4jw9/QaNtcrDL8Y=;
        b=U/zrOqISX/po9/z7H8o1/l6zAVHUncetlNiJWwY2GHE2bu6ElXO6n5nKVQ/WNdYH06
         MZlKyfRu/h7+CDW6mxUotJ7FBgBUyeo33/io3SWRwPcgZA0up+XJzND2Y+XH6VrSUHYF
         cXz4xz0LwFotcldD0kEHxbMYq7KdpKJOolI/kgI9KmlgwFzczXfrQEPKgAsHaoEpzT7E
         G5aRnc7K/ARwb5w6c/xUbphRqvDubt6TPX+YV3miRUKGocT2Uh6eMZe3/sSVV4Piw4x4
         zUqzQtyG81VhTp5NSj+DfzMvu4U2XbM2ST0UINYgE/uH+Em/VXVHBpwrBuQOkbIOh9P1
         C05w==
X-Gm-Message-State: AOAM530uwzzRpZjpUi/+K51+MAo3bl11zryUzrRi8aDOKl3Rpm+KOhPy
        vPTVFZNOWdAZfFiCqS4kXIS1gogoqOMICCQhcBf4hxbT2Q9qw7IoYqIp+aqOUOS2y6jC3MCV3Ai
        0g1Y320YvjYIG6uUhdAq9WQ==
X-Received: by 2002:a17:90a:ce17:: with SMTP id f23mr7691954pju.51.1590723619359;
        Thu, 28 May 2020 20:40:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3IqpxYfBR2MgUo03XNoATGGGr0gmcEv4dZim1Qi47Q05fk1p6AaoZkla7LLY0mrteGxh8cA==
X-Received: by 2002:a17:90a:ce17:: with SMTP id f23mr7691933pju.51.1590723619100;
        Thu, 28 May 2020 20:40:19 -0700 (PDT)
Received: from xiangao.remote.csb ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id g65sm1947761pfb.61.2020.05.28.20.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 20:40:18 -0700 (PDT)
Date:   Fri, 29 May 2020 11:40:07 +0800
From:   Gao Xiang <hsiangkao@redhat.com>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Gao Xiang <xiang@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chengguang Xu <cgxu519@mykernel.net>,
        Chao Yu <yuchao0@huawei.com>
Subject: Re: linux-next: manual merge of the vfs tree with the erofs tree
Message-ID: <20200529034007.GA12648@xiangao.remote.csb>
References: <20200529114501.3e2ecc14@canb.auug.org.au>
 <20200529015111.GA23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529015111.GA23230@ZenIV.linux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Al,

On Fri, May 29, 2020 at 02:51:11AM +0100, Al Viro wrote:
> On Fri, May 29, 2020 at 11:45:01AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the vfs tree got a conflict in:
> > 
> >   fs/erofs/super.c
> > 
> > between commit:
> > 
> >   e7cda1ee94f4 ("erofs: code cleanup by removing ifdef macro surrounding")
> > 
> > from the erofs tree and commit:
> > 
> >   91a7c5e1d30e ("erofs: convert to use the new mount fs_context api")
> > 
> > from the vfs tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc fs/erofs/super.c
> > index 8e46d204a0c2,2c0bad903fa6..000000000000
> > --- a/fs/erofs/super.c
> > +++ b/fs/erofs/super.c
> > @@@ -408,16 -365,12 +365,9 @@@ static int erofs_fc_fill_super(struct s
> >   	sb->s_time_gran = 1;
> >   
> >   	sb->s_op = &erofs_sops;
> >  -
> >  -#ifdef CONFIG_EROFS_FS_XATTR
> >   	sb->s_xattr = erofs_xattr_handlers;
> >  -#endif
> >   
> > - 	/* set erofs default mount options */
> > - 	erofs_default_options(sbi);
> > - 
> > - 	err = erofs_parse_options(sb, data);
> > - 	if (err)
> > - 		return err;
> > - 
> > - 	if (test_opt(sbi, POSIX_ACL))
> > + 	if (test_opt(ctx, POSIX_ACL))
> >   		sb->s_flags |= SB_POSIXACL;
> >   	else
> >   		sb->s_flags &= ~SB_POSIXACL;
> 
> FWIW, I would be glad to have that old erofs commit moved over to
> erofs tree...  Folks?

I'm fine with that, although I think it's mainly with vfs changes
so could be better though with vfs tree. I will add this patch
tomorrow anyway... Thanks for reminder!

Thanks,
Gao Xiang


