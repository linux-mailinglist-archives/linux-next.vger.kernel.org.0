Return-Path: <linux-next+bounces-6989-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE18AC89D1
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 10:14:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F377C7A1FF8
	for <lists+linux-next@lfdr.de>; Fri, 30 May 2025 08:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BD9211A05;
	Fri, 30 May 2025 08:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TF/07tm3"
X-Original-To: linux-next@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E88201100;
	Fri, 30 May 2025 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748592851; cv=none; b=amfpKGJoJL2xKGDRb/2spl7UKIPOw/fojDsBdsHE9dz9d4GAIPuiqH4JBugUFxwIAk5Z09SD0H6u05WIK+LdDdrCIN+A1b3I56dvzEwccQyftfrqigzYa1IFCMbhR7Rq9pAlUiHJ9RWioCVAE7NJ39RHwsA+oTIPRz8xSkTy50I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748592851; c=relaxed/simple;
	bh=9gfz7FNlnlPQa0RX08i9oh06Ar+H+M5d397F0opYhK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=twKEOWE+F2GxLhwsxCfeii6OEjayz9c3lMC2A0mai/OJ86VIP6SRox9R4mCpMH/uGDUVNgxDlfg5ZmsfuP8gSYDtI5bZGUVnCmjPqCilhzGEyPB0DWfBRYlzPIautQb9Ujqk5mbSbvWJDmjVaM7zgcRRW9zQb1gfsz3hQTfZrCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TF/07tm3; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6FA944320D;
	Fri, 30 May 2025 08:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748592841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1bix+Ruw+wPci3KYFlUL37xO5WCvyArPLnYLDXh61UA=;
	b=TF/07tm3Brkat4LBtqhni0OfExGBjdhEdkjh8dL5vNB4CG16F12er25ZpchuTGcYpAhF9T
	Sj4OTP1v89rd+DAnEO9a2T0nRmwEcx82QY8QKEG9X/xXPNR4E2BdyeHw1fpMVcNOE6it7t
	sKd/jH53FUNsivo04UgnC3f8SGrJnpFNhES7xzD3DtR/zOT4QhF1hRW6xeAGe5bbvxwwo6
	ijWPVCH8L7L9JthgwB1siIX/7c0fEFyrdVWTQMtNLtoHQ23IdLBOHKbpc5Mw/g043mBaVV
	4NcryO6nCvgrSjFi/cs7wvCQPBhrmYzJV7uzYf+sj8J+fOow1vjCLb02rV3k2A==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Wolfram Sang <wsa@the-dreams.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with the i2c tree
Date: Fri, 30 May 2025 10:13:58 +0200
Message-ID: <3352024.aeNJFYEL58@fw-rgant>
In-Reply-To: <20250529124929.5217c6d9@canb.auug.org.au>
References:
 <20250428104905.2b54643f@canb.auug.org.au>
 <20250428113052.38cf10da@canb.auug.org.au>
 <20250529124929.5217c6d9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3358454.44csPzL39Z";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvkeehtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkjghfgggtsehgtderredttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhephfdvleekvefgieejtdduieehfeffjefhleegudeuhfelteduiedukedtieehlefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopeifshgrsehthhgvqdgurhgvrghmshdruggvpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhvvghrkhhuihhlseigshegrghllhdrnhhlpdhrtghpt
 hhtohepjhgrihdrlhhuthhhrhgrsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrghkrghrihdrrghilhhusheslhhinhhugidrihhnthgvlhdrtghomh
X-GND-Sasl: romain.gantois@bootlin.com

--nextPart3358454.44csPzL39Z
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Fri, 30 May 2025 10:13:58 +0200
Message-ID: <3352024.aeNJFYEL58@fw-rgant>
In-Reply-To: <20250529124929.5217c6d9@canb.auug.org.au>
MIME-Version: 1.0

Hi Stephen,

On Thursday, 29 May 2025 04:49:29 CEST Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 28 Apr 2025 11:30:52 +1000 Stephen Rothwell <sfr@canb.auug.org.au> 
wrote:
> > On Mon, 28 Apr 2025 11:22:00 +1000 Stephen Rothwell <sfr@canb.auug.org.au> 
wrote:
> > > On Mon, 28 Apr 2025 10:49:05 +1000 Stephen Rothwell 
<sfr@canb.auug.org.au> wrote:
> > > > Today's linux-next merge of the v4l-dvb tree got a conflict in:
> > > >   drivers/media/i2c/ds90ub960.c
> > > > 
> > > > between commits:
> > > >   3ec29d51b546 ("media: i2c: ds90ub960: Protect alias_use_mask with a
> > > >   mutex")
> > > >   818bd489f137 ("i2c: use client addresses directly in ATR interface")
> > > > 
> > > > from the i2c tree and commits:
> > > >   24868501a744 ("media: i2c: ds90ub9xx: Add err parameter to
> > > >   read/write funcs") 2ca499384e98 ("media: i2c: ds90ub960: Add RX
> > > >   port iteration support")> > > 
> > > > from the v4l-dvb tree.
> > > > 
> > > > I fixed it up (see below) and can carry the fix as necessary. This
> > > > is now fixed as far as linux-next is concerned, but any non trivial
> > > > conflicts should be mentioned to your upstream maintainer when your
> > > > tree
> > > > is submitted for merging.  You may also want to consider cooperating
> > > > with the maintainer of the conflicting tree to minimise any
> > > > particularly
> > > > complex conflicts.
> > > 
> > > The actual resolution is below ...
> > 
> > I hit the wrong key :-(   Resolution below.
> 
> This is now a conflict between the i2c tree and Linus' tree.

Below is the resolution I came up with.

Thanks,

-- 
Romain Gantois, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

diff --cc drivers/media/i2c/ds90ub960.c
index ed9ace1a54766,94b20ba6cb86f..54c2546551451
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@@ -1271,10 -1056,11 +1274,12 @@@ static int ub960_atr_attach_addr(struc
        struct ub960_rxport *rxport = priv->rxports[chan_id];
        struct device *dev = &priv->client->dev;
        unsigned int reg_idx;
 +      int ret = 0;
  
-       for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients); 
reg_idx++) {
-               if (!rxport->aliased_clients[reg_idx])
+       guard(mutex)(&rxport->aliased_addrs_lock);
+ 
+       for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_addrs); 
reg_idx++) {
+               if (!rxport->aliased_addrs[reg_idx])
                        break;
        }
  
@@@ -1283,18 -1069,15 +1288,18 @@@
                return -EADDRNOTAVAIL;
        }
  
-       rxport->aliased_clients[reg_idx] = client;
+       rxport->aliased_addrs[reg_idx] = addr;
  
        ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ID(reg_idx),
-                          client->addr << 1, &ret);
 -                         addr << 1);
++                         addr << 1, &ret);
        ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx),
 -                         alias << 1);
 +                         alias << 1, &ret);
 +
 +      if (ret)
 +              return ret;
  
        dev_dbg(dev, "rx%u: client 0x%02x assigned alias 0x%02x at slot %u\n",
-               rxport->nport, client->addr, alias, reg_idx);
+               rxport->nport, addr, alias, reg_idx);
  
        return 0;
  }
@@@ -1306,10 -1089,11 +1311,12 @@@ static void ub960_atr_detach_addr(struc
        struct ub960_rxport *rxport = priv->rxports[chan_id];
        struct device *dev = &priv->client->dev;
        unsigned int reg_idx;
 +      int ret;
  
-       for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients); 
reg_idx++) {
-               if (rxport->aliased_clients[reg_idx] == client)
+       guard(mutex)(&rxport->aliased_addrs_lock);
+ 
+       for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_addrs); 
reg_idx++) {
+               if (rxport->aliased_addrs[reg_idx] == addr)
                        break;
        }
  
@@@ -1319,18 -1103,12 +1326,18 @@@
                return;
        }
  
-       rxport->aliased_clients[reg_idx] = NULL;
+       rxport->aliased_addrs[reg_idx] = 0;
  
 -      ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx), 0);
 +      ret = ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx),
 +                               0, NULL);
 +      if (ret) {
 +              dev_err(dev, "rx%u: unable to fully unmap client 0x%02x: 
%d\n",
 +                      rxport->nport, client->addr, ret);
 +              return;
 +      }
  
        dev_dbg(dev, "rx%u: client 0x%02x released at slot %u\n", rxport-
>nport,
-               client->addr, reg_idx);
+               addr, reg_idx);
  }
  
  static const struct i2c_atr_ops ub960_atr_ops = {
@@@ -4370,12 -3231,21 +4376,14 @@@ static void ub960_txport_free_ports(str
  
  static void ub960_rxport_free_ports(struct ub960_data *priv)
  {
 -      unsigned int nport;
 -
 -      for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 -              struct ub960_rxport *rxport = priv->rxports[nport];
 -
 -              if (!rxport)
 -                      continue;
 -
 -              fwnode_handle_put(rxport->source.ep_fwnode);
 -              fwnode_handle_put(rxport->ser.fwnode);
 +      for_each_active_rxport(priv, it) {
 +              fwnode_handle_put(it.rxport->source.ep_fwnode);
 +              fwnode_handle_put(it.rxport->ser.fwnode);
  
+               mutex_destroy(&rxport->aliased_addrs_lock);
+ 
 -              kfree(rxport);
 -              priv->rxports[nport] = NULL;
 +              kfree(it.rxport);
 +              priv->rxports[it.nport] = NULL;
        }
  }
  

--nextPart3358454.44csPzL39Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYFZBShRwOvLlRRy+3R9U/FLj284FAmg5aMYACgkQ3R9U/FLj
284oJQ//TbMI7doophWpEFkBg7MGGXW09i7W/r923E3m0ot9mMk+0yOaqSlj9jm3
3oiMIP0MH0cN8GUzWJq53qIINJ2DkyDD6LAoiFZajSilF+mSKqRtxuAt6iVSXJjE
XNh41qrU4jN3LhedOYuDP5NaDHsZ9SyEuSCppSrrigjI1Uslefm9ocKcPoAcbHpn
ybDLXMXT9yLaGCt232X4wSO+xOelahWqHICZTPdnQZ9lRQ4wI5KpQ9VJOvsLfNd+
3ZWfBr3Ny8uW8hS9RB70bCFR2cFc0rRlZjE1BEVuEB8axkMwNaRNeu+aYO+s4JKO
EWt0CT5Qg3hbUxzqEGUzLDaixXgtP+dzIbTXebTf3OqDaZwGdecIxIMmuLp3MJMN
NTF88Mm3FMifcZgmTLwJ3BO98BvbE/xzBvWH0pOxVY9wM0xESkkcTkNuibPwbIE0
gOzFc7pKo7xoIyzIfx6sR5lbPL59w+fnkS+N1rJIVNIczX7ma3CUqMN7jSCTEh4b
TJHmjgAscrKP7rQatuRpZRZUGHoSaKlw+o8BCk32PmDrofv0a8EnVudXHGPLuadt
9e8+lxJ4VGgM/eXz2LCsnPOp38oVCinO+zfR7vMnw2PgBGb4s/Ntja3OD6qi099a
4kGpx7fkWajtCSHRJsNCBgUMDboU4+uG3R0JzrD7mJ6lGAIf1vQ=
=/BQv
-----END PGP SIGNATURE-----

--nextPart3358454.44csPzL39Z--




