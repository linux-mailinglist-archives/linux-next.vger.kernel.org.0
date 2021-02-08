Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98737312D1C
	for <lists+linux-next@lfdr.de>; Mon,  8 Feb 2021 10:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbhBHJTq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 8 Feb 2021 04:19:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:47618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231592AbhBHJPT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 8 Feb 2021 04:15:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B031364E85;
        Mon,  8 Feb 2021 09:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612775662;
        bh=G4WQRGueEkXdgCtZG/8wFmeEh0IRMqEvYE9VGIoB5yI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=A1ggO496/Pnf9ryoeK3pfkVGmITnfP2e0/GQ54w/IswUAGByT845I0Hfz5zS+e9yu
         hciS+CgX/RPHOzvCS9uJLwaXdk7P0krK2SVbEjLGP8/Z0hlgkUxJsboDD10buqXEPz
         tAi6BR0CimBXC7wu3gUPvZh6yZfqcZ8LZ7/5fRfiBDXaTuiEiafu7zBrTAGlmj5Axu
         yjXhl4wl1KdyNTqR+Q20w2fBsyezd40TsId1UNJbmlNF5sLvmVPYqPO9xLqW710V38
         poIPOnxGtekl4L813DhS2CoPT+RWijDr5GQp+IoWlxaL5WTSjE6BBtSmR4vgImEF3w
         N8og5EgxZqjCw==
Date:   Mon, 8 Feb 2021 10:14:17 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the v4l-dvb tree
Message-ID: <20210208101417.236157b0@coco.lan>
In-Reply-To: <CAMuHMdXb99O9j0ji65=GqXOu1iArBgjhzYEGHmO_mM=ursDp9w@mail.gmail.com>
References: <20210208113208.35449879@canb.auug.org.au>
        <20210208073037.0b9fe4b9@coco.lan>
        <CAMuHMdVTSCtwbTqBOag_sYHfDnVevZHxZyYOgHMVx936x=e1ZA@mail.gmail.com>
        <20210208094901.087762b8@coco.lan>
        <CAMuHMdXb99O9j0ji65=GqXOu1iArBgjhzYEGHmO_mM=ursDp9w@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Em Mon, 8 Feb 2021 09:52:22 +0100
Geert Uytterhoeven <geert@linux-m68k.org> escreveu:

> Hi Mauro,
>=20
> On Mon, Feb 8, 2021 at 9:49 AM Mauro Carvalho Chehab <mchehab@kernel.org>=
 wrote:
> > Em Mon, 8 Feb 2021 09:33:14 +0100
> > Geert Uytterhoeven <geert@linux-m68k.org> escreveu: =20
> > > On Mon, Feb 8, 2021 at 7:35 AM Mauro Carvalho Chehab <mchehab@kernel.=
org> wrote: =20
> > > > Em Mon, 8 Feb 2021 11:32:08 +1100
> > > > Stephen Rothwell <sfr@canb.auug.org.au> escreveu:
> > > > =20
> > > > > After merging the v4l-dvb tree, today's linux-next build (x86_64
> > > > > allmodconfig) produced this warning:
> > > > >
> > > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max92=
71_set_serial_link' exported twice. Previous export was in drivers/media/i2=
c/rdacm20-camera_module.ko
> > > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max92=
71_configure_i2c' exported twice. Previous export was in drivers/media/i2c/=
rdacm20-camera_module.ko
> > > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max92=
71_set_high_threshold' exported twice. Previous export was in drivers/media=
/i2c/rdacm20-camera_module.ko
> > > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max92=
71_configure_gmsl_link' exported twice. Previous export was in drivers/medi=
a/i2c/rdacm20-camera_module.ko
> > > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max92=
71_set_gpios' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko
> > > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max92=
71_clear_gpios' exported twice. Previous export was in drivers/media/i2c/rd=
acm20-camera_module.ko
> > > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max92=
71_enable_gpios' exported twice. Previous export was in drivers/media/i2c/r=
dacm20-camera_module.ko
> > > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max92=
71_disable_gpios' exported twice. Previous export was in drivers/media/i2c/=
rdacm20-camera_module.ko
> > > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max92=
71_verify_id' exported twice. Previous export was in drivers/media/i2c/rdac=
m20-camera_module.ko
> > > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max92=
71_set_address' exported twice. Previous export was in drivers/media/i2c/rd=
acm20-camera_module.ko
> > > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max92=
71_set_deserializer_address' exported twice. Previous export was in drivers=
/media/i2c/rdacm20-camera_module.ko
> > > > > WARNING: modpost: drivers/media/i2c/rdacm21-camera_module: 'max92=
71_set_translation' exported twice. Previous export was in drivers/media/i2=
c/rdacm20-camera_module.ko
> > > > >
> > > > > Introduced by commit
> > > > >
> > > > >   a59f853b3b4b ("media: i2c: Add driver for RDACM21 camera module=
")
> > > > > =20
> > > >
> > > > It sounds to be due to a Makefile mess:
> > > >
> > > >         drivers/media/i2c/Makefile:rdacm20-camera_module-objs   :=
=3D rdacm20.o max9271.o
> > > >         drivers/media/i2c/Makefile:rdacm21-camera_module-objs   :=
=3D rdacm21.o max9271.o
> > > >
> > > > Neither drivers should be including max9271.o as their objects, but=
, instead,
> > > > be addressing max9271 dependency via Kconfig. =20
> > >
> > > Wouldn't
> > >
> > >     obj-$(CONFIG_VIDEO_RDACM20)     +=3D rdacm20.o max9271.o
> > >     obj-$(CONFIG_VIDEO_RDACM21)     +=3D rdacm21.o max9271.o
> > >
> > > work, too? =20
> >
> > Not 100% sure, but I guess this would cause problems with allyesconfig.=
 =20
>=20
> Duplicates will be filtered out.
> An example using this method is drivers/net/ethernet/8390/Makefile.

Good to know!

=46rom my side, I prefer that support for different chips would have
their own Kconfig vars. It seems to document better what's
happening there.

Thanks,
Mauro
