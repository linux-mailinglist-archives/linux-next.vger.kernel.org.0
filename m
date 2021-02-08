Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91857313B36
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 18:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbhBHRnG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 12:43:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:41712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233936AbhBHRk7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Feb 2021 12:40:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B4BE364E5D;
        Mon,  8 Feb 2021 17:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612806018;
        bh=4iDteBdt+LxfoAbchv32DupyFja6g5XYVYcXWSdw+L0=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OSQk4fIG5gUoWlw+bFgtCrMU1E7LchG1SQaXJLQD9r2sJR+gnJ7jymSL4bnU1ExQa
         2njrjxcNpwtb+xrngh2wE7A32j3R8HDjHnGMVFhFw17E9KAF179b+Kut/95SEmpoTu
         cSMC1pDt78PYaCJWKrZWdSJ8jm6ir4Hp4VLOUFkcsDgWhVMUkQI4n3owvmFtS22I8X
         8oj4+MN2VBYGn/8vXyiijnXlUOqHkrYeZBjLtOgUXc8UJkEen3l9Oqty2jfy31x7dm
         6HZnI6bgzVfwbdMx29K21wkAcZ16qBMZQBYsUFW1pebZmDyZ+SD9yt7TXRMZ99Bik6
         YVlnlJbPADHvA==
Date:   Mon, 8 Feb 2021 18:40:14 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20210208184014.55128fb5@coco.lan>
In-Reply-To: <4af499f5931d6b04a42787ae17525c63247573e6.camel@collabora.com>
References: <20210208233716.16d962ad@canb.auug.org.au>
        <56cd99bbf526b43507579b5775bac5f885319866.camel@collabora.com>
        <20210208164618.GY32460@paasikivi.fi.intel.com>
        <4af499f5931d6b04a42787ae17525c63247573e6.camel@collabora.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Mon, 08 Feb 2021 13:57:56 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

> On Mon, 2021-02-08 at 18:46 +0200, Sakari Ailus wrote:
> > Hi Ezequiel,
> >=20
> > Thanks for addressing this.
> >=20
> > On Mon, Feb 08, 2021 at 01:42:21PM -0300, Ezequiel Garcia wrote: =20
> > > Hi Stephen,
> > >=20
> > > On Mon, 2021-02-08 at 23:37 +1100, Stephen Rothwell wrote: =20
> > > > Hi all,
> > > >=20
> > > > After merging the v4l-dvb tree, today's linux-next build (htmldocs)
> > > > produced this warning:
> > > >=20
> > > > include/media/v4l2-async.h:178: warning: expecting prototype for v4=
l2_async_notifier_add_fwnode_subdev(). Prototype was for
> > > > __v4l2_async_notifier_add_fwnode_subdev() instead
> > > > include/media/v4l2-async.h:207: warning: expecting prototype for v4=
l2_async_notifier_add_fwnode_remote_subdev(). Prototype was for
> > > > __v4l2_async_notifier_add_fwnode_remote_subdev() instead
> > > > include/media/v4l2-async.h:230: warning: expecting prototype for v4=
l2_async_notifier_add_i2c_subdev(). Prototype was for
> > > > __v4l2_async_notifier_add_i2c_subdev() instead
> > > >=20
> > > > Maybe introduced by commit
> > > >=20
> > > > =C2=A0 c1cc23625062 ("media: v4l2-async: Discourage use of v4l2_asy=
nc_notifier_add_subdev")
> > > >  =20
> > >=20
> > > Thanks for spotting this. Should be fixed by:
> > >=20
> > > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
> > > index 6f22daa6f067..3785445282fc 100644
> > > --- a/include/media/v4l2-async.h
> > > +++ b/include/media/v4l2-async.h
> > > @@ -157,7 +157,7 @@ int __v4l2_async_notifier_add_subdev(struct v4l2_=
async_notifier *notifier,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v4l2_as=
ync_subdev *asd);
> > > =C2=A0
> > > =C2=A0/**
> > > - * v4l2_async_notifier_add_fwnode_subdev - Allocate and add a fwnode=
 async
> > > + * __v4l2_async_notifier_add_fwnode_subdev - Allocate and add a fwno=
de async =20
> >=20
> > The problem with the approach is that this no longer documents the API =
that
> > drivers are intended to use, but the intermediate one.

Yep. the better would be to keep documenting what will be used.

> >  I guess fixing
> > this properly could require changes to kerneldoc so I have no objection=
s to
> > the approach.

It is not a simple kernel-doc change.=20

The problem is that Kernel-doc expects:


	/**
	 * foo - something
	 */
	void foo(...)

As it parses the file lines sequentially, using the parameters at
foo(...) to double-check if everything is ok.

In order for it to parse things like:

	/**
	 * foo - something
	 */

	... (some other functions in the middle)
=09
	void foo(...)

Would require kernel-doc to first parse all the file, storing markups
on a separate struct, and then, on a second step, produce an output.

Even if modified to do that, there's a question if the result would
be what it is expected.

A separate thing would be to do things like:


	/**
	 * foo - something
	 */
	void __foo(...)

The problem here is that usually the arguments for __foo() are
different than the ones for foo(). See for example the macros that
have a __foo() functions with an owner argument, that are solved
on a macro called foo().

Thanks,
Mauro
