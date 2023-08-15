Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B06B977CC06
	for <lists+linux-next@lfdr.de>; Tue, 15 Aug 2023 13:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236858AbjHOLuG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 15 Aug 2023 07:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236867AbjHOLtk (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 15 Aug 2023 07:49:40 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B6AE1985
        for <linux-next@vger.kernel.org>; Tue, 15 Aug 2023 04:49:30 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-76ad842d12fso359562085a.3
        for <linux-next@vger.kernel.org>; Tue, 15 Aug 2023 04:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1692100169; x=1692704969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T+oV4OJqksoKrrOVqvE1dcZLounPv8Ok3JnUcRmYUME=;
        b=STewdZOUFdZkhOBFpHmxizNZ1c1uO8h9AahPqSM/bT5mtfAMxp/JPdVz2gwZqkGmYX
         CXUOy9IYCXGCzF3+rDerXnpoPRTSaME6gIV3+YX4He/3RwZ7YmZPtKP4okT4gQ5aVN20
         6cWEK8KTmk8A3mcW+j+gCNyyaMNei4bg0w0ZT+dDgr+wEOaUGbEe0JwkFSF22bDlAy4J
         esSPi0q4M3Ba0gD3p3CWj3sM/8FZucH6suDWsInP9IETZM/LcMw/APtN+NszrWsHvIIT
         i0v+RG6adtYNoRGQcTvaigBB2aFfCfvZNouda14VkK1JFzxsap17cqjYeHh8VzXo07yw
         dvqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692100169; x=1692704969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+oV4OJqksoKrrOVqvE1dcZLounPv8Ok3JnUcRmYUME=;
        b=Ocz/7/IkGjvzISFdBT055CGBAePC4/eZ/5obgH9vZFlbeLAOYu1aPw8rmr3kw7oCfG
         OqcTf0pgW/2BVHNsyQF7lAyuJb3r2wwZ/qJr7cnCZ7o8OSoEo0loXwVo+DVzrCbFq8L/
         V4660dJZVpSMOXDM3ClQAaqRFdIxdCGMo1rWBtwGChP4dWUw0d0/kMKGS3+dkhQvuo42
         AxSAACLTG/tHYMKxvK7tBbXtk4JyNjK3jpJhV+lxvoTpI8JxkgOFaiHmHXLRKnaMoCmT
         3A1jxlNSWmBzk3OHkP1Dz3UVWpoNY2GJjSwaOQAOnbYB8+c6nhKxaQHEG5nYYfOplkDK
         RA4Q==
X-Gm-Message-State: AOJu0YyfWSHzeP+OnsSJYkwS70AUMYR5WrCcSyKSjbC8UGHY6dZxqsqg
        h+RQepIHY7D0g9rzUO8+bhC0fotKN1r8VKD5iSY=
X-Google-Smtp-Source: AGHT+IFYlxCaiz/GhuJRu3EPuGKafe/PtsfPGq6WvwzBhtCzK32OsxzfaAmFeIUznd0xlljtiCY5Gw==
X-Received: by 2002:ac8:5bcd:0:b0:3ff:23e4:40b4 with SMTP id b13-20020ac85bcd000000b003ff23e440b4mr16770979qtb.42.1692100169514;
        Tue, 15 Aug 2023 04:49:29 -0700 (PDT)
Received: from ziepe.ca ([24.114.95.117])
        by smtp.gmail.com with ESMTPSA id bq22-20020a05622a1c1600b00406b11a54b8sm3749564qtb.7.2023.08.15.04.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 04:49:28 -0700 (PDT)
Received: from jgg by NV-9X0Z6D3. with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1qVsJg-0000AV-Hm;
        Tue, 15 Aug 2023 08:34:28 -0300
Date:   Tue, 15 Aug 2023 08:34:28 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Joerg Roedel <joro@8bytes.org>, Joerg Roedel <jroedel@suse.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the iommufd tree
Message-ID: <ZNtixPkYKHnWiVv1@ziepe.ca>
References: <20230815210437.12bd89b0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815210437.12bd89b0@canb.auug.org.au>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 15, 2023 at 09:04:37PM +1000, Stephen Rothwell wrote:
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 20c9a0501760..1e017e1bf5ea 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -332,7 +332,7 @@ int iommu_device_register_bus(struct iommu_device *iommu,
>  	spin_unlock(&iommu_device_lock);
>  
>  	bus->iommu_ops = ops;
> -	err = bus_iommu_probe(bus);
> +	err = bus_iommu_probe(bus, iommu);
>  	if (err) {
>  		iommu_device_unregister_bus(iommu, bus, nb);
>  		return err;

This is the right fix

Thanks,
Jason

