Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB6C31B785
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 11:46:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbhBOKoJ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Feb 2021 05:44:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:44920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230245AbhBOKnr (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 15 Feb 2021 05:43:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 476B264E08;
        Mon, 15 Feb 2021 10:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613385783;
        bh=rFDzWO+Yc0upGnKKctB4dw2q/4fjyFSfnCtQF+mJIro=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DuZnkahDGALbfhsWPRf3nHHz07TTsAjb6O7tQXgPB+Bh38SxEHQRrZDPJT+6YP8t+
         WlnPLJOX4710DDO6IX/g6gZ9N9iDFXnxwquI1Mq5Wj0Cfx8LCKXqfgv+9FN/tU1o+N
         w8PztBPOvNhSewMo3VPOsypNdqvnc14M6zynix5ESTLxO01t+ke1qfU6HbdHAqj5vq
         Bg2yIYZfhxeH+ZffPIwF2OtTaNFPG8SRWpts14FxhI/YcMAWL0GLAwe33AjTgYJ8Xm
         e5Xo96vO8BjzjKkCwu9Z03MwWBpCwQJ8m0EindGMONxhsuPBaYSTHKQc1mDlF+CfMZ
         rBfA+EViSQl5g==
Date:   Mon, 15 Feb 2021 11:42:57 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20210215114257.5dc0fd00@coco.lan>
In-Reply-To: <20210215112024.22ebdd4c@coco.lan>
References: <20210208233716.16d962ad@canb.auug.org.au>
        <56cd99bbf526b43507579b5775bac5f885319866.camel@collabora.com>
        <20210208164618.GY32460@paasikivi.fi.intel.com>
        <4af499f5931d6b04a42787ae17525c63247573e6.camel@collabora.com>
        <20210208184014.55128fb5@coco.lan>
        <fa453b6516f709b23bb046a1d956f0598966cd99.camel@collabora.com>
        <20210215112024.22ebdd4c@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Mon, 15 Feb 2021 11:20:24 +0100
Mauro Carvalho Chehab <mchehab@kernel.org> escreveu:

> Em Mon, 08 Feb 2021 15:53:00 -0300
> Ezequiel Garcia <ezequiel@collabora.com> escreveu:
>=20
> > On Mon, 2021-02-08 at 18:40 +0100, Mauro Carvalho Chehab wrote:
> > > Em Mon, 08 Feb 2021 13:57:56 -0300
> > > Ezequiel Garcia <ezequiel@collabora.com> escreveu:
> > >  =20
> > > > On Mon, 2021-02-08 at 18:46 +0200, Sakari Ailus wrote: =20
> > > > > Hi Ezequiel,
> > > > >=20
> > > > > Thanks for addressing this.
> > > > >=20
> > > > > On Mon, Feb 08, 2021 at 01:42:21PM -0300, Ezequiel Garcia wrote:=
=C2=A0  =20
> > > > > > Hi Stephen,
> > > > > >=20
> > > > > > On Mon, 2021-02-08 at 23:37 +1100, Stephen Rothwell wrote:=C2=
=A0  =20
> > > > > > > Hi all,
> > > > > > >=20
> > > > > > > After merging the v4l-dvb tree, today's linux-next build (htm=
ldocs)
> > > > > > > produced this warning:
> > > > > > >=20
> > > > > > > include/media/v4l2-async.h:178: warning: expecting prototype =
for v4l2_async_notifier_add_fwnode_subdev(). Prototype was for
> > > > > > > __v4l2_async_notifier_add_fwnode_subdev() instead
> > > > > > > include/media/v4l2-async.h:207: warning: expecting prototype =
for v4l2_async_notifier_add_fwnode_remote_subdev(). Prototype was for
> > > > > > > __v4l2_async_notifier_add_fwnode_remote_subdev() instead
> > > > > > > include/media/v4l2-async.h:230: warning: expecting prototype =
for v4l2_async_notifier_add_i2c_subdev(). Prototype was for
> > > > > > > __v4l2_async_notifier_add_i2c_subdev() instead
> > > > > > >=20
> > > > > > > Maybe introduced by commit
> > > > > > >=20
> > > > > > > =C2=A0 c1cc23625062 ("media: v4l2-async: Discourage use of v4=
l2_async_notifier_add_subdev")
> > > > > > > =C2=A0  =20
> > > > > >=20
> > > > > > Thanks for spotting this. Should be fixed by:
> > > > > >=20
> > > > > > diff --git a/include/media/v4l2-async.h b/include/media/v4l2-as=
ync.h
> > > > > > index 6f22daa6f067..3785445282fc 100644
> > > > > > --- a/include/media/v4l2-async.h
> > > > > > +++ b/include/media/v4l2-async.h
> > > > > > @@ -157,7 +157,7 @@ int __v4l2_async_notifier_add_subdev(struct=
 v4l2_async_notifier *notifier,
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct v=
4l2_async_subdev *asd);
> > > > > > =C2=A0
> > > > > > =C2=A0/**
> > > > > > - * v4l2_async_notifier_add_fwnode_subdev - Allocate and add a =
fwnode async
> > > > > > + * __v4l2_async_notifier_add_fwnode_subdev - Allocate and add =
a fwnode async=C2=A0  =20
> > > > >=20
> > > > > The problem with the approach is that this no longer documents th=
e API that
> > > > > drivers are intended to use, but the intermediate one. =20
> > >=20
> > > Yep. the better would be to keep documenting what will be used.
> > >  =20
> >=20
> > Is there a way to silence/ignore the warning for a specific function(s)?
>=20
> No. The warning is there for a very good reason: if you do something like:
>=20
>=20
> 	/**
> 	 * delete - delete some file
> 	 *
> 	 * This function deletes something.
> 	 */
> 	void insert() {}
> 	/**
> 	 * insert - creates a new file
> 	 *
> 	 * This function creates a file and inserts something.
> 	 */
> 	void delete() {}
>=20
> the output of it will be:
>=20
> 	$ ./scripts/kernel-doc -sphinx-version 3.0.0 silly.c
> 	.. c:function:: void insert ()
> =09
> 	   delete some file
> =09
> 	**Parameters**
> =09
> 	**Description**
> =09
> =09
> 	This function deletes something.
> =09
> =09
> 	.. c:function:: void delete ()
> =09
> 	   creates a new file
> =09
> 	**Parameters**
> =09
> 	**Description**
> =09
> =09
> 	This function creates a file and inserts something.
>=20
> Which is completely wrong. If someone tries to write a code using the
> above, the result will be just the opposite than what it was documented.
>=20
> Btw, I noticed several places where things like that happened, because
> some code were added between a Kernel-doc markup and some function.

Btw, in the specific case of this change, something like the above
quick hack would fix it.

PS:  I didn't think much when I wrote the __type description.

Also, keeping the symbols that should be documented as __foo
doesn't seem the right thing to me :-)


---

[PATCH] v4l2-async.h: Fix kerneldoc markups

Document the functions that should be used by the kAPI clients,
instead of the internal functions.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index 6f22daa6f067..91dbeaa4e6ee 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -156,42 +156,38 @@ void v4l2_async_notifier_init(struct v4l2_async_notif=
ier *notifier);
 int __v4l2_async_notifier_add_subdev(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_subdev *asd);
=20
+struct v4l2_async_subdev *
+__v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifi=
er,
+					struct fwnode_handle *fwnode,
+					unsigned int asd_struct_size);
 /**
  * v4l2_async_notifier_add_fwnode_subdev - Allocate and add a fwnode async
  *				subdev to the notifier's master asd_list.
  *
- * @notifier: pointer to &struct v4l2_async_notifier
- * @fwnode: fwnode handle of the sub-device to be matched
- * @asd_struct_size: size of the driver's async sub-device struct, includi=
ng
- *		     sizeof(struct v4l2_async_subdev). The &struct
- *		     v4l2_async_subdev shall be the first member of
- *		     the driver's async sub-device struct, i.e. both
- *		     begin at the same memory address.
+ * @__notifier: pointer to &struct v4l2_async_notifier
+ * @__fwnode: fwnode handle of the sub-device to be matched
+ * @__type: type of the struct that contains a struct v4l2_async_subdev.
  *
  * Allocate a fwnode-matched asd of size asd_struct_size, and add it to the
  * notifiers @asd_list. The function also gets a reference of the fwnode w=
hich
  * is released later at notifier cleanup time.
  */
-struct v4l2_async_subdev *
-__v4l2_async_notifier_add_fwnode_subdev(struct v4l2_async_notifier *notifi=
er,
-					struct fwnode_handle *fwnode,
-					unsigned int asd_struct_size);
 #define v4l2_async_notifier_add_fwnode_subdev(__notifier, __fwnode, __type=
)	\
 ((__type *)__v4l2_async_notifier_add_fwnode_subdev(__notifier, __fwnode,	\
 						   sizeof(__type)))
=20
+struct v4l2_async_subdev *
+__v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier =
*notif,
+					       struct fwnode_handle *endpoint,
+					       unsigned int asd_struct_size);
 /**
  * v4l2_async_notifier_add_fwnode_remote_subdev - Allocate and add a fwnode
  *						  remote async subdev to the
  *						  notifier's master asd_list.
  *
- * @notif: pointer to &struct v4l2_async_notifier
- * @endpoint: local endpoint pointing to the remote sub-device to be match=
ed
- * @asd_struct_size: size of the driver's async sub-device struct, includi=
ng
- *		     sizeof(struct v4l2_async_subdev). The &struct
- *		     v4l2_async_subdev shall be the first member of
- *		     the driver's async sub-device struct, i.e. both
- *		     begin at the same memory address.
+ * @__notifier: pointer to &struct v4l2_async_notifier
+ * @__ep: local endpoint pointing to the remote sub-device to be matched
+ * @__type: type of the struct that contains a struct v4l2_async_subdev.
  *
  * Gets the remote endpoint of a given local endpoint, set it up for fwnode
  * matching and adds the async sub-device to the notifier's @asd_list. The
@@ -201,33 +197,25 @@ __v4l2_async_notifier_add_fwnode_subdev(struct v4l2_a=
sync_notifier *notifier,
  * This is just like @v4l2_async_notifier_add_fwnode_subdev, but with the
  * exception that the fwnode refers to a local endpoint, not the remote on=
e.
  */
-struct v4l2_async_subdev *
-__v4l2_async_notifier_add_fwnode_remote_subdev(struct v4l2_async_notifier =
*notif,
-					       struct fwnode_handle *endpoint,
-					       unsigned int asd_struct_size);
 #define v4l2_async_notifier_add_fwnode_remote_subdev(__notifier, __ep, __t=
ype)	\
 ((__type *)__v4l2_async_notifier_add_fwnode_remote_subdev(__notifier, __ep=
,	\
 							  sizeof(__type)))
=20
+struct v4l2_async_subdev *
+__v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
+				     int adapter_id, unsigned short address,
+				     unsigned int asd_struct_size);
 /**
  * v4l2_async_notifier_add_i2c_subdev - Allocate and add an i2c async
  *				subdev to the notifier's master asd_list.
  *
- * @notifier: pointer to &struct v4l2_async_notifier
- * @adapter_id: I2C adapter ID to be matched
- * @address: I2C address of sub-device to be matched
- * @asd_struct_size: size of the driver's async sub-device struct, includi=
ng
- *		     sizeof(struct v4l2_async_subdev). The &struct
- *		     v4l2_async_subdev shall be the first member of
- *		     the driver's async sub-device struct, i.e. both
- *		     begin at the same memory address.
+ * @__notifier: pointer to &struct v4l2_async_notifier
+ * @__adap: I2C adapter ID to be matched
+ * @__addr: I2C address of sub-device to be matched
+ * @__type: type of the struct that contains a struct v4l2_async_subdev.
  *
  * Same as above but for I2C matched sub-devices.
  */
-struct v4l2_async_subdev *
-__v4l2_async_notifier_add_i2c_subdev(struct v4l2_async_notifier *notifier,
-				     int adapter_id, unsigned short address,
-				     unsigned int asd_struct_size);
 #define v4l2_async_notifier_add_i2c_subdev(__notifier, __adap, __addr, __t=
ype)	\
 ((__type *)__v4l2_async_notifier_add_i2c_subdev(__notifier, __adap, __addr=
,	\
 						sizeof(__type)))


Thanks,
Mauro
