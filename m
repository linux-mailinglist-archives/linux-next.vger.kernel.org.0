Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6B931B6F8
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 11:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbhBOKVO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Feb 2021 05:21:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:32978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229652AbhBOKVJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 Feb 2021 05:21:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5866364E04;
        Mon, 15 Feb 2021 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613384428;
        bh=8fmGuYCepzo057o2HdF+G6HtxzzEWteZ/F4yOiJ1bQo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=k0C1KAAuD9r1Zs0Skc5I5IrIudzGnot1vVC0dt47Jj1nI+19TfeB2qntrmaGWviGy
         1/fyqa+ZqYq4RU5N3+N/IMvUu/4CuaYyedNJx3gaVFEtZTKbhp9+Ez+ohFD6c9CXUX
         2b3NnTJXyQvXKCiA+eAeb98ZhTtI101keQTbtUn4m7kPvvLpT3Nbfd92IIf+f8AFI1
         cQbCw/Rh2rOeJ60K0CjCrZahpfG2GuXNmPdnj6I03WWuzSWiMxj5vAgooLgTX2HelQ
         Lp1KmvQsDPK9ihWiWcpPrF2gGhoHKaOa8BQIqtSv7mvgT2tcd5YtQMKfAomqGZzh/8
         6vj7+oEbIl7NA==
Date:   Mon, 15 Feb 2021 11:20:24 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20210215112024.22ebdd4c@coco.lan>
In-Reply-To: <fa453b6516f709b23bb046a1d956f0598966cd99.camel@collabora.com>
References: <20210208233716.16d962ad@canb.auug.org.au>
        <56cd99bbf526b43507579b5775bac5f885319866.camel@collabora.com>
        <20210208164618.GY32460@paasikivi.fi.intel.com>
        <4af499f5931d6b04a42787ae17525c63247573e6.camel@collabora.com>
        <20210208184014.55128fb5@coco.lan>
        <fa453b6516f709b23bb046a1d956f0598966cd99.camel@collabora.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Mon, 08 Feb 2021 15:53:00 -0300
Ezequiel Garcia <ezequiel@collabora.com> escreveu:

> On Mon, 2021-02-08 at 18:40 +0100, Mauro Carvalho Chehab wrote:
> > Em Mon, 08 Feb 2021 13:57:56 -0300
> > Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> >  =20
> > > On Mon, 2021-02-08 at 18:46 +0200, Sakari Ailus wrote: =20
> > > > Hi Ezequiel,
> > > >=20
> > > > Thanks for addressing this.
> > > >=20
> > > > On Mon, Feb 08, 2021 at 01:42:21PM -0300, Ezequiel Garcia wrote:=C2=
=A0  =20
> > > > > Hi Stephen,
> > > > >=20
> > > > > On Mon, 2021-02-08 at 23:37 +1100, Stephen Rothwell wrote:=C2=A0 =
 =20
> > > > > > Hi all,
> > > > > >=20
> > > > > > After merging the v4l-dvb tree, today's linux-next build (htmld=
ocs)
> > > > > > produced this warning:
> > > > > >=20
> > > > > > include/media/v4l2-async.h:178: warning: expecting prototype fo=
r v4l2_async_notifier_add_fwnode_subdev(). Prototype was for
> > > > > > __v4l2_async_notifier_add_fwnode_subdev() instead
> > > > > > include/media/v4l2-async.h:207: warning: expecting prototype fo=
r v4l2_async_notifier_add_fwnode_remote_subdev(). Prototype was for
> > > > > > __v4l2_async_notifier_add_fwnode_remote_subdev() instead
> > > > > > include/media/v4l2-async.h:230: warning: expecting prototype fo=
r v4l2_async_notifier_add_i2c_subdev(). Prototype was for
> > > > > > __v4l2_async_notifier_add_i2c_subdev() instead
> > > > > >=20
> > > > > > Maybe introduced by commit
> > > > > >=20
> > > > > > =C2=A0 c1cc23625062 ("media: v4l2-async: Discourage use of v4l2=
_async_notifier_add_subdev")
> > > > > > =C2=A0  =20
> > > > >=20
> > > > > Thanks for spotting this. Should be fixed by:
> > > > >=20
> > > > > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-asyn=
c.h
> > > > > index 6f22daa6f067..3785445282fc 100644
> > > > > --- a/include/media/v4l2-async.h
> > > > > +++ b/include/media/v4l2-async.h
> > > > > @@ -157,7 +157,7 @@ int __v4l2_async_notifier_add_subdev(struct v=
4l2_async_notifier *notifier,
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v=
4l2_async_subdev *asd);
> > > > > =C2=A0
> > > > > =C2=A0/**
> > > > > - * v4l2_async_notifier_add_fwnode_subdev - Allocate and add a fw=
node async
> > > > > + * __v4l2_async_notifier_add_fwnode_subdev - Allocate and add a =
fwnode async=C2=A0  =20
> > > >=20
> > > > The problem with the approach is that this no longer documents the =
API that
> > > > drivers are intended to use, but the intermediate one. =20
> >=20
> > Yep. the better would be to keep documenting what will be used.
> >  =20
>=20
> Is there a way to silence/ignore the warning for a specific function(s)?

No. The warning is there for a very good reason: if you do something like:


	/**
	 * delete - delete some file
	 *
	 * This function deletes something.
	 */
	void insert() {}
	/**
	 * insert - creates a new file
	 *
	 * This function creates a file and inserts something.
	 */
	void delete() {}

the output of it will be:

	$ ./scripts/kernel-doc -sphinx-version 3.0.0 silly.c
	.. c:function:: void insert ()
=09
	   delete some file
=09
	**Parameters**
=09
	**Description**
=09
=09
	This function deletes something.
=09
=09
	.. c:function:: void delete ()
=09
	   creates a new file
=09
	**Parameters**
=09
	**Description**
=09
=09
	This function creates a file and inserts something.

Which is completely wrong. If someone tries to write a code using the
above, the result will be just the opposite than what it was documented.

Btw, I noticed several places where things like that happened, because
some code were added between a Kernel-doc markup and some function.

Thanks,
Mauro
