Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 876C5359266
	for <lists+linux-next@lfdr.de>; Fri,  9 Apr 2021 05:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233070AbhDIDDM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Apr 2021 23:03:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232956AbhDIDDL (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Apr 2021 23:03:11 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E75BC061760
        for <linux-next@vger.kernel.org>; Thu,  8 Apr 2021 20:02:57 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id z22-20020a17090a0156b029014d4056663fso2476410pje.0
        for <linux-next@vger.kernel.org>; Thu, 08 Apr 2021 20:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6DzrHeVpP1+JwvPAj6EHCpf8PHTdXBjxghkIOmRbesY=;
        b=MxBxuEmmMyWOTQJUjOzWh0KjsXpMlGctEW8ZKMkLvFaFKaY/X4kXxY2cn3e+NrAzEb
         U11R6xRLKXZs+C+qbDPnSMaOemSf/vqA1+efgBPMJ8HJsHdhkOxeioGrDyDZP6QU8Nh+
         oochnJcKBkE0pn+lD+xu+PTtIaJZONleuGNwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6DzrHeVpP1+JwvPAj6EHCpf8PHTdXBjxghkIOmRbesY=;
        b=a62GRolb5hT1GEBZKRBbCCyb3iYBVXC7syy87a9BWgaxKF+Nh5aF/JpW07lKyM0N3v
         0Twq2+Q0A/FjDodp5LZHM/NwiwAPKFrJTxy9jY9dbbRlc2N5AYlyRjiFE4llMlYLbnly
         rWYAUqIHZvqxWrUlvqNj9G/gk0Z5CddSsJ/ATL2UsumV5WqZ/exF5P1OVWLRUJNPiOTc
         N1QO9Aa6BT9qgjn2es5L6wectrXN0AVm7oGsHsDpD1rxhP9XsBnJFzLjzitHGBonFs72
         BhH6n5ooMsrqSoBZMUDQC55dFhVhwTnUx9k8ZR/Vbh/PNOPcw4XMRcrzQ4SOAX9y199z
         wRaA==
X-Gm-Message-State: AOAM531EJHZApcnOEPNrPJ4Hfujy6b1jF14WvqHRjWknmadWoITlpkkf
        wa7rF3fe6EbSXlu/SRfRnmQH2iJv/uTlyg==
X-Google-Smtp-Source: ABdhPJz8FzxfLjWZx/jOHAK9KxUt8Iy4JpatEuwBLXLHYQLw4wpHvfpeUjFIrbvBb0svvm5tQPZOUw==
X-Received: by 2002:a17:902:b482:b029:e8:c21a:6ad2 with SMTP id y2-20020a170902b482b02900e8c21a6ad2mr10726665plr.51.1617937376831;
        Thu, 08 Apr 2021 20:02:56 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e5sm620065pjv.22.2021.04.08.20.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 20:02:56 -0700 (PDT)
Date:   Thu, 8 Apr 2021 20:02:55 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Gao Xiang <hsiangkao@redhat.com>
Cc:     Chao Yu <yuchao0@huawei.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Re: Coverity: z_erofs_handle_inplace_io(): Uninitialized variables
Message-ID: <202104082002.C0761A0FF@keescook>
References: <202104081709.43BC2DB@keescook>
 <20210409010146.GA689534@xiangao.remote.csb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409010146.GA689534@xiangao.remote.csb>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 09, 2021 at 09:01:46AM +0800, Gao Xiang wrote:
> Hi,
> 
> On Thu, Apr 08, 2021 at 05:09:14PM -0700, coverity-bot wrote:
> > Hello!
> > 
> > This is an experimental semi-automated report about issues detected by
> > Coverity from a scan of next-20210408 as part of the linux-next scan project:
> > https://scan.coverity.com/projects/linux-next-weekly-scan
> > 
> > You're getting this email because you were associated with the identified
> > lines of code (noted below) that were touched by commits:
> > 
> >   Wed Apr 7 13:17:55 2021 +0800
> >     c660a3a86e7e ("erofs: support decompress big pcluster for lz4 backend")
> > 
> > Coverity reported the following:
> > 
> > *** CID 1503704:  Uninitialized variables  (UNINIT)
> > /fs/erofs/decompressor.c: 160 in z_erofs_handle_inplace_io()
> > 154     	}
> > 155     	kunmap_atomic(inpage);
> > 156     	might_sleep();
> > 157     	while (1) {
> > 158     		src = vm_map_ram(rq->in, nrpages_in, -1);
> > 159     		/* retry two more times (totally 3 times) */
> > vvv     CID 1503704:  Uninitialized variables  (UNINIT)
> > vvv     Using uninitialized value "i".
> > 160     		if (src || ++i >= 3)
> > 161     			break;
> > 162     		vm_unmap_aliases();
> > 163     	}
> > 164     	*maptype = 1;
> > 165     	return src;
> 
> Thanks for the report!
> 
> This bug was reported by Colin King before (next-20210407), and has already
> been fixed in (next-20210408), see:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/fs/erofs/decompressor.c?h=next-20210408#n157
> and
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/fs/erofs/internal.h?h=next-20210408#n405

Ah-ha, thank you! Colin is fast. :)

-- 
Kees Cook
