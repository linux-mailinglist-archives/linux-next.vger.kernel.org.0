Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 366774EF83F
	for <lists+linux-next@lfdr.de>; Fri,  1 Apr 2022 18:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240144AbiDAQqO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Apr 2022 12:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349460AbiDAQqJ (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 Apr 2022 12:46:09 -0400
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C76B8A66FE
        for <linux-next@vger.kernel.org>; Fri,  1 Apr 2022 09:28:53 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id v13so2533462qkv.3
        for <linux-next@vger.kernel.org>; Fri, 01 Apr 2022 09:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/oJPJBj5S0bapYKasyhopBzSNDWA25qTBcTqIl6bNLc=;
        b=gyEoATYAqUiHXgO1CYKwAFrBY9nGAjFAp2aI6UkTwylTsAIrDI5RrO50wxWSMAV35n
         sTXyRqVL/oKo5AtUIYgMcpZ5DYFllRDuE72D9BnhzchOlnE9SjgOSZo8QAxsz02gVLAT
         6LmW3ExeJQf/p3Ohld0Eab8I/AiqsZjPNA9b0cGuJNYBv0t0Zh0OmghdCOLPOVSPHa1u
         RTE1AMiYQlOd55TWuXMT+ZlkCa8rmnWFBPMkS2kwAaonOfVSmn2NrGm4jErncO/XIbuR
         PXTKHRyr/l2JE8uZ/3kh/8/j2rzBu/Dh30kJHJvP5u9Cpp5OG7YR8xNLVzvnn2oThm4U
         LXIA==
X-Gm-Message-State: AOAM530dDVAwaRI053IDhDZbOgQ3FJU7M+h+hFGa0F0DsK4XHOpQjcTq
        RjdjRsPs3oCDH7CXWLQseDrh
X-Google-Smtp-Source: ABdhPJyTu2CWqNhv6gAWV/qlK3Su+tfFp91FXbCJ/z6jOpdyiPtszIXCFQY1MO4rOV5b4NeYDmKFxg==
X-Received: by 2002:a37:ef13:0:b0:680:fc96:f63a with SMTP id j19-20020a37ef13000000b00680fc96f63amr7090566qkk.248.1648830532970;
        Fri, 01 Apr 2022 09:28:52 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net. [68.160.176.52])
        by smtp.gmail.com with ESMTPSA id n131-20020a372789000000b0067bce1ac001sm1509772qkn.71.2022.04.01.09.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 09:28:52 -0700 (PDT)
Date:   Fri, 1 Apr 2022 12:28:50 -0400
From:   Mike Snitzer <snitzer@kernel.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Alasdair G Kergon <agk@redhat.com>,
        Jens Axboe <axboe@kernel.dk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the device-mapper tree with the
 block tree
Message-ID: <YkcoQh7jzltS8wiW@redhat.com>
References: <20220331094425.0a9e0b92@canb.auug.org.au>
 <20220401052009.GA9398@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220401052009.GA9398@lst.de>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Apr 01 2022 at  1:20P -0400,
Christoph Hellwig <hch@lst.de> wrote:

> On Thu, Mar 31, 2022 at 09:44:25AM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the device-mapper tree got a conflict in:
> > 
> >   include/linux/bio.h
> > 
> > between commit:
> > 
> >   57c47b42f454 ("block: turn bio_kmalloc into a simple kmalloc wrapper")
> > 
> > from the block tree and commit:
> > 
> >   135eaaabd22a ("block: allow using the per-cpu bio cache from bio_alloc_bioset")
> 
> Isn't this something Jens already had queued up in the block tree?
> 

Yes, but Jens hasn't staged 5.19 commits taken early in linux-next
yet.  So I just left the changes in linux-dm.git's for-next to get
coverage in the interim.

Mike
