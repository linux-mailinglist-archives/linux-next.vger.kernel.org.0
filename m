Return-Path: <linux-next+bounces-5174-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4131A0AEAE
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 06:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A735F1887254
	for <lists+linux-next@lfdr.de>; Mon, 13 Jan 2025 05:20:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E907D1865E5;
	Mon, 13 Jan 2025 05:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="O7EBCskk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iW0xdcRK"
X-Original-To: linux-next@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAC61487FE;
	Mon, 13 Jan 2025 05:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736745598; cv=none; b=YQ+Lu8mvawIqn4S+s3UsoyKDuq/a9O/92F0vRhf5De2K8amA4BPxJXyynuBLQKIHp27AMzTtKv5RbytVOrIRsacrmpJkBe2YwLX9JVL8qPrLlAFTj7H/VcWmb/wuVZ1gATVlN0TVMLMJnQ5UNrDXcIBFbblgsxiVuN0SncYeB/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736745598; c=relaxed/simple;
	bh=5qohmklPdQr/tI60yImaDKn7AGAmpwhRyNYVh6mD1gQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtT9r8k0zhqlkCnKOmkyehvu5XzBKw77QdnCn2ppyfX3BbFdhDcMMiPuCFxClatXbrR87dhgwDIzRfO00Fh++ALMATUyGFn5BXoKc6Hgr2LIKCOgClgXC9Dgj6+V65XaaNr3dI7A3UwEyWcbyvCw9dmF6P51/sN5Rxl7kuap/QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=O7EBCskk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iW0xdcRK; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D076C11400DA;
	Mon, 13 Jan 2025 00:19:54 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Mon, 13 Jan 2025 00:19:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1736745594; x=1736831994; bh=/qOfrG3FP8
	7JYhp9vjJ12o/IZhWoJm+3pBPlKY5vgmc=; b=O7EBCskkxKxj+oaYqOZO4M8OJ9
	ipMsbhds7T15qkqrjyvn04j3vd4XTnULy9LBselTfvtSG0Vth+gxyQ7Ego1P83Bt
	ML1gsIOIRAodAsIpU1qvi+oI2lUaWnoHZyyggQb3s/4VLyuO2nCOtF2uUVU+nqyh
	WrXKH89adjM2n8kIl8cKqBmHNw4JKbKDISFwt5NGbimNTps3w4Y69zABsCJhMXPQ
	WMfeZIoOlNN9cD3nM1/7BQbaIY8meFnssWzFyXKCkjalNYMIVlE4Hyuaf1V3wOQo
	yLk1tO8LvT4d16Sm8tfA3B13rtsdDMnjFIZ/nNqxuqBa71HFzABGesS96pdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736745594; x=1736831994; bh=/qOfrG3FP87JYhp9vjJ12o/IZhWoJm+3pBP
	lKY5vgmc=; b=iW0xdcRKal7bgKwIO+AXvbbGZ2qAPeDEEKZdviDkf7efdZOhKI5
	fZsUZ/hrCIlwIEWHHx0AL4Z8lz7v8V27dAungq546TVns8ho5twcE7hiNnEX/nvJ
	/WfEtUZY+iYYjkc9nAOg2/kMeD4zSll42Rhr2MUuvI+zWUkKuqQZyWgLe7WpGbHn
	hN2Fv3aNZtW4LbV0YiT/coobcE55vsb9rllzDrjGi0gc1GDDKaDZMML9Zl+GBcV6
	InpoqEm47RKPDKuaxHtNUU4r8MAXTRjgL7rn8pI/a2Nd36f3XicUzAn9s9OU7kSx
	lBROkC4fhhLTKBIlRk/2Kc9rX8ltmwDeK1Q==
X-ME-Sender: <xms:eaKEZ7E54HrI9wIIORfMr4CfjH1_bSeSPbAJ-KqBS4tYkEUTlaDvPw>
    <xme:eaKEZ4Wyb7qSRNgY5vnzPl04diO00_XkEovO8cYOdarBKT_H94vuzpx0oP2GdBrxF
    tyYy7U8hoFWQQ>
X-ME-Received: <xmr:eaKEZ9LY7psofbh0zb4Lw0AbzzL3L-ysYPgNq_GIhvAvBMQ0SuEJqNDWluDXbk0NrCm829KGlMAUTanizv_yOCFOahfaAtbr8Mq31A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudehfedgkeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrf
    grthhtvghrnhepheegvdevvdeljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefh
    gfehkeetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epghhrvghgsehkrhhorghhrdgtohhmpdhnsggprhgtphhtthhopeduvddpmhhouggvpehs
    mhhtphhouhhtpdhrtghpthhtohepshhfrhestggrnhgsrdgruhhughdrohhrghdrrghupd
    hrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehjohhnrghthhgr
    nhdrtggrmhgvrhhonheshhhurgifvghirdgtohhmpdhrtghpthhtohepjhgrvhhivghrrd
    gtrghrrhgrshgtohdrtghruhiisehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqnhgvgihtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:eaKEZ5Fp-j2cqDeHSVA_PS47R24YgFOUKsgff_bCetpnS7v2emxVAw>
    <xmx:eaKEZxX9Zqo542Hjg_LJyqnXc-MShUBeXJDLONCloIRCTHRXxUjqkg>
    <xmx:eaKEZ0M8fRsSAEQAhPmDZ9V_LFWxv-g7B7JdzPcCKUPp3-MjwWht5w>
    <xmx:eaKEZw1s2FKWvhyMnXXPzKd8x6eXqL3kmS9hrUlZOhk5NJjVRh7seQ>
    <xmx:eqKEZ6uJWzYonVAp9ULTgSdNXmxGLq5CX83Hz8AEuVp2DW-nt8GJqzAP>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jan 2025 00:19:53 -0500 (EST)
Date: Mon, 13 Jan 2025 06:19:50 +0100
From: Greg KH <greg@kroah.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the iio tree with the
 char-misc.current tree
Message-ID: <2025011343-cannon-sprawl-f0e0@gregkh>
References: <20250106152107.2c0fc03c@canb.auug.org.au>
 <20250113142342.4578868a@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113142342.4578868a@canb.auug.org.au>

On Mon, Jan 13, 2025 at 02:23:42PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 6 Jan 2025 15:21:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > Today's linux-next merge of the iio tree got a conflict in:
> > 
> >   drivers/iio/adc/ti-ads1119.c
> > 
> > between commit:
> > 
> >   54d394905c92 ("iio: adc: ti-ads1119: fix sample size in scan struct for triggered buffer")
> > 
> > from the char-misc.current tree and commit:
> > 
> >   2cfb4cd058d0 ("iio: adc: Use aligned_s64 instead of open coding alignment.")
> > 
> > from the iio tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> > -- 
> > Cheers,
> > Stephen Rothwell
> > 
> > diff --cc drivers/iio/adc/ti-ads1119.c
> > index c268e27eec12,0a68ecdea4e6..000000000000
> > --- a/drivers/iio/adc/ti-ads1119.c
> > +++ b/drivers/iio/adc/ti-ads1119.c
> > @@@ -500,8 -500,8 +500,8 @@@ static irqreturn_t ads1119_trigger_hand
> >   	struct iio_dev *indio_dev = pf->indio_dev;
> >   	struct ads1119_state *st = iio_priv(indio_dev);
> >   	struct {
> >  -		unsigned int sample;
> >  +		s16 sample;
> > - 		s64 timestamp __aligned(8);
> > + 		aligned_s64 timestamp;
> >   	} scan;
> >   	unsigned int index;
> >   	int ret;
> 
> This is now a conflict between the char-misc tree and Linus' tree.
> 

Thanks, now resolved in my tree.

greg k-h

