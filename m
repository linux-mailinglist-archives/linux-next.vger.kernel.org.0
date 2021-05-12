Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 676F237B8A3
	for <lists+linux-next@lfdr.de>; Wed, 12 May 2021 10:52:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbhELIxu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 May 2021 04:53:50 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:3064 "EHLO
        frasgout.his.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbhELIxu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 May 2021 04:53:50 -0400
Received: from fraeml734-chm.china.huawei.com (unknown [172.18.147.206])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Fg7YY61mnz6tmwH;
        Wed, 12 May 2021 16:41:21 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml734-chm.china.huawei.com (10.206.15.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 12 May 2021 10:52:40 +0200
Received: from localhost (10.52.125.138) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 12 May
 2021 09:52:39 +0100
Date:   Wed, 12 May 2021 09:50:57 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Greg KH <greg@kroah.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Tomasz Duszynski <tomasz.duszynski@octakon.com>
Subject: Re: linux-next: manual merge of the iio tree with the
 staging.current tree
Message-ID: <20210512095057.00000715@Huawei.com>
In-Reply-To: <20210512114805.5bcef396@canb.auug.org.au>
References: <20210512114342.286dd7d6@canb.auug.org.au>
        <20210512114805.5bcef396@canb.auug.org.au>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.52.125.138]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 12 May 2021 11:48:05 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Wed, 12 May 2021 11:43:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > Today's linux-next merge of the iio tree got a conflict in:
> > 
> >   drivers/iio/industrialio-core.c
> > 
> > between commit:
> > 
> >   901f84de0e16 ("iio: core: fix ioctl handlers removal")
> > 
> > from the staging.current tree and commit:
> > 
> >   919a6adf8107 ("iio: core: move @chrdev from struct iio_dev to struct iio_dev_opaque")
> > 
> > from the iio tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > diff --cc drivers/iio/industrialio-core.c
> > index 59efb36db2c7,efb4cf91c9e4..000000000000
> > --- a/drivers/iio/industrialio-core.c
> > +++ b/drivers/iio/industrialio-core.c
> > @@@ -1785,10 -1811,10 +1810,10 @@@ static long iio_ioctl(struct file *filp
> >   	}
> >   
> >   	if (ret == IIO_IOCTL_UNHANDLED)
> >  -		ret = -EINVAL;
> >  +		ret = -ENODEV;
> >   
> >   out_unlock:
> > - 	mutex_unlock(&indio_dev->info_exist_lock);
> > + 	mutex_unlock(&iio_dev_opaque->info_exist_lock);
> >   
> >   	return ret;
> >   }
> > @@@ -1925,9 -1951,12 +1950,9 @@@ EXPORT_SYMBOL(__iio_device_register)
> >    **/
> >   void iio_device_unregister(struct iio_dev *indio_dev)
> >   {
> > - 	cdev_device_del(&indio_dev->chrdev, &indio_dev->dev);
> >  -	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(indio_dev);
> >  -	struct iio_ioctl_handler *h, *t;
> >  -
> > + 	cdev_device_del(&iio_dev_opaque->chrdev, &indio_dev->dev);
> >   
> > - 	mutex_lock(&indio_dev->info_exist_lock);
> > + 	mutex_lock(&iio_dev_opaque->info_exist_lock);
> >   
> >   	iio_device_unregister_debugfs(indio_dev);
> >     
> 
> Actually, I had to add back the iio_dev_opaque declaration line.
> 

Makes sense.  I'll deal with this in the IIO tree after rc2.

thanks,

Jonathan
