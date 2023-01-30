Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2DCE68180D
	for <lists+linux-next@lfdr.de>; Mon, 30 Jan 2023 18:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236058AbjA3R4n (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Jan 2023 12:56:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjA3R4m (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Jan 2023 12:56:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB7EB3A872
        for <linux-next@vger.kernel.org>; Mon, 30 Jan 2023 09:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675101354;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Wo7cDMhDh3KUEY93xfDj6PAM7si0Dt2e0ZmKREkC3R4=;
        b=IFgsnQNYdd/5DaDvHNMhF0EkvePZ6MNi8AyfmUuDschPQfR3CT+VVtF139qK28xIrDe5fH
        GFUzk13uNt2lYVVfFojpZXSsdR0Fmffpu2SpR95oPrwrDz7ocixb3GS1Aet1zXtfBAE5rB
        Hf3v7h+/epSAOSjDW70o3zqZ3AaB8go=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-boeesPmmO2i8DNRVnHMtvw-1; Mon, 30 Jan 2023 12:55:52 -0500
X-MC-Unique: boeesPmmO2i8DNRVnHMtvw-1
Received: by mail-il1-f198.google.com with SMTP id v6-20020a056e0213c600b00310f8577354so1852722ilj.9
        for <linux-next@vger.kernel.org>; Mon, 30 Jan 2023 09:55:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wo7cDMhDh3KUEY93xfDj6PAM7si0Dt2e0ZmKREkC3R4=;
        b=1PFUm1erW0UxDWwjl0Wey5rIBH+Zy9ZQST7yrf1iholUz11TqMYLpTouw8lYvUj8JF
         iR1S9PyqgEVZafp+D7ERrwLQWNJ/7v0BcEswaybZfsRWKqw60qoRWLIBJO1nnhe+zKws
         tu/q0miE+H0SWbTj8Mm0ZxcxCs5clw3hiqzpUzr6z+GUV/dMDdKo5mIiwsVj8jujj7WV
         FnCJzHq9ykkDCczZcBVc3ZZA9sgpSiQABm3gA02eWUzQ/dK9+h32cB3Z6SahlA5tGpAL
         jmcbUrOUoW370yLiHRlaKGbja4VBAvlQrwI2hJAB+f+AYgByicuREBoLyMB0BfQiATcM
         Qlqg==
X-Gm-Message-State: AO0yUKW72xL6M4R9V2XmbJMZcqI0mRINQlgRhfRT+PXGNneuIyQB7ilK
        r8laNoxmXAczMZqnyzR9FsBSFtlT+7uX0v+SRcXjJjFx8vu/TmJ1E+5RawJ5MxYGkbZ1qVNfXLQ
        MEDTNBR9XwvOA3RFqnUP1YA==
X-Received: by 2002:a05:6e02:1645:b0:30c:1b0:fcf6 with SMTP id v5-20020a056e02164500b0030c01b0fcf6mr8417281ilu.7.1675101352191;
        Mon, 30 Jan 2023 09:55:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8nX3XySx+14VaCnnwOnPkxkUPIA8FP3+tr2FlxZ6foKcyL/EAK7UjS5b12ySh0oJMeOyR8Kw==
X-Received: by 2002:a05:6e02:1645:b0:30c:1b0:fcf6 with SMTP id v5-20020a056e02164500b0030c01b0fcf6mr8417265ilu.7.1675101351943;
        Mon, 30 Jan 2023 09:55:51 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id a16-20020a92d590000000b0031093e9c7fasm4150770iln.85.2023.01.30.09.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 09:55:51 -0800 (PST)
Date:   Mon, 30 Jan 2023 10:55:49 -0700
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Joerg Roedel <jroedel@suse.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Joerg Roedel <joro@8bytes.org>,
        Jason Gunthorpe <jgg@nvidia.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: linux-next: manual merge of the iommu tree with Linus' tree
Message-ID: <20230130105549.70044a51.alex.williamson@redhat.com>
In-Reply-To: <Y9eEjCsWUWeFccGd@suse.de>
References: <20230127141330.28b2c653@canb.auug.org.au>
        <Y9eEjCsWUWeFccGd@suse.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 30 Jan 2023 09:49:16 +0100
Joerg Roedel <jroedel@suse.de> wrote:

> Thanks for the report, Stephen.
> 
> Alex,
> 
> On Fri, Jan 27, 2023 at 02:13:30PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > Today's linux-next merge of the iommu tree got a conflict in:
> > 
> >   drivers/vfio/vfio_iommu_type1.c
> > 
> > between commit:
> > 
> >   895c0747f726 ("vfio/type1: Respect IOMMU reserved regions in vfio_test_domain_fgsp()")
> > 
> > from Linus' tree and commit:
> > 
> >   1369459b2e21 ("iommu: Add a gfp parameter to iommu_map()")
> > 
> > from the iommu tree.  
> 
> In case you want to fix this up in your tree, the patch-set causing this
> is in a separate branch in the IOMMU tree which you can merge into your
> tree:
> 
> 	git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git iommu-memory-accounting

Hi Joerg,

The conflict is with mainline, not my next branch.  The commit above
went in as a fix for v6.2.  Thanks,

Alex

