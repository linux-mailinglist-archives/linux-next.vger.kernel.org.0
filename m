Return-Path: <linux-next+bounces-7005-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C42FACB95D
	for <lists+linux-next@lfdr.de>; Mon,  2 Jun 2025 18:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2DF3C173560
	for <lists+linux-next@lfdr.de>; Mon,  2 Jun 2025 16:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E4B22172E;
	Mon,  2 Jun 2025 16:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MZ8d6CvC"
X-Original-To: linux-next@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CF670814;
	Mon,  2 Jun 2025 16:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748881059; cv=none; b=KTdyxnGxoBlclny6G3Z4AwZ73NPnER70IX8+V72rF7pD2UicQ16A2/2Y5MQjZIaWJayhIEF4wypBSJVINyC5dYdob9H0thKaPetJisExfe0oGx18L7LlOhCqIjSvKBfhyGnYOM3qWWZAzRcmGrHY9aahS+WJTYdFtYRsL6negQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748881059; c=relaxed/simple;
	bh=IG0UO/icVyY1I6TLoAWD+GUUx5E86VB3jKy4K4xXe04=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qr5BYBWpKO+M7jMaUD+irpzj3XfbSHt/Twyz21nUe4R+M5sVqg48ZKpBQ9Otni5QY36+5jDOeDis2rJj1I+s4cf8z7YVFIOEZTG1v6tRL//KPvJfbCZ2Tp64ZDjkBsH27VJcb97ASjZ4nUayJm/TtmAXGsII2QxThdvRtsVJVpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MZ8d6CvC; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B338D41CFD;
	Mon,  2 Jun 2025 16:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748881048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FuqkRg2WTuUZgjDI/e6V+T/S3sw8UE9YqSsK/8xMzHg=;
	b=MZ8d6CvCHxdGrFjSJrAqye5FcGsto5xCKhPa/5eZWuDDlY+AcSGAzfl23WDqs2pzbmZb3j
	JfvIq/pg1mcBwhvwh6lsn/2HhysV+EszOpJx4jyezckdhqS3DSiRkOBVhUXYtKfDo6SLYt
	Ea/sjoKfmKSg9f8A2IV4O8XrHTICY/LRq5Zb9mTLNJaRRoEhptyG6gj2WKTyyA+MpW5C4r
	w73R+uOAvqN7cgiyGJ8DqFZ8rWizTAVMsVt9l/mrvvagkDlk0CzF/Zf24uymAclQEmyxHb
	S3AT/+dtnbVtvA+WP5BHEdmLGAAtyRl8r0kcNtrliyoBkm6so7kWfzRv4LUOsg==
From: Romain Gantois <romain.gantois@bootlin.com>
To: Wolfram Sang <wsa@the-dreams.de>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Jai Luthra <jai.luthra@ideasonboard.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: linux-next: manual merge of the v4l-dvb tree with the i2c tree
Date: Mon, 02 Jun 2025 18:17:24 +0200
Message-ID: <3548813.44csPzL39Z@fw-rgant>
In-Reply-To: <aDmVftkqLvR0SV3p@shikoro>
References:
 <20250428104905.2b54643f@canb.auug.org.au> <3352024.aeNJFYEL58@fw-rgant>
 <aDmVftkqLvR0SV3p@shikoro>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefkedufeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkfgjfhgggfgtsehtufertddttdejnecuhfhrohhmpeftohhmrghinhcuifgrnhhtohhishcuoehrohhmrghinhdrghgrnhhtohhishessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfekfefhfeetieehvefgleelkeegffeuheffgedttedujeeutefgteekkeeiueevnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehffidqrhhgrghnthdrlhhotggrlhhnvghtpdhmrghilhhfrhhomheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopeifshgrsehthhgvqdgurhgvrghmshdruggvpdhrtghpthhtoheprhhomhgrihhnrdhgrghnthhoihhssegsohhothhlihhnrdgtohhmpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhhvvghrk
 hhuihhlseigshegrghllhdrnhhlpdhrtghpthhtohepjhgrihdrlhhuthhhrhgrsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: romain.gantois@bootlin.com

Hi Wolfram,

On Friday, 30 May 2025 13:24:46 CEST Wolfram Sang wrote:
> > Below is the resolution I came up with.
> 
> Thank you for this...
> 
> > -       for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients);
> > reg_idx++) {
> 
> ... but it was mangled, sadly. Can you resend it properly, please?

Sorry about that, here's a hopefully properly formatted version. Besides the 
issue that Linus found with the mutex_destroy(), I'd also missed a 
"s/client->addr/addr" in the previous version.

By the way, this is just the output of "git show" after resolving the merge, 
I'm not used to sending these "resolutions diffs" so please let me know
if you need it in some other form.

Thanks,

---

diff --cc drivers/media/i2c/ds90ub960.c
index ed9ace1a54766,94b20ba6cb86f..082fc62b0f5b9
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@@ -1271,10 -1056,11 +1274,12 @@@ static int ub960_atr_attach_addr(struc
  	struct ub960_rxport *rxport = priv->rxports[chan_id];
  	struct device *dev = &priv->client->dev;
  	unsigned int reg_idx;
 +	int ret = 0;
  
- 	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients); reg_idx++) {
- 		if (!rxport->aliased_clients[reg_idx])
+ 	guard(mutex)(&rxport->aliased_addrs_lock);
+ 
+ 	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_addrs); reg_idx++) {
+ 		if (!rxport->aliased_addrs[reg_idx])
  			break;
  	}
  
@@@ -1283,18 -1069,15 +1288,18 @@@
  		return -EADDRNOTAVAIL;
  	}
  
- 	rxport->aliased_clients[reg_idx] = client;
+ 	rxport->aliased_addrs[reg_idx] = addr;
  
  	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ID(reg_idx),
- 			   client->addr << 1, &ret);
 -			   addr << 1);
++			   addr << 1, &ret);
  	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx),
 -			   alias << 1);
 +			   alias << 1, &ret);
 +
 +	if (ret)
 +		return ret;
  
  	dev_dbg(dev, "rx%u: client 0x%02x assigned alias 0x%02x at slot %u\n",
- 		rxport->nport, client->addr, alias, reg_idx);
+ 		rxport->nport, addr, alias, reg_idx);
  
  	return 0;
  }
@@@ -1306,10 -1089,11 +1311,12 @@@ static void ub960_atr_detach_addr(struc
  	struct ub960_rxport *rxport = priv->rxports[chan_id];
  	struct device *dev = &priv->client->dev;
  	unsigned int reg_idx;
 +	int ret;
  
- 	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_clients); reg_idx++) {
- 		if (rxport->aliased_clients[reg_idx] == client)
+ 	guard(mutex)(&rxport->aliased_addrs_lock);
+ 
+ 	for (reg_idx = 0; reg_idx < ARRAY_SIZE(rxport->aliased_addrs); reg_idx++) {
+ 		if (rxport->aliased_addrs[reg_idx] == addr)
  			break;
  	}
  
@@@ -1319,18 -1103,12 +1326,18 @@@
  		return;
  	}
  
- 	rxport->aliased_clients[reg_idx] = NULL;
+ 	rxport->aliased_addrs[reg_idx] = 0;
  
 -	ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx), 0);
 +	ret = ub960_rxport_write(priv, chan_id, UB960_RR_SLAVE_ALIAS(reg_idx),
 +				 0, NULL);
 +	if (ret) {
 +		dev_err(dev, "rx%u: unable to fully unmap client 0x%02x: %d\n",
- 			rxport->nport, client->addr, ret);
++			rxport->nport, addr, ret);
 +		return;
 +	}
  
  	dev_dbg(dev, "rx%u: client 0x%02x released at slot %u\n", rxport->nport,
- 		client->addr, reg_idx);
+ 		addr, reg_idx);
  }
  
  static const struct i2c_atr_ops ub960_atr_ops = {
@@@ -4370,12 -3231,21 +4376,14 @@@ static void ub960_txport_free_ports(str
  
  static void ub960_rxport_free_ports(struct ub960_data *priv)
  {
 -	unsigned int nport;
 -
 -	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 -		struct ub960_rxport *rxport = priv->rxports[nport];
 -
 -		if (!rxport)
 -			continue;
 -
 -		fwnode_handle_put(rxport->source.ep_fwnode);
 -		fwnode_handle_put(rxport->ser.fwnode);
 +	for_each_active_rxport(priv, it) {
 +		fwnode_handle_put(it.rxport->source.ep_fwnode);
 +		fwnode_handle_put(it.rxport->ser.fwnode);
  
 -		mutex_destroy(&rxport->aliased_addrs_lock);
++		mutex_destroy(&it.rxport->aliased_addrs_lock);
+ 
 -		kfree(rxport);
 -		priv->rxports[nport] = NULL;
 +		kfree(it.rxport);
 +		priv->rxports[it.nport] = NULL;
  	}
  }
  





