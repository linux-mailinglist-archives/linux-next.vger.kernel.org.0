Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69365B7E23
	for <lists+linux-next@lfdr.de>; Thu, 19 Sep 2019 17:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391234AbfISP1z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Sep 2019 11:27:55 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40092 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391130AbfISP1w (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Sep 2019 11:27:52 -0400
Received: by mail-ot1-f68.google.com with SMTP id y39so3441084ota.7
        for <linux-next@vger.kernel.org>; Thu, 19 Sep 2019 08:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BQhJr69/vPd/U/psJVJ1y2BU+JZc/GqWvX4OAnagwrY=;
        b=TU+WvyEN5IqmhO1QeCdr0zyP5aga8ovoC/U2eRs61E+zTYw6pidSqTlkToVYeiIHo6
         vCcaYto8j9wnV9tJrRMQRX0nadMJFe7U6CZLGRjbdhBK35pUGFPhvnnu9BcvNG6vl1yA
         wtSwB0eb62xfZVsN+sGz7OcIHWAUcDVZ8eQ0ZxSoKRT+1F202vpKjLle/8YGBqDDH793
         uBqFTCNdFgu9r/ReamEEtBFyyRKuV9ACURztz002sq82ARVTbabM+KjTIkK7pfmcHezX
         2DxqyGFnmk7tvKZz12hstb8UMYVmd4W5+0DAM8450Uy88YRbBd9mPpjxKKhT19A+kApK
         /9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BQhJr69/vPd/U/psJVJ1y2BU+JZc/GqWvX4OAnagwrY=;
        b=MUyp60ftHj2ZYduqa3CzNuO4LW55ZTiwHDwGmCD95f3tzv6dVligAZn2AZGSHX3Q6A
         4hZjnWwzP81jPCGb5fcTjJyL/0xi7ruKilXz/1nwL99dE0hpvTa20Cv2MiYGr+odSuJj
         /EFqMCsuLoZByXicAIOLrgEt4xmolqCYfvIZ8LBjGj+aOFYpeGbuKC+uSBiieMqqpDwd
         zGAfofHvq84qceJryJ/yFeCB4PIDdhWKBqI4QqYvjHgbMuEFHMcQuNLG1E2tF4o8WOfw
         Lvl0ok+M6gEi8DbEhJAF9rALjWMBufdvaknzgAazNU9BvqB0UdmOAZ56e5uMnlnMxKxB
         jwxg==
X-Gm-Message-State: APjAAAVu3fSZUClNxiPdhSqMLC26fY5nV/u78HDwQ6Hh57Vgng/zsToJ
        JSA1m8Zt/tGjFYknR2wwP/AX+QrEUdAthzqt5wzSXQ==
X-Google-Smtp-Source: APXvYqxSV6mNOx+JelZSXq1gKYybEh6/xyhCkyebC74L1X6VZAart17bTvoaHHN9s5S2diRF49ItUjuFyqqea11bCLs=
X-Received: by 2002:a9d:6014:: with SMTP id h20mr7012748otj.207.1568906871267;
 Thu, 19 Sep 2019 08:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190919150147.GO3642@sirena.co.uk>
In-Reply-To: <20190919150147.GO3642@sirena.co.uk>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Thu, 19 Sep 2019 08:27:40 -0700
Message-ID: <CAPcyv4hq2N2H-HszhEm-rT2YziTLSeU1A5ea19-bDvSXMZLjCw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the nvdimm tree with the
 libnvdimm-fixes tree
To:     Mark Brown <broonie@kernel.org>
Cc:     "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
        Yi Zhang <yi.zhang@redhat.com>, Jeff Moyer <jmoyer@redhat.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Sep 19, 2019 at 8:02 AM Mark Brown <broonie@kernel.org> wrote:
>
> Hi all,
>
> Today's linux-next merge of the nvdimm tree got a conflict in:
>
>   drivers/nvdimm/pfn_devs.c
>
> between commit:
>
>   274b924088e935 ("libnvdimm/pfn: Fix namespace creation on misaligned addresses")
>
> from the libnvdimm-fixes tree and commit:
>
>   edbb52c24441ab ("libnvdimm/pfn_dev: Add page size and struct page size to pfn superblock")
>
> from the nvdimm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc drivers/nvdimm/pfn_devs.c
> index cb98b8fe786e2,80c7992bc5389..0000000000000
> --- a/drivers/nvdimm/pfn_devs.c
> +++ b/drivers/nvdimm/pfn_devs.c
> @@@ -724,9 -786,10 +788,11 @@@ static int nd_pfn_init(struct nd_pfn *n
>         memcpy(pfn_sb->uuid, nd_pfn->uuid, 16);
>         memcpy(pfn_sb->parent_uuid, nd_dev_to_uuid(&ndns->dev), 16);
>         pfn_sb->version_major = cpu_to_le16(1);
> -       pfn_sb->version_minor = cpu_to_le16(3);
> +       pfn_sb->version_minor = cpu_to_le16(4);
>  +      pfn_sb->end_trunc = cpu_to_le32(end_trunc);
>         pfn_sb->align = cpu_to_le32(nd_pfn->align);
> +       pfn_sb->page_struct_size = cpu_to_le16(MAX_STRUCT_PAGE_SIZE);
> +       pfn_sb->page_size = cpu_to_le32(PAGE_SIZE);
>         checksum = nd_sb_checksum((struct nd_gen_sb *) pfn_sb);
>         pfn_sb->checksum = cpu_to_le64(checksum);

Yes, looks correct. Apologies for not highlighting this conflict in advance.
