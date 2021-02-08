Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56B9D313E21
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 19:54:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234689AbhBHSyC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 13:54:02 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39764 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233805AbhBHSxx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 8 Feb 2021 13:53:53 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 881841F44B0B
Message-ID: <fa453b6516f709b23bb046a1d956f0598966cd99.camel@collabora.com>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Mon, 08 Feb 2021 15:53:00 -0300
In-Reply-To: <20210208184014.55128fb5@coco.lan>
References: <20210208233716.16d962ad@canb.auug.org.au>
         <56cd99bbf526b43507579b5775bac5f885319866.camel@collabora.com>
         <20210208164618.GY32460@paasikivi.fi.intel.com>
         <4af499f5931d6b04a42787ae17525c63247573e6.camel@collabora.com>
         <20210208184014.55128fb5@coco.lan>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 2021-02-08 at 18:40 +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 08 Feb 2021 13:57:56 -0300
> Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> 
> > On Mon, 2021-02-08 at 18:46 +0200, Sakari Ailus wrote:
> > > Hi Ezequiel,
> > > 
> > > Thanks for addressing this.
> > > 
> > > On Mon, Feb 08, 2021 at 01:42:21PM -0300, Ezequiel Garcia wrote:  
> > > > Hi Stephen,
> > > > 
> > > > On Mon, 2021-02-08 at 23:37 +1100, Stephen Rothwell wrote:  
> > > > > Hi all,
> > > > > 
> > > > > After merging the v4l-dvb tree, today's linux-next build (htmldocs)
> > > > > produced this warning:
> > > > > 
> > > > > include/media/v4l2-async.h:178: warning: expecting prototype for v4l2_async_notifier_add_fwnode_subdev(). Prototype was for
> > > > > __v4l2_async_notifier_add_fwnode_subdev() instead
> > > > > include/media/v4l2-async.h:207: warning: expecting prototype for v4l2_async_notifier_add_fwnode_remote_subdev(). Prototype was for
> > > > > __v4l2_async_notifier_add_fwnode_remote_subdev() instead
> > > > > include/media/v4l2-async.h:230: warning: expecting prototype for v4l2_async_notifier_add_i2c_subdev(). Prototype was for
> > > > > __v4l2_async_notifier_add_i2c_subdev() instead
> > > > > 
> > > > > Maybe introduced by commit
> > > > > 
> > > > >   c1cc23625062 ("media: v4l2-async: Discourage use of v4l2_async_notifier_add_subdev")
> > > > >   
> > > > 
> > > > Thanks for spotting this. Should be fixed by:
> > > > 
> > > > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > > > index 6f22daa6f067..3785445282fc 100644
> > > > --- a/include/media/v4l2-async.h
> > > > +++ b/include/media/v4l2-async.h
> > > > @@ -157,7 +157,7 @@ int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
> > > >                                    struct v4l2_async_subdev *asd);
> > > >  
> > > >  /**
> > > > - * v4l2_async_notifier_add_fwnode_subdev - Allocate and add a fwnode async
> > > > + * __v4l2_async_notifier_add_fwnode_subdev - Allocate and add a fwnode async  
> > > 
> > > The problem with the approach is that this no longer documents the API that
> > > drivers are intended to use, but the intermediate one.
> 
> Yep. the better would be to keep documenting what will be used.
> 

Is there a way to silence/ignore the warning for a specific function(s)?

Ezequiel 

