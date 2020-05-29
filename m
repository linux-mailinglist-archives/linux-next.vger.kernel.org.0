Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442401E80E2
	for <lists+linux-next@lfdr.de>; Fri, 29 May 2020 16:50:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727045AbgE2Oua (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 May 2020 10:50:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51098 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727024AbgE2Ou3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 May 2020 10:50:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590763828;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9WlVsdWU/ye2osgRTOkw0sfktljZUBDt8IESFs68H3c=;
        b=FHD2fT6GJgX8q+zHcvniLfl/OmQhu4kl5rh9r/t0x8T2+yHZk7M8Gypkr+TbkPFimMcu4Y
        6dJfRWZJOypqcgddYoJpzlX4m2ir/WAFkyhzbcNbxahQ3M0e1IAtUwenGQRGmNkoBNrwWh
        PaTwGR+8v7ya5WZoJfU4No2d6pe/8us=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-x12gy5XSM7iQKA6IVNa_2g-1; Fri, 29 May 2020 10:50:26 -0400
X-MC-Unique: x12gy5XSM7iQKA6IVNa_2g-1
Received: by mail-pj1-f71.google.com with SMTP id mt16so1943402pjb.5
        for <linux-next@vger.kernel.org>; Fri, 29 May 2020 07:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9WlVsdWU/ye2osgRTOkw0sfktljZUBDt8IESFs68H3c=;
        b=aj1l4WvjgOa/eqA3Kg/XVGfpzlglXf4dDWIjeosW7y6EfhzWHhVf59EyWwTT72uqlE
         IRgfpiq7OStGtGKc27VkPqkcZNTeziDg2ZC0+ccQGoOlI8dd1leS498XTH5D3y6Jlwy/
         b29PNkFYVT7kSoRk8ZUmdYFe2j5zKdNYUYYRzwGFzXAkyE1qTz30515PQ131yJk8oshn
         OTIBMMaKXro45T8y2y3jjKGc14AphoO5gyoBvhpH86ZDzzsYMSOdZpsIi5uieJEmXomT
         hTqZNeWRr7/CqUFTmOpJCfzLiJgtM1IWeanBlYCM0yS47iTJUbefdaVKeaMMIUndEk2f
         TCTQ==
X-Gm-Message-State: AOAM532hFEn8gzEDzRFMKj3VNxFdPOlc6uxv1fZibaJJaxY9FxraK4e5
        vUE3cjmbPDksSglUZ57Uhts5RsPFsoUYaSRgSCMeulv342Ezd0wLv8GNFOq3H0J+srP6oFYXoe7
        QQEhudIczKWxIIFnStfq7Fw==
X-Received: by 2002:a63:348b:: with SMTP id b133mr8439232pga.319.1590763825014;
        Fri, 29 May 2020 07:50:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJySqJRkgTPKtzGK/4jLrXMKYSnDDUt2nMIvXlgLkNKE8VG2SS2t+96tchxwhvt2Cgv3MJJY+g==
X-Received: by 2002:a63:348b:: with SMTP id b133mr8439219pga.319.1590763824766;
        Fri, 29 May 2020 07:50:24 -0700 (PDT)
Received: from xiangao.remote.csb ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id r1sm7054983pgb.37.2020.05.29.07.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 07:50:24 -0700 (PDT)
Date:   Fri, 29 May 2020 22:50:13 +0800
From:   Gao Xiang <hsiangkao@redhat.com>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Gao Xiang <xiang@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chengguang Xu <cgxu519@mykernel.net>,
        Chao Yu <yuchao0@huawei.com>
Subject: Re: linux-next: manual merge of the vfs tree with the erofs tree
Message-ID: <20200529145013.GA22698@xiangao.remote.csb>
References: <20200529114501.3e2ecc14@canb.auug.org.au>
 <20200529015111.GA23230@ZenIV.linux.org.uk>
 <20200529034007.GA12648@xiangao.remote.csb>
 <20200529143613.GE23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529143613.GE23230@ZenIV.linux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, May 29, 2020 at 03:36:13PM +0100, Al Viro wrote:
> On Fri, May 29, 2020 at 11:40:07AM +0800, Gao Xiang wrote:
> 
> > I'm fine with that, although I think it's mainly with vfs changes
> > so could be better though with vfs tree. I will add this patch
> > tomorrow anyway... Thanks for reminder!
> 
> FWIW, my reasoning here is
> 	* erofs tree exists and
> 	* the patch is erofs-specific, affects nothing outside and
> has no dependencies with anything currently done in VFS or in other
> filesystems and
> 	* it does have (trivial) conflicts with the stuff in
> erofs tree
> 
> So putting it into erofs tree would seem to be an obvious approach -
> minimizes the amount of cross-tree dependencies and headache for
> everyone involved...

That is reasonable. btw, our initial thought was that relates to new
mount apis and we weren't very confident if it really went the
filesystem itself...

> 
> I'm dropping it from #work.misc and #for-next now.

I will push out for next cycle. Thanks for detailed explanation.

Thanks,
Gao Xiang

> 

