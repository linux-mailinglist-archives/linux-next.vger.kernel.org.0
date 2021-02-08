Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4B95313A09
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 17:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234325AbhBHQtn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 11:49:43 -0500
Received: from mga04.intel.com ([192.55.52.120]:11465 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234678AbhBHQsQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Feb 2021 11:48:16 -0500
IronPort-SDR: qsdeONBKkLpGO9/dJeHGFeoK/qfvFWn58G21PHAE9OTHbWo2C7XnxCNNJ0wV8VjORcX/PuanO3
 OD2mHDpW9oWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="179181609"
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; 
   d="scan'208";a="179181609"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 08:46:22 -0800
IronPort-SDR: B+Ir28btZSuTbBOqiRenJDSRItnbw/1bi4Wk6J9ruur0hyhbS9VCHB0mlMsKA4/7a+xYIjjnHs
 8cZ70rZubCvA==
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; 
   d="scan'208";a="509529035"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2021 08:46:20 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 4C04C2082C; Mon,  8 Feb 2021 18:46:18 +0200 (EET)
Date:   Mon, 8 Feb 2021 18:46:18 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20210208164618.GY32460@paasikivi.fi.intel.com>
References: <20210208233716.16d962ad@canb.auug.org.au>
 <56cd99bbf526b43507579b5775bac5f885319866.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56cd99bbf526b43507579b5775bac5f885319866.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Ezequiel,

Thanks for addressing this.

On Mon, Feb 08, 2021 at 01:42:21PM -0300, Ezequiel Garcia wrote:
> Hi Stephen,
> 
> On Mon, 2021-02-08 at 23:37 +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the v4l-dvb tree, today's linux-next build (htmldocs)
> > produced this warning:
> > 
> > include/media/v4l2-async.h:178: warning: expecting prototype for v4l2_async_notifier_add_fwnode_subdev(). Prototype was for
> > __v4l2_async_notifier_add_fwnode_subdev() instead
> > include/media/v4l2-async.h:207: warning: expecting prototype for v4l2_async_notifier_add_fwnode_remote_subdev(). Prototype was for
> > __v4l2_async_notifier_add_fwnode_remote_subdev() instead
> > include/media/v4l2-async.h:230: warning: expecting prototype for v4l2_async_notifier_add_i2c_subdev(). Prototype was for
> > __v4l2_async_notifier_add_i2c_subdev() instead
> > 
> > Maybe introduced by commit
> > 
> >   c1cc23625062 ("media: v4l2-async: Discourage use of v4l2_async_notifier_add_subdev")
> > 
> 
> Thanks for spotting this. Should be fixed by:
> 
> diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> index 6f22daa6f067..3785445282fc 100644
> --- a/include/media/v4l2-async.h
> +++ b/include/media/v4l2-async.h
> @@ -157,7 +157,7 @@ int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
>  				   struct v4l2_async_subdev *asd);
>  
>  /**
> - * v4l2_async_notifier_add_fwnode_subdev - Allocate and add a fwnode async
> + * __v4l2_async_notifier_add_fwnode_subdev - Allocate and add a fwnode async

The problem with the approach is that this no longer documents the API that
drivers are intended to use, but the intermediate one. I guess fixing
this properly could require changes to kerneldoc so I have no objections to
the approach.

>   *				subdev to the notifier's master asd_list.
>   *
>   * @notifier: pointer to &struct v4l2_async_notifier
> @@ -181,7 +181,7 @@ __v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
>  						   sizeof(__type)))
>  
>  /**
> - * v4l2_async_notifier_add_fwnode_remote_subdev - Allocate and add a fwnode
> + * __v4l2_async_notifier_add_fwnode_remote_subdev - Allocate and add a fwnode
>   *						  remote async subdev to the
>   *						  notifier's master asd_list.
>   *
> @@ -210,7 +210,7 @@ __v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif
>  							  sizeof(__type)))
>  
>  /**
> - * v4l2_async_notifier_add_i2c_subdev - Allocate and add an i2c async
> + * __v4l2_async_notifier_add_i2c_subdev - Allocate and add an i2c async
>   *				subdev to the notifier's master asd_list.
>   *
>   * @notifier: pointer to &struct v4l2_async_notifier
> @@ -228,7 +228,7 @@ struct v4l2_async_subdev *
>  __v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
>  				     int adapter_id, unsigned short address,
>  				     unsigned int asd_struct_size);
> -#define v4l2_async_notifier_add_i2c_subdev(__notifier, __adap, __addr, __type)	\
> +#define v4l2_async_notifier_i2c(__notifier, __adap, __addr, __type)	\

I guess this change was not intentional?

>  ((__type *)__v4l2_async_notifier_add_i2c_subdev(__notifier, __adap, __addr,	\
>  						sizeof(__type)))
>  
> 

-- 
Kind regards,

Sakari Ailus
