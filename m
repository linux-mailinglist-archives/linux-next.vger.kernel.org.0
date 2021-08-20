Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1925F3F2CC1
	for <lists+linux-next@lfdr.de>; Fri, 20 Aug 2021 15:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240605AbhHTNHN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Aug 2021 09:07:13 -0400
Received: from mail-lj1-f180.google.com ([209.85.208.180]:45797 "EHLO
        mail-lj1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238220AbhHTNHN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Aug 2021 09:07:13 -0400
Received: by mail-lj1-f180.google.com with SMTP id l18so9681215lji.12;
        Fri, 20 Aug 2021 06:06:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EeTKhoiyOvt4X/wpO3VhebtTpAujOSN4zW5f3GEK5zU=;
        b=jFRqtQPoUkzOqvYvJhnRBkbOp7bH9Cq8WWhk9C4F5D1aaC8ujPfOkv9JxKQOkzfHeV
         zli2QugNaUTSrP76iFR8n5ibuF6jT+bcLpOWtsEMJZSAsdFZY/0htXiHjFub+qA+JMko
         DM1f8wRCY7FOLTMiavwscNR2P+MXSRMoCHcpjDwLHpHzgYY26K2I4l9a+b8IuGGLTC62
         RFptuupZcxuYmkA/zvO44gx95pZh4EnhBeHSdIqLhXpyDTVn9blFWoV/00C0AjYFWYaY
         5J/nks7618dj5FAPulch04TvpSDn3c1KoZ+zL7FRoag1Z1zF0GHecqNmF6WbCuSlpXxn
         QP/Q==
X-Gm-Message-State: AOAM533JWi5XzkEI+MiSNNszwGc7brNzPW36WdEh2INvOcoUDy+etbXZ
        NXeD0etqhnQsJJ3nLAJTj+k=
X-Google-Smtp-Source: ABdhPJzrBdnF3WYX0YUc4mykYxePJqGLXs5WRFGrwWqmTDMt32EINylc/QEpceu8NNSf4Z7f8B6AUA==
X-Received: by 2002:a2e:a4bb:: with SMTP id g27mr9877827ljm.110.1629464794363;
        Fri, 20 Aug 2021 06:06:34 -0700 (PDT)
Received: from rocinante ([95.155.85.46])
        by smtp.gmail.com with ESMTPSA id x14sm688225lfg.220.2021.08.20.06.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 06:06:33 -0700 (PDT)
Date:   Fri, 20 Aug 2021 15:06:33 +0200
From:   Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Greg KH <greg@kroah.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 pci-current tree
Message-ID: <20210820130633.GB183257@rocinante>
References: <20210820151357.793f0b31@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210820151357.793f0b31@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   drivers/pci/pci-sysfs.c
> 
> between commit:
> 
>   045a9277b561 ("PCI/sysfs: Use correct variable for the legacy_mem sysfs object")
> 
> from the pci-current tree and commits:
> 
>   93bb8e352a91 ("sysfs: Invoke iomem_get_mapping() from the sysfs open callback")
>   f06aff924f97 ("sysfs: Rename struct bin_attribute member to f_mapping")
> 
> from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thank you for fixing this!

We did crossed the streams there a little bit, so to speak.  Sincere
apologies.

	Krzysztof
