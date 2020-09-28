Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 337B427AC18
	for <lists+linux-next@lfdr.de>; Mon, 28 Sep 2020 12:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbgI1Km3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Sep 2020 06:42:29 -0400
Received: from lhrrgout.huawei.com ([185.176.76.210]:2926 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726610AbgI1Km3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 28 Sep 2020 06:42:29 -0400
Received: from lhreml710-chm.china.huawei.com (unknown [172.18.7.107])
        by Forcepoint Email with ESMTP id 9A98AFEF8C0DC0021CE8;
        Mon, 28 Sep 2020 11:42:27 +0100 (IST)
Received: from localhost (10.52.126.2) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1913.5; Mon, 28 Sep
 2020 11:42:27 +0100
Date:   Mon, 28 Sep 2020 11:40:46 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Andrew Morton <akpm@linux-foundation.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Dan Williams <dan.j.williams@intel.com>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the akpm-current tree with the pm
 tree
Message-ID: <20200928114046.000005ae@Huawei.com>
In-Reply-To: <20200928202459.419ce848@canb.auug.org.au>
References: <20200928202459.419ce848@canb.auug.org.au>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.126.2]
X-ClientProxiedBy: lhreml707-chm.china.huawei.com (10.201.108.56) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 28 Sep 2020 20:24:59 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   drivers/acpi/numa/hmat.c
> 
> between commits:
> 
>   01feba590cd6 ("ACPI: Do not create new NUMA domains from ACPI static tables that are not SRAT")
>   4eb3723f18e9 ("ACPI: Rename acpi_map_pxm_to_online_node() to pxm_to_online_node()")
> 
> from the pm tree and commit:
> 
>   b499f2c84cbf ("ACPI: HMAT: refactor hmat_register_target_device to hmem_register_device")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

Looks like the correct conflict fix to me.

Thanks

Jonathan

