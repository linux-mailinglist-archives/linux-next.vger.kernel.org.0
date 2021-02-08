Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8674D3135EC
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 16:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbhBHPCW (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 10:02:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:51362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230013AbhBHPCU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Feb 2021 10:02:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1C7464E29;
        Mon,  8 Feb 2021 15:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612796499;
        bh=QWoJlGOW40cZoLpGKQgwL4bAbwzSzuidzUjPVAD82pw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=MbyKbgXUkGs/dHPB0BAZYg+J9JCSVX2dFk2/6NHNR+yjYXMg4meBhXUjNQ4Hzwb3Q
         FVcnkL8fd6ZKTW6Oa85xpSF8TF9dUyzoF36s+XcsxBPa5o7XwEhOwhlFVImEQfqBgs
         P8An5KdFFsvlzElnsTOCWT9zkODYmJr9t3N9plqqKSnaowvpE+XsUJws9dyp2lL9TL
         ZsPMKnCNvwBEfg965ycguoWaGejZYFqkTDXGSbF7nKfzTWOSaOcxg7pXHSHnpzuPDx
         Bd/wayh9YpCHgVsCMWV4gGtKVPAOvzieL3LfPhW70GNI+Zmmyj0EmIleiJDU2+KI3e
         OUOmawCHcwjVg==
Date:   Mon, 8 Feb 2021 16:01:34 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org
Subject: Re: [PATCH] media: i2c: fix max9271 build dependencies
Message-ID: <20210208160134.01e99737@coco.lan>
In-Reply-To: <YCFLNLIlVKceiS46@pendragon.ideasonboard.com>
References: <20210208084147.GN32460@paasikivi.fi.intel.com>
        <20210208100822.76ca0c2e@coco.lan>
        <20210208092424.GP32460@paasikivi.fi.intel.com>
        <20210208110723.4859ddda@coco.lan>
        <YCEhVrSFpqX1Th4x@pendragon.ideasonboard.com>
        <20210208114142.skwc22xps5xiqdyo@uno.localdomain>
        <20210208141102.3d5999dd@coco.lan>
        <20210208143150.03974bca@coco.lan>
        <YCE/OkSfIbxUB4XQ@pendragon.ideasonboard.com>
        <20210208152359.17831275@coco.lan>
        <YCFLNLIlVKceiS46@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Mon, 8 Feb 2021 16:31:16 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hi Mauro,
> 
> On Mon, Feb 08, 2021 at 03:23:59PM +0100, Mauro Carvalho Chehab wrote:
> > Em Mon, 8 Feb 2021 15:40:10 +0200 Laurent Pinchart escreveu:  
> > > On Mon, Feb 08, 2021 at 02:31:50PM +0100, Mauro Carvalho Chehab wrote:  
> > > > Em Mon, 8 Feb 2021 14:11:02 +0100 Mauro Carvalho Chehab escreveu:    
> > > > > Em Mon, 8 Feb 2021 12:41:42 +0100 Jacopo Mondi escreveu:
> > > > >     
> > > > > > > > If you do, instead:
> > > > > > > >
> > > > > > > >     if VIDEO_V4L2 && I2C
> > > > > > > > 	config VIDEO_MAX9271_SERIALIZER
> > > > > > > > 		tristate
> > > > > > > >
> > > > > > > > 	config VIDEO_RDACM20
> > > > > > > > 		select VIDEO_MAX9271_SERIALIZER
> > > > > > > > 		...
> > > > > > > >
> > > > > > > > 	config VIDEO_RDACM21
> > > > > > > > 		select VIDEO_MAX9271_SERIALIZER
> > > > > > > > 		...
> > > > > > > >     endif
> > > > > > > >
> > > > > > > > Then you also won't need:
> > > > > > > > 	depends on VIDEO_MAX9271_SERIALIZER || !VIDEO_MAX9271_SERIALIZER
> > > > > > > >
> > > > > > > > As select should do the right thing in this case, ensuring that MAX9271
> > > > > > > > will be builtin either if RDACM20 or RDACM21 is builtin.      
> > > > > > >
> > > > > > > I also vote for usage of "select".
> > > > > > >      
> > > > > > 
> > > > > > I would prefer that too, I was concerned about possible un-met
> > > > > > dependencies, as Sakari pointed out, but the current situation is no
> > > > > > better, as the only Kconfig symbols where those can be listed are the
> > > > > > camera modules one.    
> > > > > 
> > > > > Works for me. I'll make a patch for it.    
> > > > 
> > > > Hmm... after taking a deeper look at the rcma20 drivers, and on its
> > > > Kconfig help text:
> > > > 
> > > > 	config VIDEO_RDACM20
> > > > 		tristate "IMI RDACM20 camera support"
> > > > 		select V4L2_FWNODE
> > > > 		select VIDEO_V4L2_SUBDEV_API
> > > > 		select MEDIA_CONTROLLER
> > > > 		help
> > > > 		  This driver supports the IMI RDACM20 GMSL camera, used in
> > > > 		  ADAS systems.
> > > > 
> > > > 		  This camera should be used in conjunction with a GMSL
> > > > 		  deserialiser such as the MAX9286.
> > > > 
> > > > I'm starting to suspect that there's something very wrong here...
> > > > 
> > > > The help text mentions the MAX9286 driver, which is a complete
> > > > driver, and not MAX9271, which seems to implement a set of PHY functions
> > > > needed by those drivers, and which lacks a proper I2C binding code on it.
> > > > 
> > > > The I2C binding code is, instead, inside RDACM20 and RDACM21:
> > > > 
> > > > 	static int rdacm21_initialize(struct rdacm21_device *dev)
> > > > 	{
> > > > 		int ret;
> > > > 
> > > > 		/* Verify communication with the MAX9271: ping to wakeup. */
> > > > 		dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
> > > > 		i2c_smbus_read_byte(dev->serializer.client);
> > > > 		usleep_range(3000, 5000);
> > > > 
> > > > 		/* Enable reverse channel and disable the serial link. */
> > > > 		ret = max9271_set_serial_link(&dev->serializer, false);
> > > > 		if (ret)
> > > > 			return ret;
> > > > 
> > > > 		/* Configure I2C bus at 105Kbps speed and configure GMSL. */
> > > > 		ret = max9271_configure_i2c(&dev->serializer,
> > > > 					    MAX9271_I2CSLVSH_469NS_234NS |
> > > > 					    MAX9271_I2CSLVTO_1024US |
> > > > 					    MAX9271_I2CMSTBT_105KBPS);
> > > > 
> > > > 		/* Several other max9271-specific init code */
> > > > 
> > > > 		ret = ov490_initialize(dev);
> > > > 		if (ret)
> > > > 			return ret;
> > > > 
> > > > And, at max9271 "driver", there's just a bunch of exported functions.
> > > > 
> > > > This is all wrong.
> > > > 
> > > > I'm seriously considering to move all those 3 drivers to staging,
> > > > while they're not fixed to use a proper I2C binding mechanism.    
> > > 
> > > They can't. The RDACM20 and RDACM21 are GMSL cameras, that are
> > > internally made of a GMSL serializer (MAX9271 in both cases) and a
> > > camera sensor (OV10625 for the RDACM20, OV10640 + OV490 ISP for the
> > > RDAMC21). The sensor and serializer are tightly couple, so much so that
> > > in the RDACM20, there's a microcontroller that configures both when
> > > power is applied. In the RDACM21, the OV490 firmware has a similar role.
> > > Due to the tight coupling and the presense of a device-specific
> > > microcontroller, the cameras need to be handled as a whole, we can't
> > > have one driver for the sensor and one driver for the serializer that
> > > would work in isolation and be controlled separately from userspace. The
> > > MAX9271, however, still needs to be configured from the host, and we've
> > > thus moved common code to a common file instead of duplicating it.  
> > 
> > I'm not saying that max9271 should expose a media-controller (or any
> > other interface) to the userspace. It is perfectly fine to have the 
> > RDACM20 and RDACM21 drivers fully controlling it. There are *lots of* 
> > other media drivers that are implemented using multiple separate I2C
> > chips. Several of them have internally micro-controller(s) that may
> > control some I2C devices.
> > 
> > There are even some DVB designs where there is a microcontroller
> > (usually cypress) that it is connected to different I2C chips.
> > 
> > For instance, 23 of them use a Cypress microcontroller:
> > 
> > 	$ git grep -li cypress drivers/media/|grep .c$|wc -l
> > 	23
> > 
> > The problem here is that the max9271 probing code is at the wrong
> > place. It belongs to max9271 driver, and should not be outside
> > it.  
> 
> Could you then submit a patch with a fix, as the right solution has
> clearly escaped 4 engineers working on this issue for 2 years ? :-)

As far as I noticed, max9271 code is called only two times at the 
driver:

1. at probe time:

	static int rdacm21_initialize(struct rdacm21_device *dev)
	{
		int ret;
	
		/* Verify communication with the MAX9271: ping to wakeup. */
		dev->serializer.client->addr = MAX9271_DEFAULT_ADDR;
		i2c_smbus_read_byte(dev->serializer.client);
		usleep_range(3000, 5000);

		...
	}

	static int rdacm21_probe(struct i2c_client *client)
...

		ret = rdacm21_initialize(dev);
		if (ret < 0)
			goto error;
...
	}

2. At stream on time:

	static int rdacm21_s_stream(struct v4l2_subdev *sd, int enable)
	{
		struct rdacm21_device *dev = sd_to_rdacm21(sd);

		return max9271_set_serial_link(&dev->serializer, enable);
	}

As I said before, there are *lots* of other drivers doing about the same.

Just to get a random example inside the V4L drivers, the em28xx relies on 
an external chip, controlled via I2C, that needs to be enabled before 
the stream on (like tvp5051 or saa711x).

Inside its probing code, it does I2C binding in order to initialize the
I2C drivers.

It also wakes up the I2C devices during stream on, in order to wake up
tvp5051 (and other subdevs):

	int em28xx_start_analog_streaming(struct vb2_queue *vq, unsigned int count)
	{
		...

		/*
                 * Needed, since GPIO might have disabled power of
                 * some i2c device
                 */
                em28xx_wake_i2c(dev);

It is not an exact match to what rdacm21 does, but it seems close enough.


Thanks,
Mauro
