Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89E6F1DD7D3
	for <lists+linux-next@lfdr.de>; Thu, 21 May 2020 22:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730295AbgEUUAx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 21 May 2020 16:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729780AbgEUUAw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 21 May 2020 16:00:52 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E13C05BD43
        for <linux-next@vger.kernel.org>; Thu, 21 May 2020 13:00:51 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id 190so8590744qki.1
        for <linux-next@vger.kernel.org>; Thu, 21 May 2020 13:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p+M48zwL3P4qBswmkDG7wpCz13PEIl+461d3T9PW9JI=;
        b=RqtfZL2mrsTsE3QMSTR7kttcHNVDTsG6Xg3tPcha4m5UZZ/qQOvBxOwMTCdgJ64XMD
         e6QquJJpnJTV955pm4XPNMjOA3KI/KRCZQIJ7DOIV/tUFFGb8v8cw/3FsYy6mBptb8q7
         x97xxC/KE/bSeLzJj0/lm3xauWU6TZOPgRC7YmAOyt36tU8hDTYTuPw/nLmswirUCMkL
         t1o1+EEmTDw34Re2j4ED9mjqbV6TCBPwML3sgnfT9KHqkP9sQVvhKkZbX3r1NOROOk16
         xU7CsXzdyBm1anFhSkxZSGjYRwlx3GwGZXhtdjnWnZewmm7wwUnIrmL/pruHCP2gBTHR
         o5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p+M48zwL3P4qBswmkDG7wpCz13PEIl+461d3T9PW9JI=;
        b=MkVMxM61LCw/Bwz+jh84/bkjCEirsZJ4RHPKeen8Hqte+yP7dQkCHGU1GR71gans1/
         JiMgRCUBGMIp55lAxxoWlmcAKQ7YeQKaznz1G31PkISIa6fSPQ+gHeAM1Ksz/TGolOVt
         DY1apOelELSBdECHHUS4Jmf7dxwbjNgZOUMhRgrkRr5wksD8e7sfDLBVqd74bExbSYFK
         ZyPzbPalQnQ3bb6wtUt68EaupQzzrdjO6eLDfLKfu/gBxS2E5fS995kIVmj1sZRA9tQN
         dkcKj0XjL6NnICnvMkPGqQlOx8C7qQlwRocFosHBFAN90fi4gn6NnOAeiwmmcO+9X8tK
         rdeQ==
X-Gm-Message-State: AOAM530GpIQ17c2ZhzjtESdmHfGrMI2wZcsE8arQtW70HKoUqwOvhv1U
        bugKNybzSd9HwYCDWYV3WodDxA==
X-Google-Smtp-Source: ABdhPJxuDgWajhOJpYbZyhzmQrMl0wXOrI1gpt5F94tu2v9uUy7JCkQrqhkVnBdI36hQ6lRUzRXDbw==
X-Received: by 2002:a37:a889:: with SMTP id r131mr3411165qke.197.1590091250787;
        Thu, 21 May 2020 13:00:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id f127sm5546136qkj.61.2020.05.21.13.00.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 13:00:50 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
        (envelope-from <jgg@ziepe.ca>)
        id 1jbrN3-0002Yf-FV; Thu, 21 May 2020 17:00:49 -0300
Date:   Thu, 21 May 2020 17:00:49 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Danil Kipnis <danil.kipnis@cloud.ionos.com>,
        linux-block@vger.kernel.org, linux-rdma@vger.kernel.org,
        linux-next@vger.kernel.org, axboe@kernel.dk, dledford@redhat.com,
        bvanassche@acm.org, leon@kernel.org, jinpu.wang@cloud.ionos.com
Subject: Re: [PATCH v2] rnbd/rtrs: pass max segment size from blk user to the
 rdma library
Message-ID: <20200521200049.GC17583@ziepe.ca>
References: <20200519084812.GP188135@unreal>
 <20200519111419.924170-1-danil.kipnis@cloud.ionos.com>
 <20200519234443.GB30609@ziepe.ca>
 <6de09fa5-5a4f-dec4-7101-8dd27ca4c764@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6de09fa5-5a4f-dec4-7101-8dd27ca4c764@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 21, 2020 at 09:12:59AM -0700, Randy Dunlap wrote:
> On 5/19/20 4:44 PM, Jason Gunthorpe wrote:
> > On Tue, May 19, 2020 at 01:14:19PM +0200, Danil Kipnis wrote:
> >> When Block Device Layer is disabled, BLK_MAX_SEGMENT_SIZE is undefined.
> >> The rtrs is a transport library and should compile independently of the
> >> block layer. The desired max segment size should be passed down by the
> >> user.
> >>
> >> Introduce max_segment_size parameter for the rtrs_clt_open() call.
> >>
> >> Fixes: f7a7a5c228d4 ("block/rnbd: client: main functionality")
> >> Fixes: 6a98d71daea1 ("RDMA/rtrs: client: main functionality")
> >> Fixes: cb80329c9434 ("RDMA/rtrs: client: private header with client structs and functions")
> >> Fixes: b5c27cdb094e ("RDMA/rtrs: public interface header to establish RDMA connections")
> >>
> >> Signed-off-by: Danil Kipnis <danil.kipnis@cloud.ionos.com>
> >> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> >> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> >> v1->v2 Add Fixes lines.
> > 
> > Applied to for-next, thanks
> 
> Hi Jason,
> 
> Does your "for-next" feed into linux-next?
> I am still seeing this build error today (linux-next 20200521).

Yes, it is usually delayed a bit. It should be there tomorrow

Thanks,
Jason
