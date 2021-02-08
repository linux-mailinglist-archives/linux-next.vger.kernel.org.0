Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4311B3139E8
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 17:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233455AbhBHQnQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 11:43:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234602AbhBHQnK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2021 11:43:10 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9C12C061788;
        Mon,  8 Feb 2021 08:42:29 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id D105E1F450D7
Message-ID: <56cd99bbf526b43507579b5775bac5f885319866.camel@collabora.com>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Mon, 08 Feb 2021 13:42:21 -0300
In-Reply-To: <20210208233716.16d962ad@canb.auug.org.au>
References: <20210208233716.16d962ad@canb.auug.org.au>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Mon, 2021-02-08 at 23:37 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the v4l-dvb tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> include/media/v4l2-async.h:178: warning: expecting prototype for v4l2_async_notifier_add_fwnode_subdev(). Prototype was for
> __v4l2_async_notifier_add_fwnode_subdev() instead
> include/media/v4l2-async.h:207: warning: expecting prototype for v4l2_async_notifier_add_fwnode_remote_subdev(). Prototype was for
> __v4l2_async_notifier_add_fwnode_remote_subdev() instead
> include/media/v4l2-async.h:230: warning: expecting prototype for v4l2_async_notifier_add_i2c_subdev(). Prototype was for
> __v4l2_async_notifier_add_i2c_subdev() instead
> 
> Maybe introduced by commit
> 
>   c1cc23625062 ("media: v4l2-async: Discourage use of v4l2_async_notifier_add_subdev")
> 

Thanks for spotting this. Should be fixed by:

diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 6f22daa6f067..3785445282fc 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -157,7 +157,7 @@ int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_subdev *asd);
 
 /**
- * v4l2_async_notifier_add_fwnode_subdev - Allocate and add a fwnode async
+ * __v4l2_async_notifier_add_fwnode_subdev - Allocate and add a fwnode async
  *				subdev to the notifier's master asd_list.
  *
  * @notifier: pointer to &struct v4l2_async_notifier
@@ -181,7 +181,7 @@ __v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifier,
 						   sizeof(__type)))
 
 /**
- * v4l2_async_notifier_add_fwnode_remote_subdev - Allocate and add a fwnode
+ * __v4l2_async_notifier_add_fwnode_remote_subdev - Allocate and add a fwnode
  *						  remote async subdev to the
  *						  notifier's master asd_list.
  *
@@ -210,7 +210,7 @@ __v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier *notif
 							  sizeof(__type)))
 
 /**
- * v4l2_async_notifier_add_i2c_subdev - Allocate and add an i2c async
+ * __v4l2_async_notifier_add_i2c_subdev - Allocate and add an i2c async
  *				subdev to the notifier's master asd_list.
  *
  * @notifier: pointer to &struct v4l2_async_notifier
@@ -228,7 +228,7 @@ struct v4l2_async_subdev *
 __v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
 				     int adapter_id, unsigned short address,
 				     unsigned int asd_struct_size);
-#define v4l2_async_notifier_add_i2c_subdev(__notifier, __adap, __addr, __type)	\
+#define v4l2_async_notifier_i2c(__notifier, __adap, __addr, __type)	\
 ((__type *)__v4l2_async_notifier_add_i2c_subdev(__notifier, __adap, __addr,	\
 						sizeof(__type)))
 

I'll send a fix for Mauro.

Best regards,
Ezequiel

