Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE12834CD04
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 11:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231659AbhC2J1A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 29 Mar 2021 05:27:00 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2744 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbhC2J05 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 29 Mar 2021 05:26:57 -0400
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4F86Xq4FKBz684bW;
        Mon, 29 Mar 2021 17:22:03 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 29 Mar 2021 11:26:56 +0200
Received: from localhost (10.47.26.85) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 29 Mar
 2021 10:26:55 +0100
Date:   Mon, 29 Mar 2021 10:25:34 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Greg KH <greg@kroah.com>, Sudeep Holla <sudeep.holla@arm.com>,
        "Cristian Marussi" <cristian.marussi@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the staging tree with the scmi tree
Message-ID: <20210329102534.00001a6a@Huawei.com>
In-Reply-To: <20210329163700.673b51e9@canb.auug.org.au>
References: <20210329163700.673b51e9@canb.auug.org.au>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.26.85]
X-ClientProxiedBy: lhreml718-chm.china.huawei.com (10.201.108.69) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 29 Mar 2021 16:37:00 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/iio/common/scmi_sensors/scmi_iio.c
> 
> between commit:
> 
>   fc91d6b6f0ba ("iio/scmi: port driver to the new scmi_sensor_proto_ops interface")
> 
> from the scmi tree and commit:
> 
>   1b33dfa5d5f1 ("Merge remote-tracking branch 'local/ib-iio-scmi-5.12-rc2-take3' into togreg")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>

Thanks Stephen,

Looks right. I'll check the overall result once your tree is public.

Jonathan
